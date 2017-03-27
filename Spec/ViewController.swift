//
//  ViewController.swift
//  Spec
//
//  Created by Brian Wang on 3/27/17.
//  Copyright © 2017 GT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var colorNames:[String] = ["Red", "Blue", "Green"]
    var colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green]
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        let colorName = colorNames[indexPath.row]
        let color = colors[indexPath.row]
        cell.textLabel?.text = colorName
        cell.textLabel?.textColor = color
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Color", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ColorViewController
        let index = sender as! Int
        dest.color = colors[index]
        dest.colorName = colorNames[index]
    }

}

