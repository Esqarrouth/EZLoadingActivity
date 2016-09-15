Pod::Spec.new do |s|
s.name             = "EZLoadingActivity"
s.version          = "1.0"
s.summary          = "Lightweight Swift loading activity for iOS7+"
s.description      = "Lightweight Swift loading activity for iOS7+. Really simple to use, just add the class and write 1 line of code."
s.homepage         = "https://github.com/goktugyil/EZLoadingActivity"
s.license          = 'MIT'
s.author           = { "goktugyil" => "gok-2@hotmail.com" }
s.source           = { :git => "https://github.com/goktugyil/EZLoadingActivity.git", :tag => s.version.to_s }
s.platform     = :ios, '8.0'
s.requires_arc = true

# If more than one source file: https://guides.cocoapods.org/syntax/podspec.html#source_files
s.source_files = 'EZLoadingActivity.swift' 

end
