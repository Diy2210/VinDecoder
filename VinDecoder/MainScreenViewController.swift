//
//  MainScreenViewController.swift
//  VinDecoder
//
//  Created by Diy2210 on 16.09.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var vinTextField: UITextField!
    @IBOutlet weak var decodeButton: UIButton!
    let limitLength = 14
    
    @IBAction func decodeButton(_ sender: AnyObject) {
        
        let session = URLSession.shared
        let urlPath = NSURL(string: "https://api.edmunds.com/api/vehicle/v2/vins/2G1FC3D33C9165616?fmt=json&api_key=5829y9twwkzyxqp7rt5k7xr3")
        let request = NSMutableURLRequest(url: urlPath! as URL)
        let VIN = vinTextField.text!
        let params = "VIN=\(vinTextField)"
        
        if VIN.isEmpty {
            self.messageNotification(message: "VIN code is not added")
            return
        }
 
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = params.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            // handle error
            guard error == nil else { return }
            var json: NSDictionary?
            do {
                json = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? NSDictionary
            } catch {
                //print("Complete")
                return
            }
            if let parseJSON = json {
                let success = parseJSON["success"] as? Int
                //self.performSegue(withIdentifier: "create", sender: self)
                print("Success: \(success)")
                print(parseJSON)
            }
            else {
                
                let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("Error could not parse JSON: \(jsonStr)")
            }
        })
        
        task.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        vinTextField.delegate = self
        
        decodeButton.layer.backgroundColor = UIColor(red: 0.30, green: 0.91, blue: 0.28, alpha: 1).cgColor
        decodeButton.layer.borderColor = UIColor(red: 0.30, green: 0.91, blue: 0.28, alpha: 1).cgColor
        decodeButton.layer.cornerRadius = 10
        decodeButton.layer.borderWidth = 1
    }
    
    private func vinTextField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = vinTextField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }
    
    /*
    private func textFieldShouldReturn(textField: UITextField) -> Bool {
        if vinTextField.text!.characters.count < 17 {
            vinTextField.isHidden = false }
        self.view.endEditing(true)
        return true
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Messege notification
    func messageNotification(message: String, title: String = "Error") -> Void {
        let AlertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        AlertView.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(AlertView, animated: true, completion: nil)
    }
}



