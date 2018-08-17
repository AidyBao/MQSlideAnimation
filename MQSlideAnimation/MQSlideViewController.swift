//
//  MQSlideViewController.swift
//  MQSlideAnimation
//
//  Created by 120v on 2018/8/17.
//  Copyright © 2018年 MQ. All rights reserved.
//

import UIKit

class MQSlideViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var zxContentView: UIView!
    
    var zx_dismissTapOutSideView: UIView? { return zxContentView }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.transitioningDelegate = self
        self.modalPresentationStyle = .custom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func show(superView: UIViewController) {
        let vc = MQSlideViewController()
        superView.present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //super.touchesBegan(touches, with: event)
        if let outside = zx_dismissTapOutSideView, let touch = touches.first {
            let position = touch.location(in: outside)
            if !outside.bounds.contains(position) {
                self.zx_dismissAction()
            }
        }
    }
    
    func zx_dismissAction() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return ZXDimmingPresentationController.init(presentedViewController: presented, presenting: presenting)
    }
    
   
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ZXHSlideInAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ZXHSlideOutAnimationController()
    }

}
