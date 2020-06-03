//
//  ViewController.swift
//  UIDynamicAnimation
//
//  Created by Sergey Lavrov on 03.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  //UICollisionBehavior - обнаружение столкновений
  //UIGravityBehavior - обеспечение тяготения
  //UIPushBehavior - реагирует на толчки
  //UISnapBehavior - крепит view к определенной точке
  
  //MARK: - Variable
  var squares = [UIDynamicItem]()
  var anim = UIDynamicAnimator()
  var push = UIPushBehavior()
  var squareView = UIView()
  
  //MARK: - Override
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    
    // Добавление квадратов по отдельности с гравитацией
    let greenSquare = createSquare(size: 100, color: UIColor.green,
                 x: Int(view.center.x)-50,
                 y: Int(view.center.y)-50)
    let redSquare = createSquare(size: 200, color: UIColor.red,
                 x: Int(view.center.x)-100,
                 y: 0)
    view.addSubview(greenSquare)
    view.addSubview(redSquare)
    
    anim = UIDynamicAnimator(referenceView: view)
    createGravity(animator: anim, objects: [greenSquare, redSquare])

    // Массовое добавление квадратов с гравитацией и столкновениями
    let colors = [UIColor.orange, UIColor.blue, UIColor.brown]
    fillSquares(size: 50, colors: colors)
    createGravity(animator: anim, objects: squares)
    createCollision(animator: anim, objects: squares)

    //работа с пушем
    squareView = createSquare(size: 80, color: UIColor.purple,
                                  x: Int(view.center.x), y: Int(view.center.y))
    view.addSubview(squareView)
    recognizer()
    createAnivationandBehaviors(square: squareView)
  }

  //MARK: - Method
  //создание кубика с указанным размером, цветом и координатами
  func createSquare(size: Int, color: UIColor, x: Int, y: Int) -> UIView{
    let square = UIView()
    square.frame = CGRect(x: x, y: y, width: size, height: size)
    square.backgroundColor = color
    return square
  }
  
  //создание и заполнение массива кубиков
  func fillSquares(size: Int, colors: [UIColor]){
    let numberOfView = colors.count
    squares.reserveCapacity(numberOfView)
    var centerPoint: CGPoint = view.center
    let eachViewSize = CGSize(width: size, height: size)
    
    for counter in 0..<numberOfView {
      let newView = createSquare(size: size, color: colors[counter],
                                 x: Int(centerPoint.x - CGFloat(size/2)),
                                 y: Int(centerPoint.y - CGFloat(size/2)))
      centerPoint.y += eachViewSize.height + 10
      view.addSubview(newView)
      squares.append(newView)
    }
  }
  
  //создание аниматора и тяготения
  func createGravity(animator: UIDynamicAnimator, objects: [UIDynamicItem]){
    let gravity = UIGravityBehavior(items: objects)
    animator.addBehavior(gravity)
  }
  
  //управление столкновениями
  func createCollision(animator: UIDynamicAnimator, objects: [UIDynamicItem]){
    let collision = UICollisionBehavior(items: squares)
    collision.translatesReferenceBoundsIntoBoundary = true
    collision.addBoundary(withIdentifier: "bottom" as NSCopying,
                          from: CGPoint(x: 0, y: view.bounds.size.height),
                          to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height - 100))
    collision.collisionDelegate = self
    animator.addBehavior(collision)
  }

  func recognizer() {
    let recognizer = UITapGestureRecognizer(target: self, action: #selector(handlerTap(param:)))
    view.addGestureRecognizer(recognizer)
  }
  
  func createAnivationandBehaviors(square: UIView){
    let collision = UICollisionBehavior(items: [square])
    collision.translatesReferenceBoundsIntoBoundary = true
    push = UIPushBehavior(items: [square], mode: .continuous)
    anim.addBehavior(collision)
    anim.addBehavior(push)
  }

  //MARK: - Selector
  @objc func handlerTap(param: UITapGestureRecognizer){
    //Получаем угол view
    let tapPoint: CGPoint = param.location(in: view)
    let centerPoint: CGPoint = squareView.center
    let deltaX: CGFloat = tapPoint.x - centerPoint.x
    let deltaY: CGFloat = tapPoint.y - centerPoint.y
    let angle: CGFloat = atan2(deltaY, deltaX)
    let distance: CGFloat = sqrt(pow(deltaX, 2.0) + pow(deltaY, 2.0))
    push.angle = angle
    push.magnitude = distance / 200
  }
  
}

//MARK: - Extension
extension ViewController: UICollisionBehaviorDelegate {

  func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
    let identifier = identifier as? String
    let bottomBoundary = "bottom"
    if identifier == bottomBoundary {
      UIView.animate(withDuration: 3.0, animations: {
        let view = item as? UIView
        view?.backgroundColor = .red
        view?.alpha = 0.0
        view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
      }, completion: { (finised) in
        let view = item as? UIView
        behavior.removeItem(item)
        view?.removeFromSuperview()
      })
    }
  }
}
