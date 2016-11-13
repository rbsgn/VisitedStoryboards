//
//  AppDelegate.swift
//  VisitedStoryboards
//
//  Created by Roman Buussyghin on 12/11/2016.
//  Copyright © 2016 Roman Buussyghin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

  var window: UIWindow?
  var storyboardsSegueHandler = StoryboardSegueHandler()


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let splitViewController = self.window!.rootViewController as! UISplitViewController
    let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! StoryboardNavigationController

    navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
    splitViewController.delegate = self


    splitViewController.viewControllers.forEach { vc in
      (vc as! StoryboardNavigationController).storyboardSegueHandler = self.storyboardsSegueHandler
    }


    return true
  }

 

  // MARK: - Split view

  func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
      guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
      guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
      if topAsDetailController.detailItem == nil {
          // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
          return true
      }


      return false
  }
}

