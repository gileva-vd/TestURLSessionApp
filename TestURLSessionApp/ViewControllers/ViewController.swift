//
//  ViewController.swift
//  TestURLSessionApp
//
//  Created by Валерия Гилева on 13.12.2022.
//

import UIKit

enum Link: String {
    case userURL = "https://reqres.in/api/users/2"
}

class ViewController: UIViewController {


    @IBAction func starParsing(_ sender: UIButton) {
        guard let url = URL(string: Link.userURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                print(user)
                self?.successAlert()
            } catch let error {
                print(error)
                self?.failedAlert()
            }
            
        }.resume()
    }
    
    // MARK: - Private Methods
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
}

