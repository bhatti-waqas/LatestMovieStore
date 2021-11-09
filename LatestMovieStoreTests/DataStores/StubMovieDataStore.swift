//
//  StubMovieDataStore.swift
//  CareemAssignmentTests
//
//  Created by Waqas Naseem on 06/10/2019.
//  Copyright © 2019 Waqas Naseem. All rights reserved.
//

import XCTest
@testable import LatestMovieStore

class ErrorbMovieDataStore: MoviesDataStore {
    
    func searchMovies(with query: String, page: String, request: SearchAPIRequestModel, onCompletion: @escaping ResultHandler<SearchAPIResponseModel>) {
        let fetchRecipesResult: Result<SearchAPIResponseModel, Error> = .failure(MoviesUseCaseError.moviesNotFound)
        onCompletion(fetchRecipesResult)
    }
}
