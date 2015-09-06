//
//  CardViewContainer.swift
//  CardsAnimation
//
//  Created by Sheepy on 15/9/5.
//  Copyright (c) 2015年 Sheepy. All rights reserved.
//

import UIKit

class CardViewContainer: UIView {
    
    var cardList = [CardView]()
    var cardFrameList = [CGRect]()
    var cardAlphaList = [CGFloat]()
    var cardCenterYList = [CGFloat]()
    
    var startPoint = CGPointZero
    
    var circleView: CircleView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let width = frame.width
        let height = frame.height
        
        for i in 0...2 {
            let cardView = CardView(frame: CGRectInset(self.bounds, screenWidth/40 * CGFloat(i), screenHeight/40 * CGFloat(i)), image: "testimg\(i+1)")
            cardView.center.y = height/2 + CGFloat(i) * height/15
            //cardView.alpha = 1 - CGFloat(i) * 0.1
            self.addSubview(cardView)
            self.sendSubviewToBack(cardView)
            cardList.append(cardView)
            cardFrameList.append(cardView.frame)
            cardAlphaList.append(cardView.alpha)
            cardCenterYList.append(cardView.center.y)
        }
        
        let panGesture = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        self.addGestureRecognizer(panGesture)
        
    }

    func handlePanGesture(sender: UIPanGestureRecognizer) {
        let state = sender.state
        
        let card = cardList.first!
        let cardCenterY = cardCenterYList.first!
        switch state {
        case .Began:
            startPoint = sender.locationInView(self)
        case .Changed:
            let touchPoint = sender.translationInView(self)
            card.center.y += touchPoint.y
            sender.setTranslation(CGPointZero, inView: self)
        case .Ended:
            let endPoint = sender.locationInView(self)
            let border = card.frame.height/5
            if startPoint.y - endPoint.y > border {
                UIView.animateWithDuration(0.3) {
                    card.center.y = -screenHeight
                }
                circleView.date = 19
            } else {
                UIView.animateWithDuration(0.2) {
                    card.center.y = cardCenterY
                }
                circleView.date = 1
            }
        default: break
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
