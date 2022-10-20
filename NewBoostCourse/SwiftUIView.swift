//
//  SwiftUIView.swift
//  NewBoostCourse
//
//  Created by kimtaeuk on 2022/06/20.
//

import SwiftUI

struct SwiftUiView: View {
    
    @ObservedObject var movieDataViewmodel = MovieDataViewModel()
    @State private var selection = 0
    
    var body: some View {
        if(movieDataViewmodel.movieData.indices.count > 0) {
            TabView(selection: $selection) {
                    ForEach(movieDataViewmodel.movieData.indices, id: \.self){ index in
                        OnboardView(imageurl:movieDataViewmodel.movieData[index].thumb,
                                    title: movieDataViewmodel.movieData[index].title, rate: String(movieDataViewmodel.movieData[index].reservationRate)).tag(index)
                    }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

struct OnboardView: View {
    let imageurl: String
    let title: String
    let rate: String
    
    var body: some View {
        VStack(spacing: 20) {
            //이미지 표시
            AsyncImage(url: URL(string: imageurl))
            Text(title).font(.title).bold()
            
            Text(rate).multilineTextAlignment(.center).foregroundColor(.secondary)
        }.padding(.horizontal, 40)
    }
}

