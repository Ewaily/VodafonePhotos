//
//  PhotosListViewModelTests.swift
//  VodafonePhotosTests
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import XCTest
@testable import VodafonePhotos

class PhotosListViewModelTests: XCTestCase {

    private let viewModel = PhotosListViewModel()

    func test_fetchPhotosList() {
        // given
        let expectation = expectation(description: "Photos List fetched")
        //when
        viewModel.fetchPhotos {
            expectation.fulfill()
        }
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(viewModel.countPhotos() != 0)
    }
    
    func test_fetchMorePhotosList() {
        // given
        let expectation = expectation(description: "Photos List fetched")
        //when
        viewModel.fetchMorePhotos {
            expectation.fulfill()
        }
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(viewModel.countPhotos() != 0)
    }
}
