//
//  NewsViewController.swift
//  jbcnews
//
//  Created by cagla copuroglu on 17.08.2022.
//

import UIKit
import SnapKit

class NewsViewController: UIViewController {
    
    var viewModel: NewsViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    var tableView: UITableView!
    private var NewsList: [NewsPresentation] = []
    var homeTitle: UILabel!

    override func viewDidLoad() {
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        tableView = UITableView(frame: .zero)
        homeTitle = UILabel(frame: .zero)
        self.view.addSubview(tableView)
        self.view.addSubview(homeTitle)
        makeTableView()

        homeTitle.text = "News"
        homeTitle.font = UIFont(name: "Kanit-Medium", size: 30)
        
        homeTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
        }

        viewModel.delegate = self
        viewModel.load()

    }

    func makeTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableCell.self, forCellReuseIdentifier: NewsTableCell.identifier)
        tableView.rowHeight = 100
        tableView.separatorInset.bottom = 16
        

        tableView.snp.makeConstraints { make in
            make.top.equalTo(homeTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()

        }

    }
}

extension NewsViewController: NewsViewModelDelegate {
    
    func navigate(to route: NewsViewRoute) {
        
    }
    

    func handleViewModelOutput(_ output: NewsViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showNewsList(let NewsList):
            self.NewsList = NewsList
            self.tableView.reloadData()

        }
    }

}

extension NewsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let cell: NewsTableCell = tableView.dequeueReusableCell(withIdentifier: NewsTableCell.identifier) as! NewsTableCell
        let News = NewsList[indexPath.row]
        cell.saveModel(news: News, index: indexPath.row)

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsList.count
    }
}

extension NewsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.selectNews(at: indexPath.row)
    }
}
