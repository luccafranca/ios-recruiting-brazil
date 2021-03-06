//
//  PopularMoviesViewModelSpec.swift
//  MovsTests
//
//  Created by Lucca França Gomes Ferreira on 19/12/19.
//  Copyright © 2019 LuccaFranca. All rights reserved.
//

import Quick
import Nimble
import Combine
@testable import Movs

class PopularMoviesViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("PopularMoviesViewModel") {
            var popularMoviesViewModel: PopularMoviesViewModel!
            context("get a cell") {
                var movieDTO: MovieDTO!
                var movie: Movie!
                beforeEach {
                    movieDTO = MovieDTO(id: 1,
                                        overview: "overview",
                                        releaseDate: "2019-12-18",
                                        genreIds: [1, 2],
                                        title: "title",
                                        posterPath: "posterPath")
                    movie = Movie(withMovie: movieDTO)
                    popularMoviesViewModel = PopularMoviesViewModel(withPopularMovies: [movie])
                }
                context("viewModel") {
                    var viewModel: PopularMoviesCellViewModel!
                    beforeEach {
                        viewModel = popularMoviesViewModel.viewModelForCell(at: IndexPath(item: 0, section: 0))
                    }
                    it("Instanciate and return the correct PopularMoviesCellViewModel") {
                        expect(viewModel.title).to(equal(movie.title))
                    }
                }
                context("viewModelDetails") {
                    var viewModelDetails: MovieDetailsViewModel!
                    beforeEach {
                        viewModelDetails = popularMoviesViewModel.viewModelDetailsForCell(at: IndexPath(item: 0, section: 0))
                    }
                    it("Instanciate and return the correct MovieDetailsViewModel") {
                        expect(viewModelDetails.title).to(equal(movie.title))
                        expect(viewModelDetails.overview).to(equal(movie.overview))
                        expect(viewModelDetails.releaseYear).to(equal("2019"))
                    }
                }
            }
        }
    }
}
