//
//  CirCleView.swift
//  CardsAnimation
//
//  Created by Sheepy on 15/9/3.
//  Copyright (c) 2015年 Sheepy. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    var circleLayer: CAShapeLayer!
    var singleDigitSlider: NumSlider!
    var tenDigitSlider: NumSlider!
    
    var date: Int! {
        didSet {
            assert(date < 32 && date > 0, "date应在0~31之间")
            tenDigitSlider.slideToNum(date/10)
            singleDigitSlider.slideToNum(date%10)
            drawCircle()
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let width = self.frame.width
        let height = self.frame.height
       
        circleLayer = CAShapeLayer()
        circleLayer.lineWidth = 2
        circleLayer.fillColor = UIColor.whiteColor().CGColor
        circleLayer.strokeColor = UIColor.blackColor().CGColor
        //半径
        let radius = width/2
        let center = CGPointMake(radius, radius)
        let startAngle = CGFloat(-M_PI_2)
        let endAngle = CGFloat(M_PI_2 * 3)
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circleLayer.path = circlePath.CGPath
        self.layer.addSublayer(circleLayer)
        
        tenDigitSlider = NumSlider(frame: CGRectMake(width/6, height/4, width/3, height/4), type: .TenDigit)
        singleDigitSlider = NumSlider(frame: CGRectMake(width/6 + width/3, height/4, width/3, height/4), type: .SingleDigit)
        self.addSubview(tenDigitSlider)
        self.addSubview(singleDigitSlider)
    }
    
    func drawCircle() {
        //strokeEnd是CAShapeLayer的一个属性.CABasicAnimation中的动画都通过CAShapeLayer中的属性完成
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        pathAnimation.duration = 0.5
        circleLayer.addAnimation(pathAnimation, forKey: "pathAnimation")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
