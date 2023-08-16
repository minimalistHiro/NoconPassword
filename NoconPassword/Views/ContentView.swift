//
//  ContentView.swift
//  NoconPassword
//
//  Created by 金子広樹 on 2023/08/13.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Entity.title, ascending: true)])
    var data: FetchedResults<Entity>
    
    let setting = Setting()
    
    var body: some View {
        
        let mappedText = data.map { value in
            value.title
        }
        
        NavigationStack {
            List {
                ForEach(data) { data in
                    if let title = data.title {
                        NavigationLink {
                            NewPasswordView(data: data, views: .editView)
                        } label: {
                            Text(title)
                                .font(.system(size: 25))
                                .lineLimit(1)
                        }
                        .listRowSeparator(.hidden)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                rowRemove(data: data)
                            } label: {
                                Image(systemName: "trash")
                            }
                            .tint(.red)
                        }
                    }
                }
            }
            .listStyle(.inset)
            .environment(\.defaultMinListRowHeight, 70)
            .padding()
            .overlay(alignment: .bottomTrailing) {
                // プラスボタン
                if mappedText.count <= setting.maxListCount - 1 {
                    NavigationLink {
                        NewPasswordView(data: nil, views: .newPasswordView)
                    } label: {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                            .foregroundColor(setting.black)
                            .overlay {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .bold()
                                    .foregroundColor(setting.white)
                            }
                    }
                    .padding(30)
                }
            }
        }
    }
    
    /// 行を削除する。
    /// - Parameters:
    ///   - data: 削除するデータ
    /// - Returns: なし
    private func rowRemove(data: FetchedResults<Entity>.Element) {
        viewContext.delete(data)
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
