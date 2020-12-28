//
//  PageViewController.swift
//  firstApp
//
//  Created by Айдар on 05.11.2020.
//

import UIKit
import RxCocoa
import RxSwift

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        self.view.backgroundColor = UIColor.darkGray
        if UserDefaults.standard.bool(forKey: "stopWelcomePage") {
         let postVC = self.storyboard?.instantiateViewController(identifier: "BarViewController")
         self.navigationController?.pushViewController(postVC!, animated: true)
        }
        if let firstViewController = allViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private lazy var allViewControllers: [UIViewController] = {
        return [self.newViewController(storyBoardID: "FirstViewController"),
                self.newViewController(storyBoardID: "SecondViewController"),
                self.newViewController(storyBoardID: "ThirdViewController")]
    }()
    private func newViewController(storyBoardID: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyBoardID)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = allViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard allViewControllers.count > previousIndex else {
            return nil
        }
        return allViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = allViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let ViewControllersCount = allViewControllers.count
        guard ViewControllersCount != nextIndex else {
            return nil
        }
        guard ViewControllersCount > nextIndex else {
            return nil
        }
        return allViewControllers[nextIndex]
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return allViewControllers.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
