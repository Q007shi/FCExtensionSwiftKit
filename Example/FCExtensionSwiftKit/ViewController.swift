//
//  ViewController.swift
//  FCExtensionSwiftKit
//
//  Created by 2585299617@qq.com on 02/08/2020.
//  Copyright (c) 2020 2585299617@qq.com. All rights reserved.
//

import UIKit
import FCExtensionSwiftKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(imageView)
        imageView.image = UIColor.fc_RGBValue(RGBValue: 0xFFB6C1).fc_image
        
        view.backgroundColor = UIColor.fc_RGBAValue(RGBAValue: 0xFFB6C1FF)
        
    }

}

