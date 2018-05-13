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
