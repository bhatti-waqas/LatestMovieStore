//
//  MovieCellViewModelTest.swift
//  CareemAssignmentTests
//
//  Created by Waqas Naseem on 06/10/2019.
//  Copyright © 2019 Waqas Naseem. All rights reserved.
//

import XCTest
@testable import LatestMovieStore

final class MovieCellViewModelTest: XCTestCase {
    
    func testName_ShouldReturnErrorOnEmptyTitle() {
        let movie = Movie()
        movie.title = ""
        let cellViewModel = MovieCellViewModel(movie: movie)
        XCTAssertEqual(cellViewModel.title, "No Title")
        
    }
    
    func testName_ShouldReturnErrorOnEmptyOverView() {
        let movie = Movie()
        movie.overview = ""
        let cellViewModel = MovieCellViewModel(movie: movie)
        XCTAssertEqual(cellViewModel.overView, "No Overview")
        
    }

}
