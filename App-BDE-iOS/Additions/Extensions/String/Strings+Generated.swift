// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum CardPayment {
    /// Ajouter une carte de crédit
    internal static let title = L10n.tr("Localizable", "CardPayment.title")
    internal enum Button {
      /// Ajouter cette carte
      internal static let addCard = L10n.tr("Localizable", "CardPayment.button.addCard")
    }
    internal enum CreditCard {
      /// Cryptogramme
      internal static let cvc = L10n.tr("Localizable", "CardPayment.creditCard.cvc")
      /// Date d'expiration
      internal static let expirationDate = L10n.tr("Localizable", "CardPayment.creditCard.expirationDate")
      /// MasterCard / Visa / CB
      internal static let indications = L10n.tr("Localizable", "CardPayment.creditCard.indications")
      /// Numéro de la carte
      internal static let number = L10n.tr("Localizable", "CardPayment.creditCard.number")
      /// Titulaire de la carte
      internal static let owner = L10n.tr("Localizable", "CardPayment.creditCard.owner")
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
    internal enum Button {
      /// Scanner à nouveau
      internal static let scanAgain = L10n.tr("Localizable", "QRScanner.button.scanAgain")
    }
  }

  internal enum CheckoutDone {
    /// Ton BDE 🦁
    internal static let signature = L10n.tr("Localizable", "checkoutDone.signature")
    /// Achat réussi !
    internal static let title = L10n.tr("Localizable", "checkoutDone.title")
    internal enum Thanks {
      /// Nous avons bien reçu ton paiement, merci et bon appétit !
      internal static let food = L10n.tr("Localizable", "checkoutDone.thanks.food")
      /// Nous avons bien reçu ton paiement, merci et à très bientôt !
      internal static let ticket = L10n.tr("Localizable", "checkoutDone.thanks.ticket")
    }
  }

  internal enum CheckoutPayment {
    /// Confirmation d'achat
    internal static let title = L10n.tr("Localizable", "checkoutPayment.title")
    internal enum Button {
      /// Enregistrer cette carte
      internal static let cardRegistration = L10n.tr("Localizable", "checkoutPayment.button.cardRegistration")
    }
  }

  internal enum Error {
    internal enum Alert {
      internal enum BadCredentials {
        /// Votre adresse mail ou votre mot de passe sont incorrects
        internal static let description = L10n.tr("Localizable", "error.alert.BAD_CREDENTIALS.description")
        /// Attention
        internal static let title = L10n.tr("Localizable", "error.alert.BAD_CREDENTIALS.title")
      }
      internal enum PartyRefused {
        /// Bah la partie est refusée hein
        internal static let description = L10n.tr("Localizable", "error.alert.PARTY_REFUSED.description")
        /// partie refusée
        internal static let title = L10n.tr("Localizable", "error.alert.PARTY_REFUSED.title")
      }
      internal enum TokenNotFound {
        /// Vous n'êtes pas connecté
        internal static let description = L10n.tr("Localizable", "error.alert.TOKEN_NOT_FOUND.description")
        /// Attention
        internal static let title = L10n.tr("Localizable", "error.alert.TOKEN_NOT_FOUND.title")
      }
      internal enum UnknowError {
        /// une erreur inconnue est survenue
        internal static let description = L10n.tr("Localizable", "error.alert.UNKNOW_ERROR.description")
        /// une erreur est survenue
        internal static let title = L10n.tr("Localizable", "error.alert.UNKNOW_ERROR.title")
      }
      internal enum UserInactive {
        /// Votre compte n'a pas encore été activé !\n Rendez-vous dans vos mails
        internal static let description = L10n.tr("Localizable", "error.alert.USER_INACTIVE.description")
        /// Attention
        internal static let title = L10n.tr("Localizable", "error.alert.USER_INACTIVE.title")
      }
      internal enum Button {
        /// Annuler
        internal static let cancel = L10n.tr("Localizable", "error.alert.button.cancel")
      }
    }
  }

  internal enum Event {
    /// ÉVÈNEMENTS
    internal static let title = L10n.tr("Localizable", "event.title")
  }

  internal enum EventDetail {
    internal enum Button {
      /// Prendre ma place
      internal static let payment = L10n.tr("Localizable", "eventDetail.button.payment")
      /// Scanner un QRCode
      internal static let scanner = L10n.tr("Localizable", "eventDetail.button.scanner")
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
      /// Prénom
      internal static let firstName = L10n.tr("Localizable", "settings.updateInfo.firstName")
      /// Nom
      internal static let lastName = L10n.tr("Localizable", "settings.updateInfo.lastName")
      /// Nom, Prénom, Mot de passe, Classe
      internal static let subTitle = L10n.tr("Localizable", "settings.updateInfo.subTitle")
    }
  }

  internal enum SignInView {
    internal enum Button {
      /// Se connecter
      internal static let login = L10n.tr("Localizable", "signInView.button.login")
      /// Créer un compte
      internal static let signIn = L10n.tr("Localizable", "signInView.button.signIn")
    }
    internal enum Section {
      /// Identifiants
      internal static let identifiers = L10n.tr("Localizable", "signInView.section.identifiers")
    }
    internal enum TextField {
      /// Email
      internal static let mail = L10n.tr("Localizable", "signInView.textField.mail")
      /// Mot de passe
      internal static let password = L10n.tr("Localizable", "signInView.textField.password")
    }
  }

  internal enum SignUpView {
    internal enum Button {
      /// Créer un compte
      internal static let signUp = L10n.tr("Localizable", "signUpView.button.signUp")
    }
    internal enum Section {
      /// Identifiants
      internal static let identifiers = L10n.tr("Localizable", "signUpView.section.identifiers")
      /// Informations personnelles
      internal static let personalInfos = L10n.tr("Localizable", "signUpView.section.personalInfos")
      /// Identifiants
      internal static let studentInfos = L10n.tr("Localizable", "signUpView.section.studentInfos")
    }
    internal enum TextField {
      internal enum Identifiers {
        /// Email
        internal static let mail = L10n.tr("Localizable", "signUpView.textField.identifiers.mail")
        /// Mot de passe
        internal static let password = L10n.tr("Localizable", "signUpView.textField.identifiers.password")
      }
      internal enum PersonalInfos {
        /// Prénom
        internal static let firstName = L10n.tr("Localizable", "signUpView.textField.personalInfos.firstName")
        /// Nom
        internal static let name = L10n.tr("Localizable", "signUpView.textField.personalInfos.name")
      }
      internal enum StudentInfos {
        /// Formation
        internal static let formation = L10n.tr("Localizable", "signUpView.textField.studentInfos.formation")
        /// Promotion
        internal static let promotion = L10n.tr("Localizable", "signUpView.textField.studentInfos.promotion")
      }
    }
  }

  internal enum TabBar {
    /// Contacts
    internal static let contact = L10n.tr("Localizable", "tabBar.contact")
    /// Évènements
    internal static let event = L10n.tr("Localizable", "tabBar.event")
    /// Profil
    internal static let profil = L10n.tr("Localizable", "tabBar.profil")
  }

  internal enum UpdateInfoView {
    /// Update
    internal static let title = L10n.tr("Localizable", "updateInfoView.title")
    internal enum Button {
      /// Mettre à jour mes données
      internal static let updateInfos = L10n.tr("Localizable", "updateInfoView.button.updateInfos")
    }
    internal enum Section {
      /// Identifiants
      internal static let identifiers = L10n.tr("Localizable", "updateInfoView.section.identifiers")
      /// Informations personnelles
      internal static let personalInfos = L10n.tr("Localizable", "updateInfoView.section.personalInfos")
      /// Informations étudiant
      internal static let studentInfos = L10n.tr("Localizable", "updateInfoView.section.studentInfos")
    }
    internal enum TextField {
      internal enum Identifiers {
        /// Mot de passe
        internal static let password = L10n.tr("Localizable", "updateInfoView.textField.identifiers.password")
      }
      internal enum PersonalInfos {
        /// Prénom
        internal static let firstName = L10n.tr("Localizable", "updateInfoView.textField.personalInfos.firstName")
        /// Nom
        internal static let name = L10n.tr("Localizable", "updateInfoView.textField.personalInfos.name")
      }
      internal enum StudentInfos {
        /// Formation
        internal static let formation = L10n.tr("Localizable", "updateInfoView.textField.studentInfos.formation")
        /// Promotion
        internal static let promotion = L10n.tr("Localizable", "updateInfoView.textField.studentInfos.promotion")
      }
    }
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
