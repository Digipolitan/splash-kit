import PackageDescription

let package = Package(
  name: "SplashKit",
  dependencies: [
    .Package(url: "https://github.com/Digipolitan/runtime-environment.git", versions: Version(1, 0, 0)..<Version(2, 0, 0))
  ],
  exclude: [
    "Tests",
    "Samples"
  ]
)
