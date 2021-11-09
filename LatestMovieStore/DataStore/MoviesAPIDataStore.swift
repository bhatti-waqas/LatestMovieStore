//
//  MoviesAPIDataStore.swift
//  CareemAssignment
//
//  Created by Waqas Naseem on 06/10/2019.
//  Copyright © 2019 Waqas Naseem. All rights reserved.
//

import UIKit
import Alamofire

public typealias ResultHandler<T> = (Result<T, Error>) -> Void

private enum SearchBodyParameters: String {
    case query, page,
         apiKey = "api_key"
}

enum MoviesUseCaseError: LocalizedError {
    case moviesNotFound
    case other(Error)
    
    var errorDescription: String? {
        switch self {
        case .moviesNotFound:
            return "Movies are not found. please try again later"
        case .other(let error):
            return error.localizedDescription
        }
    }
}

class MoviesAPIDataStore: MoviesDataStore {
    
    let baseUrl: String = APIURLs.baseURL
    
    func searchMovies(with query: String, page: String, request: SearchAPIRequestModel, onCompletion: @escaping ResultHandler<SearchAPIResponseModel>) {
        let url = baseUrl.concat(urlPath: "search/movie")
        
        let dataRequest = CustomDataRequest(url: url)
        dataRequest.addQueryParameter(key: SearchBodyParameters.query, value: query)
        dataRequest.addQueryParameter(key: SearchBodyParameters.page, value: page)
        dataRequest.addQueryParameter(key: SearchBodyParameters.apiKey, value: APPKeys.APIKeys.themoviedb)
        
        AF.request(dataRequest)
            .validate()
            .responseDecodable { (response: DataResponse<SearchAPIResponseModel, AFError>)  in
                switch response.result {
                case .failure(let error):
                    onCompletion(.failure(MoviesUseCaseError.other(error)))
                case .success(let moviesResponse) where moviesResponse.movies.isEmpty:
                    onCompletion(.failure(MoviesUseCaseError.moviesNotFound))
                case .success(let moviesResponse):
                    onCompletion(.success(moviesResponse))
                }
            }
    }
}
