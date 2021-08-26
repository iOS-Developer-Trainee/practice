//
//  TableViewController.swift
//  TableViewPractice
//
//  Created by 오승기 on 2021/08/12.
//

import UIKit

enum NetworkError: String, Error {
    case doNotLoadImage = "이미지 로딩 실패"
    
    var description: String {
        return self.rawValue
    }
}
class TableViewController: UITableViewController {
    
    let images = ["https://wallpaperaccess.com/download/europe-4k-1369012",
                  "https://wallpaperaccess.com/download/europe-4k-1318341",
                  "https://wallpaperaccess.com/download/europe-4k-1379801"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as?
                CustomTableViewCell else { fatalError() }
        
        cell.textLabel?.text = "\(indexPath.section)행 \(indexPath.row)줄"
        
        if indexPath.row == 3 {
            cell.backgroundColor = .red
        }
        
        if indexPath.row <= 2 {
            guard let imageURL = URL(string: images[indexPath.row]) else { fatalError() }
            cell.loadImage(url: imageURL, indexPath: indexPath)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(section)
    }
}

