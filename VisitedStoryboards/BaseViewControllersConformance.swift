import UIKit


class StoryboardViewController: UIViewController, StoryboardManagedScene {
  var storyboardSegueHandler: StoryboardSegueHandler!

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    storyboardSegueHandler.prepare(for: segue, sender: sender)
  }
}


class StoryboardTableViewController: UITableViewController, StoryboardManagedScene {
  var storyboardSegueHandler: StoryboardSegueHandler!

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    storyboardSegueHandler.prepare(for: segue, sender: sender)
  }
}


class StoryboardNavigationController: UINavigationController, StoryboardManagedScene {

  var storyboardSegueHandler: StoryboardSegueHandler! {
    didSet {
      prepareRootViewController()
    }
  }

  private func prepareRootViewController() {
    guard let root = topViewController else {
      fatalError("topViewController must have been set")
    }

    let segue = UIStoryboardSegue(identifier: nil,
                                  source: self,
                                  destination: root)

    prepare(for: segue, sender: nil)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    storyboardSegueHandler.prepare(for: segue, sender: sender)
  }
}


