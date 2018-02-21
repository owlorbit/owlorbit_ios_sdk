# OwlorbitSDK

[![Version](https://img.shields.io/cocoapods/v/OwlorbitSDK.svg?style=flat)](http://cocoapods.org/pods/OwlorbitSDK)
[![License](https://img.shields.io/cocoapods/l/OwlorbitSDK.svg?style=flat)](http://cocoapods.org/pods/OwlorbitSDK)
[![Platform](https://img.shields.io/cocoapods/p/OwlorbitSDK.svg?style=flat)](http://cocoapods.org/pods/OwlorbitSDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Documentation on API Routes

Here is the documentation of the api routes: https://github.com/owlorbit/api

## Installation

OwlorbitSDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'OwlorbitSDK'
```


**Implementation**

Initialize `Owlorbit` SDK (To get your API tokens, please create a domain and navigate to https://app.owlorbit.com/account/api):

`var owlorbit:OwlorbitSDK = OwlorbitSDK(publicKey:"YOUR_PUBLIC_KEY", encryptedSession:"YOUR_ENCRYPTED_SESSION", sessionHash:"YOUR_SESSION_HASH")`


Then call the API:

```
owlorbit.owlorbitApi.getRoomsByEmail(email: "test@test.com",resultObj: {
    (ListAllRoomsModel) in
        ...
    }, error: {
    (err) in
        ...
    }
})
```


## Author

tim.nguyen@owlorbit.com

## License

OwlorbitSDK is available under the MIT license. See the LICENSE file for more info.
