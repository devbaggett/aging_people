//
//  ViewController.swift
//  Aging People
//
//  Created by Devin Baggett on 5/9/18.
//  Copyright © 2018 devbaggett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nameList = ["Tom", "Jerry", "Stephanie", "Jim", "John", "Jack", "Jeremy", "Johnson", "Bob", "Gorgonzola", "Belgarath", "Zaphod"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // returns the amount of cells we need
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tell UITableViewCell how to populate data and return in
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = nameList[indexPath.row]
        
        cell.detailTextLabel?.text = "\(Int(arc4random_uniform(91) + 5)) years old"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        nameList.remove(at: indexPath.row)
        tableView.reloadData()
    }
}

