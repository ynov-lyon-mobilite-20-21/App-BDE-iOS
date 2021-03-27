// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum EventDetail {
    internal enum Button {
      /// Prendre ma place
      internal static let payment = L10n.tr("Localizable", "EventDetail.button.payment")
    }
  }

  internal enum QRCode {
    /// QR-code à présenter au membre du  BDE responsable à l’entrée le jour J
    internal static let indication = L10n.tr("Localizable", "QRCode.indication")
  }

  internal enum QRScanner {
    /// Scanner le QR Code
    internal static let indication = L10n.tr("Localizable", "QRScanner.indication")
    /// Billet n°
    internal static let ticketId = L10n.tr("Localizable", "QRScanner.ticketId")
  }

  internal enum Error {
    internal enum Alert {
      internal enum PartyRefused {
        /// Bah la partie est refusée hein
        internal static let description = L10n.tr("Localizable", "error.alert.PARTY_REFUSED.description")
        /// partie refusée
        internal static let title = L10n.tr("Localizable", "error.alert.PARTY_REFUSED.title")
      }
      internal enum UnknowError {
        /// une erreur inconnue est survenue
        internal static let description = L10n.tr("Localizable", "error.alert.UNKNOW_ERROR.description")
        /// une erreur est survenue
        internal static let title = L10n.tr("Localizable", "error.alert.UNKNOW_ERROR.title")
      }
      internal enum Button {
        /// Annuler
        internal static let cancel = L10n.tr("Localizable", "error.alert.button.cancel")
      }
    }
  }

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
    internal enum Button {
      /// Suivant
      internal static let next = L10n.tr("Localizable", "onBoarding.button.next")
      /// Précédent
      internal static let previous = L10n.tr("Localizable", "onBoarding.button.previous")
    }
  }

  internal enum Profil {
    /// MES BILLETS
    internal static let ticketsTitle = L10n.tr("Localizable", "profil.ticketsTitle")
    /// MES INFORMATIONS
    internal static let userTitle = L10n.tr("Localizable", "profil.userTitle")
  }

  internal enum Settings {
    /// Comment utiliser l'application ?
    internal static let onboarding = L10n.tr("Localizable", "settings.onboarding")
    /// Réglage
    internal static let title = L10n.tr("Localizable", "settings.title")
    internal enum Account {
      /// Supprimer le compte
      internal static let delete = L10n.tr("Localizable", "settings.account.delete")
      /// Déconnexion
      internal static let logout = L10n.tr("Localizable", "settings.account.logout")
    }
    internal enum Payment {
      /// Informations de paiement
      internal static let info = L10n.tr("Localizable", "settings.payment.info")
    }
    internal enum UpdateInfo {
      /// Nom, Prénom, Mot de passe, Classe
      internal static let subTitle = L10n.tr("Localizable", "settings.updateInfo.subTitle")
    }
  }

  internal enum SignInView {
    /// Identifiants
    internal static let section1header = L10n.tr("Localizable", "signInView.section1header")
  }

  internal enum TabBar {
    /// Évènements
    internal static let event = L10n.tr("Localizable", "tabBar.event")
    /// Profil
    internal static let profil = L10n.tr("Localizable", "tabBar.profil")
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
