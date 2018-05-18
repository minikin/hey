# Hey iOS

Hey is an iOS demo application.

## Meta

* **State:** development
* **Point People:** [Sasha Prokhorenko](https://github.com/minikin)
* **CI:** _ci status_

----------

* [Requirements](#requirements)
* [Setup](#setup)
* [Running the project](#running-the-project)
* [Architecture](#architecture)
* [Bugs](#bugs)

## Requirements

* iOS 9.0+ / macOS 10.13+
* Xcode 9.3+
* Swift 4.1+
* CocoaPods 1.5.0 +

## Setup

```bash
git clone https://github.com/minikin/hey.git && cd hey && make setup
```

## Running the project

From Xcode you can run the app `Hey.xcworkspace`.

## Architecture

* Coordinators should:
  * Manage view controller transitions
* View Controllers should:
  * Delegate 'final' actions to a Coordinator
  * **Not** access the navigation controller or present view controllers
  * Model ViewState (ie: Value type view model)
  * Target Actions and UI Delegates should modify the controller state or delegate.
    * UI Should be configured in one one method when the state is changed.
  * Contain minimal layout functionality
* Views should:
  * Define constants only if re-used
  * Specify colors via UIAppearance
  * Prefer attributed strings for text configuration
  * Adapt to changes in text size
  * Not use constructor-injected values
  * Confirm there no ambiguous constraints in View Debugger before commit
  * Use Dynamic Type to exercise text wrapping
  * Collection View and Table View cells should be avoided in favor of a generic wrapper cell
* ViewModels should:
  * Use value semantics if possible
  * Can be called an `Item` or `State` as needed
  * Use extensions to integration View integration
* Services Should
  * Expose contract via Protocol
  * Define domain specific logic
    * Validation
    * Entity Graph Management
    * Invoke server actions
    * Identifier management, uniquing and encapsulation
  * Encapsulate networking and persistence details
    * Transparently refresh OAuth tokens
    * Return persisted cache and refresh local store
    * Do not expose NSManagedObjectContext
    * Expose identifiers as opaque objects

## Bugs
* After logout, if a user tries to sign in (or sign up) again it's not possible to dismiss Auth Coordinator and present ContentCoordinator.