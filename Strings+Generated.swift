// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum OnBoarding {
    /// Tout au long de l'année tu trouveras des évènements variés pour nous retrouver et passer de bons moments.
    internal static let content1 = L10n.tr("Localizable", "onBoarding.content1")
    /// Grâce à cette app, tu peux stocker tous tes billets au même endroit, les retrouver rapidement et les faire scanner par l'équipe du BDE le jour J !
    internal static let content2 = L10n.tr("Localizable", "onBoarding.content2")
    /// Des questions ? Des précisions ? Nous sommes à ta disposition pour t'éclairer et t'aider au mieux à passer des moments inoubliables avec nous !
    internal static let content3 = L10n.tr("Localizable", "onBoarding.content3")
    /// Parcours les évènements à venir de ton BDE
    internal static let title1 = L10n.tr("Localizable", "onBoarding.title1")
    /// Achète ta place facilement et ne rate aucun évènement
    internal static let title2 = L10n.tr("Localizable", "onBoarding.title2")
    /// Prends contact quand tu veux avec les membres de ton BDE
    internal static let title3 = L10n.tr("Localizable", "onBoarding.title3")
  }

  internal enum SignInView {
    /// Identifiants
    internal static let section1header = L10n.tr("Localizable", "signInView.section1header")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
