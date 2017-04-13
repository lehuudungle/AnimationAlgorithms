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
            Menu(title: "Bubble Sort", viewClass: "BubbleSortSVC",inputClass: BubbleSortIVC() ),
            Menu(title: "Selection Sort", viewClass: "SelectionSortSVC",inputClass: SelectionSortIVC() ),
            Menu(title: "Insertion Sort", viewClass: "InsertionSortSVC",inputClass: InsertionSortIVC() ),
            Menu(title: "Merge Sort", viewClass: "MergeSortSVC",inputClass: MergeSortIVC() ),
            Menu(title: "Quick Sort", viewClass: "QuickSortSVC",inputClass: QuickSortIVC() ),
            Menu(title: "Heap Sort", viewClass: "HeapSortSVC",inputClass: HeapSortIVC() )

            ])

        let inter = MenuSection(section: "inter", menus:[
            Menu(title: "Rock", viewClass: "ClassVC",inputClass: SelectionSortIVC()),
            Menu(title: "Home", viewClass: "ClassVC",inputClass: SelectionSortIVC())
            ])
        
        let advance = MenuSection(section: "advance", menus:[
            Menu(title: "Rock", viewClass: "ClassVC",inputClass: SelectionSortIVC()),
            Menu(title: "Home", viewClass: "ClassVC",inputClass: SelectionSortIVC())
            ])

        let mainScreen = MainScreen(style: UITableViewStyle.grouped)
        mainScreen.menu = [basic,inter,advance]
        mainScreen.title = "Algorithms"
        mainScreen.about = "KLTD Team"

        let startView = StartVC()
        let nav = UINavigationController(rootViewController: mainScreen)

        window.rootViewController = nav
        rootWindow = window
        main = mainScreen

    }
    class func nextView(){
        rootWindow.rootViewController = UINavigationController(rootViewController: main)


    }
}
