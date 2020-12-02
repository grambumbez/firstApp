//
//  ThirdViewController.swift
//  firstApp
//
//  Created by Айдар on 06.11.2020.
//

import UIKit
import RxSwift
import RxCocoa

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var checkBox: UIButton!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goButton.layer.cornerRadius = 6
        
        if UserDefaults.standard.bool(forKey: "stopWelcomePage") {
            self.checkBox.isSelected = UserDefaults.standard.bool(forKey: "stopWelcomePage")
        }
        
        goButton.rx.tap.subscribe(onNext: {
            guard let postVC = self.storyboard?.instantiateViewController(identifier: "BarViewController") else {return}
            self.navigationController?.pushViewController(postVC, animated: true)
        }).disposed(by: disposeBag)
}
    @IBAction func checkBoxButton(_ sender: Any) {
        self.checkBox.isSelected = !self.checkBox.isSelected
        UserDefaults.standard.set(checkBox.isSelected, forKey: "stopWelcomePage")
    }
}

