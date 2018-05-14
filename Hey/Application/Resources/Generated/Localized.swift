// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {
  internal enum Application {

    internal enum Title {
      /// Hey Beaches
      internal static let navigation = L10n.tr("Application", "Title.Navigation")

      internal enum Navigation {
        /// SignIn
        internal static let signIn = L10n.tr("Application", "Title.Navigation.SignIn")
      }
    }

    internal enum Uitabbaritem {

      internal enum Title {
        /// Explore
        internal static let explore = L10n.tr("Application", "UITabBarItem.Title.Explore")
        /// Favorite
        internal static let favorite = L10n.tr("Application", "UITabBarItem.Title.Favorite")
        /// My Profile
        internal static let myProfile = L10n.tr("Application", "UITabBarItem.Title.MyProfile")
      }
    }
  }
  internal enum SignIn {

    internal enum Signin {

      internal enum Button {

        internal enum Title {
          /// Sign In
          internal static let signIn = L10n.tr("SignIn", "SignIn.Button.Title.SignIn")
          /// Sign Up
          internal static let signUp = L10n.tr("SignIn", "SignIn.Button.Title.SignUp")
        }
      }
    }

    internal enum Signinorsignup {

      internal enum Button {

        internal enum Title {
          /// Registered? Sign In!
          internal static let signIn = L10n.tr("SignIn", "SignInOrSignUp.Button.Title.SignIn")
          /// Want to Sign Up?
          internal static let signUp = L10n.tr("SignIn", "SignInOrSignUp.Button.Title.SignUp")
        }
      }
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
