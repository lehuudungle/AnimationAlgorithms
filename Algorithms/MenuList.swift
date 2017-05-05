//
//  MenuList.swift
//  Algorithms
//
//  Created by TTung on 3/28/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import Foundation
import UIKit

struct Menu {
    var title: String
    var viewClass: String
    var inputClass: UIViewController
    var infoTitle: String
    
};

struct MenuSection {
    var section: String
    var menus: [Menu]
}

class MenuList: NSObject {
    
    var menu : [MenuSection]!
    static var rootWindow: UIWindow!
    static var main: MainScreen!
    class func boot(window:UIWindow){
        
        let basic = MenuSection(section: "Sort", menus:[
            Menu(title: "Bubble Sort", viewClass: "BubbleSortSVC",inputClass: BubbleSortIVC(), infoTitle: "BubbleSortDocument" ),
            Menu(title: "Selection Sort", viewClass: "SelectionSortSVC",inputClass: SelectionSortIVC(), infoTitle: "SelectionSortDocument" ),
            Menu(title: "Insertion Sort", viewClass: "InsertionSortSVC",inputClass: InsertionSortIVC(), infoTitle: "InsertionSortDocument" ),
            Menu(title: "Merge Sort", viewClass: "MergeSortSVC",inputClass: MergeSortIVC(), infoTitle: "MergeSortDocument" ),
            Menu(title: "Quick Sort", viewClass: "QuickSortSVC",inputClass: QuickSortIVC(), infoTitle: "QuickSortDocument" ),
            Menu(title: "Heap Sort", viewClass: "HeapSortSVC",inputClass: HeapSortIVC(), infoTitle: "HeapSortDocument" )
            
            ])
        
        let inter = MenuSection(section: "N-Queen ", menus:[
            Menu(title: "N-Queen Problem", viewClass: "ViewController",inputClass: SelectionSortIVC(), infoTitle: "A" )
            ])
        let tower = MenuSection(section: "Tower Of HaNoi", menus:[
            Menu(title: "Tower Of HaNoi", viewClass: "TowerOfHaNoiVC",inputClass: SelectionSortIVC(), infoTitle: "A" )
            ])
        let dataStructs = MenuSection(section: "Data Structures", menus:[
            Menu(title: "Stacks", viewClass: "StacksSVC",inputClass: StacksSVC(), infoTitle: "A" )
            ])

        
        let advance = MenuSection(section: "Other", menus:[
            Menu(title: "About", viewClass: "AboutVC",inputClass: SelectionSortIVC(), infoTitle: "A" ),
            Menu(title: "Share", viewClass: "ShareVC",inputClass: ShareVC(), infoTitle: "A" )
            ])
        
        let mainScreen = MainScreen(style: UITableViewStyle.grouped)
        mainScreen.menu = [basic,inter,tower,dataStructs,advance]
        mainScreen.title = "Algorithms"
        
        let nav = UINavigationController(rootViewController: mainScreen)
        
        
        window.rootViewController = nav
        rootWindow = window
        main = mainScreen
        
    }
    class func nextView(){
        rootWindow.rootViewController = UINavigationController(rootViewController: main)
        
        
    }
}
