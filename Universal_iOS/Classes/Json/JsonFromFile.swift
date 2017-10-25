//
//  JsonFromFile.swift
//  Pods-DVP4_Project
//
//  Created by Abhijeet Malamkar on 10/25/17.
//
import UIKit
import Foundation

public extension JSON {
    
    public typealias CompletionHandler = (_ object:Any) -> Void
    public static func readJsonFile(forResource: String, ofType: String,completionHandler: CompletionHandler){
        if let path = Bundle.main.path(forResource: forResource, ofType: ofType){
            let url = URL(fileURLWithPath: path)
            
            do {
                let data = try Data.init(contentsOf:url)
                let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as Any
                
                completionHandler(jsonObj)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
