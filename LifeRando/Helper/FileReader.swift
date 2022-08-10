//
//  FileReader.swift
//  LifeRando
//
//  Created by KarimAhmed on 09/08/22.
//

import Foundation

//File reader for reading file,created generic model we can use it for fetching json and parsing with codable model classes
class FileReader {
    public func readFile<T:Codable>(fileName:String) -> T {
        let data = Bundle.main.decode(T.self, from: fileName)
        return data
    }
}
