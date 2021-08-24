//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 오승기 on 2021/08/12.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func tapStartButton() {
    guard let nextVC = self.storyboard?.instantiateViewController(identifier: "secondVC") else { return }
    nextVC.navigationController?.pushViewController(nextVC, animated: true)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

