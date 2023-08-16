////
////  InputLineView.swift
////  NoconPassword
////
////  Created by 金子広樹 on 2023/08/15.
////
//
//import SwiftUI
//
//struct InputLineView: View {
//    let setting = Setting()
//
//    var focus: FocusState<FocusField?>.Binding
//    let focusField: FocusField?
////    @Binding var focusField: FocusField?
//    let title: String
//    @Binding var text: String
//
//    var body: some View {
//        Text(title)
//        TextField(title, text: $text)
////            .focused(focus.projectedValue, equals: FocusField(rawValue: 0))
//            .onSubmit {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                    focus.wrappedValue = FocusField(rawValue: (focus.wrappedValue?.rawValue ?? 1) + 1)
//                }
//            }
//        Rectangle()
//            .frame(height: 1)
//            .foregroundColor(setting.black)
//    }
//}
//
////struct InputLineView_Previews: PreviewProvider {
////    static var previews: some View {
////        InputLineView(focusField: FocusField.title, title: "タイトル", text: .constant("タイトル"))
////    }
////}
