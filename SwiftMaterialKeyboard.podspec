Pod::Spec.new do |s|
s.platform = :ios
s.ios.deployment_target = '9.3'
s.name = 'SwiftMaterialKeyboard'
s.summary = 'Custom keyboard build with CosmicMind/Material and RxSwift'
s.requires_arc = true
s.version = '0.1.4'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.author = { 'Chinh Nguyen' => 'chinh@willbe.vn' }
s.homepage = 'https://github.com/chinhnguyen/SwiftMaterialKeyboard'
s.source = { :git => 'https://github.com/chinhnguyen/SwiftMaterialKeyboard.git', :tag => s.version }
s.framework = 'UIKit'
s.dependency 'SnapKit', '~> 4.0'
s.dependency 'RxSwift', '~> 4.0'
s.dependency 'RxCocoa', '~> 4.0'
s.dependency 'Material', '~> 2.12'
s.source_files = 'SwiftMaterialKeyboard/*.swift'
s.swift_version = '4.2'
end
