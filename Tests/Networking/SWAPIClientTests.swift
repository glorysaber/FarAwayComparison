//
//  SWAPIClientTests.swift
//  FarAwayComparisonTests
//
//  Created by Stephen Kac on 2/16/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import XCTest
@testable import FarAwayComparison

class SWAPIClientTests: XCTestCase {
  
	var api = SWAPI.Client()
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  fileprivate func checkAllCasesPresentFor<ResourceType: SWAPIResource>(_ resourceType: ResourceType.Type, _ requestExpect: XCTestExpectation, id: Int = 1) {
    api.requestResource(with: id, resource: resourceType) { response in
      switch response {
      case .failure(let error):
        XCTAssert(false, error.localizedDescription)
      case .success(_):
        // Success!
				break
      }
      
      requestExpect.fulfill()
    }
  }
  
  /// Tests getting the People data and converting it to our SWAPI data type and that all expected SWAPI values are present on first object in remote endpoint
  func testSWAPIPeopleID1() {
    
    let requestExpect = XCTestExpectation(description: "PeopleID1")
    
    let resourceType = SWAPI.Person.self
    
    checkAllCasesPresentFor(resourceType, requestExpect)
    
    wait(for: [requestExpect], timeout: 30)
  }
  
  /// Tests getting the Planets data and converting it to our SWAPI data type and that all expected SWAPI values are present on first object in remote endpoint
  func testSWAPIPlanetsID1() {
    
    let requestExpect = XCTestExpectation(description: "PlanetsID1")
    
    let resourceType = SWAPI.Planet.self
    
    checkAllCasesPresentFor(resourceType, requestExpect)
    
    wait(for: [requestExpect], timeout: 30)
  }
  
  /// Tests getting the Vehicle data and converting it to our SWAPI data type and that all expected SWAPI values are present on first object in remote endpoint
  func testSWAPIVehiclesID4() {
    
    let requestExpect = XCTestExpectation(description: "VehiclesID4")
    
		let resourceType = SWAPI.Vehicle.self
    
    checkAllCasesPresentFor(resourceType, requestExpect, id: 4)
    
    wait(for: [requestExpect], timeout: 30)
  }
  
  /// Tests getting the Films data and converting it to our SWAPI data type and that all expected SWAPI values are present on first object in remote endpoint
  func testSWAPIFilmsID1() {
    
    let requestExpect = XCTestExpectation(description: "FilmsID1")
    
    let resourceType = SWAPI.Film.self
    
    checkAllCasesPresentFor(resourceType, requestExpect)
    
    wait(for: [requestExpect], timeout: 30)
  }
  
  /// Tests getting the Vehicle data and converting it to our SWAPI data type and that all expected SWAPI values are present on first object in remote endpoint
  func testSWAPISpeciesID1() {
    
    let requestExpect = XCTestExpectation(description: "SpeciesID1")
    
    let resourceType = SWAPI.Species.self
    
    checkAllCasesPresentFor(resourceType, requestExpect)
    
    wait(for: [requestExpect], timeout: 30)
  }
  
  /// Tests getting the Starships data and converting it to our SWAPI data type and that all expected SWAPI values are present on first object in remote endpoint
  func testSWAPIStarshipID2() {
    
    let requestExpect = XCTestExpectation(description: "StarshipID2")
    
    let resourceType = SWAPI.Starship.self
    
    checkAllCasesPresentFor(resourceType, requestExpect, id: 2)
    
    wait(for: [requestExpect], timeout: 30)
  }

	func test_SWAPI_ALL_People() {
		let requestExpect = XCTestExpectation(description: "StarshipID2")

		let resourceType = SWAPI.Starship.self

		api.requestAll(of: resourceType) { (response) in
			switch response {
			case .failure(let error):
				XCTAssert(false, error.localizedDescription)
			case .success(_):
				// Success!
				break
			}

			requestExpect.fulfill()
		}

		wait(for: [requestExpect], timeout: 30)
	}
  
  func testSWAPISearchSpecific() {

    let requestExpect = XCTestExpectation(description: "SWAPISearchSpecific")

    let nameToSearchFor = "Luke Skywalker"

		api.searchFor(resource: SWAPI.Person.self, matching: nameToSearchFor) { response in
      switch response {
      case .failure(let error):
        XCTAssert(false, error.localizedDescription)
      case .success(let data):
        var foundName = false
        // We should have all keys present. .weather need to be checked seperately
        for record in data.results {
					foundName = record.name == .some(nameToSearchFor) || foundName
        }

        assert(foundName)
      }

      requestExpect.fulfill()
    }

    wait(for: [requestExpect], timeout: 30)

  }
  
  func testSWAPISearchUnSpecific() {

    let requestExpect = XCTestExpectation(description: "SWAPISearchUnSpecific")

    let nameToSearchFor = "L"

    // Create a repsonse we expect to have more than one page of results
    api.searchFor(resource: SWAPI.Person.self, matching: nameToSearchFor) { response in
      switch response {
      case .failure(let error):
        XCTAssert(false, error.localizedDescription)
      case .success(let firstPageData):
				guard let nameToCompare = firstPageData.results.first?.name else {
          requestExpect.fulfill()
          XCTAssert(false, "There was no results")
          return
        }
        if (firstPageData.next != nil) {
          // If We have a next page we want to check the next page of results
					self.api.getNextPage(from: firstPageData) { response in
            switch response {
            case .failure(let error):
              XCTAssert(false, error.localizedDescription)
            case .success(let secondPageData):
              // Success lets go back to first page
              self.api.getPrevPage(from: secondPageData) { response in
                switch response {
                case .failure(let error):
                  XCTAssert(false, error.localizedDescription)
                case .success(let returnToFirstPageData):
                  // Lets make sure the name that we grabbed in page 1 still exists
									guard returnToFirstPageData.results.contains(where: {$0.name == nameToCompare}) else {
                    XCTAssert(false, "There was no results when returning to page 1")
                    requestExpect.fulfill()
                    return
                  }
                  break
                }

                requestExpect.fulfill()
              }
              break
            }
          }
        } else {
          XCTAssert(false, "Expected multiple responses, please change search parameters")
          requestExpect.fulfill()
        }
      }

    }

    wait(for: [requestExpect], timeout: 30)

  }
  
  
  
}
