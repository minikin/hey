// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

internal struct SceneType<T: Any> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal struct InitialSceneType<T: Any> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal protocol SegueType: RawRepresentable { }

internal extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    let identifier = segue.rawValue
    performSegue(withIdentifier: identifier, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum ExploreBeaches: StoryboardType {
    internal static let storyboardName = "ExploreBeaches"

    internal static let initialScene = InitialSceneType<Hey.ExploreBeachesViewController>(storyboard: ExploreBeaches.self)

    internal static let exploreBeachesViewController = SceneType<Hey.ExploreBeachesViewController>(storyboard: ExploreBeaches.self, identifier: "ExploreBeachesViewController")
  }
  internal enum Favorite: StoryboardType {
    internal static let storyboardName = "Favorite"

    internal static let initialScene = InitialSceneType<Hey.FavoriteViewController>(storyboard: Favorite.self)

    internal static let favoriteViewController = SceneType<Hey.FavoriteViewController>(storyboard: Favorite.self, identifier: "FavoriteViewController")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum MyProfile: StoryboardType {
    internal static let storyboardName = "MyProfile"

    internal static let initialScene = InitialSceneType<Hey.MyProfileViewController>(storyboard: MyProfile.self)

    internal static let myProfileViewController = SceneType<Hey.MyProfileViewController>(storyboard: MyProfile.self, identifier: "MyProfileViewController")
  }
  internal enum SignIn: StoryboardType {
    internal static let storyboardName = "SignIn"

    internal static let initialScene = InitialSceneType<Hey.SignInViewController>(storyboard: SignIn.self)

    internal static let signInViewController = SceneType<Hey.SignInViewController>(storyboard: SignIn.self, identifier: "SignInViewController")
  }
}

internal enum StoryboardSegue {
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
