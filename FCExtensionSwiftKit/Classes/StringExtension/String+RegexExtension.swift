//
//  String+RegexExtension.swift
//  FCCategorySwiftKit
//
//  Created by 石富才 on 2020/2/5.
//

import Foundation

extension String{
    
    
    /// 根据正则表达式字符串 regex 将字符串分割，并将分割结果返回
    /// - Parameter regex: 正则表达式字符串
    public func fc_trimSourceStringWithRegex(regex: String) -> [NSTextCheckingResult]?{
        do {
            let re = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
            return re.matches(in: self, options: .reportProgress, range: NSMakeRange(0, self.count))
        } catch { }
        return nil
    }
    
    
    /// 对当前字符，根据正则表达式 regex 进行匹配
    /// - Parameter regex: 正则表达式
    public func fc_evaluateWithRegex(regex: String) -> Bool{
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}
