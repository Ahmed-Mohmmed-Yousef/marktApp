#if os(OSX)
    typealias Image     = NSImage
    typealias ImageName = NSImage.Name
#elseif os(iOS)
    import UIKit

    typealias Image     = UIImage
    typealias ImageName = String
#endif

extension Image {
    static var assetsAppicon: Image { return Image(named: ImageName("AppIcon"))! }
    static var assetsAhmed: Image { return Image(named: ImageName("ahmed"))! }
    static var assetsCartMinus: Image { return Image(named: ImageName("cart_minus"))! }
    static var assetsCartPlus: Image { return Image(named: ImageName("cart_plus"))! }
    static var assetsCarts: Image { return Image(named: ImageName("carts"))! }
    static var assetsClose: Image { return Image(named: ImageName("close"))! }
    static var assetsDay: Image { return Image(named: ImageName("day"))! }
    static var assetsDefimg: Image { return Image(named: ImageName("defImg"))! }
    static var assetsHilwawater: Image { return Image(named: ImageName("hilwaWater"))! }
    static var assetsImage: Image { return Image(named: ImageName("Image"))! }
    static var assetsLeftArrow: Image { return Image(named: ImageName("left-arrow"))! }
    static var assetsLike: Image { return Image(named: ImageName("like"))! }
    static var assetsLocation: Image { return Image(named: ImageName("location"))! }
    static var assetsMenu: Image { return Image(named: ImageName("menu"))! }
    static var assetsNestlewater: Image { return Image(named: ImageName("nestleWater"))! }
    static var assetsNovawater: Image { return Image(named: ImageName("novaWater"))! }
    static var assetsPerainwater: Image { return Image(named: ImageName("perainWater"))! }
    static var assetsPerson: Image { return Image(named: ImageName("person"))! }
    static var assetsPhone: Image { return Image(named: ImageName("phone"))! }
    static var assetsProfile: Image { return Image(named: ImageName("profile"))! }
    static var assetsRadioButtonOff: Image { return Image(named: ImageName("radio_button_off"))! }
    static var assetsRadioButtonOn: Image { return Image(named: ImageName("radio_button_on"))! }
    static var assetsRightArrow: Image { return Image(named: ImageName("right-arrow"))! }
    static var assetsScope: Image { return Image(named: ImageName("scope"))! }
    static var assetsSearch: Image { return Image(named: ImageName("search"))! }
    static var assetsSmile: Image { return Image(named: ImageName("smile"))! }
    static var assetsTaniawater: Image { return Image(named: ImageName("taniaWater"))! }
    static var assetsTime: Image { return Image(named: ImageName("time"))! }
    static var assetsTrash: Image { return Image(named: ImageName("trash"))! }
    static var assetsWater: Image { return Image(named: ImageName("water"))! }
    static var assetsWaterbottol: Image { return Image(named: ImageName("waterBottol"))! }
    static var assetsWaterlogo: Image { return Image(named: ImageName("waterLogo"))! }
}