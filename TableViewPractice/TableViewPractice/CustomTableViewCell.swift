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
        let text = self.textLabel?.text
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async { [weak self] in
                if let currentText = self?.textLabel?.text, currentText == text {
                    do {
                        try self?.checkImage(image: image)
                    } catch {
                        print("이미지 로딩 실패")
                    }
                }
            }
        }.resume()
    }
    
    func checkImage(image: UIImage?) throws -> UIImage {
        guard let image = image else {
            throw NetworkError.doNotLoadImage
        }
        testImage.image = image
        return image
    }
}
