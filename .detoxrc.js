module.exports = {
  testRunner: {
    $0: 'jest',
      args: {
        config: 'e2e/jest.config.js',
        _: ['e2e']
      },
  },
  apps: {
    "ios": {
      "type": "ios.app",
      "binaryPath": "ios/build/Build/Products/Release-iphonesimulator/DetoxReloadApp.app",
      "build": "export NO_FLIPPER=1 && set -o pipefail && export CODE_SIGNING_REQUIRED=NO && export RCT_NO_LAUNCH_PACKAGER=true && xcodebuild -workspace ios/DetoxReloadApp.xcworkspace -scheme DetoxReloadApp -configuration Release -sdk iphonesimulator -derivedDataPath ios/build -quiet"
    },
  },
  devices: {
    "iphone16": {
      "type": "ios.simulator",
      "device": {
        "type": "iPhone 16"
      }
    },
  },
  configurations: {
    "ios": {
      "device": "iphone16",
      "app": "ios"
    },
  }
}
