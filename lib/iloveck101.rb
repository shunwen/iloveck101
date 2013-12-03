require "nokogiri"
require "open-uri"
require "mini_magick"

module Iloveck101
  def self.love uri, w_min=400, h_min=400
    html = Nokogiri::HTML uri.read, nil, 'UTF-8'
    thread_id = uri.match(/thread-(\d+)-.*/)[1]
    title = html.xpath('.//title').text.split(' - ')[0].gsub('/','').strip

    raise "Fail to love uri: #{uri}" unless thread_id and title

    folder = File.join Dir.home, 'Pictures/iloveck101', "#{thread_id} - #{title}"
    FileUtils.mkdir_p folder unless Dir.exist? folder

    html.xpath('//img/@file').uniq.each do |img_file|
      next unless img_file.value.start_with? 'http'
      img_url = URI.parse img_file.value
      filename = img_url.path.match(/\/(.*)/)[1]
      print "Fetching #{img.value} ..."
      i = MiniMagick::Image.open img.value
      if i[:width] < w_min or i[:height] < h_min
        print "Skipped, size too small\n"
      else
        i.write File.join folder, filename
        print "Done!\n"
      end
    rescue
      next
    end
  end
end
