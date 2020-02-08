//
//  String+SubExtension.swift
//  FCCategorySwiftKit
//
//  Created by 石富才 on 2020/2/1.
// 字符串子串

import Foundation

extension String{
    
    
    /// 截取字符串 [0, toIndex)
    /// - Parameter toIndex: 目标字符索引
    public func fc_substring(toIndex: Int) -> String{
        if self.count <= toIndex{
            return self
        }
        return String(self.prefix(toIndex))
    }
    
    
    /// 截取字符串 [fromIndex, œ ]
    /// - Parameter fromIndex: 开始字符索引
    public func fc_substring(fromIndex: Int) -> String{
        if fromIndex >= self.count{
            return ""
        }
        let startIndex = self.index(self.startIndex, offsetBy: fromIndex)
        return String(self[startIndex ..< self.endIndex])
    }
    
    
    /// 截取字符串 [startIndex, endIndex ]
    /// - Parameters:
    ///   - startIndex: 起始字符索引
    ///   - endIndex: 结束字符索引
    public func fc_substring(startIndex: Int, endIndex: Int) -> String{
        if (startIndex < endIndex || startIndex == endIndex) && endIndex < self.count {
            let start = self.index(self.startIndex, offsetBy: startIndex)
            let end = self.index(self.startIndex, offsetBy: endIndex)
            return String(self[start ... end])
        }
        return ""
    }
    
}
