//
//  ViewController.swift
//  LottieAnimation
//
//  Created by 山本響 on 2021/07/23.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        label.text = "Lottie Animation Sample App"
        
        return label
    }()
    
    let ufoAnimation: AnimationView = {
        let ufoAnimationView: AnimationView = AnimationView(name: "61191-ufos")
        
        // Play the animation
        ufoAnimationView.play()
        
        // Set animation loop mode
        ufoAnimationView.loopMode = .loop
        
        return ufoAnimationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLayer()
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 15.0
        
        //Constraints
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            label.heightAnchor.constraint(equalToConstant: self.view.safeAreaInsets.top+500),
            ufoAnimation.heightAnchor.constraint(equalToConstant: self.view.safeAreaInsets.bottom+400),
            ufoAnimation.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        ])
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(ufoAnimation)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        // Add animationView as subview
        self.view.addSubview(stackView)
        self.view.backgroundColor = .black

    }
    
    //画面レイアウト
    private func createLayer() {
        let layer = CAEmitterLayer()
        layer.emitterPosition = CGPoint(x: view.center.x,
                                        y: -100)
        
        let colors: [UIColor] = [
//            .systemRed,
//            .systemBlue,
//            .systemPink,
//            .systemPurple,
            .systemYellow
        ]
        
        let cells: [CAEmitterCell] = colors.compactMap {
            let color = $0.cgColor
            return getParticle(with: color)
        }
        
        layer.emitterCells = cells
        
        view.layer.addSublayer(layer)
    }
    
    //パーティクル生成
    public func getParticle(with cgColor: CGColor) -> CAEmitterCell{
        let cell = CAEmitterCell()
        cell.scale = 0.005
        cell.emissionRange = .pi * 2
        
        //The lifetime of the cell, in seconds. Animatable.
        cell.lifetime = 10
        
        //The number of emitted objects created every second
        cell.birthRate = 50
        
        //The velocity of the cell will vary by a random amount within the range specified by velocityRange.
        cell.velocity = 200
        
        cell.color = cgColor
        
        // cell color
        cell.contents = UIImage(named: "image")!.cgImage
        
        return cell
        
    }
}
