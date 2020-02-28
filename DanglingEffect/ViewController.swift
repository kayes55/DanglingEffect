//
//  ViewController.swift
//  DanglingEffect
//
//  Created by Kayes on 2/28/20.
//  Copyright © 2020 Kayes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var danglingView: DanglingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        danglingAnimationChain()
    }
    
    func danglingAnimationChain() {
        var rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -1000.0;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, CGFloat(Double.pi * 0.15), 1, 0, 0)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.danglingView.layer.transform = rotationAndPerspectiveTransform
        }) { (finished) in
            UIView.animate(withDuration: 0.5, animations:{
                self.danglingView.layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, CGFloat(-Double.pi * 0.15), 1, 0, 0)
            }) { finished in
                UIView.animate(withDuration: 0.5, animations: {
                    self.danglingView.layer.transform = rotationAndPerspectiveTransform
                }) { (finished) in
                    UIView.animate(withDuration: 0.5, animations:{
                        self.danglingView.layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, CGFloat(-Double.pi * 0.15), 1, 0, 0)
                    }) { finished in
                        
                    }
                }
            }
        }
    }
}

