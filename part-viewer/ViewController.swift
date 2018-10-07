//
//  ViewController.swift
//  part-viewer
//
//  Created by Wojciech Szczurek on 9/3/18.
//  Copyright © 2018 Wojciech Szczurek. All rights reserved.
//

import UIKit

struct Part: Decodable {
    /*
    let ID: Int
    let PartNumber: String
    let ManufacturerPartNumber: String
    */
    let slug: String
    let type: String
}

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var parts: [Part] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://www.nowabiala.com/wp-json/wp/v2/posts"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                self.parts = try JSONDecoder().decode([Part].self, from: data)
            } catch let jsonErr {
                print(jsonErr)
            }
            
            OperationQueue.main.addOperation({
                self.tableView.reloadData()
            })
            
        }.resume()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! partTableViewCell
        
        if(parts.count > 0) {
            cell.partName.text = parts[indexPath.row].slug
        }
        
        return cell
    }


}

