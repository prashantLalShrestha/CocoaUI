//
//  TableViewPagingInteractor.swift
//  CocoaUI
//
//  Created by Prashant Shrestha on 5/19/20.
//  Copyright © 2020 Inficare. All rights reserved.
//

import UIKit

final class TableViewPagingInteractor<Item> {
    typealias FetchItemActionCallBack = ((_ currentPage: Int) -> ())
    typealias FetchCompletedCallback = ((_ indexPathsToReload: [IndexPath]?) -> ())
    typealias FetchFailedCallback = ((_ reason: String) -> ())
    
    private var previousItems: [Item] = []
    private var previousCurrentPage = 0
    private var previousTotal = 0
    private var items: [Item] = []
    private var currentPage = 0
    private var total = 0
    private var isFetchingProgress = false
    private let fetchItemAction: FetchItemActionCallBack
    private let onFetchCompleted: FetchCompletedCallback
    private let onFetchFailed: FetchFailedCallback
    
    private var shouldResetOnSuccess: Bool = true
    
    init(fetchItemAction: @escaping FetchItemActionCallBack, onFetchCompleted: @escaping FetchCompletedCallback, onFetchFailed: @escaping FetchFailedCallback) {
        self.fetchItemAction = fetchItemAction
        self.onFetchCompleted = onFetchCompleted
        self.onFetchFailed = onFetchFailed
    }
    
    var totalCount: Int {
        return total
    }
    
    var currentCount: Int {
        return items.count
    }
    
    func item(at index: Int) -> Item {
        return items[index]
    }
    
    func fetchAndReset() {
        guard !isFetchingProgress else {
            return
        }
        
        currentPage = 0
        isFetchingProgress = true
        self.shouldResetOnSuccess = true
        fetchItemAction(self.currentPage)
    }
    
    func fetchItems() {
        guard !isFetchingProgress else {
            return
        }
        
        guard (items.count == 0 && total == 0) || (items.count != 0 && total != 0 && items.count != total) else {
            self.onFetchCompleted([])
            return
        }
        
        isFetchingProgress = true
        self.shouldResetOnSuccess = false
        fetchItemAction(self.currentPage)
        
    }
    
    func fetchCompleted(total: Int, items: [Item]) {
        DispatchQueue.main.async {
            self.isFetchingProgress = false
            if self.shouldResetOnSuccess {
                self.resetItems()
            }
            self.previousTotal = total
            self.total = total
            
            self.previousItems = items
            self.items.append(contentsOf: items)
            
            if self.currentPage >= 1 {
                let indexPathsToReload = self.calculateIndexPathsToReload(from: items)
                self.onFetchCompleted(indexPathsToReload)
            } else {
                self.onFetchCompleted(.none)
            }
            
            self.previousCurrentPage = self.currentPage
            self.currentPage += 1
        }
    }
    
    func fetchFailed(with reason: String) {
        DispatchQueue.main.async {
            self.total = self.previousTotal
            self.items = self.previousItems
            self.currentPage = self.previousCurrentPage
            self.isFetchingProgress = false
            self.onFetchFailed(reason)
        }
    }
    
    private func resetItems() {
        items = []
        total = 0
    }
    
    private func calculateIndexPathsToReload(from newItems: [Item]) -> [IndexPath] {
        let startIndex = items.count - newItems.count
        let endIndex = startIndex + newItems.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
    
}
