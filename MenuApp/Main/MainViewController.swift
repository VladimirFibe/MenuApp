//
//  MainViewController.swift
//  Super easy dev
//
//  Created by Vladimir on 04.04.2023
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func showCategories(_ categories: [String])
    func showRecipies(_ recipies: [Recipe])
}

class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    var categories: [String] = []
    private var dataSource: [Recipe] = []
    
    private lazy var tableView = UITableView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.backgroundColor = .menuBackgroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        let headerView = BannersView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 115))
        tableView.tableHeaderView = headerView
        initialize()
        
        let label = UILabel()
        label.text = "Москва"
        let image = UIImageView(image: UIImage(systemName: "chevron.down"))
        let stack = UIStackView(arrangedSubviews: [label, image])
        stack.axis = .horizontal
        stack.spacing = 10
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: stack)
        
        presenter?.viewDidLoaded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

private extension MainViewController {
    func initialize() {
    }
}

extension MainViewController: MainViewProtocol {
    func showCategories(_ categories: [String]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }
    func showRecipies(_ recipies: [Recipe]) {
        DispatchQueue.main.async {
            self.dataSource = recipies
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        let item = dataSource[indexPath.row]
        cell.configure(with: item, roundedType: .notRounded)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        172
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let categoriesView = CategoriesHeaderView(categories: categories)
        categoriesView.delegate = self
        return categoriesView
    }

}

extension MainViewController: CategoriesHeaderViewDelegate {
    func scrollToRow(with category: String) {
        print(#function, category)
        guard let index = dataSource.firstIndex(where: { $0.dishTypes.contains(category.lowercased())}) else { return }
        tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
        
    }
}
