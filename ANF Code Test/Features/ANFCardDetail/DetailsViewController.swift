//
//  DetailsViewController.swift
//  ANF Code Test
//
//  Created by Thrinadh Ponnapati on 8/27/21.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var exploreDataModel : ExploreDataModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1{
            return 1
        }
        return exploreDataModel?.content?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let model = exploreDataModel{
            if indexPath.section == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailImageTableViewCell") as! DetailImageTableViewCell
                cell.setUpUIData(exploreDataModel: model)
                return cell
            }
            else if indexPath.section == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailDescriptionTableViewCell") as! DetailDescriptionTableViewCell
                cell.setUpUIData(exploreData: model)
                return cell
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell") as! ButtonTableViewCell
                if let content = model.content?[indexPath.row]{
                    cell.button.setTitle(content.title, for: .normal)
                }
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let content = exploreDataModel?.content?[indexPath.row]{
            print(content)
        }
    }
}
