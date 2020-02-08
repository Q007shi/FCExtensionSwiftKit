//
//  String+BaseExtension.swift
//  FCCategorySwiftKit
//
//  Created by 石富才 on 2020/2/1.
//

import Foundation

extension String{
    
    /// 剔除字符串收尾空格
    public var fc_trimmingWhitespaceCharacter: String{
        get{
            return self.trimmingCharacters(in: CharacterSet.whitespaces)
        }
    }
    
    /// 剔除字符串收尾指定字符
    /// - Parameter trimmingString: 要剔除的字符
    public func fc_trimmingCustomCharacter(_ trimmingString: String) -> String{
        return self.trimmingCharacters(in: CharacterSet(charactersIn: trimmingString))
    }
}
