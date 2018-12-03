//
//  NetworkManager.swift
//  OH
//
//  Created by Li Chai on 11/27/18.
//  Copyright © 2018 Joie Ng. All rights reserved.
//
// https://classes.cornell.edu/api/2.0/search/classes.json?roster=FA18&subject=INFO(required)&catalogNbr=4320

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager{
    
    private static let rosterURL = "https://classes.cornell.edu/api/2.0/search/classes.json?"
    private static let dbURL = ""
    
    private static let coursesURL = "/course/get_hours?"
    
    let deviceToken = UserDefaults.standard.string(forKey: "deviceTokenString") ?? ""
    
    static func postUserEmail(email: String, didPost: @escaping (String) -> Void) {
        let parameters: Parameters = ["email": email]
        Alamofire.request(dbURL, method: .post, parameters: parameters).responseJSON { response in
            print(response)
        }
    }
    
//    static func postUserEmail(email: String, didPost: @escaping([]))
    static func getCourseBasicInfo(searchText: String, didGetCourse: @escaping([Course]) -> Void) {
        let parameters: [String: Any] = ["roster": "FA18", "subject": searchText.components(separatedBy: " ")[0], "q": searchText.components(separatedBy: " ")[1]]
        Alamofire.request(rosterURL,
                          method: .get,
                          parameters: parameters)
            .validate()
            .responseData { response in
                switch response.result{
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    if let courseResponse = try? jsonDecoder.decode(CourseSearchResponse.self, from: data) {
                            didGetCourse(courseResponse.data.classes)
                    } else {
                        print("invalid response data")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print(response.request?.url)
                }
        }
    }
    
    static func getCourseOfficeHours(searchText: String, didGetOfficeHours: @escaping([OfficeHour]) -> Void) {
        let parameters: [String: Any] = ["subj": searchText.components(separatedBy: " ")[0], "nbr": searchText.components(separatedBy: " ")[1]]
        Alamofire.request(coursesURL,
                          method: .get,
                          parameters: parameters)
            .validate()
            .responseData { response in
                switch response.result{
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    if let hourResponse = try? jsonDecoder.decode(CourseOHSearchResponse.self, from: data) {
                        didGetOfficeHours(hourResponse.data)
                    } else {
                        print("invalid response data")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print(response.request?.url)
                }
        }
    }
}



