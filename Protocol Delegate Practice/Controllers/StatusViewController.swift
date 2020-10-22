//
//  StatusViewController.swift
//  Protocol Delegate Practice
//
//  Created by Adwait Barkale on 21/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {
    
    @IBOutlet weak var imgProfilePic: UIImageView!
    
    @IBOutlet weak var tableViewRecent: UITableView!
    @IBOutlet weak var tableRecentHeight: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewViewed: UITableView!
    @IBOutlet weak var tableViewedHeight: NSLayoutConstraint!
    
 
    
    var arrRecentUpdates:[RecentStatusData] = [
        RecentStatusData(imageName: "p1", name: "Raj Patel", dateTime: "12October,2:05pm"),
        RecentStatusData(imageName: "p2", name: "Rohan Deshpande", dateTime: "10October,6:05pm"),
        RecentStatusData(imageName: "p3", name: "Mahesh Patil", dateTime: "5October,11:35am"),
        RecentStatusData(imageName: "p1", name: "Raj Patel", dateTime: "1October,10:05am"),
        RecentStatusData(imageName: "p1", name: "Raj Patel", dateTime: "1October,10:05am"),
        RecentStatusData(imageName: "p5", name: "Ronny Mallya", dateTime: "20September,2:45pm"),
        RecentStatusData(imageName: "p2", name: "Rohan Deshpande", dateTime: "11July,3:35pm"),
        RecentStatusData(imageName: "p5", name: "Ronny Mallya", dateTime: "20September,2:45pm"),
        RecentStatusData(imageName: "p2", name: "Rohan Deshpande", dateTime: "11July,3:35pm"),
        RecentStatusData(imageName: "p5", name: "Ronny Mallya", dateTime: "20September,2:45pm"),
        RecentStatusData(imageName: "p2", name: "Rohan Deshpande", dateTime: "11July,3:35pm")
    ]
    
    let arrViewedUpdates:[ViewedStatusData] = [
        ViewedStatusData(imageName: "p3", name: "Mahesh Patil", dateTime: "5October,11:35am"),
        ViewedStatusData(imageName: "p1", name: "Raj Patel", dateTime: "1October,10:05am"),
        ViewedStatusData(imageName: "p1", name: "Raj Patel", dateTime: "1October,10:05am"),
        ViewedStatusData(imageName: "p5", name: "Ronny Mallya", dateTime: "20September,2:45pm")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableViewRecent.delegate = self
        tableViewRecent.dataSource = self
        tableViewRecent.alwaysBounceVertical = false
        tableRecentHeight.constant = CGFloat(Double(arrRecentUpdates.count) * Double(90))
        
        tableViewViewed.delegate = self
        tableViewViewed.dataSource = self
        tableViewViewed.alwaysBounceVertical = false
        tableViewedHeight.constant = CGFloat(Double(arrViewedUpdates.count) * Double(90))
    }
    
    func setupUI()
    {
        imgProfilePic.layer.cornerRadius = imgProfilePic.frame.size.height / 2
        //imgAddStatus.layer.cornerRadius = imgProfilePic.frame.size.height / 2
        imgProfilePic.image = UIImage(named: "p1")
    }
    
}

extension StatusViewController: UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewRecent
        {
                return arrRecentUpdates.count
        }else if tableView == tableViewViewed{
        return arrViewedUpdates.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableViewRecent
        {
            let cell = tableViewRecent.dequeueReusableCell(withIdentifier: "RecentViewCell") as! RecentViewCell
            cell.imgProfilePic.layer.borderWidth = 2
            cell.imgProfilePic.layer.borderColor = UIColor.black.cgColor
            let data = arrRecentUpdates[indexPath.row]
            cell.imgProfilePic.image = UIImage(named: data.imageName)
            cell.imgProfilePic.layer.cornerRadius = cell.imgProfilePic.frame.size.height / 2
            cell.lblName.text = data.name
            cell.lblTimeDate.text = data.dateTime
            //tableViewRecent.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: tableViewRecent.contentSize.height)
            return cell
        }else if tableView == tableViewViewed
        {
            let cell = tableViewViewed.dequeueReusableCell(withIdentifier: "ViewedViewCell") as! ViewedViewCell
            let data = arrViewedUpdates[indexPath.row]
            cell.imgProfilePic.image = UIImage(named: data.imageName)
            cell.lblName.text = data.name
            cell.lblDateTime.text = data.dateTime
            cell.imgProfilePic.layer.cornerRadius = cell.imgProfilePic.frame.size.height / 2
            cell.imgProfilePic.layer.borderWidth = 2
            cell.imgProfilePic.layer.borderColor = UIColor.black.cgColor
            return cell
        }
        let noUseCell = tableView.dequeueReusableCell(withIdentifier: "")
        return noUseCell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
}
