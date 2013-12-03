require "nokogiri"
require "open-uri"
require "mini_magick"

module Iloveck101

  def self.love uri, w_min=400, h_min=400
    html = Nokogiri::HTML open(uri), nil, 'UTF-8'

    thread_id = uri.match(/thread-(\d+)-.*/)[1]
    title = html.xpath('.//title').text.split(' - ')[0].gsub('/','').strip

    folder = File.join Dir.home, 'Pictures/iloveck101', "#{thread_id} - #{title}"
    FileUtils.mkdir_p folder unless Dir.exist? folder

    html.xpath('//img/@file').each do |img_file|
      begin
        next unless img_file.value.start_with? 'http'
        filename = img_file.value.split('/').last
        print "Fetching #{filename} ..."

        img = MiniMagick::Image.open img_file.value

        if img[:width] < w_min or img[:height] < h_min
          print "Skip: Image too small!\n"
        else
          img.write File.join(folder, filename)
          print "Done!\n"
        end

      rescue => e
        puts "Failed to fetch #{img_file.value}: #{e.message}"
        next
      end
    end

  end

end
