//
//  ChatUser.swift
//  MsssageKitProject
//
//  Created by 堀川浩二 on 2019/08/05.
//  Copyright © 2019 堀川浩二. All rights reserved.
//

import MessageKit

class ChatUser: SenderType {
    
    //ユーザーID
    var senderId: String
    
    //表示名
    var displayName: String
    
    //コンストラクタ（クラスをインスタンス化するときに呼び出されるもの
    //ChatUserを作るときは、必ずユーザーIDと表示名を設定するにようにする
    init(senderId: String, displayName: String) {
        self.senderId = senderId
        self.displayName = displayName
    }
    
}
