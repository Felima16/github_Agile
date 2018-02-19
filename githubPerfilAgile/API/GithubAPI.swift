//
//  iTunesAPI.swift
//  PlayerTest
//
//  Created by Fernanda de Lima on 18/01/2018.
//  Copyright © 2018 Empresinha. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper


class GithubAPI{
    
    //cria o get pegando um array de infomaçoes mapeando qualquer tipo de classe mappble
    static func getArray <T: Any>
        (_ type: T.Type,
         url: String,
         success:@escaping (_ item: Array<T>) -> Void,
         fail:@escaping (_ error: Error) -> Void) -> Void where T:Mappable {
        Alamofire.request(url).responseArray { (response: DataResponse<Array<T>>) in
            print("GET ARRAY ------ \(url) with status code \(response.response?.statusCode ?? 0)")
            switch response.result {
            case .success(let item):
                print("Response from GET ARRAY ---- \(String(describing: response.result.value))")
                success(item)
            case .failure(let error):
                print("ERROR GET ARRAY ---- ", error)
                fail(error)
            }
        }
    }
}
