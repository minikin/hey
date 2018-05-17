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
            let layout = PinterestLayout()
            layout.delegate = self
            layout.prepare()
            beachesCollectionView.collectionViewLayout = layout
        }
    }
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties

    private let viewModel = ExploreBeachesState(ExpoloreBeachesAPI())
    private var currentPage = 0
    private let numberOfPages = 2
    private var shouldShowLoadingCell = false

    // MARK: - ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadBeaches()
    }

    // MARK: - Helpers

    private func loadBeaches(refresh: Bool = false) {
        viewModel.fetchBeaches(currentPage, refresh: refresh)

        viewModel.showLoading = {
            if self.viewModel.isLoading {
                self.activityIndicator.startAnimating()
                self.beachesCollectionView.alpha = 0.0
            } else {
                self.activityIndicator.stopAnimating()
                self.beachesCollectionView.alpha = 1.0
            }
        }

        viewModel.reloadDataOnSuccess = {
            self.beachesDataSource.items = self.viewModel.beachCellState
            DispatchQueue.main.async {
                self.beachesCollectionView.reloadData()
                self.beachesCollectionView.collectionViewLayout.prepare()
            }
        }

        viewModel.showError = { error in
            print(error)
        }
    }

    private func fetchNextPage() {
        currentPage += 1
        print("Fetching page \(currentPage)")
        viewModel.fetchBeaches(currentPage)
    }

    private func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.row == viewModel.beachCellState.count
    }
}

// MARK: - PinterestLayoutDelegate

extension ExploreBeachesViewController: PinterestLayoutDelegate {
    func collectionView(_: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        guard let heightString = viewModel.beachCellState[indexPath.item].imageHeight.cgFloat() else {
            return 100
        }
        return heightString
    }
}

// MARK: - UICollectionViewDelegate

extension ExploreBeachesViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView,
                        willDisplay _: UICollectionViewCell,
                        forItemAt _: IndexPath) {
//    if currentPage < numberOfPages {
//      fetchNextPage()
//    }
    }
}
