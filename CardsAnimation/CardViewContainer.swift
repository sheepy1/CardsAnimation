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
    var imageFrameList = [CGRect]()
    //var cardAlphaList = [CGFloat]()
    var cardCenterYList = [CGFloat]()
    var dateList = [Int]()
    var index = 0
//        {
//        didSet {
//            if index < 0 || index >= cardList.count {
//                return
//            }
//            //当前显示的卡片
//            card = cardList[index]
//            cardCenterY = cardCenterYList[index]
//            //下一张卡片
//            if index < cardList.count - 1 {
//                nextCard = cardList[index+1]
//                nextCardCenterY = cardCenterYList[index+1]
//            }
//            //上一张卡片
//            if index > 0 {
//                lastCard = cardList[index-1]
//                lastCardCenterY = cardCenterYList[index-1]
//            }
//            date = dateList[index]
//        }
//    }
    
//    var date = 1
//    var card: CardView!
//    var lastCard: CardView!
//    var nextCard: CardView!
//    var nextCardCenterY: CGFloat!
//    var cardCenterY: CGFloat!
//    var lastCardCenterY: CGFloat!
    var startPointY: CGFloat = 0
    
    var circleView: CircleView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let width = frame.width
        let height = frame.height
        
        for i in 0...2 {
            //等比缩放
            //r2 = CGRectInset(r1, dx, dy):r2 = CGRect(r1.origin.x+dx, r1.origin.y+dy, r1.width-dx*2, r1.height-dy*2)
            let cardView = CardView(frame: CGRectInset(self.bounds, screenWidth/40 * CGFloat(i), screenHeight/40 * CGFloat(i)), image: "pic\(i+1)")
            let blankHeight = CGFloat(i) * height/15
            cardView.center.y = height/2 - blankHeight
            cardView.imageView.frame = CGRect(x: 0, y: blankHeight, width: cardView.bounds.width, height: cardView.bounds.height - blankHeight)
            //cardView.alpha = 1 - CGFloat(i) * 0.1
            self.addSubview(cardView)
            self.sendSubviewToBack(cardView)
            cardList.append(cardView)
            cardFrameList.append(cardView.frame)
            imageFrameList.append(cardView.imageView.frame)
            //cardAlphaList.append(cardView.alpha)
            cardCenterYList.append(cardView.center.y)
            dateList.append((i + 1) * 5)
        }

        circleView = CircleView(frame: CGRect(x: width/2 - width/10, y: height - height/10, width: width/5, height: height/5))
//        circleView.drawCircle()
        self.addSubview(circleView)
        circleView.date = dateList[0]
        
        let panGesture = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        self.addGestureRecognizer(panGesture)
        
    }

    func handlePanGesture(sender: UIPanGestureRecognizer) {
        assert(index < cardList.count && index >= 0, "数组越界")
        
        let card = cardList[index]
        let cardCenterY = cardCenterYList[0]

        let state = sender.state
        switch state {
        case .Began:
            startPointY = sender.locationInView(self).y
        case .Changed:
            let touchPointY = sender.translationInView(self).y
            //println(touchPointY)
            if touchPointY > 0 {
                if index == 0 {
                    return
                }
                cardList[index-1].center.y += touchPointY
            } else {
                card.center.y += touchPointY
            }
            sender.setTranslation(CGPointZero, inView: self)
        case .Ended:
            let endPointY = sender.locationInView(self).y
            let border = card.frame.height/4
            
            if startPointY < endPointY && index > 0{
//                if index = 0 {
//                    return
//                }
                //上一张卡片下落归位
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.cardList[--self.index].center.y = cardCenterY
                }, completion: nil)
                //--index
                UIView.animateWithDuration(0.2) {
                    for i in self.index+1...2 {
                        self.cardList[i].frame = self.cardFrameList[i-self.index]
                        self.cardList[i].imageView.frame = self.imageFrameList[i-self.index]
                    }
                }
                circleView.date = dateList[index]
            } else if startPointY - endPointY > border && index < cardList.count - 1 {
//                if index == cardList.count - 1 {
//                    return
//                }
                //卡片飞走
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    card.center.y -= (card.bounds.height + self.frame.origin.y)
                }, completion: nil)
                
                UIView.animateWithDuration(0.2) {
                    for i in ++self.index...2 {
                        self.cardList[i].frame = self.cardFrameList[i-self.index]
                        self.cardList[i].imageView.frame = self.imageFrameList[i-self.index]
                    }
//                    self.card.frame = self.cardFrameList.first!
//                    self.card.imageView.frame = self.card.bounds
                }
                circleView.date = dateList[index]
            } else {
                UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    card.center.y = cardCenterY
                }, completion: nil)
            }
        default: break
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
