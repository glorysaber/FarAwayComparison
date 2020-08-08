//
//  SWAPICache.swift
//  FarAwayComparison
//
//  Created by Stephen Kac on 7/5/20.
//  Copyright © 2020 Stephen Kac. All rights reserved.
//

import Foundation

struct SWAPICache<Resource: SWAPIResource> {
	typealias Page = SWAPI.Page<Resource>
	typealias PageCache = [Page]
	
	private var pages: PageCache = []
	
	func makeIterator() -> Iterator {
		return Iterator(pages: self.pages)
	}
	
	func makeResourceIterator() -> ResourceIterator {
		return ResourceIterator(pageIterator: AnyIterator(makeIterator()))
	}
	
}

extension SWAPICache: RangeReplaceableCollection {
	mutating func append(_ page: Page) {
		pages.append(page)
	}
	
	mutating func append<S: Sequence>(contentsOf pages: S) where S.Element == Page {
		self.pages.append(contentsOf: pages)
	}
}

extension SWAPICache: RandomAccessCollection {
	var startIndex: PageCache.Index {
		pages.startIndex
	}
	
	var endIndex: PageCache.Index {
		pages.endIndex
	}
	
	typealias Element = PageCache.Element
	
	typealias Index = PageCache.Index
	
	typealias SubSequence = PageCache.SubSequence
	
	typealias Indices = PageCache.Indices
	
	func index(after i: Index) -> Index {
		i + 1
	}
	
	func distance(from start: PageCache.Index, to end: PageCache.Index) -> Int {
		abs(start - end)
	}
	
	subscript(position: PageCache.Index) -> PageCache.Element {
		get {
			pages[position]
		}
		mutating set {
			pages[position] = newValue
		}
	}
}

extension SWAPICache: Sequence {
	struct Iterator: IteratorProtocol {
		
		typealias Element = Page
		
		private var swapiIterator: IndexingIterator<PageCache>
		
		init(pages: PageCache) {
			swapiIterator = pages.makeIterator()
		}
		
		mutating func next() -> Page? {
			swapiIterator.next()
		}
	}
	
	var underestimatedCount: Int {
		pages.underestimatedCount
	}
}

extension SWAPICache {
	struct ResourceIterator: IteratorProtocol {
		typealias Element = Resource
		
		private var page: Page?
		private var pageIterator: AnyIterator<Page>?
		private var resourceIterator: IndexingIterator<[Resource]>?
		
		init(pageIterator: AnyIterator<Page>) {
			self.pageIterator = pageIterator
			page = pageIterator.next()
			resourceIterator = page?.results.makeIterator()
		}
		
		mutating func next() -> Resource? {
			
			repeat {
				// If we have a next resource return it
				if let resource = resourceIterator?.next() {
					return resource
				}
				
				// If not get next page and repeat
				page = pageIterator?.next()
			
			} while (page != nil)
			
			// If we have no next apge we are done
			return nil
		}
	}
}



