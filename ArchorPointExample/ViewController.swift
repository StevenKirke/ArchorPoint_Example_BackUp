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
    var imageCircleGreen:           UIView!
    var imageCircleRed:             UIView!
    
    var containerForArchorPoint:    UIStackView!
    var containerForPosition:       UIStackView!
    
    var sliderArchorPointX:         UISlider!
    var sliderArchorPointY:         UISlider!
    
    var labelArchorPointX:          UILabel!
    var labelArchorPointY:          UILabel!
    var labelRotate:                UILabel!
    var labelNameArchorPoint:       UILabel!
    var labelNamePosition:          UILabel!
    
    var stepperPotate:              UIStepper!
    
    var stepRotate                  = 15.0
    var currentValueStepper:        Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerForBlock                          = UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 240))
        containerForBlock.layer.borderWidth        = 1
        containerForBlock.center                   = CGPoint(x: self.view.center.x, y: self.view.frame.minY + containerForBlock.bounds.height)
        view.addSubview(containerForBlock)
        
        blockExample                               = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        blockExample.layer.borderWidth             = 1
        blockExample.layer.borderColor             = UIColor.blue.cgColor
        blockExample.layer.position                = CGPoint(x: self.containerForBlock.layer.position.x, y: self.containerForBlock.layer.position.y)
        view.addSubview(blockExample)
        
        containerForArchorPoint                    = UIStackView(frame: CGRect(x: 0, y: 0, width: 360, height: 120))
        containerForArchorPoint.axis               = .vertical
        containerForArchorPoint.spacing            = 0
        containerForArchorPoint.alignment          = .fill
        containerForArchorPoint.distribution       = .equalCentering
        containerForArchorPoint.center             = CGPoint(x: self.view.center.x, y: self.view.bounds.maxY - containerForArchorPoint.bounds.height * 3)
        view.addSubview(containerForArchorPoint)
        
        containerForPosition                       = UIStackView(frame: CGRect(x: 0, y: 0, width: 360, height: 60))
        containerForPosition.axis                  = .vertical
        containerForPosition.spacing               = 10
        containerForPosition.alignment             = .center
        containerForPosition.distribution          = .fillProportionally
        containerForPosition.center                = CGPoint(x: self.view.center.x, y: self.view.bounds.maxY - containerForPosition.bounds.height * 2)
        view.addSubview(containerForPosition)
        
        stepperPotate                              = UIStepper(frame: CGRect(x: 0, y: 0, width: 120, height: 31))
        stepperPotate.minimumValue                 = -90
        stepperPotate.maximumValue                 = 90
        stepperPotate.stepValue                    = stepRotate
        stepperPotate.center.x                     = self.containerForPosition.center.x
        currentValueStepper                        = Int(stepperPotate.minimumValue)
        
        sliderArchorPointX                         = UISlider(frame: CGRect(x: 0, y: 0, width: self.containerForArchorPoint.bounds.width, height: 30))
        sliderArchorPointX.minimumValue            = 0
        sliderArchorPointX.maximumValue            = 10
        sliderArchorPointX.setValue(5, animated: true)
        
        sliderArchorPointY                         = UISlider(frame: CGRect(x: 0, y: 0, width: self.containerForArchorPoint.bounds.width, height: 30))
        sliderArchorPointY.minimumValue            = 0
        sliderArchorPointY.maximumValue            = 10
        sliderArchorPointY.setValue(5, animated: true)
        
        labelArchorPointX                          = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        labelArchorPointX.layer.borderWidth        = 0
        labelArchorPointX.text                     = "ArchorPoint X:"
        labelArchorPointX.textAlignment            = .center
        
        labelArchorPointY                          = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        labelArchorPointY.layer.borderWidth        = 0
        labelArchorPointY.text                     = "ArchorPoint Y:"
        labelArchorPointY.textAlignment            = .center
        
        labelRotate                                = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        labelRotate.layer.borderWidth              = 0
        labelRotate.text                           = "Rotate: "
        labelRotate.textAlignment                  = .center
        
        imageCircleRed                             = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        imageCircleRed.layer.cornerRadius          = imageCircleRed.bounds.width / 2
        imageCircleRed.backgroundColor             = .red
        imageCircleRed.center                      = CGPoint(x: self.blockExample.layer.position.x, y: self.blockExample.layer.position.y)
        view.addSubview(imageCircleRed)
        
        imageCircleGreen                           = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 7))
        imageCircleGreen.layer.cornerRadius        = imageCircleGreen.bounds.width / 2
        imageCircleGreen.backgroundColor           = UIColor.green
        imageCircleGreen.center                    = CGPoint(x: self.blockExample.layer.anchorPoint.x, y: blockExample.layer.anchorPoint.y)
        blockExample.addSubview(imageCircleGreen)
        
        labelNamePosition                          = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 10))
        labelNamePosition.text                     = "Point Position"
        labelNamePosition.center                   = CGPoint(x: (labelNamePosition.bounds.width / 2) + 10, y: self.imageCircleGreen.bounds.minY - 10)
        labelNamePosition.sizeToFit()
        labelNamePosition.font                     = labelNamePosition.font.withSize(14)
        imageCircleGreen.addSubview(labelNamePosition)
        
        labelNameArchorPoint                       = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 10))
        labelNameArchorPoint.layer.position.x      = self.imageCircleGreen.bounds.midX + (labelNameArchorPoint.layer.bounds.width / 2) + 10
        labelNameArchorPoint.center.y              = self.imageCircleGreen.bounds.midY - (labelNameArchorPoint.layer.bounds.height / 2)
        labelNameArchorPoint.text                  = "ArchorPoint"
        labelNameArchorPoint.font                  = labelNameArchorPoint.font.withSize(14)
        imageCircleRed.addSubview(labelNameArchorPoint)
        view.addSubview(imageCircleRed)
        
        
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
            let oldOriginX                        = blockExample.frame.origin.x
            let newValueX                         = Int(sender.value)
            let convertValueX                     = CGFloat(Double(newValueX) / 10)
            labelArchorPointX.text                = "ArchorPoint X: \(convertValueX)"
            
            blockExample.layer.anchorPoint.x      = convertValueX
            let newOriginX                        = blockExample.frame.origin.x
            let changeOriginX                     = newOriginX - oldOriginX
            blockExample.center.x                 = blockExample.center.x - changeOriginX
            
            imageCircleRed.center.x               = blockExample.layer.position.x
            imageCircleGreen.center.x             = blockExample.layer.anchorPoint.x
            sender.setValue(Float(newValueX), animated: false)

        }
        else if sender == sliderArchorPointY {
            let oldOriginY                        = blockExample.frame.origin.y
            let newValueY                         = Int(sender.value)
            let convertValueY                     = CGFloat(Double(newValueY) / 10)
            labelArchorPointY.text                = "ArchorPoint Y: \(convertValueY)"
            
            blockExample.layer.anchorPoint.y      = convertValueY
            let newOriginY                        = blockExample.frame.origin.y
            let changeOriginY                     = newOriginY - oldOriginY
            blockExample.center.y                 = blockExample.center.y - changeOriginY

            imageCircleRed.center.y               = blockExample.layer.position.y
            imageCircleGreen.center.y             = blockExample.layer.anchorPoint.y
            sender.setValue(Float(newValueY), animated: false)
        }
    }

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
