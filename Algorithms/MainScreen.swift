//
//  MainScreen.swift
//  Algorithms
//
//  Created by TTung on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class MainScreen: UITableViewController {
//    var about: String!
    
    var menu: [MenuSection]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let barButoonItem = UIBarButtonItem(title: "About", style: UIBarButtonItemStyle.plain, target: self, action: #selector(MainScreen.onAbout))
//        self.navigationItem.rightBarButtonItem = barButoonItem
        
        self.tableView.contentInset = UIEdgeInsetsMake(20,0,0,0)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 204/255, green: 102/255, blue: 102/255, alpha: 1)
        
    }
    
//    func onAbout(){
//        let alert = UIAlertController.init(title: "Info",
//                                           message: about,
//                                           preferredStyle: .alert)
//        
//        let defaultAction = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
//        
//        alert.addAction(defaultAction)
//        self.present(alert, animated: true, completion: nil)
//    }
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let menuSection: MenuSection  = self.menu[section]
        let menuArray: [Menu] = menuSection.menus
        
        return menuArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15.0
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let menuSection: MenuSection = self.menu[section]
        return menuSection.section
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "id")
        let menuSection: MenuSection = self.menu[indexPath.section]
        let menuItems = menuSection.menus
        let item: Menu = menuItems[indexPath.row]
        cell.textLabel!.text = item.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuSection: MenuSection = self.menu[indexPath.section]
        let menuItems = menuSection.menus
        
        let item: Menu = menuItems[indexPath.row]
        INPUT_XIB_CLASS = item.inputClass
        
        let xibClass = item.viewClass
        
        let detailScreen: UIViewController!
        
        
        let appName =  Bundle.main.infoDictionary!["CFBundleName"] as! String
        
        // check if class exits
        
        if let aClass = NSClassFromString("\(appName).\(xibClass)") as? UIViewController.Type {
            
            if (Bundle.main.path(forResource: xibClass, ofType: "nib") == nil){
                //if the xib file does not exits
                detailScreen = aClass.init() as UIViewController
            }else{
                detailScreen = aClass.init(nibName:xibClass,bundle:nil) as UIViewController
                
            }
            
            let menuVC = MenuViewController(nibName: "MenuViewController", bundle: nil)
            
            detailScreen.title = item.title
            DETAIL = detailScreen
            
            let list = UIImage(named: "list-1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            detailScreen.navigationItem.rightBarButtonItem = UIBarButtonItem(image: list, style: .plain, target: revealViewController(), action: #selector(self.revealViewController().rightRevealToggle(_:)))
            let img = UIImage(named: "house")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            detailScreen.navigationItem.leftBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(backHOME(sender:)))
            
            let navDetail = UINavigationController(rootViewController: detailScreen)

            navDetail.navigationBar.barTintColor = UIColor(red: 204/255, green: 102/255, blue: 102/255, alpha: 1)
            let revel = SWRevealViewController(rearViewController: menuVC, frontViewController: navDetail)
            revel?.rightViewController = menuVC
            
            present(revel!, animated: true, completion: nil)
            revel?.rightViewRevealWidth = 180
            
            
            
            
        }else{
            let alert = UIAlertController.init(title: "Warning",
                                               message: "Thuật toán cần thêm \(xibClass)",
                preferredStyle: .alert)
            
            let defaultAction = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    func backHOME(sender: UIBarButtonItem){
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
}


