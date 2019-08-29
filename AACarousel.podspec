Pod::Spec.new do |s|
 s.name = 'AACarousel'
 s.version = '1.3.2'
 s.license = { :type => "MIT", :file => "LICENSE.md" }
 s.summary = 'Image Slider in Swift'
 s.homepage = 'https://github.com/ubook-editora/AACarousel'
 s.authors = { 'Alan' => 'nakama74@gmail.com' }
 s.source = { :git => 'https://github.com/ubook-editora/AACarousel.git', :tag => s.version }
 s.source_files = 'Sources/*.swift'
 s.requires_arc = true
 s.ios.deployment_target = '9.0'
end
