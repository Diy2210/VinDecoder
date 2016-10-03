//
//  VINDecoderViewController.swift
//  VinDecoder
//
//  Created by Diy2210 on 20.09.16.
//  Copyright © 2016 Diy2210. All rights reserved.
//

import UIKit

class VINDecoderViewController: UIViewController {

    // Name labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var cylinderLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var horsepowerLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var transmission: UILabel!
    @IBOutlet weak var wheelsLabel: UILabel!
    @IBOutlet weak var doorsLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var interiorLabel: UILabel!
    @IBOutlet weak var exteriorLabel: UILabel!
    
    // Info labels
    @IBOutlet weak var nameInfo: UILabel!
    @IBOutlet weak var modelInfo: UILabel!
    @IBOutlet weak var cylinderInfo: UILabel!
    @IBOutlet weak var sizeInfo: UILabel!
    @IBOutlet weak var horsepowerInfo: UILabel!
    @IBOutlet weak var typeInfo: UILabel!
    @IBOutlet weak var transmissionInfo: UILabel!
    @IBOutlet weak var wheelsInfo: UILabel!
    @IBOutlet weak var doorsInfo: UILabel!
    @IBOutlet weak var yearInfo: UILabel!
    @IBOutlet weak var interiorInfo: UILabel!
    @IBOutlet weak var exteriorInfo: UILabel!
    
    var record: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameInfo.text = record["vin"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
