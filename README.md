# MAWishfulButtonFramework

MAWishfulButtonFramework is a user friendly, easy to integrate Button generator for users who want to add life to their application. Once added, users can choose to customize the buttons either from storyboard or from their code. However, the predefined button animations need to be chosen from the code.

# Requirements
 - *iOS 10.0*
 - *Swift 5.0*

# Installation
 Download the folder named "MaWishfulButtonKit" and add it to the application by drag and dropping in it.

# Button Categories
```
  - MARectangularButton
  - MACircularImageBaseButton
  - MASquareImageBaseButton
  - MAGradientBackgroundButton
  - MAGradientBorderButton
  - MASimpleCompositeButton
  - MAGradientCompositeButton
```
#### MARectangularButton
MARectangularButton is simple but elegant in appearance with corners and shadows around.

![MARectangular](https://user-images.githubusercontent.com/8694816/93320855-84f3e200-f84c-11ea-8fec-ca4bfc484f21.png)

However with a little bit of geometry, it can easily be transformed into a circular button.
Remember those profile image placeholder buttons when no image is available with just user initials. Let's try that-

![profile place holder](https://user-images.githubusercontent.com/8694816/93256460-5cc99c00-f7d6-11ea-8792-e3d4fa6890b9.png)


##### From Code

    @IBOutlet weak var profileButton: MARectangularButton!{
        didSet{
            profileButton.backgroundColor = UIColor.black
            profileButton.borderWidth = 3.0
            profileButton.borderColor = UIColor.darkGray
            profileButton.cornerRadius = 50.0
            profileButton.buttonTitle = "MA"
            profileButton.titleTextColor = UIColor.lightGray
            profileButton.fontSize = 40.0
            profileButton.shadowColor = UIColor.white
        }
    }
##### From Storyboard
![profile image placeholder from storyboard](https://www.rolewithvirtualization.com/MAWishfulButtonKitAssets/profile_button.gif)

##### MARectangularButton Properties:

  - var backgroundColor: UIColor?
  - var buttonTitle: String
  - var fontSize: CGFloat
  - var textAlignment: String
  - var titleTextColor: UIColor?
  - var cornerRadius: CGFloat
  - var borderWidth: CGFloat
  - var borderColor: UIColor?
  - var shadowColor: UIColor
  - var shadowOpacity: Float
  - var shadowRadius: CGFloat

#### MACircularImageBaseButton
MACircularImageBaseButton is a circular button restricted to have only image. The image should be a transparent one of type png.
Some Sample buttons -

![MACircularImages](https://user-images.githubusercontent.com/8694816/93320310-e23b6380-f84b-11ea-9a38-a18685e6230a.png)

##### A Sample Demo from Storyboard
![circular notification image demo](https://www.rolewithvirtualization.com/MAWishfulButtonKitAssets/circularImage.gif)

##### MACircularImageBaseButton Properties:

  - var backgroundColor: UIColor?
  - var imageOffsetXY : CGFloat
  - var contentImage : UIImage?
  - var borderWidth: CGFloat
  - var borderColor: UIColor?
  - var shadowColor: UIColor
  - var shadowOpacity: Float
  - var shadowRadius: CGFloat

#### MASquareImageBaseButton
MASquareImageBaseButton is almost same as MACircularImageBaseButton restricted to have only image but unlike the MACircularImageBaseButton, MASquareImageBaseButton has the cornerRadius propery which allows the user to set a corner of his/her choice.
#####  A Demo from storyboard-
![](https://www.rolewithvirtualization.com/MAWishfulButtonKitAssets/SquareImage.gif)

#### MAGradientBackgroundButton and MAGradientBorderButton
As the name suggests, MAGradientBackgroundButton is with gradient background while the MAGradientBorderButton is with gradient border. Currently the gradient shade is a merge of no more than two colors but the start and end points of gradient colors can be configured for both buttons.

##### Sample buttons
![MAGradientBackgroundAndBorder](https://user-images.githubusercontent.com/8694816/93321521-38f56d00-f84d-11ea-9bad-73c89db70fc4.png)


##### Properties:

  - var darkerShade: UIColor
  - var lighterShade: UIColor
  - var startPointX: CGFloat
  - var startPointY: CGFloat
  - var endPointX: CGFloat
  - var endPointY: CGFloat
  - var cornerRadius: CGFloat
  - var buttonTitle: String
  - var fontSize: CGFloat
  - var textAlignment: String
  - var titleTextColor: UIColor?


#### MASimpleCompositeButton
MASimpleCompositeButton is a compound button with image and title. The position(left, right, top, bottom; p.s. default is left) of the image, its frame offset(how far should it move from the orgin point, default is 5.0) and the padding around it(default is 0.0) all can be configured. Following is some variations -

![MASimpleComposite](https://user-images.githubusercontent.com/8694816/93320907-96d58500-f84c-11ea-978c-a187af54fbf1.png)

##### Demo From Storyboard
![](https://www.rolewithvirtualization.com/MAWishfulButtonKitAssets/simpleComposite.gif)

##### MASimpleCompositeButton Properties:

  - var titleBackgroundColor: UIColor
  - var imageBackgroundColor: UIColor?
  - var imagePosition: String //default "left"
  - var contentImage : UIImage?
  - var frameOffset: CGFloat // default 5.0
  - var imageSizingFactor: CGFloat
  - var buttonTitle: String?
  - var textColor: UIColor
  - var fontSize: CGFloat
  - var textAlignment: String
  - var borderWidth: CGFloat
  - var borderColor: UIColor?
  - var cornerRadius: CGFloat


##### MAGradientCompositeButton
MAGradientCompositeButton is almost similar to MASimpleCompositeButton. However, the title and image don't have separate gardient backgroud rather the button itself has the gradient effect. Following is some variations -

![MAGradientComposite](https://user-images.githubusercontent.com/8694816/93321241-f2a00e00-f84c-11ea-8a79-618972fe9f47.png)

#### MAGradientCompositeButton Properties:

  - var darkerShade: UIColor
  - var lighterShade: UIColor
  - var startPointX: CGFloat
  - var startPointY: CGFloat
  - var endPointX: CGFloat
  - var endPointY: CGFloat
  - var imagePosition: String //default "left"
  - var contentImage : UIImage?
  - var frameOffset: CGFloat // default 5.0
  - var imageSizingFactor: CGFloat
  - var buttonTitle: String?
  - var textColor: UIColor
  - var fontSize: CGFloat
  - var textAlignment: String
  - var borderWidth: CGFloat
  - var borderColor: UIColor?
  - var cornerRadius: CGFloat

Other than all the visual properties, one other property available for all the buttons is a fixed set of animation.

##### Animation set
    - horizontalShaking
    - verticalBouncing
    - zoomIn
    - zoomOut
    - springOut
    - rotateBy45Degree
    - rotateBy90Degree
    - rotateBy180Degree
    - rotateBy360Degree

Adding these animations are possible only through code.
P.S: the last 4 animations only work when there is an image, so for MARectangularButton, MAGradientBackgroundButton, and MAGradientBorderButton, those won't be effective.

##### Adding Animation
1. Create an outlet for the button
 ![connecting](https://user-images.githubusercontent.com/8694816/93255874-7a4a3600-f7d5-11ea-89b1-967ba4729b66.png)

2. When the outlet is established, like in the viewDidload method or in the didSet, property observer, assign the value of appliedAnimation. Following is a sample code for adding -
```
@IBOutlet weak var addContactButton: MASimpleCompositeButton!{
        didSet{
            addContactbutton.appliedAnimation = .rotateBy45Degree
        }
    }
```
That's it. Check out some more animation effects.

## Demo Animation
![Animation](https://www.rolewithvirtualization.com/MAWishfulButtonKitAssets/animation.gif)

## Call-back for event Handling on Button tap

``var buttonPressed: ((UIButton)->())?``, a call-back is presented for handling action. Implement the call back for any framwork generated button like-

```
myWishfulButton.buttonPressed = { sender in
    print("Code for clicking the button goes here")
}
```

## License
Distributed under the MIT license. See LICENSE for more information.
