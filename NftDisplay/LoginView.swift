//
//  LoginView.swift
//  NftDisplay
//
//  Created by Fernando Salazar on 11/12/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var nativeAlert = false
    @State var isLoading = false
    @State var secretPhrase = ""
    @State var privateKey = ""
    @State var walletAddress = ""
    
    let walletApi = WalletApi()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    
                    if walletAddress.isEmpty {
                        Text("Import Wallet with")
                        
                        Button("Secret Phrase", action: {
                            importWithMnemonicsPhraseView()
                        })
                        
                        Text("or")

                        Button("Private Key", action: {
                            importWithPrivateKeyView()
                        })
                    }
                    
                    if !walletAddress.isEmpty {
                        Text("Address \(walletAddress)")
                            .padding()
                            .lineLimit(1)

                        NavigationLink(destination: NftListView(walletAddress: walletAddress)) {
                            Text("My NFT Collection")
                        }
                    }
                }
                
                if isLoading {
                    LoadingView()
                }
        
            }
            .navigationTitle("My Wallet")
        }
    }
    
    func importWithMnemonicsPhraseView() {
        let alert = UIAlertController(title: "Import Wallet", message: "Import wallet with Secret Phrase.", preferredStyle: .alert)
        
        alert.addTextField { secret in
            secret.placeholder = "Enter Secret Phrase"
        }
        
        let importWallet = UIAlertAction(title: "Import", style: .default) { (_) in
            isLoading = true
            secretPhrase = alert.textFields![0].text!
            walletApi.getWalletDataWithSecretPhrase(secretPhrase: secretPhrase) { address in
                isLoading = false
                print(address)
                walletAddress = address
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            // Cancel
        }
        
        alert.addAction(importWallet)
        alert.addAction(cancel)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
//             Do more stuff
        })
    }
    
    func importWithPrivateKeyView() {
        let alert = UIAlertController(title: "Import Wallet", message: "Import wallet with Private Key.", preferredStyle: .alert)
        
        alert.addTextField { key in
            key.isSecureTextEntry = true
            key.placeholder = "Enter Private Key"
        }
        
        let importWallet = UIAlertAction(title: "Import", style: .default) { (_) in
            isLoading = true
            privateKey = alert.textFields![0].text!
            walletApi.getWalletDataWithPrivateKey(privateKey: privateKey) { address in
                isLoading = false
                print(address)
                walletAddress = address
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            // Cancel
        }
        
        alert.addAction(importWallet)
        alert.addAction(cancel)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
//             Do more stuff
        })
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.7)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
