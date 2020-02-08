//
//  UIColor+TransformExtension.swift
//  FCCategorySwiftKit
//
//  Created by 石富才 on 2020/2/5.
//

import Foundation



extension UIColor{
    //MARK: -- 属性
    
    static let rHex: UInt32 = 0xFF000000
    static let gHex: UInt32 = 0x00FF0000
    static let bHex: UInt32 = 0x0000FF00
    static let aHex: UInt32 = 0x000000FF
    
    /// 获取当前颜色的透明度
    public var fc_alpha: CGFloat{
        return self.cgColor.alpha
    }
    
    /// 获取当前颜色的 RGBA 值
    public var fc_rgba: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat){
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red,green,blue,alpha)
    }
    
    
    /// 将当前颜色转换成 10X10 的可拉伸图片
    public var fc_image: UIImage?{
        let rect = CGRect(x: 0, y: 0, width: 10, height: 10)
        UIGraphicsBeginImageContext(rect.size)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        //为上下午填充颜色
        context.setFillColor(self.cgColor)
        //颜色显示区域
        context.fill(rect)
        //从上下文中获取图片
        guard var img = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        //关闭图片上下午
        UIGraphicsEndImageContext()
        //
        //automatic(默认渲染模式),根据上下文渲染;alwaysOriginal, 根据颜色本身渲染；alwaysTemplate，根据 tintColor 渲染
        img = img.withRenderingMode(.alwaysOriginal)
        //tile,平铺样式；stretch，拉伸样式
        return img.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10), resizingMode: .stretch)
    }
    
    
    /// 随机色
    public static var fc_randomColor: UIColor{
        return UIColor(red: CGFloat(integerLiteral: Int(arc4random_uniform(255)))/255.0, green: CGFloat(integerLiteral: Int(arc4random_uniform(255)))/255.0, blue: CGFloat(integerLiteral: Int(arc4random_uniform(255)))/255.0, alpha: 1);
    }
    
    //MARK: -- 方法
    
    ///  0xRRGGBB 转 Color
    /// - Parameter RGBValue: rgb颜色
    public static func fc_RGBValue(RGBValue: UInt32) -> UIColor{
        return self.fc_RGBAValue(RGBAValue: ((RGBValue & 0x00FFFFFF) << 8) | aHex)
    }
    
    /// 0xRRGGBBAA 转 Colo
    /// - Parameter RGBAValue: rgba 颜色
    public static func fc_RGBAValue(RGBAValue: UInt32) -> UIColor{
        print(CGFloat(integerLiteral: Int((RGBAValue & rHex) >> 24))/255.0)
        print(CGFloat(integerLiteral: Int((RGBAValue & gHex) >> 16))/255.0)
        print(CGFloat(integerLiteral: Int((RGBAValue & bHex) >> 8))/255.0)
        print(CGFloat(integerLiteral: Int(RGBAValue & aHex))/255.0)
        return UIColor(red: CGFloat(integerLiteral: Int((RGBAValue & rHex) >> 24))/255.0, green: CGFloat(integerLiteral: Int((RGBAValue & gHex) >> 16))/255.0, blue: CGFloat(integerLiteral: Int((RGBAValue & bHex) >> 8))/255.0, alpha: CGFloat(integerLiteral: Int(RGBAValue & aHex))/255.0)
    }
    
    
    /// 字符串转颜色
    /// - Parameter hexValueString:
    /**
        * 0xRGB 或 0xRGBA 或 0xRRGGBB 或 0xRRGGBBAA
        * #RGB 或 #RGBA 或 #RRGGBB 或 #RRGGBBAA
        * RGB 或 RGBA 或 RRGGBB 或 RRGGBBAA
     */
    public static func fc_hexValueString(hexValueString: String) -> UIColor{
        if hexValueString.isEmpty { return clear }
        if hexValueString.fc_evaluateWithRegex(regex: "^(0x|#)(([a-zA-Z0-9]{3})|([a-zA-Z0-9]{4})|([a-zA-Z0-9]{6})|([a-zA-Z0-9]{8}))") {
            if hexValueString.hasPrefix("0x") {
                let hexValueStr = hexValueString.fc_trimmingCustomCharacter("0x")
                return _matchColorWithHexValueString(hexValueStr: hexValueStr)
            }else if hexValueString.hasPrefix("#"){
                let hexValueStr = hexValueString.fc_trimmingCustomCharacter("#")
                return _matchColorWithHexValueString(hexValueStr: hexValueStr)
            }
            return clear
        }else if hexValueString.fc_evaluateWithRegex(regex: "(([a-zA-Z0-9]{3})|([a-zA-Z0-9]{4})|([a-zA-Z0-9]{6})|([a-zA-Z0-9]{8}))") {
            return _matchColorWithHexValueString(hexValueStr: hexValueString)
        }
        return clear
    }
    
    
    /// 字符串转颜色
    /// - Parameters:
    ///   - hexValueString: 0xRGB 或 0xRRGGBB 或 #RGB 或 #RRGGBB 或 RGB 或 RRGGBB
    ///   - alpha: alpha [0,1]
    public static func fc_hexValueString(hexValueString: String,alpha: CGFloat) -> UIColor{
        if hexValueString.isEmpty { return clear }
        if hexValueString.fc_evaluateWithRegex(regex: "^(0x|#)(([a-zA-Z0-9]{3})|([a-zA-Z0-9]{4})|([a-zA-Z0-9]{6})|([a-zA-Z0-9]{8}))") {
            if hexValueString.hasPrefix("0x") {
                let hexValueStr = hexValueString.fc_trimmingCustomCharacter("0x")
                let RGBA = _matchColorWithHexValueString(hexValueStr: hexValueStr).fc_rgba
                return UIColor(red: RGBA.r, green: RGBA.g, blue: RGBA.b, alpha: alpha)
            }else if hexValueString.hasPrefix("#"){
                let hexValueStr = hexValueString.fc_trimmingCustomCharacter("#")
                let RGBA = _matchColorWithHexValueString(hexValueStr: hexValueStr).fc_rgba
                return UIColor(red: RGBA.r, green: RGBA.g, blue: RGBA.b, alpha: alpha)
            }
        }else if hexValueString.fc_evaluateWithRegex(regex: "(([a-zA-Z0-9]{3})|([a-zA-Z0-9]{4})|([a-zA-Z0-9]{6})|([a-zA-Z0-9]{8}))") {
            let RGBA = _matchColorWithHexValueString(hexValueStr: hexValueString).fc_rgba
            return UIColor(red: RGBA.r, green: RGBA.g, blue: RGBA.b, alpha: alpha)
        }
        return clear
    }
    
    
    private static func _matchColorWithHexValueString(hexValueStr: String) -> UIColor{
        if hexValueStr.isEmpty { return clear }
        switch hexValueStr.count {
        case 3://RGB
            let rChar: Character = hexValueStr.first!
            let gChar: Character = hexValueStr[hexValueStr.index(hexValueStr.startIndex, offsetBy: 1)]
            let bChar: Character = hexValueStr.last!
            let str = "\(rChar)" + "\(rChar)" + "\(gChar)" + "\(gChar)" + "\(bChar)" + "\(bChar)"
//            let scanner = Scanner(string: str)
//            if #available(iOS 13.0, *) {
//                guard let hexValue = scanner.scanInt32() else{ return clear }
//            } else {
//                // Fallback on earlier versions
//            }
            guard let hexValue = UInt32(str, radix: 16) else{ return clear }
            return  fc_RGBValue(RGBValue: hexValue)
        case 4://RGBA
            let rChar: Character = hexValueStr.first!
            let gChar: Character = hexValueStr[hexValueStr.index(hexValueStr.startIndex, offsetBy: 1)]
            let bChar: Character = hexValueStr[hexValueStr.index(hexValueStr.startIndex, offsetBy: 2)]
            let aChar: Character = hexValueStr.last!
            let str = "\(rChar)" + "\(rChar)" + "\(gChar)" + "\(gChar)" + "\(bChar)" + "\(bChar)" + "\(aChar)" + "\(aChar)"
            guard let hexValue = UInt32(str, radix: 16) else{ return clear }
            return fc_RGBAValue(RGBAValue: hexValue)
        case 6://RRGGBB
            guard let hexValue = UInt32(hexValueStr, radix: 16) else{ return clear }
            return  fc_RGBValue(RGBValue: hexValue)
        case 8://RRGGBBAA
            guard let hexValue = UInt32(hexValueStr, radix: 16) else{ return clear }
            return fc_RGBAValue(RGBAValue: hexValue)
        default:
            print(hexValueStr)
            return clear
        }
    }
    
    
    /// fromColor 到 toColor 的渐变色
    /// - Parameters:
    ///   - fromColor: fromColor 起始颜色
    ///   - toColor: toColor 结束颜色
    ///   - percent: percent 百分比[0,1]
    public static func fc_gradation(fromColor: UIColor,toColor: UIColor,percent: Float) -> UIColor{
        return fc_gradation(fromColor: fromColor, toColor: toColor, percent: percent, alpha: 1)
    }
    
    /// fromColor 到 toColor 的渐变色
    /// - Parameters:
    ///   - fromColor: fromColor 起始颜色
    ///   - toColor: toColor 结束颜色
    ///   - percent: percent 百分比[0,1]
    ///   - alpha: alpha 透明度
    public static func fc_gradation(fromColor: UIColor,toColor: UIColor,percent: Float,alpha: Float) -> UIColor{
        let per = CGFloat(max(0, min(1, percent)))
        let alp = CGFloat(max(0, min(1, alpha)))
        let fromV = fromColor.fc_rgba
        let toV = toColor.fc_rgba
        return UIColor(red: (fromV.r + (toV.r - fromV.r)*per), green: (fromV.g + (toV.g - fromV.g)*per), blue: (fromV.b + (toV.b - fromV.b)*per), alpha: alp)
    }
    
}
