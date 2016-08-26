# ShadowView

Normally it's not possible to set a corner radius and a shadow on a `UIView` subclass. This is because the property `clipsToBounds` must be set to `true` for the view to render the rounded corners, which also clips the shadow away.

![Screenshot](https://github.com/bennibrightside/ShadowView/blob/master/screenshot.jpg)

## The solution

This is a `UIView` subclass that allows for setting both a corner radius and a drop shadow. This is done by adding a second private subview that renders the shadow.

## Installation

Clone or download the repository and and manually add the file `ShadowView.swift` to your project and target.

## Usage

The shadow view can be used with storyboards or be created in code. The properties for `cornerRadius`, `shadowOffset`, `shadowOpacity`, `shadowRadius` and `shadowColor` can be set via Interface Builder.

## Contact

Mail: [apps@ben-boecker.de](mailto:apps@ben-boecker.de)  

Twitter: [@BenBoecker](https://twitter.com/BenBoecker)

## License

ShadowView is available under the [MIT License](https://github.com/bennibrightside/ShadowView/blob/master/LICENSE)