//
//  CardView.swift
//  CardsAnimation
//
//  Created by Sheepy on 15/9/4.
//  Copyright (c) 2015年 Sheepy. All rights reserved.
//

import UIKit

class CardView: UIView {

    let imageView = UIImageView()
    
    init(frame: CGRect, image: String) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 2
        //self.layer.borderWidth = 0.3
        //self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSizeMake(0, 2)
        //self.layer.shadowColor = UIColor.grayColor().CGColor
        self.layer.shadowRadius = 3
        
        let width = frame.width
        let height = frame.height
        //imageView.frame = CGRectMake(width/20, height/20, width * 9/10, height * 9/10)
        //imageView.frame = self.bounds
        imageView.image = UIImage(named: image)
        self.addSubview(imageView)
        
//        let upSwipGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipGesture:")
//        upSwipGesture.direction = .Up
//        self.addGestureRecognizer(upSwipGesture)
//        let downSwipGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipGesture:")
//        downSwipGesture.direction = .Down
//        self.addGestureRecognizer(downSwipGesture)
    }
    
//    func handleSwipGesture(sender: UISwipeGestureRecognizer) {
//        let direction = sender.direction
//        switch direction {
//        case UISwipeGestureRecognizerDirection.Up:
//            UIView.animateWithDuration(0.3) {
//                self.center.y -= screenHeight
//            }
//        case UISwipeGestureRecognizerDirection.Down:
//            UIView.animateWithDuration(0.3) {
//                self.center.y += screenHeight
//            }
//        default: break
//        }
//        
//    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
