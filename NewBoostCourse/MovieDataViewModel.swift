//
//  MovieDataViewModel.swift
//  NewBoostCourse
//
//  Created by kimtaeuk on 2022/06/20.
//

import Foundation
import Combine
import Alamofire

class MovieDataViewModel: ObservableObject {
    var subscription = Set<AnyCancellable>()
    
    @Published var movieData = [Movie]()
    
    var baseUrl = "https://connect-boxoffice.run.goorm.io/movies?order_type=0"
    
    init() {
        fetchMovieData()
    }
    
    func fetchMovieData() {
        AF.request(baseUrl)
            .publishDecodable(type: MovieData.self)
            .compactMap { $0.value }
            .map{ $0.movies }
            .sink(receiveCompletion: { completion in
                print("Complete")
            }, receiveValue: { (receivedValue : [Movie]) in
                //print("받은 값 : \(receivedValue)")
                self.movieData = receivedValue
                //print(receivedValue)
            }).store(in: &subscription)
    }
}
