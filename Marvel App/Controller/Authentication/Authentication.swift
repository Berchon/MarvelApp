//
//  Authentication.swift
//  Marvel App
//
//  Created by Luciano Berchon on 15/01/22.
//

import SwiftHash

class Authentication {
    static func getCredentials() -> [URLQueryItem] {
        let ts = String(Date().timeIntervalSince1970)
        let privateKey = Constants.APIParameters.privateKey
        let publicKey = Constants.APIParameters.publicKey
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return [
            URLQueryItem(name: "ts", value: ts),
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "hash", value: hash)
        ]
//        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
