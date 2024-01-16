//
//  ContentView.swift
//  QuickOSC
//
//  Created by Marcus Harvey on 15/01/2024.
//

import SwiftUI
import OSCKit

let oscClient = OSCClient()

func sendOscMessage(ip: String, port: String, msg: String) {
    let oscMsg = OSCMessage(msg)
    guard let newPort = UInt16(port) else { return }
    
    do {
        try oscClient.send(oscMsg, to: ip, port: newPort)
    } catch {
        print(error)
    }

}

struct MainView: View {
    @State private var message: String = ""
    @State private var ipaddress: String = ""
    @State private var port: String = ""
    
    var body: some View {
        VStack {
            
            HStack {
                TextField("IP Address", text: $ipaddress)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Port", text: $port)
                    .frame(width: 100)
                    .textFieldStyle(.roundedBorder)
                
                Button("Send") {
                    sendOscMessage(ip: ipaddress, port: port, msg: message)
                }
            }
            TextField("Message", text: $message, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            
        }
        .padding()
    }
}

#Preview {
    MainView()
        .frame(height: 100)
}
