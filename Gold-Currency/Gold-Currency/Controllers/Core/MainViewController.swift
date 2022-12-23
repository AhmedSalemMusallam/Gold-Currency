//
//  MainViewController.swift
//  Gold-Currency
//
//  Created by Ahmed Salem on 22/12/2022.
//

import UIKit

class MainViewController: UIViewController {

    private let goldTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(goldTable)
        view.backgroundColor = .systemBackground
        
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        goldTable.delegate = self
        goldTable.dataSource = self
        
        //fetch data
        fetchMetalPrices()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        goldTable.frame = view.bounds
    }
    
    
    private func fetchMetalPrices()
    {
        APICaller.shared.getPrices{ results in
                    
                }
    }
}

extension MainViewController: UITableViewDelegate ,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
}
