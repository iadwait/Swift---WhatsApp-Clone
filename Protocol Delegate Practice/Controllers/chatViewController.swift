//
//  SecondViewController.swift
//  Protocol Delegate Practice
//
//  Created by Adwait Barkale on 21/10/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class chatViewController: UIViewController {
    
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnChat: UIButton!
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var callsView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var tableViewChat: UITableView!
    
    @IBOutlet weak var viewWhatsApp: UIView!
    @IBOutlet weak var viewSearch: UIView!
    
    @IBOutlet weak var txtSearchField: UITextField!
    
    
    
    
    let myGreen = UIColor(red: 27/255, green: 164/255, blue: 52/255, alpha: 1.0)
    
    
    let arrChatData:[chatData] = [
        chatData(imageName: "p1", name: "Raj Patel", lastMessage: "Ok, i will come to office.", time: "9:06am"),
        chatData(imageName: "p2", name: "Rohan Deshpande", lastMessage: "Ok, i will get back to you.", time: "4:55pm"),
        chatData(imageName: "p3", name: "Mahesh Patil", lastMessage: "Let's go tomorrow", time: "2:14pm"),
        chatData(imageName: "p4", name: "Suresh Singh", lastMessage: "when are the Exams.", time: "10:12am"),
        chatData(imageName: "p5", name: "Rony Mallya", lastMessage: "we will send them EOD.", time: "2:14pm"),
        chatData(imageName: "p6", name: "Mayuri kakad", lastMessage: "ok i will check", time: "8:09am"),
        chatData(imageName: "p7", name: "Mayur lachke", lastMessage: "please brink lapi", time: "12:14pm"),
        chatData(imageName: "p8", name: "Neha pawar", lastMessage: "office tomorrow at 10.30", time: "3:14pm")
    ]
    
    var tempArray:[chatData] = [
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableView()
        
        for obj in arrChatData{
            tempArray.append(obj)
        }
        
        txtSearchField.addTarget(self, action: #selector(searchText), for: .editingChanged)
    }
    
    
    @objc func searchText()
    {
        self.tempArray.removeAll()
        
        if txtSearchField.text?.count != 0
        {
            for search in 0..<arrChatData.count{
                
                let data = arrChatData[search].name
                guard let nameToSearch = txtSearchField.text else{ return }
                let range = data.lowercased().range(of: nameToSearch, options: .caseInsensitive, range: nil, locale: nil)
                if range != nil{
                    self.tempArray.append(arrChatData[search])
                }
                
            }        }else{
            for obj in arrChatData{
                self.tempArray.append(obj)
            }
        }
        tableViewChat.reloadData()
    }
    
    func configureTableView()
    {
        tableViewChat.delegate = self
        tableViewChat.dataSource = self
    }
    
    func setupUI()
    {
        
        view.backgroundColor = .clear
        //btnSearch.setTitle("magnifyingglass", for: .normal)
        
        btnChat.setTitleColor(myGreen, for: .normal)
        //chatView.backgroundColor = .green
        chatView.backgroundColor = UIColor(red: 27/255, green: 164/255, blue: 52/255, alpha: 1.0)
        btnStatus.setTitleColor(UIColor.white, for: .normal)
        statusView.backgroundColor = .clear
        btnCall.setTitleColor(UIColor.white, for: .normal)
        callsView.backgroundColor = .clear
        
        viewSearch.isHidden = true
        
    }
    
    @IBAction func btnChatTapped(_ sender: UIButton) {
        chatView.backgroundColor = myGreen
        statusView.backgroundColor = .clear
        callsView.backgroundColor = .clear
        btnChat.setTitleColor(myGreen, for: .normal)
        btnStatus.setTitleColor(UIColor.white, for: .normal)
        btnCall.setTitleColor(UIColor.white, for: .normal)
        containerView.addSubview(tableViewChat)
        tableViewChat.isHidden = false
    }
    
    @IBAction func btnStatusTapped(_ sender: UIButton) {
        chatView.backgroundColor = .clear
        statusView.backgroundColor = myGreen
        callsView.backgroundColor = .clear
        btnChat.setTitleColor(UIColor.white, for: .normal)
        btnStatus.setTitleColor(myGreen, for: .normal)
        btnCall.setTitleColor(UIColor.white, for: .normal)
        tableViewChat.isHidden = true
        
        let statusVC = storyboard?.instantiateViewController(identifier: "StatusViewController") as! StatusViewController
        self.addChild(statusVC)
        statusVC.view.frame = .init(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height)
        self.containerView.addSubview(statusVC.view)
        statusVC.didMove(toParent: self)
    }
    
    @IBAction func btnCallsTapped(_ sender: UIButton) {
        chatView.backgroundColor = .clear
        statusView.backgroundColor = .clear
        callsView.backgroundColor = myGreen
        btnChat.setTitleColor(UIColor.white, for: .normal)
        btnStatus.setTitleColor(UIColor.white, for: .normal)
        btnCall.setTitleColor(myGreen, for: .normal)
        tableViewChat.isHidden = true
        
        let callsVC = storyboard?.instantiateViewController(identifier: "callsViewController") as! callsViewController
        self.addChild(callsVC)
        callsVC.view.frame = .init(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height)
        self.containerView.addSubview(callsVC.view)
        callsVC.didMove(toParent: self)
    }
    
    @IBAction func btnSearchTapped(_ sender: UIButton) {
        viewSearch.isHidden = false
        viewWhatsApp.isHidden = true
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        viewSearch.isHidden = true
        viewWhatsApp.isHidden = false
    }
}

extension chatViewController: UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return arrChatData.count
        return tempArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewChat.dequeueReusableCell(withIdentifier: "chatViewCell") as! chatViewCell
        let data = tempArray[indexPath.row]
        cell.imgProfilePic.image = UIImage(named: data.imageName)
        cell.lblName.text = data.name
        cell.lblMessage.text = data.lastMessage
        cell.lblTime.text = data.time
        cell.imgProfilePic.layer.cornerRadius = cell.imgProfilePic.frame.size.height / 2
        cell.imgProfilePic.layer.borderWidth = 2
        cell.imgProfilePic.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
