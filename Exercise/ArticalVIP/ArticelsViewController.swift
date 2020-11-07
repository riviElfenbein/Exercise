//
//  ArticelsViewController.swift
//  Exercise
//
//  Created by Rivi Elf on 05/11/2020.
//

import UIKit

class ArticelsViewController: UIViewController, Storyboarded {
    var interactor: InteractorArticelsProtocol!
    
}

extension ArticelsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticalCell.reuseIdentifier,
                                                       for: indexPath) as? ArticalCell else {
            return UITableViewCell()
        }

        cell.titelLabel.text = interactor.titelForRow(index:indexPath.row)
        
        interactor.imageUrlFor(index: indexPath, completion: { data, index in
            guard let data = data else {
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                if let updateCell:ArticalCell = tableView.cellForRow(at: index) as? ArticalCell {
                    updateCell.EImageCell.image = image
                }
            }
        })
        
        return cell
    }
    
    
}


