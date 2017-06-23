Pod::Spec.new do |s|

  s.name         = "ParallaxHeader"
  s.version      = "1.0.0"
  s.summary      = "Simple way to add parallax header to scrollView/tableView"
  s.description  = "The ParallaxHeader allows to add parallax header to UIScrollView and it's subclasses within UIScrollView extension"
  s.homepage     = "https://github.com/romansorochak"

  s.license      = "MIT"

  s.author             = { "Roman Sorochak" => "roman.sorochak@gmail.com" }
  s.social_media_url   = "https://www.linkedin.com/in/roman-sorochak-b3339a93/"

  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/romansorochak/ParallaxHeader.git", :tag => "1.0.0" }

  s.source_files  = "ParallaxHeader", "ParallaxHeader/**/*.{h,m}"

  s.swift-version = "3.0"

end
