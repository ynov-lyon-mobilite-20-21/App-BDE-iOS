// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal enum QRCodeBackground {
    internal static let qrFood = ImageAsset(name: "QR-FOOD")
    internal static let qrKolok = ImageAsset(name: "QR-KOLOK")
    internal static let qrLan = ImageAsset(name: "QR-LAN")
    internal static let qrSoiree = ImageAsset(name: "QR-SOIREE")
    internal static let qrSport = ImageAsset(name: "QR-SPORT")
  }
  internal static let backgroundEvent = ImageAsset(name: "background_event")
  internal enum Cards {
    internal static let cardFOOD = ImageAsset(name: "card_FOOD")
    internal static let cardKOLOK = ImageAsset(name: "card_KOLOK")
    internal static let cardLAN = ImageAsset(name: "card_LAN")
    internal static let cardPARTY = ImageAsset(name: "card_PARTY")
    internal static let cardSPORT = ImageAsset(name: "card_SPORT")
  }
  internal enum EventTypeImage {
    internal static let foodStand = ImageAsset(name: "FOOD_stand")
    internal static let kolokBiere = ImageAsset(name: "KOLOK_biere")
    internal static let lanManette = ImageAsset(name: "LAN_manette")
    internal static let partyCocktail = ImageAsset(name: "PARTY_cocktail")
    internal static let sportHaltere = ImageAsset(name: "SPORT_haltere")
  }
  internal static let horloge = ImageAsset(name: "horloge")
  internal static let logoBde = ImageAsset(name: "logo_bde")
  internal enum LogoFormation {
    internal static let logoInfo = ImageAsset(name: "logoInfo")
  }
  internal enum OnBoarding {
    internal static let logosIllustration2 = ImageAsset(name: "logos_illustration2")
    internal static let onboarding1 = ImageAsset(name: "onboarding_1")
    internal static let onboarding2 = ImageAsset(name: "onboarding_2")
    internal static let onboarding3 = ImageAsset(name: "onboarding_3")
  }
  internal static let profilMenu = ImageAsset(name: "profilMenu")
  internal enum TabBar {
    internal static let profilNoir = ImageAsset(name: "profil_noir")
    internal static let ticketNoir = ImageAsset(name: "ticket_noir")
  }
  internal static let ynovCampus = ImageAsset(name: "ynovCampus")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
