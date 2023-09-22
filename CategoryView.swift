//
//  CategoryView.swift
//  CategoryMenuRnD
//
//  Created by Javid Shaikh on 20/09/23.
//

import SwiftUI

struct CategoryView: View {
    var categories: [String]
    @State private var selectedCategory: Int = 0
    var action: (String) -> ()
    
    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    VStack {
                        HStack(spacing: 10) {
                            ForEach(0..<categories.count, id: \.self) { i in
                                CategoryItem(isSelected: i == selectedCategory, title: categories[i])
                                    .onTapGesture {
                                        selectedCategory = i
                                        action(categories[i])
                                    }
                            }
                        }
                    }
                    .frame(width: geometry.size.width)
                }.scrollIndicators(.never)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct CategoryItem: View {
    var isSelected: Bool = false
    var title: String = "All"
    
    var body: some View {
        VStack(spacing: 1) {
            Text(title)
                .font(Font.custom("Tenor Sans", size: 23))
                .kerning(1)
                .multilineTextAlignment(.center)
                .foregroundColor( isSelected ? Color("Yellow") : Color.gray.opacity(0.9))
                .bold(isSelected)
            if isSelected {
                Rectangle()
                    .foregroundColor(Color("Yellow"))
                    .frame(width: 5, height: 5)
                    .rotationEffect(Angle(degrees: 45))
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(categories: categoriesData) { selected in
            print("Selected Category : \(selected)")
        }
    }
}
