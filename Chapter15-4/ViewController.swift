//
//  ViewController.swift
//  Chapter15-4
//
//  Created by daito yamashita on 2021/03/24.
//

import UIKit

class ViewController: UIViewController {

    var num = 0
    
    @IBOutlet weak var myLabel: UILabel!
    
    // カウントアップするメソッド
    @objc func step() {
        num += 1
        myLabel.text = String(num)
        if num % 3 == 0 {
            myLabel.textColor = UIColor.red
        } else {
            myLabel.textColor = UIColor.black
        }
        
        UIView.transition(
            with: myLabel,
            duration: 0.5,
            options: [.transitionCrossDissolve],
            animations: nil,
            completion: nil)
    }
    
    @IBOutlet weak var baseView: UIView!
    
    var fromView: UIView!
    var toView: UIView!
    
    @IBAction func nextView(_ sender: Any) {
        UIView.transition(
            from: fromView,
            to: toView,
            duration: 1,
            options: .transitionFlipFromLeft,
            completion: { _ in
                let tmpView = self.fromView
                self.fromView = self.toView
                self.toView = tmpView
            }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(self.step),
            userInfo: nil,
            repeats: true
        )
        
        myLabel.text = String(num)
        
        let view1 = UIImageView(image: UIImage(named: "shami4.jpg"))
        view1.center = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
        
        let view2 = UILabel()
        view2.text = "しゃみたん"
        view2.frame = CGRect(x: 20, y: 20, width: 140, height: 21)
        view2.backgroundColor = UIColor.gray
        view2.textColor = UIColor.white
        
        fromView = view1
        toView = view2
        
        // 最初に表示するViewを設定
        baseView.addSubview(fromView)
        
        // はみ出た部分はトリミング
        baseView.clipsToBounds = true
    }


}

