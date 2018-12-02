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
}



