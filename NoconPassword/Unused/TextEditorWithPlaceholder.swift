////
////  TextEditorWithPlaceholder.swift
////  NoconPassword
////
////  Created by 金子広樹 on 2023/08/13.
////
//
//import SwiftUI
//
//struct TextEditorWithPlaceholder: View {
//
//    @FocusState private var focus: FocusField?
//
//    @Binding var text: String
//    private let view: EditViews
//    private let placeholderText: String
//
//    init(_ placeholder: String, text: Binding<String>, view: EditViews) {
//        self._text = text
//        self.view = view
//        self.placeholderText = placeholder
//    }
//
//    var body: some View {
//        ZStack {
//            // テキストが空の時にプレースホルダーを表示する
//            if text.isEmpty {
//                ZStack {
//                    Rectangle()
//                        .fill(Color(uiColor: .systemBackground))
//                    VStack {
//                        HStack {
//                            TextField(placeholderText, text: $text)
//                                .focused($focus, equals: .memo)
//                            Spacer()
//                        }
//                        .padding(.leading, 6)
//                        .padding(.top, 8)
//
//                        Spacer()
//                    }
//                }
//
//                // テキストが空ではない時にTextEditorを表示する
//            } else {
//                TextEditor(text: $text)
//                    .focused($focus, equals: .memo)
//                    .onAppear {
//                        if text.isEmpty {
//                            focus = .memo
//                        }
////                         新規作成の場合のみ実行
////                        if view == .newPasswordView {
////                        }
//                    }
//            }
//        }
//    }
//}
//
//struct TextEditorWithPlaceholder_Previews: PreviewProvider {
//    static var previews: some View {
//        TextEditorWithPlaceholder("", text: .constant("text"), view: .newPasswordView)
//    }
//}
