//
//  ViewController.swift
//  GenericsAndProtocolApi
//
//  Created by Alphonsa Varghese on 23/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var ApiManagerObj : ApiManager = ApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }

    func getData() {
        ApiManagerObj.get(endPoint: .fact, method: .GET, expecting: CatFactModel.self) { result in
            switch result {
            case .success(let catFactMdl) :
                print("response]=====",catFactMdl[0].text)
            case .failure(let error):
                print("error=====",error)
            }
        }
    }
}

