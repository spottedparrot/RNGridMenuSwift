//
//  RNViewController.swift
//  RNGridMenu
//
//  Created by Medrano, Tony (NYC-MRM) on 1/12/16.
//  Copyright © 2016 MRM//MCCANN All rights reserved.
//

import Foundation


class RNViewController: UIViewController, RNGridMenuDelegate {

    
    @IBOutlet weak var imageView: UIImageView!


    override func viewDidLoad() {
        
        super.viewDidLoad()
        let longPress: RNLongPressGestureRecognizer = RNLongPressGestureRecognizer(target: self, action: "handleLongPress:")
        self.view!.addGestureRecognizer(longPress)
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }

@IBAction func onShowButton(sender: AnyObject) {
    self.showGrid()
}

func handleLongPress(longPress: UILongPressGestureRecognizer) {
    if longPress.state == .Began {
        self.showGridWithHeaderFromPoint(longPress.locationInView(self.view!))
    }
}

func gridMenu(gridMenu: RNGridMenu, willDismissWithSelectedItem item: RNGridMenuItem, atIndex itemIndex: Int) {
    NSLog("Dismissed with item %d: %@", itemIndex, item.title)
}

func showImagesOnly() {
    let numberOfOptions: Int = 5
    var images: [AnyObject] = [UIImage(named: "arrow")!, UIImage(named: "attachment")!, UIImage(named: "block")!, UIImage(named: "bluetooth")!, UIImage(named: "cube")!, UIImage(named: "download")!, UIImage(named: "enter")!, UIImage(named: "file")!, UIImage(named: "github")!]
    let av: RNGridMenu = RNGridMenu(images: Array(images[0 ..< numberOfOptions]))
    av.delegate = self
    av.showInViewController(self, center: CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0))
}

func showList() {
    let numberOfOptions: Int = 5
    var options: [AnyObject] = ["Next", "Attach", "Cancel", "Bluetooth", "Deliver", "Download", "Enter", "Source Code", "Github"]
    let av: RNGridMenu = RNGridMenu(titles: Array(options[0 ..< numberOfOptions]))
    av.delegate = self
    av.itemFont = UIFont.boldSystemFontOfSize(18)
    av.itemSize = CGSizeMake(150, 55)
    av.showInViewController(self, center: CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0))
}

func showGrid() {
    let numberOfOptions: Int = 9
    var items: [AnyObject] = [RNGridMenuItem(image: UIImage(named: "arrow"), title: "Next"), RNGridMenuItem(image: UIImage(named: "attachment"), title: "Attach"), RNGridMenuItem(image: UIImage(named: "block"), title: "Cancel"), RNGridMenuItem(image: UIImage(named: "bluetooth"), title: "Bluetooth"), RNGridMenuItem(image: UIImage(named: "cube"), title: "Deliver"), RNGridMenuItem(image: UIImage(named: "download"), title: "Download"), RNGridMenuItem(image: UIImage(named: "enter"), title: "Enter"), RNGridMenuItem(image: UIImage(named: "file"), title: "Source Code"), RNGridMenuItem(image: UIImage(named: "github"), title: "Github")]
    let av: RNGridMenu = RNGridMenu(items: Array(items[0 ..< numberOfOptions]))
    av.delegate = self
    av.showInViewController(self, center: CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0))
}

func showGridWithHeaderFromPoint(point: CGPoint) {
    let numberOfOptions: Int = 9
    var items: [AnyObject] = [RNGridMenuItem.emptyItem(), RNGridMenuItem(image: UIImage(named: "attachment"), title: "Attach"), RNGridMenuItem.emptyItem(), RNGridMenuItem(image: UIImage(named: "bluetooth"), title: "Bluetooth"), RNGridMenuItem(image: UIImage(named: "cube"), title: "Deliver"), RNGridMenuItem(image: UIImage(named: "download"), title: "Download"), RNGridMenuItem.emptyItem(), RNGridMenuItem(image: UIImage(named: "file"), title: "Source Code"), RNGridMenuItem.emptyItem()]
    let av: RNGridMenu = RNGridMenu(items: Array(items[0 ..< numberOfOptions]))
    av.delegate = self
    av.bounces = false
    av.animationDuration = 0.2
    av.blurExclusionPath = UIBezierPath(ovalInRect: self.imageView!.frame)
    av.backgroundPath = UIBezierPath(ovalInRect: CGRectMake(0.0, 0.0, av.itemSize.width * 3, av.itemSize.height * 3))
    let header: UILabel = UILabel(frame: CGRectMake(0, 0, 0, 44))
    header.text = "Example Header"
    header.font = UIFont.boldSystemFontOfSize(18)
    header.backgroundColor = UIColor.clearColor()
    header.textColor = UIColor.whiteColor()
    header.textAlignment = .Center
    av.showInViewController(self, center: point)
}

func showGridWithPath() {
    let numberOfOptions: Int = 9
    var items: [AnyObject] = [RNGridMenuItem(image: UIImage(named: "arrow"), title: "Next"), RNGridMenuItem(image: UIImage(named: "attachment"), title: "Attach"), RNGridMenuItem(image: UIImage(named: "block"), title: "Cancel"), RNGridMenuItem(image: UIImage(named: "bluetooth"), title: "Bluetooth"), RNGridMenuItem(image: UIImage(named: "cube"), title: "Deliver"), RNGridMenuItem(image: UIImage(named: "download"), title: "Download"), RNGridMenuItem(image: UIImage(named: "enter"), title: "Enter"), RNGridMenuItem(image: UIImage(named: "file"), title: "Source Code"), RNGridMenuItem(image: UIImage(named: "github"), title: "Github")]
    let av: RNGridMenu = RNGridMenu(items: Array(items[0 ..< numberOfOptions]))
    av.delegate = self
    av.showInViewController(self, center: CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0))
}
}
