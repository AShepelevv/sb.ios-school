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
        
        gradientView = CircleGradientView(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.width))
        gradientView.center = view.center
        
        view.addSubview(gradientView)
        view.backgroundColor = .white
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panMoved))
        gradientView.addGestureRecognizer(panGesture)
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDone))
        swipeGestureRecognizer.direction = .down
        view.addGestureRecognizer(swipeGestureRecognizer)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc
    func panMoved() {
//        gradientView.layer =
        let gestureRecognizer = gradientView.gestureRecognizers!.first as! UIPanGestureRecognizer
        let x = gestureRecognizer.location(in: gradientView).x / gradientView.frame.width
        let y = gestureRecognizer.location(in: gradientView).y / gradientView.frame.height
        
        gradientView.colors = [getShadeOfGray(value: x), getShadeOfGray(value: y)]
    
    }
    
    @objc
    func swipeDone() {
        navigationController?.popViewController(animated: false)
    }
    
    func getShadeOfGray(value : CGFloat) -> UIColor {
        return UIColor(red: value, green: value, blue: value, alpha: 1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
