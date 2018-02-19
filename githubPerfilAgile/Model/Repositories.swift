//
//  Repositories.swift
//  githubPerfilAgile
//
//  Created by Fernanda de Lima on 17/02/2018.
//  Copyright © 2018 Empresinha. All rights reserved.
//

import AlamofireObjectMapper
import ObjectMapper
import Foundation

class Repositories: Mappable {
    
    var name: String?
    var language: String?
    var owner: Owner?
    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map:Map){
        name        <- map["name"]
        language    <- map["language"]
        owner       <- map["owner"]
    }
}

class Owner: Mappable {
    
    var username: String?
    var avataURL: String?
    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map:Map){
        username    <- map["login"]
        avataURL    <- map["avatar_url"]

    }

}

