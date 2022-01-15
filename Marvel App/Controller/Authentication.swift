//
//  Authentication.swift
//  Marvel App
//
//  Created by Luciano Berchon on 15/01/22.
//

import SwiftHash

class Authentication {
    static func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let privateKey = Constants.APIParameters.privateKey
        let publicKey = Constants.APIParameters.publicKey
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
