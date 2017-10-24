workspace 'SplashKit.xcworkspace'

## Frameworks targets
abstract_target 'Frameworks' do
	use_frameworks!

    pod 'RuntimeEnvironment', '~> 1.0'

	target 'SplashKit-iOS' do
		platform :ios, '8.0'
	end

	target 'SplashKit-tvOS' do
		platform :tvos, '9.0'
	end
end

## Tests targets
abstract_target 'Tests' do
	use_frameworks!

    pod 'RuntimeEnvironment', '~> 1.0'

	target 'SplashKitTests-iOS' do
		platform :ios, '8.0'
	end

	target 'SplashKitTests-tvOS' do
		platform :tvos, '9.0'
	end
end

## Samples targets
abstract_target 'Samples' do
	use_frameworks!

    pod 'RuntimeEnvironment', '~> 1.0'

	target 'SplashKitSample-iOS' do
		project 'Samples/SplashKitSample-iOS/SplashKitSample-iOS'
		platform :ios, '8.0'
	end

	target 'SplashKitSample-tvOS' do
		project 'Samples/SplashKitSample-tvOS/SplashKitSample-tvOS'
		platform :tvos, '9.0'
	end
end
