//
//  WeatherVC.swift
//  PageViewController
//
//  Created by Hoàng Minh Thành on 2/20/17.
//  Copyright © 2017 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    var greeting:String!
    var color:UIColor!
    var index: Int!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = color
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension WeatherVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = greeting
        return cell
    }
}
