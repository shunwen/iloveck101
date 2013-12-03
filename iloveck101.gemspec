# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "iloveck101"
  spec.version       = "0.0.1"
  spec.authors       = ["shunwen"]
  spec.email         = ["hsiaoshunwen@gmail.com"]
  spec.description   = %q{我愛卡提諾}
  spec.summary       = %q{我只想看圖, 可是卡提諾的網站載入太慢, 一堆廣告跟不必要的資訊, 還要等圖片 lazy load, 所以寫了這個 iloveck101, 直接先把圖片都下載下來, 看圖快多了。目前只支援 Mac, Linux 我不確定。by tzangms aka 海總理 2012.12.02}
  spec.homepage      = "https://github.com/tzangms/iloveck101"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "nokogiri"
  spec.add_dependency "mini_magick"
end
