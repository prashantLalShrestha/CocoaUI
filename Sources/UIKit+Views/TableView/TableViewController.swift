//
//  TableViewController.swift
//  CoreUIKit
//
//  Created by Prashant Shrestha on 6/18/19.
//  Copyright © 2019 Prashant Shrestha. All rights reserved.
//

import UIKit

open class TableViewController: ViewController, UIScrollViewDelegate {
    
    public lazy var tableView: TableView = {
        let view = TableView(frame: CGRect(), style: .plain)
        view.delegate = self
        return view
    }()
    
    public var clearsSelectionOnViewWillAppear = true
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if clearsSelectionOnViewWillAppear == true {
            deselectSelectedRow()
        }
    }
    
    override open func makeUI() {
        super.makeUI()
        
        stackView.spacing = 0
        stackView.insertArrangedSubview(tableView, at: 0)
        
//        tableView.footRefreshControl.autoRefreshOnFoot = true
        
    }
}

extension TableViewController {
    
    public func deselectSelectedRow() {
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
            selectedIndexPaths.forEach({ (indexPath) in
                tableView.deselectRow(at: indexPath, animated: false)
            })
        }
    }
}

extension TableViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let view = view as? UITableViewHeaderFooterView {
            view.textLabel?.font = UIFont(name: ".SFUIText-Bold", size: 15.0)!
        }
    }
}
