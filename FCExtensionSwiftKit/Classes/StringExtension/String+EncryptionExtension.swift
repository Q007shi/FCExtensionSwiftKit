//
//  String+EncryptionExtension.swift
//  FCCategorySwiftKit
//
//  Created by 石富才 on 2020/2/5.
//

import Foundation
import CommonCrypto

extension String{
    public var fc_md5: String{
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        //要取消初始化的实例数。count不能为负。
        result.deinitialize(count: 1)
        return String(format: hash as String)
    }
}
