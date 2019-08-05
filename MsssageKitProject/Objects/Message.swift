//
//  Message.swift
//  MsssageKitProject
//
//  Created by 堀川浩二 on 2019/08/05.
//  Copyright © 2019 堀川浩二. All rights reserved.
//

import MessageKit

//一件のメッセージのデータを持つクラス
class Message: MessageType {

    //送信者
    let user: ChatUser
    
    //Messageの本文
    let text: String
    
    //メッセージID（一件のMessageを特定するため）
    let messageId: String
    
    //送信日付
    let sentDate: Date
    
    //コンストラクタ
    init(user: ChatUser, text: String, messageId: String, sentDate: Date) {
        self.user = user
        self.text = text
        self.messageId = messageId
        self.sentDate = sentDate
    }
    
    var sender: SenderType {
        return Sender(id: user.senderId, displayName: user.displayName)
    }
    
    var kind: MessageKind{
        return .text(text)
    }
    
    
    
}

