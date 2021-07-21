//
//  PhotoDetailsViewModelTests.swift
//  VodafonePhotosTests
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import XCTest
@testable import VodafonePhotos

class PhotoDetailsViewModelTests: XCTestCase {

    private let viewModel = PhotoDetailsViewModel(photoDetailsViewInfo: PhotoDetailsViewInfo(authorName: Strings.AUTHOR_NAME_TEST, photoImageURL: .init(string: Strings.PHOTO_IMAGE_URL_TEST)))
    
    func test_getAuthorName() {
        // given
        let expectation = expectation(description: "Author name fetched")
        //when
        let fetchedAuthorName = viewModel.getAuthorName()
        if !fetchedAuthorName.isEmpty {
            expectation.fulfill()
        }
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(fetchedAuthorName == Strings.AUTHOR_NAME_TEST)
    }
    
    func test_getPhotoDownloadURL() {
        // given
        let expectation = expectation(description: "Photo image URL fetched")
        //when
        let fetchedPhotoImageURL = viewModel.getPhotoDownloadURL()
        if fetchedPhotoImageURL != nil {
            expectation.fulfill()
        }
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(fetchedPhotoImageURL == .init(string: Strings.PHOTO_IMAGE_URL_TEST))
    }
}
