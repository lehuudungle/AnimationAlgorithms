//
//  MenuViewController.swift
//  Algorithms
//
//  Created by Ledung95d on 4/11/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit
import KDPulseButton

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    struct cellData{
    let nameText: String!
    let image: UIImage!

    }

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var viewMenu: UIView!
    var arrayCellData = [cellData]()

    override func viewDidLoad() {
        super.viewDidLoad()

//        let button = KDPulseButton(frame: <#T##CGRect#>)


        arrayCellData = [cellData(nameText: "Home",image:#imageLiteral(resourceName: "house")),
                        cellData(nameText: "Study",image:#imageLiteral(resourceName: "learning")),
                        cellData(nameText: "Enter_Number",image:#imageLiteral(resourceName: "enter_number"))
        ]
        var nib = UINib(nibName: "MenuCell", bundle: nil)
        imgProfile.layer.borderWidth = 2
        imgProfile.layer.borderColor = UIColor.green.cgColor
        imgProfile.layer.cornerRadius = 50

        imgProfile.layer.masksToBounds = false
        imgProfile.clipsToBounds = true
        tableView.register(nib, forCellReuseIdentifier: "MenuCell")
        viewMenu.backgroundColor = UIColor.cyan
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("so count: \(arrayCellData.count)")
        return arrayCellData.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.imgCell.image = arrayCellData[indexPath.row].image
        cell.titleCell.text = arrayCellData[indexPath.row].nameText
        cell.titleCell.font = UIFont(name: "Helvetica Neue", size: 18)
        cell.titleCell.textColor = UIColor.orange


        print("height: \(cell.frame.height)")
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let revealviewcontroller:SWRevealViewController = self.revealViewController()
        

        let cell: MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
        cell.backgroundColor = UIColor.red
        cell.selectedBackgroundView?.backgroundColor = UIColor.red
        print("title ne: \(revealviewcontroller)")
        if(cell.titleCell.text! == "Home"){
            dismiss(animated: true, completion: nil)
        }
        else if (cell.titleCell.text! == "Study"){

            let newFontController = UINavigationController.init(rootViewController: DETAIL)
            DETAIL.navigationController?.navigationBar.barTintColor = UIColor.yellow
            // tai sao newFontController.navigationController.navigationBar ko doi mau ???
            revealviewcontroller.pushFrontViewController(newFontController, animated: true)
            var img = UIImage(named: "list-1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)

            let menuVC = MenuViewController(nibName: "MenuViewController", bundle: nil)
            revealviewcontroller.rightViewController = menuVC

        }else{

            let newFontController = UINavigationController.init(rootViewController: INPUT_XIB_CLASS)

            revealviewcontroller.pushFrontViewController(newFontController, animated: true)
            var img = UIImage(named: "list-1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            INPUT_XIB_CLASS.navigationItem.rightBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: revealViewController(), action: #selector(self.revealViewController().rightRevealToggle(_:)))
            img = UIImage(named: "house")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            INPUT_XIB_CLASS.navigationItem.leftBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(backHOME(sender:)))
            newFontController.navigationController?.navigationBar.barTintColor = UIColor.yellow


        }

    }
    func backHOME(sender: UIBarButtonItem){
       dismiss(animated: true, completion: nil)
    }

}
