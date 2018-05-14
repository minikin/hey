// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



//swiftlint:disable:previous vertical_whitespace

// MARK: - AuthCoordinator
protocol AuthCoordinatorDelegate: AnyObject {
    func authCoordinator(_ coordinator: AuthCoordinator, didNotify action: AuthCoordinator.Action)
}

extension AuthCoordinator {

    typealias ActionType = Action
    typealias Delegate = AuthCoordinatorDelegate

    func notify(_ action: ActionType) {
        delegate?.authCoordinator(self, didNotify: action)
    }

}

// MARK: - SignInCoordinator
protocol SignInCoordinatorDelegate: AnyObject {
    func signInCoordinator(_ coordinator: SignInCoordinator, didNotify action: SignInCoordinator.Action)
}

extension SignInCoordinator {

    typealias ActionType = Action
    typealias Delegate = SignInCoordinatorDelegate

    func notify(_ action: ActionType) {
        delegate?.signInCoordinator(self, didNotify: action)
    }

}

// MARK: - SignInViewController
protocol SignInViewControllerDelegate: AnyObject {
    func signInViewController(_ vc: SignInViewController, didNotify action: SignInViewController.Action)
}

extension SignInViewController {

    typealias ActionType = Action
    typealias Delegate = SignInViewControllerDelegate

    func notify(_ action: ActionType) {
        delegate?.signInViewController(self, didNotify: action)
    }

}
