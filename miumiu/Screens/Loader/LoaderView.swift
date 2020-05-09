//
//  LoaderView.swift
//  miumiu
//
//  Created by Steven Vovchyna on 18.04.2020.
//  Copyright © 2020 Steven Vovchyna. All rights reserved.
//

import UIKit

class LoaderView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "paw")
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.frame.height / 2
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
    func startAnimation() {
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7047570634)
        let firstLayer = addShapeLayer(strokeColor: #colorLiteral(red: 0.4, green: 0.6, blue: 1, alpha: 1), lineWidth: 8, strokeEnd: 0)
        let trackLayer = addShapeLayer(strokeColor: .white, lineWidth: 8, strokeEnd: 1)
        firstLayer.lineCap = CAShapeLayerLineCap.round
        firstLayer.add(addAnim(with: 0.5), forKey: "basic")
        imageView.layer.addSublayer(trackLayer)
        imageView.layer.addSublayer(firstLayer)
        imageView.center = self.center
        self.addSubview(imageView)
    }
    func stopAnimation() {
        OperationQueue.main.addOperation {
            self.removeFromSuperview()
        }
    }
    
    func addShapeLayer(strokeColor: UIColor, lineWidth: CGFloat, strokeEnd: CGFloat ) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.masksToBounds = false
        shapeLayer.strokeEnd = strokeEnd
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.strokeColor = strokeColor.cgColor
        let center = CGPoint(x: 75, y: 75)
        let path = UIBezierPath(arcCenter: center, radius: 75, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        shapeLayer.path = path
        return shapeLayer
    }
    
    
    func addAnim(with duration: CFTimeInterval) -> CABasicAnimation {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0.9
        basicAnimation.fromValue = 0.0
        basicAnimation.repeatCount = 1000
        basicAnimation.duration = 1
        basicAnimation.fillMode = CAMediaTimingFillMode.removed
        basicAnimation.isRemovedOnCompletion = true
        return basicAnimation
    }
    
}
