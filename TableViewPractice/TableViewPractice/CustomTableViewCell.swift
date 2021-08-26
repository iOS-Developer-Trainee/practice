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
            let image = UIImage(data: data)
            DispatchQueue.main.async { [weak self] in
                if let currentText = self?.textLabel?.text, currentText == text {
                    do {
                        try self?.checkNetworkImage(image: image)
                    } catch {
                        switch error {
                        case NetworkError.doNotLoadImage:
                            print("이미지로딩 에러")
                        default:
                            print("이유를 알 수 없는 에러")
                        }
                    }
                }
            }
        }.resume()
    }
    
    @discardableResult
    private func checkNetworkImage(image: UIImage?) throws -> UIImage {
        guard let image = image else {
            throw NetworkError.doNotLoadImage
        }
        tableViewCellImage.image = image
        return image
    }
}
