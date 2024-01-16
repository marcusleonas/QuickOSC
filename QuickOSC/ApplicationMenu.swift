//
//  ApplicationMenu.swift
//  QuickOSC
//
//  Created by Marcus Harvey on 16/01/2024.
//

import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        let mainView = MainView()
        let topView = NSHostingController(rootView: mainView)
        topView.view.frame.size = CGSize(width: 400, height: 90)
        
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())
            
        let aboutMenuItem = NSMenuItem(title: "About QuickOSC", action: #selector(about), keyEquivalent: ",")
        aboutMenuItem.target = self
        menu.addItem(aboutMenuItem)
        
        let githubMenuItem = NSMenuItem(title: "Github", action: #selector(openLink), keyEquivalent: "")
        githubMenuItem.target = self
        githubMenuItem.representedObject = "https://github.com/flvffywvffy/QuickOSC"
        menu.addItem(githubMenuItem)
        
        let websiteMenuItem = NSMenuItem(title: "Website", action: #selector(openLink), keyEquivalent: "")
        websiteMenuItem.target = self
        websiteMenuItem.representedObject = "https://marcusleonasharvey.co.uk"
        menu.addItem(websiteMenuItem)
        
        menu.addItem(NSMenuItem.separator())
        
        let quitMenuItem = NSMenuItem(title: "Quit QuickOSC", action: #selector(quit), keyEquivalent: "q")
        quitMenuItem.target = self
        menu.addItem(quitMenuItem)
        
        return menu
    }
    
    @objc func about(sender: NSMenuItem) {
        NSApp.orderFrontStandardAboutPanel()
    }
    
    @objc func openLink(sender: NSMenuItem) {
        let link = sender.representedObject as! String
        guard let url = URL(string: link) else { return }
        NSWorkspace.shared.open(url)
    }
    
    @objc func quit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}
