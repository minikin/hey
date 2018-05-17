//
//  ExploreBeachesViewController.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 12.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services
import UIKit

final class ExploreBeachesViewController: UIViewController {

    // MARK: - Injections

    private var beachesDataSource = ItemsDataSource(items: [BeachCellState](),
                                                    cellDescriptor: { $0.beachCellDescriptor })

    // MARK: - IBOutlets

    @IBOutlet private var beachesCollectionView: UICollectionView! {
        didSet {
            beachesCollectionView.delegate = self
            beachesCollectionView.dataSource = beachesDataSource
            beachesCollectionView.collectionViewLayout = layout
            layout.delegate = self
        }
    }
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties

    private let layout = PinterestLayout()
    private let exploreState = ExploreBeachesState(ExpoloreBeachesAPI())
    private var currentPage = 0
    private let numberOfPages = 15
    private var shouldShowLoadingCell = false

    // MARK: - ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        loadBeaches()
    }

    // MARK: - Helpers

    private func loadBeaches() {
        print("Fetching page \(currentPage)")
        exploreState.fetchBeaches(currentPage)
        reloadData()
    }

    private func reloadData() {
      exploreState.reloadDataOnSuccess = { [unowned self] in
        self.beachesDataSource.items = self.exploreState.beachCellState
        DispatchQueue.main.async {
          self.beachesCollectionView.reloadData()
          self.layout.prepare()
        }
      }
    }

    private func showLoading() {
        exploreState.showLoading = {
          if self.exploreState.isLoading {
            self.activityIndicator.startAnimating()
            self.beachesCollectionView.alpha = 0.0
          } else {
            self.activityIndicator.stopAnimating()
            self.beachesCollectionView.alpha = 1.0
          }
        }
    }

    private func fetchNextPage() {
        currentPage += 1
        loadBeaches()
    }

    private func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
      return indexPath.row == exploreState.beachCellState.count - 1
    }
}

// MARK: - PinterestLayoutDelegate

extension ExploreBeachesViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        guard let heightString = exploreState.beachCellState[indexPath.item].imageHeight.cgFloat() else {
            return 100
        }
        return heightString
    }
}

// MARK: - UICollectionViewDelegate

extension ExploreBeachesViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView,
                        willDisplay _: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
      if indexPath.item == exploreState.beachCellState.count - 1 && currentPage <= numberOfPages {
        fetchNextPage()
      }
    }
}
