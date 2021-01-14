//
//  PageViewController.swift
//  firstApp
//
//  Created by Айдар on 05.11.2020.
//

import UIKit
import RxCocoa
import RxSwift

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageControl = UIPageControl()
    private lazy var allViewControllers: [UIViewController] = {
        return [self.newViewController(storyBoardID: "FirstViewController"),
                self.newViewController(storyBoardID: "SecondViewController"),
                self.newViewController(storyBoardID: "ThirdViewController")]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if UserDefaults.standard.bool(forKey: "stopWelcomePage") {
         let postVC = self.storyboard?.instantiateViewController(identifier: "BarViewController")
         self.navigationController?.pushViewController(postVC!, animated: true)
        }
        if let firstViewController = allViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        configPageControl()
    }
    
    private func newViewController(storyBoardID: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyBoardID)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let pageContent = pageViewController.viewControllers? [0] else {return}
        self.pageControl.currentPage = allViewControllers.firstIndex(of: pageContent) ?? 0
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
        guard ViewControllersCount > nextIndex else {
            return nil
        }
        guard ViewControllersCount > nextIndex else {
            return nil
        }
        return allViewControllers[nextIndex]
    }
    func configPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 100, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = allViewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = .gray
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .systemOrange
        self.view.addSubview(pageControl)
    }
}
