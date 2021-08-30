//
//  ANFExploreCardViewModel.swift
//  ANF Code Test
//
//  Created by Thrinadh Ponnapati on 8/29/21.
//

import Foundation
class ANFExploreCardViewModel{
    var view: ANFExploreCardTableViewController?
    var data : ExploreData
    
    init(view:ANFExploreCardTableViewController ){
        self.view = view
        self.data = []
    }

    func callExploreDataAPI(){
        APIWrapper.shared.callAPI(urlString: URLConstants.exploreDataURL) {[self] exploreData, response, error in
            if let hasError = error{
                view?.showAlert(title: "ANF", message: hasError.localizedDescription)
            }
            else{
                self.data = exploreData ?? []
                DispatchQueue.main.async { [self] in
                    view?.tableView.reloadData()
                }
            }
        }
    }
    
    func getDataFromLocalJSON(){
        self.data = exploreDataCodable ?? []
    }
    
    private var exploreDataCodable: ExploreData?{
        if let filePath = Bundle.main.path(forResource: "exploreData", ofType: "json"),
           let fileContent = try? Data(contentsOf: URL(fileURLWithPath: filePath)){
            let exploreDataCodable = try? newJSONDecoder().decode(ExploreData.self, from: fileContent)
            return exploreDataCodable
        }
        return nil
    }
}
