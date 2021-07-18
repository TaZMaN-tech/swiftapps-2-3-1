//
//  MoreInfoViewController.swift
//  LoginApp
//
//  Created by Тадевос Курдоглян on 18.07.2021.
//

import UIKit

class MoreInfoViewController: UIViewController {
    @IBOutlet weak var moreInfoLabel: UILabel!
    
    var moreInfoLabelText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moreInfoLabel.text = moreInfoLabelText
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let personInfoVC = segue.source as? PersonInfoViewController else { return }
//        moreInfoLabelText = personInfoVC.moreInfo
//    }

}
