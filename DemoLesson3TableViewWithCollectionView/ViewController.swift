//
//  ViewController.swift
//  DemoLesson3TableViewWithCollectionView
//
//  Created by Aykhan Hajiyev on 11.03.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeHeaderTableViewCell")
        tableView.register(UINib(nibName: "HomeBannerTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeBannerTableViewCell")
        tableView.register(UINib(nibName: "DishesTableViewCell", bundle: nil), forCellReuseIdentifier: "DishesTableViewCell")
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeaderTableViewCell", for: indexPath) as! HomeHeaderTableViewCell
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBannerTableViewCell", for: indexPath) as! HomeBannerTableViewCell
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DishesTableViewCell", for: indexPath) as! DishesTableViewCell
            return cell
        }
        return UITableViewCell()
        

    }
    

}



