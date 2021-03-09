//
//  ListTableViewController.swift
//  pruebaMarvel
//
//  Created by ruben on 08/03/2021.
//  Copyright © 2021 ruben. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var characterList = [Character]()
    var charSelected: (name: String ,description:String? , thumbnail: UIImage?)? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCharacters(offset: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "heroTableViewCell", bundle: nil), forCellReuseIdentifier: "heroCell")
      
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroCell", for: indexPath) as! heroTableViewCell
        
        cell.nameLabel.text = characterList[indexPath.row].name
        let urlbuild = URL(string: "\(characterList[indexPath.row].thumbnail.path).\(characterList[indexPath.row].thumbnail.ext)")!
        cell.photo.load(url: urlbuild)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! heroTableViewCell
        charSelected = (name: characterList[indexPath.row].name, description: characterList[indexPath.row].description, thumbnail: cell.photo.image)
        
         let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
               let detailVC = storyBoard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
         detailVC.name = charSelected?.name
         detailVC.descriptiontxt = charSelected?.description
         detailVC.imageHero = charSelected?.thumbnail
         detailVC.modalPresentationStyle = .fullScreen
         self.present(detailVC, animated: true, completion: nil)
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 60))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height)
        label.text = "Tus Heroes"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        
        headerView.backgroundColor = .systemGray
        headerView.addSubview(label)
        return headerView
    }
        
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func fetchCharacters(offset: Int) {
        
        let apiRequest = WebService(offset: offset)
        
        apiRequest.getCharacters() { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let results,let total):
                if offset == 0 {
                    self.characterList = results
                } else {
                    self.characterList.append(contentsOf: results)
                }
                
                DispatchQueue.main.async {
                     self.tableView?.reloadData()
                }
        
            }
        }
        
    }
       
}

extension UIImageView{
    func load(url:URL){
        if let data = try? Data(contentsOf: url){
            if let image = UIImage(data:data){
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
 
