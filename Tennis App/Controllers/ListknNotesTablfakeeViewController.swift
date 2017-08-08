//
//  ListViewController.swift
//  Tennis App
//
//  Created by adyao20 on 8/5/17.
//  Copyright © 2017 adyao20. All rights reserved.
//

import Foundation

class ListNotesTableViewController: UITableViewController {


// 1
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
}

// 2
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // 3
    let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath)
    
    // 4
    cell.textLabel?.text = "Yay - it's working!"
    
    // 5
    return cell
}
}
