//
//  ViewController.swift
//  GenericsAndProtocolApi
//
//  Created by Alphonsa Varghese on 23/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var ApiManagerObj : ApiManager = ApiManager()
    let baseurl = baseUrl.dev.rawValue

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getDatafromURLSession()
        getDataFromAF()
    }
    
    func getDatafromURLSession() {
        ApiManagerObj.get(endPoint: .fact, method: .GET, expecting: CatFactModel.self) { result in
            switch result {
                case .success(let catFactMdl) :
                        print("response]=====",catFactMdl[0].text)
                case .failure(let error):
                        print("error=====",error)
            }
           
        }
    }

    func getDataFromAF() {
        let path = "\(baseurl)\(EndPoint.fact.rawValue)"
        print(path)
        NetworkCall(data: [:], headers: [:], url: path, service: .none, method: .get, isJSONRequest: false).executeQuery(endPoint: EndPoint.fact, method: .GET, expecting: CatFactModel.self) { result in
            switch result {
                case .success(let catFactMdl) :
                        print("response from AF=====",catFactMdl[0].text)
                case .failure(let error):
                        print("error=====",error)
            }
        }
    }
}

