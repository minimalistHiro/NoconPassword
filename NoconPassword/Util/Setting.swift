//
//  Setting.swift
//  NoconPassword
//
//  Created by 金子広樹 on 2023/08/13.
//

import SwiftUI

final class Setting {
    // 各種設定
    let maxListCount: Int = 2000                            // 最大リスト数
    let maxTitleCount: Int = 20                             // 最大タイトル文字数
    let maxUserNameCount: Int = 50                          // 最大ユーザーネーム文字数
    let maxPasswordCount: Int = 100                         // 最大パスワード文字数
    let maxURLCount: Int = 100                              // 最大URL文字数
    let maxMemoCount: Int = 500                             // 最大メモ文字数
    // 固定色
    let black: Color = Color("Black")                       // 文字・ボタン色
    let white: Color = Color("White")                       // 背景色
    let highlight: Color = Color("Highlight")               // 強調色
}
