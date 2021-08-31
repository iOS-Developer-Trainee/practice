//
//  Error.swift
//  TableViewPractice
//
//  Created by 오승기 on 2021/08/26.
//

import Foundation

enum NetworkError: String, Error {
    case doNotLoadImage = "이미지 로딩 실패"
    
    var description: String {
        return rawValue
    }
}
