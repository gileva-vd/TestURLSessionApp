//
//  User.swift
//  TestURLSessionApp
//
//  Created by Валерия Гилева on 13.12.2022.
//

struct User: Decodable {
    let data: Data?
}
struct Data: Decodable {
    let id: Int?
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
}
