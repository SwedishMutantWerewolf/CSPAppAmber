//
//  TheInternetViewController.swift
//  CSP App Amber
//
//  Created by Bullough, Amber on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class InternetMasterViewController : UITableViewController
{
    private(set) lazy var internetTopics : [String] =
{
    return [
        "Definitions",
        "CSP",
        "CTEC",
        "Canyons",
        "Twitter",
        "Swift Guide"
    ]
    }()
    
    private lazy var addresses: [String] = []
    
    private var detailViewController: InternetDetailViewCotroller?
    
    private func setup() -> Void
    {
        //TODO Replace with correct links
        addresses = [
            "https://www.google.com",
            "https://www.google.com",
            "https://www.google.com",
            "https://www.google.com",
            "https://www.google.com",
            "https://www.google.com"
        ]
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            detailViewController = currentControllers[0] as? InternetDetailViewController
        }
    }
    
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        self.clearsSelectionOnViewWillAppear = false
    }

    override public func numberOfSections(in tableVieweUITableView) -> Int
    {
        return 1
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return internetTopics.count
    }

    override public func tableView(_ tableView: UITableView , cellForRowAt indexPath: IndexPath) -> UITableViewCell
{
    let cell = tableView.dequeueReusableCell(withIdentifier: "reusedentifier", for: indexpath)
    let currentText = internetTopics[indexPath.row]
    cell.textLabel!.text = currentText
    
    return cell
}

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?)
{
    if segue.identifier! == "showDetail"
    {
        if let indexPath = self.tableView.indexPathForSelectedRow
        {
            let urlString = addresses[indexPath.row]
            let pageText : String
            
            if indexPath.row == 0
            {
                //Replace with definitions. Great time to use the "" operator
                pageText = "allthe definitions you wrote......."
            }
            else
            {
                pageText = internetTopics[indexPath.row]
            }
            
            let cibtrikker = segue.destination as! InternetDetailViewController
            
            controller.detailAddress = urlString
            controller.detailText = pageText
            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemSupplementBackButton = true
            }
        }
    }
}
