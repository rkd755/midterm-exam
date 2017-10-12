//
//  ViewController.swift
//  201412346_Busan_Map_Tour
//
//  Created by D7702_09 on 2017. 10. 10..
//  Copyright © 2017년 lyw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var myTalbe: UITableView!
    var contents = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTalbe.delegate = self
        myTalbe.dataSource = self
        
        self.title = "Busan Map Tour"
        
        let path = Bundle.main.path(forResource: "plist", ofType: "plist")
        contents = NSArray(contentsOfFile: path!)!
    }

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let myCell = myTalbe.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let address = (contents[indexPath.row] as AnyObject).value(forKey: "address")
        let title = (contents[indexPath.row] as AnyObject).value(forKey: "title")
        
        
        
        myCell.textLabel?.text = title as? String
        myCell.detailTextLabel?.text = address as? String

        
        return myCell
        
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail"{
            let detailMVC = segue.destination as! DetailViewController
            let selectedPath = myTalbe.indexPathForSelectedRow
            
            let myIndexedTitle = (contents[(selectedPath?.row)!]as AnyObject).value(forKey: "title")
            let myIndexedAddress = (contents[(selectedPath?.row)!]as AnyObject).value(forKey: "address")
            
            detailMVC.detailTitle = myIndexedTitle as? String
            detailMVC.detailAddress = myIndexedAddress as? String
        }else if segue.identifier == "segueAll"{
            let totalMVC = segue.destination as! TotalViewController
            totalMVC.contents = contents
    }
}
}
