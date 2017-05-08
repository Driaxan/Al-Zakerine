//
//  Utilities.swift
//  TemplateProjectSwift
//
//  Created by Tedmob IMac on 10/19/15.
//  Copyright © 2015 Tedmob. All rights reserved.
//

import UIKit
import SystemConfiguration

class Utilities: NSObject {
    
    // MARK: Array
    func reverseArray(_ array:[AnyObject])->[AnyObject]{
        return array.reversed()
    }
    
    // MARK: Color
    func colorFromHex(_ hex: String)->UIColor{
        var rgbValue: UInt32 = 0
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1
        scanner.scanHexInt32(&rgbValue)
        return UIColor(red: CGFloat(((rgbValue & 0xFF0000)>>16))/255.0, green:CGFloat(((rgbValue&0xFF00)>>8))/255.0, blue:CGFloat((rgbValue&0xFF))/255.0, alpha: 1.0)
    }
    
    // MARK: Date
    func stringToDate(_ dateString: String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString)
        return date!
    }
    
    func stringFromDate(_ date: Double?)->String{
        if date == nil{
            return ""
        } else{
            let formatter = DateFormatter()
            formatter.locale = Locale.current
            formatter.dateFormat = "dd/MM/yyyy"
            
            return formatter.string(from: Date(timeIntervalSince1970: date!))
        }
    }
    
    // MARK: File
    func getFileURL(_ fileName:String)->String?{
        let fileURL = FileManager().urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first
        
        return (fileURL?.appendingPathComponent(fileName).path)
    }
    
    // MARK: String
    func stringFromDeviceTokenData(_ deviceToken: Data)->String?{
        let stringDeviceToken = deviceToken.description.replacingOccurrences(of: "<", with: "").replacingOccurrences(of: ">", with: "").replacingOccurrences(of: " ", with: "")
        
        return stringDeviceToken
    }
    
    // MARK: Mathematics
    func degreesToRadians(_ degrees: CGFloat)->CGFloat{
        return degrees*CGFloat(M_PI/180)
    }
    
    func heightFor(_ text: NSString, withFont font:UIFont, boundedInRectWithWidth width:CGFloat)->CGFloat{
        let sizeOfText: CGSize = text.boundingRect(with: CGSize(width: width, height: 9999), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil).size
        
        return ceil(sizeOfText.height)
    }

    func widthforText(_ text: NSString, font : UIFont, withMargin margin: CGFloat)->CGFloat{
        let textSize: CGSize = text.size(attributes: [NSFontAttributeName : font])
        
        return ceil(textSize.width+margin)
    }
    
    // MARK: GUID/UUID
    func getDeviceGUID()->String{
        return UUID().uuidString
    }
    
    // MARK: Localization
    func getCurrentDeviceLanguage()->String?{
        return Bundle.main.preferredLocalizations.first
    }
    
    // MARK: Push Notifications
    /*func registerForRemotePushNotifications(_ deviceToken: String, appID: String, withCompletion handler:@escaping (_ success: Bool, _ registration_id: String?)->Void){
        ServerInterface().postRequest(withBaseURL:"https://push.tedmob.com/", forFunctionName:"api/register", functionParameters: ["platform" : "2" as AnyObject, "token" : deviceToken as AnyObject, "app_id" : appID as AnyObject], andHeaderParameters: nil) { (response) -> Void in
            if (response.responseCode == 200) {
                // Response OK
                handler(true, (response.responseData as! Dictionary)["registration_id"]!)
            } else{
                // Response Error
                handler(false, nil)
            }
        }
    }
 */
    
    // MARK: Storyboard
    func viewControllerWith(_ identifier: String, fromStoryboard storyboardName:String)->UIViewController{
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    // MARK: UIApplication
    func replaceRootWithViewController(_ identifier: String, storyboard: String){
        UIApplication.shared.windows.first?.rootViewController = self.viewControllerWith(identifier, fromStoryboard: storyboard)
    }
    
    // MARK: Networking
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)

        return (isReachable && !needsConnection)
    }
    
    //AlertViewController
    func displayAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        presentViewController(alertController, animated: true, completion: nil)
        return
    }
    //Actionsheet For Share
    func displayShareSheet(_ shareContent:String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
//        presentViewController(activityViewController, animated: true, completion: {})
    }
}
