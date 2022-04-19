//
//  NoticeInteractor.swift
//  Pods-CocoPodProject
//
//  Created by Admin on 14/04/2022.
//

import Foundation
import Alamofire
import ObjectMapper

class NoticeInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNotice() {
        Alamofire.request(API_NOTICE_LIST).responseJSON { response in
            if(response.respnse?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["notice_list"] as! NSArray
                    let arrayObject = Mapper<NoticeModel>().mapArray(JSONArray: arrayResponse as! self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObject)
                }
                                                                     }else {
                        self.presenter?.noticeFetchFailed()
                    }
    }
}
                    }
