//
//  NoticeModel.swift
//  Pods-CocoPodProject
//
//  Created by Admin on 14/04/2022.
//

import Foundation
import ObjectMapper

private let ID = "id"
private let TITIE = "title"
private let BRIEF = "brief"
private let FILESOURCE = "filesorce"

class NoticeModel: Mappable{
    
    internal var id:String?
    internal var title:String?
    internal var brief:String?
    internal var filesource:String?
    
    required.init?(map:map) {
        mapping(map:map)
    }
    
    func mapping(map:map){
        id <- map[ID]
        title <- map[TITLE]
        brief <- map[BRIEF]
        filesource <- map[FILESOURCE]
    }
}
