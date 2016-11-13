extension StoryboardController {

  func visit(_ scene: MasterViewController) {
    scene.actionsHandler = context
  }

  func visit(_ scene: DetailViewController) {
    scene.detailItem = context.selectedDate
  }
}

extension StoryboardNavigationController: StoryboardVisitableScene {
  func accept(visitor: StoryboardController) {
    if let masterViewController = topViewController as? MasterViewController {
      visitor.visit(masterViewController)
    }
    else if let detailViewController = topViewController as? DetailViewController {
      visitor.visit(detailViewController)
    }
  }
}


extension MasterViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardController) {
    visitor.visit(self)
  }
}

extension DetailViewController: StoryboardVisitableScene {
  func accept(visitor: StoryboardController) {
    visitor.visit(self)
  }
}
