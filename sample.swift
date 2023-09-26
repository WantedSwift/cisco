//
//  HomeViewCont.swift
//  VTEAM VPN
//
//  Created by wanted on 9/9/23.
//


    
    func CiscoConnection(){
        let tunnelProtocol = NETunnelProviderProtocol()
        tunnelProtocol.providerBundleIdentifier = "x_bundel"
        
        
        let json2 = ServerManager.config!
        let username = "username"
        let password = "password"
        let url_connect = "url"
        
        
        
        
        
        tunnelProtocol.providerConfiguration = ["server": url_connect,"username":username,"password":password]
        tunnelProtocol.serverAddress = "127.0.0.0"//"wanted"
        self.providerManager.protocolConfiguration = tunnelProtocol
        self.providerManager.localizedDescription = "wanted"
        self.providerManager.isEnabled = true
        self.providerManager.saveToPreferences(completionHandler: { (error) in
            if let error = error  {
                // Handle an occurred error
             //   self.setttt(Bool: false, name: "OpenVPN Client")
                print("eerror")
            }else{
               // self.setttt(Bool: true, name: "OpenVPN Client")
                print("sucki")
                self.start_vpn_new()
            }
        
        })
    }
    
func start_vpn_new(){
    if switch1 == true {
        
        self.providerManager.loadFromPreferences(completionHandler: { (error) in
            if error == nil  {
                // Handle an occurred error
                do {
                    try self.providerManager.connection.startVPNTunnel()
                    self.switch1 = false
                } catch {
                    
                    // Handle an occurred error
                }
            }
            
            
        })
    }else{
        
        self.providerManager.loadFromPreferences(completionHandler: { (error) in
            if error == nil  {
                do {
                    try self.providerManager.connection.stopVPNTunnel()
                    self.switch1 = true
                } catch {
                    
                    // Handle an occurred error
                }
            }
            
            
        })
    }
}
    
   
