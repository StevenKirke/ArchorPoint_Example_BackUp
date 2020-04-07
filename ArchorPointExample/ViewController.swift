//
//  ViewController.swift
//  ArchorPointExample
//
//  Created by Steven Kirke on 07.04.2020.
//  Copyright © 2020 Steven Kirke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var containerForBlock:          UIView!
    var blockExample:               UIView!
    var imageCircleRed:             UIView!
    var imageCircleBlue:            UIView!
    
    var containerForArchorPoint:    UIStackView!
    var containerForPosition:       UIStackView!
    
    var sliderArchorPointX:         UISlider!
    var sliderArchorPointY:         UISlider!
    
    var labelArchorPointX:          UILabel!
    var labelArchorPointY:          UILabel!
    var labelRotate:                UILabel!
    var labelNameArchorPoint:       UILabel!
    
    var stepperPotate:              UIStepper!
    
    var stepRotate                  = 15.0
    var currentValueStepper:        Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerForBlock                        = UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 240))
        containerForBlock.layer.borderWidth      = 1
        containerForBlock.center                 = CGPoint(x: self.view.center.x, y: self.view.frame.minY + containerForBlock.bounds.height)
        view.addSubview(containerForBlock)
        
        blockExample                             = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        blockExample.layer.borderWidth           = 1
        blockExample.layer.borderColor           = UIColor.green.cgColor
        blockExample.layer.position              = CGPoint(x: self.containerForBlock.layer.position.x, y: self.containerForBlock.layer.position.y)
        view.addSubview(blockExample)
        
        containerForArchorPoint                  = UIStackView(frame: CGRect(x: 0, y: 0, width: 360, height: 120))
        containerForArchorPoint.axis             = .vertical
        containerForArchorPoint.spacing          = 0
        containerForArchorPoint.alignment        = .fill
        containerForArchorPoint.distribution     = .fillProportionally
        containerForArchorPoint.center           = CGPoint(x: self.view.center.x, y: self.view.bounds.maxY - containerForArchorPoint.bounds.height * 3)
        view.addSubview(containerForArchorPoint)
        
        containerForPosition                     = UIStackView(frame: CGRect(x: 0, y: 0, width: 360, height: 60))
        containerForPosition.axis                = .vertical
        containerForPosition.spacing             = 10
        containerForPosition.alignment           = .center
        containerForPosition.distribution        = .fillProportionally
        containerForPosition.center              = CGPoint(x: self.view.center.x, y: self.view.bounds.maxY - containerForPosition.bounds.height * 2)
        view.addSubview(containerForPosition)
        
        stepperPotate                            = UIStepper(frame: CGRect(x: 0, y: 0, width: 120, height: 31))
        stepperPotate.minimumValue               = -90
        stepperPotate.maximumValue               = 90
        stepperPotate.stepValue                  = stepRotate
        stepperPotate.center.x                   = self.containerForPosition.center.x
        currentValueStepper                      = Int(stepperPotate.minimumValue)
        
        sliderArchorPointX                       = UISlider(frame: CGRect(x: 0, y: 0, width: self.containerForArchorPoint.bounds.width, height: 30))
        sliderArchorPointX.minimumValue          = 0
        sliderArchorPointX.maximumValue          = 10
        sliderArchorPointX.setValue(5, animated: true)
        
        sliderArchorPointY                       = UISlider(frame: CGRect(x: 0, y: 0, width: self.containerForArchorPoint.bounds.width, height: 30))
        sliderArchorPointY.minimumValue          = 0
        sliderArchorPointY.maximumValue          = 10
        sliderArchorPointY.setValue(5, animated: true)
        
        
        labelArchorPointX                        = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        labelArchorPointX.layer.borderWidth      = 0
        labelArchorPointX.text                   = "ArchorPoint X:"
        labelArchorPointX.textAlignment          = .center
        
        labelArchorPointY                        = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        labelArchorPointY.layer.borderWidth      = 0
        labelArchorPointY.text                   = "ArchorPoint Y:"
        labelArchorPointY.textAlignment          = .center
        
        labelRotate                              = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        labelRotate.layer.borderWidth            = 0
        labelRotate.text                         = "Rotate: "
        labelRotate.textAlignment                = .center
        
        imageCircleBlue                          = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        imageCircleBlue.layer.cornerRadius       = imageCircleBlue.bounds.width / 2
        imageCircleBlue.backgroundColor          = .blue
        imageCircleBlue.center                   = CGPoint(x: self.blockExample.layer.position.x, y: self.blockExample.layer.position.y)
        view.addSubview(imageCircleBlue)
        
        imageCircleRed                           = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 7))
        imageCircleRed.layer.cornerRadius        = imageCircleRed.bounds.width / 2
        imageCircleRed.backgroundColor           = UIColor.red
        imageCircleRed.center                    = CGPoint(x: self.blockExample.layer.anchorPoint.x, y: blockExample.layer.anchorPoint.y)
        
        labelNameArchorPoint                     = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 10))
        labelNameArchorPoint.layer.position.x    = self.imageCircleRed.bounds.midX + (labelNameArchorPoint.layer.bounds.width / 2) + 10
        labelNameArchorPoint.center.y            = self.imageCircleRed.bounds.midY - (labelNameArchorPoint.layer.bounds.height / 2)
        labelNameArchorPoint.text                = "ArchorPoint"
        labelNameArchorPoint.sizeToFit()
        imageCircleRed.addSubview(labelNameArchorPoint)
        blockExample.addSubview(imageCircleRed)
        
        
        [labelArchorPointX, sliderArchorPointX, labelArchorPointY, sliderArchorPointY].forEach {
            containerForArchorPoint.addArrangedSubview($0)
        }
        
        [labelRotate, stepperPotate].forEach {
            containerForPosition.addArrangedSubview($0)
        }
        sliderArchorPointX.addTarget(self, action: #selector(showSliderValueArchorPoint), for: .valueChanged)
        sliderArchorPointY.addTarget(self, action: #selector(showSliderValueArchorPoint), for: .valueChanged)
        
        stepperPotate.addTarget(self, action: #selector(rotateCube), for: .valueChanged)
    }

    
    @objc func showSliderValueArchorPoint(sender: UISlider) {
        if sender == sliderArchorPointX {
            let newValueX                         = Int(sender.value)
            let convertValueX                     = CGFloat(Double(newValueX) / 10)
            labelArchorPointX.text                = "ArchorPoint X: \(convertValueX)"
            blockExample.layer.anchorPoint.x      = convertValueX
            imageCircleBlue.center.x              = blockExample.layer.position.x
            imageCircleRed.center.x               = blockExample.layer.anchorPoint.x
            sender.setValue(Float(newValueX), animated: false)

        }
        else if sender == sliderArchorPointY {
            let newValueY                         = Int(sender.value)
            let convertValueY                     = CGFloat(Double(newValueY) / 10)
            labelArchorPointY.text                = "ArchorPoint Y: \(convertValueY)"
            blockExample.layer.anchorPoint.y      = convertValueY
            imageCircleBlue.center.y              = blockExample.layer.position.y
            imageCircleRed.center.y               = blockExample.layer.anchorPoint.y
            sender.setValue(Float(newValueY), animated: false)
        }
    }
    //
    @objc func rotateCube(sender: UIStepper) {
        if Int(sender.value) > currentValueStepper {
            stepRotate = 15.0
            print("+")
        }
        else if Int(sender.value) == 0 {
            stepRotate = 0
            blockExample.transform = .identity
        }
        else {
            stepRotate = -15.0
            print("-")
        }
        currentValueStepper = Int(sender.value)
        labelRotate.text = "Rotate: " + String(sender.value)
        blockExample.transform = blockExample.transform.rotated(by: CGFloat(stepRotate) * .pi / 180)
    }
}

