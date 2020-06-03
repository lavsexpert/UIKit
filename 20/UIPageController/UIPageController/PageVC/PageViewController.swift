//
//  PageViewController.swift
//  UIPageController
//
//  Created by Sergey Lavrov on 03.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

  //MARK: - Variable
  var cars = [CarsHelper]()
  var first = UIImage(named: "1")
  var second = UIImage(named: "2")
  var third = UIImage(named: "3")

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Cars"
    let firstCar = CarsHelper(name: "Car - 1", image: first!)
    let secondCar = CarsHelper(name: "Car - 2", image: second!)
    let thirdCar = CarsHelper(name: "Car - 3", image: third!)
    cars.append(firstCar)
    cars.append(secondCar)
    cars.append(thirdCar)
  }
  
  //MARK: - Create VC
  lazy var arrayCars: [CarViewController] = {
    var carsVC = [CarViewController]()
    for car in cars {
      carsVC.append(CarViewController(carWith: car))
    }
    return carsVC
  }()
  
  //MARK: - Init
  override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
    super.init(transitionStyle: .pageCurl, navigationOrientation: navigationOrientation, options: nil)
    view.backgroundColor = .black
    self.dataSource = self
    self.delegate = self
    setViewControllers([arrayCars[0]], direction: .forward, animated: true, completion: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    guard let viewController = viewController as? CarViewController else {return nil}
    if let index = arrayCars.firstIndex(of: viewController) {
      if index > 0 {
        return arrayCars[index - 1]
      }
    }
    return nil
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    guard let viewController = viewController as? CarViewController else {return nil}
    if let index = arrayCars.firstIndex(of: viewController) {
      if index < cars.count - 1 {
        return arrayCars[index + 1]
      }
    }
    return nil
  }
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return cars.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return 0
  }
}
