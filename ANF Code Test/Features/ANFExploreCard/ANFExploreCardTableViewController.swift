//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit



class ANFExploreCardTableViewController: UITableViewController {
    var viewModel : ANFExploreCardViewModel?
    override func viewDidLoad() {
        viewModel = ANFExploreCardViewModel(view: self)
        viewModel?.callExploreDataAPI()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.data.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "exploreContentCell", for: indexPath) as! ExploreContentTableViewCell
        if viewModel?.data.count ?? 0 > 0{
            if let vm = viewModel?.data[indexPath.row]{
                cell.nameLabel1.text = vm.title
                ImageDownloader.shared.downloadImage(with: vm.backgroundImage, completionHandler: { image, isLoaded in
                    cell.imageView1.image = image
                }, placeholderImage: UIImage.init(named: "placeholder"))
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController{
            vc.exploreDataModel = viewModel?.data[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
