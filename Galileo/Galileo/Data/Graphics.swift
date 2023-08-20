//
//  SwiftUIView.swift
//  
//
//  Created by Juan Liut on 16/04/23.
//

import SwiftUI


///Colors
///- background
let backColor = Color(red: 0.16, green: 0.16, blue: 0.42)

let darkBackColor = Color(red: 0.09, green: 0.09, blue: 0.22)

let darkness = Color( red: 0.03, green: 0.04  , blue: 0.09)

///- tiles
let tintTile = Color(red: 0.29, green: 0.29, blue: 0.74)

///- buttons
let btnColor = Color(red: 0.27, green: 0.27, blue: 0.52)

///Shapes
///cells
let square = Rectangle()

///Struct to justify text in TextView
struct TextView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.textAlignment = .justified
        textView.backgroundColor = UIColor(Color(white: 1, opacity: 0))
        textView.textColor = .white
        textView.isEditable = false
        textView.isSelectable = false
        
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

///Struct to justify text in Label
struct LabelAlignment: UIViewRepresentable {
var text: String
var textAlignmentStyle : TextAlignmentStyle
var width: CGFloat

func makeUIView(context: Context) -> UILabel {
    let label = UILabel()
    label.textAlignment = NSTextAlignment(rawValue: textAlignmentStyle.rawValue)!
    label.numberOfLines = 0
    label.preferredMaxLayoutWidth = width
    label.setContentHuggingPriority(.required, for: .horizontal)
    label.setContentHuggingPriority(.required, for: .vertical)


    return label
}

func updateUIView(_ uiView: UILabel, context: Context) {
    uiView.text = text
}
}

enum TextAlignmentStyle : Int{
 case left = 0 ,center = 1 , right = 2 ,justified = 3 ,natural = 4
}

