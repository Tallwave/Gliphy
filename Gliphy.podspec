Pod::Spec.new do |s|
  s.name         = "Gliphy"
  s.version      = "0.2.0"
  s.summary      = "A Swift Library to help manage Dynamic Type"

  s.description  = <<-DESC
                   A library to help manage custom fonts when used in iOS's
                   Dynamic Type.
                   DESC

  s.homepage     = "https://github.com/tallwave/Gliphy"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Scott Williams" => "scott.williams@tallwave.com" }
  s.social_media_url = 'http://twitter.com/swilliams'
  s.source       = { :git => "https://github.com/tallwave/Gliphy.git", :tag => s.version }
  s.platform     = :ios, '9.0'
  s.source_files = 'Gliphy/**/*.swift'
  s.requires_arc = true
end
