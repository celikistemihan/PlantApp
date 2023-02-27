//
//  OnboardingContainerViewController.swift
//  PlantApp
//
//

import UIKit
import SnapKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

final class OnboardingContainerViewController: UIViewController {
    
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupUI()
    }
    
    private func configurePageControl() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor(red: 19/255, green: 35/255, blue: 27/255, alpha: 0.25)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 19/255, green: 35/255, blue: 27/255, alpha: 1)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        let firstPage = FirstOnboardingViewController()
        let secondPage = SecondOnboardingViewController()
        
        pages.append(firstPage)
        pages.append(secondPage)
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupUI
private extension OnboardingContainerViewController {
    func setupUI() {
        view.backgroundColor = .clear
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        pageViewController.didMove(toParent: self)
        pageViewController.dataSource = self
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false)
        currentVC = pages.first!
    }
}

//MARK: - PageViewController Methods
extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}
