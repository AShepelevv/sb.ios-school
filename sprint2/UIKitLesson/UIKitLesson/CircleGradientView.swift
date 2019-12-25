//
//  CircleGradientView.swift
//  UIKitLesson
//
//  Created by Aleksey Shepelev on 08/11/2019.
//  Copyright © 2019 DK. All rights reserved.
//

import Foundation
import UIKit

class CircleGradientView : GradientView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
