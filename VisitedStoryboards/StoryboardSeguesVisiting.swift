import UIKit

class StoryboardContext: MasterViewControllerActionsHandler {

  var selectedDate: Date?

  func masterViewController(_ controller: MasterViewController, didChose object: Date) {
    selectedDate = object
  }

}

struct StoryboardSegueHandler {
  var context = StoryboardContext()

  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let storyboardController = StoryboardController(segue: segue,
                                                    sender: sender,
                                                    context: context)
    storyboardController.prepare()
  }
}


protocol StoryboardVisitableScene {
  func accept(visitor: StoryboardController)
}

protocol StoryboardManagedScene {
  var storyboardSegueHandler: StoryboardSegueHandler! { get set }
}

struct StoryboardController {
  let segue: UIStoryboardSegue
  let sender: Any?
  let context: StoryboardContext

  func prepare() {
    setupSegueHandlerOnDestination()
    dispatchVisitorToDestination()
  }

  private func setupSegueHandlerOnDestination() {
    guard var
      destination = segue.destination as? StoryboardManagedScene
    else {
      fatalError("destination must be StoryboardManagedScene")
    }

    destination.storyboardSegueHandler = StoryboardSegueHandler(context: context)
  }

  private func dispatchVisitorToDestination() {
    guard let
      destination = segue.destination as? StoryboardVisitableScene
    else {
      fatalError("destination must be StoryboardVisitableScene")
    }

    destination.accept(visitor: self)
  }
}
