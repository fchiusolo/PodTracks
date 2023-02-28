//
//  PodcastsListViewController.swift
//  PodTracks
//
//  Created by Francesco Chiusolo on 28/02/23.
//

import UIKit

class PodcastsListViewController: UIViewController {
  private lazy var tableView = UITableView()

#warning("Provide real data with a ViewModel and delete images from Assets")
  let podcasts = [
    Podcast(image: UIImage(named: "TheJoeBuddenPodcast")!, title: "The Joe Budden Podcast", author: "The Joe Budden Network"),
    Podcast(image: UIImage(named: "MillionDollazWorthOfGame")!, title: "Million Dollaz Worth Of Game", author: "Barstool Sports"),
    Podcast(image: UIImage(named: "AngieMartinezIRL")!, title: "Angie Martinez IRL", author: "iHeartPodcasts"),
  ]

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
}

// MARK: - UI Configuration

private extension PodcastsListViewController {
  func configureUI() {
    view.backgroundColor = .systemBackground
    setupSearchController()
    setupTableView()
    layoutTableView()
  }

  private func setupSearchController() {
    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Type something here to search"
    tableView.tableHeaderView = searchController.searchBar
  }

  private func setupTableView() {
    tableView.register(PodcastTableViewCell.self, forCellReuseIdentifier: PodcastTableViewCell.reuseID)
    tableView.dataSource = self
    tableView.delegate = self
  }

  private func layoutTableView() {
    view.addSubview(tableView, usingConstraints: [
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margins),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margins),
      view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: margins),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: margins),
    ])
  }
}

// MARK: - UITableViewDataSource

extension PodcastsListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    podcasts.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PodcastTableViewCell.reuseID, for: indexPath) as! PodcastTableViewCell
    let podcast = podcasts[indexPath.row]
    cell.update(image: podcast.image)
    cell.update(primaryText: podcast.title)
    cell.update(secondaryText: podcast.author)
    return cell
  }
}

// MARK: - UITableViewDelegate

extension PodcastsListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
#warning("Implement navigation to 'podcast details' screen")
  }
}

// MARK: - UISearchResultsUpdating

extension PodcastsListViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    guard let text = searchController.searchBar.text else { return }
#warning("Implement filtering functionality")
  }
}
