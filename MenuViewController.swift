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


//       self.view.backgroundColor = UIColor.white
//        self.view.backgroundColo


        arrayCellData = [cellData(nameText: "Study",image:#imageLiteral(resourceName: "learning")),
                        cellData(nameText: "Enter_Number",image:#imageLiteral(resourceName: "pencils_32")),
                        cellData(nameText: "Info",image:#imageLiteral(resourceName: "info_32"))
        ]
        let nib = UINib(nibName: "MenuCell", bundle: nil)
        imgProfile.layer.borderWidth = 2
        imgProfile.layer.borderColor = UIColor.green.cgColor
        imgProfile.layer.cornerRadius = 50

        imgProfile.layer.masksToBounds = false
        imgProfile.clipsToBounds = true
        tableView.register(nib, forCellReuseIdentifier: "MenuCell")
        viewMenu.backgroundColor = UIColor(red: 245/255, green: 222/255, blue: 179/255, alpha: 0.8)

        let navBar = UINavigationBar(frame: CGRect(x: 0, y:0 , width: 270, height: 44+UIApplication.shared.statusBarFrame.height))
        
        navBar.barTintColor = UIColor(red: 153/255, green: 0/255, blue: 102/255, alpha: 0.6)

        let navItem = UINavigationItem(title: "Menu")
        navBar.setItems([navItem], animated: false)

        self.view.addSubview(navBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCellData.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.imgCell.image = arrayCellData[indexPath.row].image
        cell.titleCell.text = arrayCellData[indexPath.row].nameText
        cell.titleCell.font = UIFont(name: "Helvetica Neue", size: 18)
        cell.titleCell.textColor = UIColor.orange

        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealviewcontroller:SWRevealViewController = self.revealViewController()

        if (indexPath.row == 0){

            let newFontController = UINavigationController.init(rootViewController: DETAIL)
            newFontController.navigationBar.barTintColor = UIColor(red: 204/255, green: 102/255, blue: 102/255, alpha: 1)
            revealviewcontroller.pushFrontViewController(newFontController, animated: true)
            _ = UIImage(named: "list-1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)



        }else if(indexPath.row == 1){
            let newFontController = UINavigationController.init(rootViewController: INPUT_XIB_CLASS)
            
            newFontController.navigationBar.barTintColor = UIColor(red: 204/255, green: 102/255, blue: 102/255, alpha: 1)
            

            INPUT_XIB_CLASS.title = DETAIL.title
            revealviewcontroller.pushFrontViewController(newFontController, animated: true)
            var img = UIImage(named: "list-1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            INPUT_XIB_CLASS.navigationItem.rightBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: revealviewcontroller, action: #selector(revealviewcontroller.rightRevealToggle(_:)))

            img = UIImage(named: "house")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            INPUT_XIB_CLASS.navigationItem.leftBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(backHOME(sender:)))

        }else{
            print("khong lam gi")
        }

    }
    func backHOME(sender: UIBarButtonItem){
       dismiss(animated: true, completion: nil)
    }

}
