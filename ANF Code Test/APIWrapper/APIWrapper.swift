//
//  APIWrapper.swift
//  ANF Code Test
//
//  Created by Thrinadh Ponnapati on 8/27/21.
//

import Foundation

protocol  APICalling {
    func callAPI(urlString : String, completionHandler: @escaping (ExploreData?, URLResponse?, Error?) -> Void)
}

class APIWrapper : APICalling{
    private init(){
        
    }
    static let shared = APIWrapper()
    func callAPI(urlString : String, completionHandler: @escaping (ExploreData?, URLResponse?, Error?) -> Void){
        
        if let url = URL.init(string: urlString){
            let task = URLSession.shared.ExploreDataTask(with: url) { exploreData, urlResponse, error in
                completionHandler(exploreData,urlResponse,error)
            }
            task.resume()
        }
    }
}


// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func ExploreDataTask(with url: URL, completionHandler: @escaping (ExploreData?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}


