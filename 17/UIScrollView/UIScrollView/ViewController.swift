//
//  ViewController.swift
//  UIScrollView
//
//  Created by Sergey Lavrov on 02.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

  var scrollView = UIScrollView()
  var imageView = UIImageView()
    
  override func viewDidLoad() {
    super.viewDidLoad()

    //createScrollView()
    let image1 = UIImage(named: "1")
    let image2 = UIImage(named: "2")
    let image3 = UIImage(named: "3")
    
    // ScrollView
    let scrollViewRect = view.bounds
    scrollView = UIScrollView(frame: scrollViewRect)
    scrollView.contentSize = CGSize(width: scrollViewRect.size.width * 3, height: scrollViewRect.size.height)
    scrollView.isPagingEnabled = true
    view.addSubview(scrollView)
    
    // ImageViews
    var imageViewRect = view.bounds
    let imageView1 = newImageViewWithImage(paramImage: image1!, paramFrame: imageViewRect)
    scrollView.addSubview(imageView1)

    imageViewRect.origin.x += imageViewRect.size.width
    let imageView2 = newImageViewWithImage(paramImage: image2!, paramFrame: imageViewRect)
    scrollView.addSubview(imageView2)

    imageViewRect.origin.x += imageViewRect.size.width
    let imageView3 = newImageViewWithImage(paramImage: image3!, paramFrame: imageViewRect)
    scrollView.addSubview(imageView3)

  }

  //MARK: - UIScrollViewDelegate
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    print("начинается прокрутка")
    print(scrollView.contentOffset.y)
    scrollView.alpha = 0.5
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    print("после прокрутки")
    scrollView.alpha = 1.0
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    print("гарантирует, что вернёт альфу к 1")
    scrollView.alpha = 1.0
  }
  
  //MARK: - UI
  func createScrollView() {
    let imageLoad = UIImage(named: "1")
    imageView = UIImageView(image: imageLoad)
    scrollView = UIScrollView(frame: view.bounds)
    scrollView.addSubview(imageView)
    scrollView.contentSize = imageView.bounds.size
    scrollView.delegate = self
    view.addSubview(scrollView)
  }
  
  func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect)->UIImageView{
    let result = UIImageView(frame: paramFrame)
    result.contentMode = .scaleAspectFit
    result.image = paramImage
    return result
  }

}

