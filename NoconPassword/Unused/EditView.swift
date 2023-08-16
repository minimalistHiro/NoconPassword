////
////  EditVieww.swift
////  NoconPassword
////
////  Created by 金子広樹 on 2023/08/14.
////
//
//import SwiftUI
//
//struct EditView: View {
//    @Environment(\.managedObjectContext) var viewContext
//    @Environment(\.dismiss) var dismiss
//    let data: FetchedResults<Entity>.Element?
//
//    let setting = Setting()
//    @FocusState private var focus: FocusField?
//    @State private var title = ""               // タイトル
//    @State private var userName = ""            // ユーザーネーム
//    @State private var password = ""            // パスワード
//    @State private var url = ""                 // URL
//    @State private var memo = ""                // メモ
//
//    var body: some View {
//        List {
//            // タイトル
//            Group {
//                Text("タイトル")
//                TextField("タイトル", text: $title)
//                    .focused($focus, equals: .title)
//                Rectangle()
//                    .frame(height: 1)
//                    .foregroundColor(setting.black)
//            }
//            .listRowSeparator(.hidden)
//
//            // ユーザーネーム
//            Group {
//                Text("ユーザーネーム")
//                TextField("ユーザーネーム", text: $userName)
//                    .focused($focus, equals: .userName)
//                Rectangle()
//                    .frame(height: 1)
//                    .foregroundColor(setting.black)
//            }
//            .listRowSeparator(.hidden)
//
//            // パスワード
//            Group {
//                Text("パスワード")
//                SecureField("パスワード", text: $password)
//                    .focused($focus, equals: .password)
//                Rectangle()
//                    .frame(height: 1)
//                    .foregroundColor(setting.black)
//            }
//            .listRowSeparator(.hidden)
//
//            // URL
//            Group {
//                Text("URL")
//                TextField("URL", text: $url)
//                    .focused($focus, equals: .url)
//                    .keyboardType(.URL)
//                Rectangle()
//                    .frame(height: 1)
//                    .foregroundColor(setting.black)
//            }
//            .listRowSeparator(.hidden)
//
//            Group {
//                Text("メモ")
//                TextEditor(text: $memo)
//                    .focused($focus, equals: .memo)
//                    .frame(height: 200)
//                    .border(.gray, width: 1)
//            }
//            .listRowSeparator(.hidden)
//        }
//        .listStyle(.inset)
//        .environment(\.defaultMinListRowHeight, 40)
//        .padding()
//        .overlay {
//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    if focus == nil {
//                        Button {
//                            update()
//                            dismiss()
//                        } label: {
//                            Image(systemName: "circle.fill")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 50)
//                                .foregroundColor(setting.black)
//                                .overlay {
//                                    Image(systemName: "checkmark")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 20)
//                                        .bold()
//                                        .foregroundColor(setting.white)
//                                }
//                        }
//                        .padding()
//                    }
//                }
//            }
//        }
//        .toolbar {
//            ToolbarItem(placement: .keyboard) {
//                HStack {
//                    // 何故か空白のボタンを入れないとチェックマークが表示されなくなるので仕方なく入れている。
//                    Button { } label: { }
//                    Spacer()
//                    Button {
//                        focus = nil
//                    } label: {
//                        Image(systemName: "checkmark")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 25)
//                            .foregroundColor(setting.black)
//                    }
//                }
//            }
//        }
//        .onAppear {
//            title = data?.title ?? ""
//            userName = data?.username ?? ""
//            password = data?.password ?? ""
//            url = data?.url ?? ""
//            memo = data?.memo ?? ""
//        }
//    }
//
//    /// データを更新する。
//    /// - Parameters: なし
//    /// - Returns: なし
//    private func update() {
//        data?.title = title
//        data?.username = userName
//        data?.password = password
//        data?.url = url
//        data?.memo = memo
//        do {
//            try viewContext.save()
//        } catch {
//            fatalError("セーブに失敗")
//        }
//    }
//}
//
////struct EditVieww_Previews: PreviewProvider {
////    static var previews: some View {
////        EditView(data: <#FetchedResults<Entity>.Element#>)
////    }
////}
