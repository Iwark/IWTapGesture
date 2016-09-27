Pod::Spec.new do |s|
  s.name         = "IWTapGesture"
  s.version      = "1.0.0"
  s.summary      = "Add effect to tap gesture."
  s.description  = <<-DESC
  - Add effect to tap gesture.
                   DESC

  s.homepage     = "https://github.com/Iwark/IWTapGesture"
  s.license      = "MIT"
  s.author       = { "Iwark" => "iwark02@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Iwark/IWTapGesture.git", :tag => "#{s.version}" }
  s.source_files = "IWTapGesture/**/*.swift"
  s.requires_arc = true
end
