//
//  CustomTableViewCell.swift
//  TableViewPractice
//
//  Created by 오승기 on 2021/08/12.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableViewCellImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .white
        tableViewCellImage.image = nil
    }

    func loadNetworkImage(url: URL) {
        let text = self.textLabel?.text
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("data가 없습니다.")
                return
            }
            var image = UIImage(data: data)
            do {
                image = try self.checkNetworkImage(image: image)
            } catch let error as NetworkError {
                print("error = \(error.description)")
            } catch {
                print("unowned error")
            }
            DispatchQueue.main.async { [weak self] in
                if let currentText = self?.textLabel?.text, currentText == text {
                    self?.tableViewCellImage.image = image
                }
            }
        }.resume()
    }
    
    @discardableResult
    private func checkNetworkImage(image: UIImage?) throws -> UIImage {
        guard let image = image else {
            throw NetworkError.doNotLoadImage
        }
        return image
    }
}
