//
//  Wallet.swift
//  NftDisplay
//
//  Created by Fernando Salazar on 11/12/21.
//

import SwiftUI
import web3swift

struct Wallet {
    let address: String
    let data: Data
    let name: String
    let isHD: Bool
}

class WalletApi {
    func getWalletDataWithSecretPhrase(secretPhrase: String, completion: @escaping (String) -> Void) {

        let loadingQueue = DispatchQueue(label: "loading-queue")
        
        loadingQueue.async {
            let password = "web3swift"
            let mnemonics = secretPhrase
            let keystore = try! BIP32Keystore(
                mnemonics: mnemonics,
                password: password,
                mnemonicsPassword: "",
                language: .english)!
            let address = keystore.addresses!.first!.address
            
            DispatchQueue.main.async {
                completion(address)
            }
        }
    }
    
    func getWalletDataWithPrivateKey(privateKey: String, completion: @escaping (String) -> Void) {

        let loadingQueue = DispatchQueue(label: "loading-queue")
        
        loadingQueue.async {
            let password = "web3swift"
            let key = privateKey
            let formattedKey = key.trimmingCharacters(in: .whitespacesAndNewlines)
            let dataKey = Data.fromHex(formattedKey)!
            let keystore = try! EthereumKeystoreV3(privateKey: dataKey, password: password)!
            let address = keystore.addresses!.first!.address
            
            DispatchQueue.main.async {
                completion(address)
            }
        }
    }
}
