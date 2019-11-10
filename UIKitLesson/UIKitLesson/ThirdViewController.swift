//
//  ThirdViewController.swift
//  UIKitLesson
//
//  Created by Aleksey Shepelev on 08/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var gradientView : CircleGradientView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientView = CircleGradientView(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 200))
        gradientView.center = view.center
        
        view.addSubview(gradientView)
        view.backgroundColor = .white
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panMoved))
        gradientView.addGestureRecognizer(panGesture)
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDone))
        swipeGestureRecognizer.direction = .down
        
        view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc
    func panMoved() {
        let gestureRecognizer = gradientView.gestureRecognizers!.first as! UIPanGestureRecognizer
        let x = gestureRecognizer.location(in: view).x
        let y = gestureRecognizer.location(in: view).y
        gradientView.center = CGPoint(x: x , y: y)
        gradientView.colors = [getShadeOfGray(value: x / view.frame.width), getShadeOfGray(value: y / view.frame.height)]
    
    }
    
    @objc
    func swipeDone() {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func getShadeOfGray(value : CGFloat) -> UIColor {
        return UIColor(red: value, green: 0.67 * value, blue: 0.33 * value, alpha: 1)
    }
}
