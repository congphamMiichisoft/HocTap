//
//  APIManager.swift
//  DesignEx
//
//  Created by Miichisoft on 12/10/20.
//

import Foundation
import Alamofire
import SwiftyJSON
let API_root = ""
class APIManager {
    var alamoFireManager: URLSessionConfiguration? = {
        let alamoFireManager = AF.sessionConfiguration
        alamoFireManager.timeoutIntervalForRequest = 200
        alamoFireManager.timeoutIntervalForResource = 200
        return alamoFireManager
        
    }()
    class func requestAPI(api: String, param: [String: Any], method: HTTPMethod,type : Int, success: @escaping(_ data: JSON?, _ resultCode: Int) -> Void)   {
        
            let params = param
            let url = API_root + api
            
            //        let header1 : HTTPHeaders = HTTPHeaders(header)
            // Kiểm tra nếu type =1 thì gửi param
            if type == 1 {
//                alamoFireManager?.request(url, method: method, parameters: params,encoding:  JSONEncoding.default,headers: nil).responseJSON { response in
//                        switch response.result {
//                        case .success:
//                            let data = try! JSON(data: response.data!)
//                            success(data,response.response!.statusCode)
//                        case .failure:
//                            if response.response?.statusCode != nil {
//                                success(nil,response.response!.statusCode)
//                                print("Alamofire Error Code : ",response.response?.statusCode as Any)
//                            }else {
//                                success(nil,0)
//                                print("Can't connect to Server : ")
//                            }
//
//
//                        }
//
//                }
            } else if type == 0 {
//                alamoFireManager?.request(url, method: method, encoding: JSONEncoding.default,headers: nil).responseJSON { response in
//
//                        switch response.result {
//                        case .success:
//                            let data = try! JSON(data: response.data!)
//                            success(data,response.response!.statusCode)
//                        case .failure:
//                            if response.response != nil {
//                                success(nil,response.response!.statusCode)
//                            }
//
//                            print("Alamofire Error Code : ",response.response?.statusCode as Any)
//                        }
//
//                }
            } else {
                
//                alamoFireManager?.request(url, method: method, encoding: URLEncoding.default,headers: nil).responseJSON { response in
//                    switch response.result {
//                    case .success:
//                        let data = try! JSON(data: response.data!)
//                        success(data,response.response!.statusCode)
//                    case .failure:
//                        success(nil,response.response!.statusCode)
//                        print("Alamofire Error Code : ",response.response?.statusCode as Any)
//                    }
//                }
            }
        }
    }

