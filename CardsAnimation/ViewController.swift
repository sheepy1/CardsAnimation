//
//  ViewController.swift
//  CardsAnimation
//
//  Created by Sheepy on 15/9/3.
//  Copyright (c) 2015年 Sheepy. All rights reserved.
//

import UIKit


let screenWidth = UIScreen.mainScreen().bounds.width
let screenHeight = UIScreen.mainScreen().bounds.height

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //view.backgroundColor = UIColor.blackColor()
        
        let frame = CGRectMake(screenWidth/2 - screenWidth/10, screenHeight * 3/4, screenWidth/5, screenWidth/5)
        let circle = CircleView(frame: frame)
        view.addSubview(circle)
        circle.drawCircle()
        
        let rect = CGRectMake(screenWidth/10, screenHeight/10, screenWidth * 4/5, screenHeight/2)
        let cardContainer = CardViewContainer(frame: rect)
        cardContainer.circleView = circle
        view.addSubview(cardContainer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

