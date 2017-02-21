//
//  MainVC.swift
//  PageViewController
//
//  Created by Hoàng Minh Thành on 2/20/17.
//  Copyright © 2017 Hoàng Minh Thành. All rights reserved.
//

import UIKit
import EMPageViewController

class MainVC: UIViewController {

    var greetings: [String] = ["Hello!", "¡Hola!", "Salut!", "Hallo!", "Ciao!"]
    var greetingColors: [UIColor] = [
        UIColor(red: 108.0/255.0, green: 122.0/255.0, blue: 137.0/255.0, alpha: 1.0),
        UIColor(red: 135.0/255.0, green: 211.0/255.0, blue: 124.0/255.0, alpha: 1.0),
        UIColor(red: 34.0/255.0, green: 167.0/255.0, blue: 240.0/255.0, alpha: 1.0),
        UIColor(red: 245.0/255.0, green: 171.0/255.0, blue: 53.0/255.0, alpha: 1.0),
        UIColor(red: 214.0/255.0, green: 69.0/255.0, blue: 65.0/255.0, alpha: 1.0)
    ]
    
    var pageViewController: EMPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let pageViewController = EMPageViewController()
        // Or, for a vertical orientation
        // let pageViewController = EMPageViewController(navigationOrientation: .Vertical)
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        // Set the initially selected view controller
        // IMPORTANT: If you are using a dataSource, make sure you set it BEFORE calling selectViewController:direction:animated:completion
        let currentViewController = self.viewController(at: 0)!
        pageViewController.selectViewController(currentViewController, direction: .forward, animated: false, completion: nil)
        // Add EMPageViewController to the root view controller
        self.addChildViewController(pageViewController)
        self.view.insertSubview(pageViewController.view, at: 0)
        pageViewController.didMove(toParentViewController: self)
        
        self.pageViewController = pageViewController
    }

}

extension MainVC: EMPageViewControllerDataSource, EMPageViewControllerDelegate {
    func em_pageViewController(_ pageViewController: EMPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.index(of: viewController as! WeatherVC) {
            let beforeViewController = self.viewController(at: viewControllerIndex - 1)
            return beforeViewController
        } else {
            return nil
        }
    }
    
    func em_pageViewController(_ pageViewController: EMPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.index(of: viewController as! WeatherVC) {
            let afterViewController = self.viewController(at: viewControllerIndex + 1)
            return afterViewController
        } else {
            return nil
        }
    }
    
    func viewController(at index: Int) -> WeatherVC? {
        if (self.greetings.count == 0) || (index < 0) || (index >= self.greetings.count) {
            return nil
        }
        
        let viewController = WeatherVC(nibName: "WeatherVC", bundle: nil)
        viewController.greeting = self.greetings[index]
        viewController.color = self.greetingColors[index]
        viewController.index = index
        return viewController
    }
    
    func index(of viewController: WeatherVC) -> Int? {
        if let greeting: String = viewController.greeting {
            return self.greetings.index(of: greeting)
        } else {
            return nil
        }
    }
}
