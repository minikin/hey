//
//  ExploreBeachesViewController.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 12.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import Services

final class ExploreBeachesViewController: UIViewController {

  // MARK: - Injections

  private var beachesDataSource = ItemsDataSource(items: [BeachCellViewModel](),
                                                 cellDescriptor: { $0.beachCellDescriptor })

  // MARK: - IBOutlets

  @IBOutlet private var beachesCollectionView: UICollectionView! {
    didSet {
      beachesCollectionView.delegate = self
      beachesCollectionView.dataSource = beachesDataSource
      let layout = PinterestLayout()
      layout.delegate = self
      beachesCollectionView.collectionViewLayout = layout
    }
  }
  @IBOutlet private var activityIndicator: UIActivityIndicatorView!
  
  // MARK: - Properties

  private let viewModel = ExploreBeachesViewModel()
  private var currentPage = 1

  // MARK: - ViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
    loadBeaches()
  }

  // MARK: - Helpers

  private func loadBeaches() {
    viewModel.showLoading = {
      if self.viewModel.isLoading {
        self.activityIndicator.startAnimating()
        self.beachesCollectionView.alpha = 0.0
      } else {
        self.activityIndicator.stopAnimating()
        self.beachesCollectionView.alpha = 1.0
      }
    }

    viewModel.showError = { error in
      print(error)
    }

    viewModel.reloadData = {
      self.beachesDataSource.items = self.viewModel.beachCellViewModels
      self.beachesCollectionView.reloadData()
    }

    viewModel.fetchBeaches()
  }

  private func fetchNextPage() {
    currentPage += 1
    loadBeaches()
  }
}

// MARK: - PinterestLayoutDelegate

extension ExploreBeachesViewController: PinterestLayoutDelegate {
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
    guard let heightString = viewModel.beachCellViewModels[indexPath.item].imageHeight.cgFloat() else {
      return 100
    }
    return heightString
  }
}

// MARK: - UICollectionViewDelegate

extension ExploreBeachesViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView,
                      willDisplay cell: UICollectionViewCell,
                      forItemAt indexPath: IndexPath) {
    
  }
}
