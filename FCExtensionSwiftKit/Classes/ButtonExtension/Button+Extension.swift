//
//  Button+Extension.swift
//  FCCategorySwiftKit
//
//  Created by 石富才 on 2020/2/6.
//

import Foundation


extension UIButton{
    
    
    /// 根据状态设置背景颜色
    /// - Parameters:
    ///   - color: 颜色
    ///   - state: 状态
    public func fc_setBackgroundColor(color: UIColor,state: UIControl.State){
        self.setBackgroundImage(color.fc_image, for: state)
    }
}
