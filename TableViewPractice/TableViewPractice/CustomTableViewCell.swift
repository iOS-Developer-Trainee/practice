//
//  CustomTableViewCell.swift
//  TableViewPractice
//
//  Created by 오승기 on 2021/08/12.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  @IBOutlet weak var testImage: UIImageView!
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.backgroundColor = .white
    testImage.image = nil
  }
  
  func loadImage(url: URL, indexPath: IndexPath) {
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data else { return}
      
      DispatchQueue.global().async {
        let image = UIImage(data: data)
        DispatchQueue.main.async { [self] in
          testImage.image = image
        }
      }
    }.resume()
  }
}
