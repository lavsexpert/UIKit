//
//  ViewController.swift
//  UIDynamic
//
//  Created by Sergey Lavrov on 04.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  //UIAttachmentBehavior - привязка
  //UISnapBehavior - снимок
  
  //MARK: - Variable
  var squareView = UIView()
  var anchorInSquare = UIView()
  var anchorView = UIView()
  var animator = UIDynamicAnimator()
  var attachment: UIAttachmentBehavior?
  var snap: UISnapBehavior?

  //MARK: - Override
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    createSquareView()
    createAnchorView()

    animator = UIDynamicAnimator(referenceView: view)
    createCollision()
    createPan()
    createAttachment()
    createTap()
    createSnap()
  }

  //MARK: - Method
  //Создаём квадрат с маленьким квадратом внутри
  func createSquareView() {
    squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    squareView.backgroundColor = .green
    squareView.center = view.center
    anchorInSquare = UIView(frame: CGRect(x: 60, y: 0, width: 20, height: 20))
    anchorInSquare.backgroundColor = .brown
    squareView.addSubview(anchorInSquare)
    view.addSubview(squareView)
  }
  
  //Создаём view с точкой привязки
  func createAnchorView(){
    anchorView = UIView(frame: CGRect(x: 120, y: 120, width: 20, height: 20))
    anchorView.backgroundColor = .red
    view.addSubview(anchorView)
  }
  
  //Создаём регистратор жеста панорамирования
  func createPan(){
    let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(param:)))
    view.addGestureRecognizer(recognizer)
  }
  
  //Создаем столкновение
  func createCollision(){
    let collision = UICollisionBehavior(items: [squareView])
    collision.translatesReferenceBoundsIntoBoundary = true
    animator.addBehavior(collision)
  }
  
  //Создаем прикрепление
  func createAttachment(){
    attachment = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
    animator.addBehavior(attachment!)
  }
  
  //Создание жеста тапа
  func createTap(){
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(param:)))
    view.addGestureRecognizer(tap)
  }
  
  func createSnap(){
    snap = UISnapBehavior(item: anchorView, snapTo: anchorView.center)
    snap?.damping = 0.5
    animator.addBehavior(snap!)
  }
  
  //MARK: - Selector
  //Определяет где палец, определяет красный квадрат и привязывает к большому
  @objc func handlePan(param: UIPanGestureRecognizer){
    let tapPoint = param.location(in: view)
    if snap != nil {
      animator.removeBehavior(snap!)
    }
    attachment?.anchorPoint = tapPoint
    anchorView.center = tapPoint
  }
  
  @objc func handleTap(param: UITapGestureRecognizer){
    let tapPoint = param.location(in: view)
    if snap != nil {
      animator.removeBehavior(snap!)
    }
    snap = UISnapBehavior(item: anchorView, snapTo: tapPoint)
    snap?.damping = 0.5
    animator.addBehavior(snap!)
  }
}

