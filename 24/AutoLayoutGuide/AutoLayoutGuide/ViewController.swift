//
//  ViewController.swift
//  AutoLayoutGuide
//
//  Created by Sergey Lavrov on 04.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  //MARK: - Variable
  let view1: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    view.backgroundColor = .brown
    return view
  }()

  let view2: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    view.backgroundColor = .orange
    return view
  }()

  let view3: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    view.backgroundColor = .yellow
    return view
  }()
  
  let viewRed: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .red
    return view
  }()

  let viewBlue: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .blue
    return view
  }()
  
  let viewGreen: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .green
    return view
  }()

  let viewPurple: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .purple
    return view
  }()

  let viewCyan: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.cyan
    return view
  }()

  
  //MARK: - Override
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(view1)
    view.addSubview(view2)
    view.addSubview(view3)
    createView1Constraint()
    createView2Constraint()
    createView3Constraint()
    
    view.addSubview(viewRed)
    view.addSubview(viewBlue)
    createVFLConstraints()

    view.addSubview(viewGreen)
    view.addSubview(viewPurple)
    view.addSubview(viewCyan)
    createViewGreenConstraint()
    createViewPurpleConstraint()
    createViewCyanConstraint()
  }

  //MARK: - NSLayoutConstraint
  func createView1Constraint(){
    NSLayoutConstraint(item: view1, attribute: .leading, relatedBy: .equal,
                       toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
    
    NSLayoutConstraint(item: view1, attribute: .trailing, relatedBy: .equal,
                       toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
    
    NSLayoutConstraint(item: view1, attribute: .top, relatedBy: .equal,
                       toItem: view, attribute: .topMargin, multiplier: 1, constant: 100).isActive = true
    
    NSLayoutConstraint(item: view1, attribute: .height, relatedBy: .equal,
                       toItem: view, attribute: .width, multiplier: 1, constant: 0).isActive = true
  }
  
  func createView2Constraint(){
    NSLayoutConstraint(item: view2, attribute: .centerX, relatedBy: .equal,
                       toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
    
    NSLayoutConstraint(item: view2, attribute: .centerY, relatedBy: .equal,
                       toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    
    NSLayoutConstraint(item: view2, attribute: .width, relatedBy: .equal,
                       toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
    
    NSLayoutConstraint(item: view2, attribute: .height, relatedBy: .equal,
                       toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
  }

  func createView3Constraint(){
    NSLayoutConstraint(item: view3, attribute: .centerX, relatedBy: .equal,
                       toItem: view2, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
    
    NSLayoutConstraint(item: view3, attribute: .bottom, relatedBy: .equal,
                       toItem: view2, attribute: .top, multiplier: 1, constant: -10).isActive = true
    
    NSLayoutConstraint(item: view3, attribute: .width, relatedBy: .equal,
                       toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
    
    NSLayoutConstraint(item: view3, attribute: .height, relatedBy: .equal,
                       toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
  }

  //MARK: - VFL constraint
  func createVFLConstraints(){
    let viewVFL = ["viewRed": viewRed, "viewBlue": viewBlue]
    let metrics = ["height": 50, "width": view.bounds.size.width / 3, "top": 50]
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[viewRed(height)]|",
                                                       options: [], metrics: metrics, views: viewVFL))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[viewBlue(height)]|",
                                                       options: [], metrics: metrics, views: viewVFL))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[viewRed(width)]-(50)-[viewBlue(width)]-|",
                                                       options: [], metrics: metrics, views: viewVFL))

  }
  
  //MARK: - Anchor constraint
  func createViewGreenConstraint(){
    viewGreen.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    viewGreen.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
    viewGreen.heightAnchor.constraint(equalToConstant: 100).isActive = true
    viewGreen.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  func createViewPurpleConstraint(){
    viewPurple.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    viewPurple.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
    viewPurple.heightAnchor.constraint(equalToConstant: 100).isActive = true
    viewPurple.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }

  func createViewCyanConstraint(){
    viewCyan.leftAnchor.constraint(equalTo: viewGreen.leftAnchor).isActive = true
    viewCyan.rightAnchor.constraint(equalTo: viewPurple.rightAnchor).isActive = true
    viewCyan.topAnchor.constraint(equalTo: viewPurple.bottomAnchor, constant: 20).isActive = true
    viewCyan.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
}
