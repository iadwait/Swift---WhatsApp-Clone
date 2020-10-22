//
//  callsViewController.swift
//  Protocol Delegate Practice
//
//  Created by Adwait Barkale on 21/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class callsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableViewCalls: UITableView!
    
    var arrCallsData:[callsData] = [
    callsData(imageName: "p1", name: "Raj Patel", dateTime: "12October,2:05pm"),
    callsData(imageName: "p2", name: "Rohan Deshpande", dateTime: "10October,6:05pm"),
    callsData(imageName: "p3", name: "Mahesh Patil", dateTime: "5October,11:35am"),
    callsData(imageName: "p1", name: "Raj Patel", dateTime: "1October,10:05am"),
    callsData(imageName: "p5", name: "Ronny Mallya", dateTime: "20September,2:45pm"),
    callsData(imageName: "p2", name: "Rohan Deshpande", dateTime: "11July,3:35pm")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCalls.delegate = self
        tableViewCalls.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCallsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCalls.dequeueReusableCell(withIdentifier: "callsViewCell") as! callsViewCell
        let data = arrCallsData[indexPath.row]
        cell.imgProfilePic.image = UIImage(named: data.imageName)
        cell.lblCallerName.text = data.name
        cell.lblCallTimeDate.text = data.dateTime
        cell.imgProfilePic.layer.cornerRadius = cell.imgProfilePic.frame.size.height / 2
        cell.imgProfilePic.layer.borderWidth = 2
        cell.imgProfilePic.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
