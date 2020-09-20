Pod::Spec.new do |s|

  s.name               = "MAWishfulButtonFramework"
  s.version            = "1.0.0"
  s.summary            = "MAWishfulButtonFramework is a user friendly, easy to integrate custon UIKit Button generator and add life to apps with subtle animations."
  s.description        = "With 7 category of buttons, users can generate button with text, image or combination of both. The buttons have the capability to have any shape square, rounded or circular, with or without border and shadow. It also has the gradient colored background or border unlike the usual single colored ones."
  s.homepage           = "https://github.com/natashamalam/MAWishfulButtonFramework"
  s.license            = "MIT"
  s.author             = { "Mahjabin Alam" => "natasha.mahjabin@gmail.com" }
  s.platform           = :ios, "10.0"
  s.swift_versions     = "5.0"
  s.source       = { :git => "https://github.com/natashamalam/MAWishfulButtonFramework.git", :tag => "1.0.0" }
  s.source_files  = "MAWishfulButtonFramework/**/*"
  s.exclude_files = "MAWishfulButtonFramework/**/*.plist"

end
