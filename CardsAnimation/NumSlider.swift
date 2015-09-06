//
//  NumSlider.swift
//  CardsAnimation
//
//  Created by Sheepy on 15/9/4.
//  Copyright (c) 2015年 Sheepy. All rights reserved.
//

import UIKit

class NumSlider: UIScrollView {
    
    var type = NumSliderType.SingleDigit
    var width: CGFloat!
    var height: CGFloat!
    
    init(frame: CGRect, type: NumSliderType) {
        super.init(frame: frame)
        
        width = frame.width
        height = frame.height
        self.type = type
        self.contentSize = CGSize(width: width, height: height * 10)
        
        for i in 0...9 {
            let label = UILabel(frame: CGRectMake(0, height * CGFloat(i), width, height))
            label.text = "\(i)"
            //label.backgroundColor = UIColor.whiteColor()
            label.textColor = UIColor.blackColor()
            label.font = UIFont.systemFontOfSize(20)
            label.textAlignment = .Center
//            label.layer.borderWidth = 0
//            label.layer.borderColor = UIColor.whiteColor().CGColor
            self.addSubview(label)
        }
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func slideToNum(num: Int) {
        if num < 0 || num > 9 {
            return
        }
        
        switch type {
        case .TenDigit:
            UIView.animateWithDuration(0.85) {
                self.contentOffset.y = self.height * CGFloat(num)
            }
        case .SingleDigit:
            UIView.animateWithDuration(1) {
                self.contentOffset.y = self.height * CGFloat(num)
            }
        }
        
    }
    
}

enum NumSliderType {
    case SingleDigit
    case TenDigit
}