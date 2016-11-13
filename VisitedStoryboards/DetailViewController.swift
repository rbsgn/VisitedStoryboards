//
//  DetailViewController.swift
//  VisitedStoryboards
//
//  Created by Roman Buussyghin on 12/11/2016.
//  Copyright © 2016 Roman Buussyghin. All rights reserved.
//

import UIKit

class DetailViewController: StoryboardViewController {

  @IBOutlet weak var detailDescriptionLabel: UILabel!


  func configureView() {
    // Update the user interface for the detail item.
    if let detail = self.detailItem {
        if let label = self.detailDescriptionLabel {
            label.text = detail.description
        }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.configureView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  var detailItem: Date? {
    didSet {
        // Update the view.
        self.configureView()
    }
  }


}

