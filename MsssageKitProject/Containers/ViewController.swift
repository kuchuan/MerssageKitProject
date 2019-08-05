//
//  ViewController.swift
//  MsssageKitProject
//
//  Created by 堀川浩二 on 2019/08/05.
//  Copyright © 2019 堀川浩二. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView

//ViewControllerからMessages。ViewControllerに変更することによって、チャット画面を作成するために使える便利な機能を使用できるようになる
class ViewController: MessagesViewController  {
    
    //全メッセージを保持する配列
    var messageList: [Message] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }


}

extension ViewController: MessagesDataSource {
    //自分の情報を設定する（今日はログイン機能は作らないので固定で）
    func currentSender() -> SenderType {
        let id = "1234"
        let name = "seedkun"
        return ChatUser(senderId: id, displayName: name)
    }
    
    //ほ表示するメッセージの情報
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messageList[indexPath.section] //メッセージを1件ずつ返してくれる
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageList.count
    }
    
    
}

//送信ボタンの処理
extension ViewController: InputBarAccessoryViewDelegate {
    
    //送信ボタンがクリックされた時の処理
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
        //送信者の作成（自分の情報を取得）
        let me = self.currentSender() as! ChatUser
        
        //メッセージの作成
        let message = Message(user: me, text: text, messageId: UUID().uuidString, sentDate: Date())
        
        messageList.append(message)
        
        // 作成したメッセージを画面に追加
        messagesCollectionView.insertSections([messageList.count - 1])
    }
}

extension ViewController: MessagesDisplayDelegate {
    
}

extension ViewController: MessagesLayoutDelegate {
    
}
