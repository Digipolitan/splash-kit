Pod::Spec.new do |s|
s.name = "SplashKit"
s.version = "1.0.0"
s.summary = "Customizable splash screen system wich can handle multiple splash navigation and display"
s.homepage = "https://github.com/Digipolitan/splash-kit"
s.authors = "Digipolitan"
s.source = { :git => "https://github.com/Digipolitan/splash-kit.git", :tag => "v#{s.version}" }
s.license = { :type => "BSD", :file => "LICENSE" }
s.source_files = 'Sources/**/*.{swift,h}'
s.ios.deployment_target = '8.0'
s.tvos.deployment_target = '9.0'
s.requires_arc = true
s.dependency 'RuntimeEnvironment', '~> 1.0'
end
