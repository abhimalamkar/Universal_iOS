//
//  BasePageViewControllerWithTabViewController.swift
//  Universal_iOS
//
//  Created by Abhijeet Malamkar on 7/24/18.
//

import UIKit

@available(iOS 11.0, *)
public class BasePageViewControllerWithTabViewController: UIViewController {

    public let CELL_ID = "CELL_ID"
    public var ITEMS = ["Matches","Table","Social","Top Scorer","Trivia"]
    
    public var currentPageIndex = 0
    
    public lazy var tabBar:TabbarLayoutView = {
        let view = TabbarLayoutView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.ITEMS = ITEMS
        view.backgroundColor = UIColor(hexString: "#212121")
        view.FONT_SIZE = 14
        view.delegate = self
        return view
    }()
    
    private var shadowImageView: UIImageView?
    
    private func findShadowImage(under view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1 {
            return (view as! UIImageView)
        }
        
        for subview in view.subviews {
            if let imageView = findShadowImage(under: subview) {
                return imageView
            }
        }
        return nil
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if shadowImageView == nil {
            shadowImageView = findShadowImage(under: navigationController!.navigationBar)
        }
        shadowImageView?.isHidden = true
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        shadowImageView?.isHidden = false
    }
    
    public lazy var pageController: UIPageViewController = {
        let view = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: .horizontal, options: nil)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    
    var controllers:[UIViewController]?
    
   public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        handleTabbar()
        setupPageView()
    }
    
    func handleTabbar(){
        view.backgroundColor = UIColor(hexString: "#212121")
        view.addSubview(tabBar)
        
        tabBar.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 32)
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Football Paradise"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#212121")
        navigationController?.navigationBar.tintColor = UIColor(hexString: "#212121")
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [kCTForegroundColorAttributeName: UIColor.white,
                                                                             kCTFontAttributeName: UIFont(name: "NewYorker", size: 22)!] as [NSAttributedStringKey : Any]
        self.navigationController?.navigationBar.titleTextAttributes =
            [kCTForegroundColorAttributeName: UIColor.white,
             kCTFontAttributeName: UIFont(name: "NewYorker", size: 22)!] as [NSAttributedStringKey : Any]
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

@available(iOS 11.0, *)
extension BasePageViewControllerWithTabViewController: ScrollToIndex, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
   public func scrollTo(index: Int) {
        //print(currentPageIndex,index)
        self.pageController.setViewControllers([self.controllers![index]], direction: currentPageIndex > index ? .reverse : .forward, animated: true)
        currentPageIndex = index
    }
    
    public func setupPageView(){
        addChildViewController(pageController)
        view.addSubview(pageController.view)
        
        pageController.view.anchor(tabBar.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        if let controller = controllers?[0] {
            self.pageController.setViewControllers([controller], direction: .forward, animated: true)
        }
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        if (!completed)
        {
            return
        }
        
        self.currentPageIndex = pageViewController.viewControllers!.first!.view.tag //Page Index
        //tabBar.setSelected(index: currentPageIndex)
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers?.index(of: viewController) {
            if index > 1 {
                return controllers?[index - 1]
            }
        }
        
        return nil
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers?.index(of: viewController) {
            print(index)
            if index < (controllers?.count)! - 1 {
                return controllers?[index + 1]
            }
        }
        
        return nil
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //menuBar.horizontalBarLeftAnchorConstrain?.constant = scrollView.contentOffset.x / 4
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //print(targetContentOffset.pointee.x/view.frame.width)
        let menuIndex = Int(targetContentOffset.pointee.x/view.frame.width)
        let indexPath = IndexPath(row: menuIndex, section: 0)
        tabBar.setSelected(index: indexPath.row)
    }
}

