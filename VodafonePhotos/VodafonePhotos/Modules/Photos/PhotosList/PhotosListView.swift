//
//  PhotosListView.swift
//  VodafonePhotos
//
//  Created by Muhammad Ewaily on 21/07/2021.
//

import UIKit

class PhotosListView: BaseViewController {
    
    private var viewModel: PhotosListViewModel!
    
    @IBOutlet weak var photosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupUI()
        fetchPhotos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarTitle()
    }
    
    private func setupViewModel() {
        viewModel = PhotosListViewModel()
    }
    
    private func setupUI() {
        setupPhotosTableView()
    }
    
    private func setupNavigationBarTitle() {
        self.navigationItem.title = Strings.Photos_LISTING
    }
    
    private func setupPhotosTableView() {
        let photoCell = UINib(nibName: PhotoCell.ID, bundle: nil)
        let adPlaceholderCell = UINib(nibName: AdPlaceholderCell.ID, bundle: nil)
        let progressCell = UINib(nibName: ProgressCell.ID, bundle: nil)
        
        photosTableView.delegate = self
        photosTableView.dataSource = self
        photosTableView.estimatedRowHeight = 280
        photosTableView.rowHeight = UITableView.automaticDimension
        photosTableView.separatorStyle = .none
        photosTableView.register(photoCell, forCellReuseIdentifier: PhotoCell.ID)
        photosTableView.register(adPlaceholderCell, forCellReuseIdentifier: AdPlaceholderCell.ID)
        photosTableView.register(progressCell, forCellReuseIdentifier: ProgressCell.ID)
    }
    
    private func fetchPhotos() {
        viewModel.fetchPhotos { [weak self] in
            guard let self = self else { return }
            self.photosTableView.reloadData()
        }
    }
    
    private func fetchMorePhotos() {
        viewModel.fetchMorePhotos { [weak self] in
            guard let self = self else { return }
            self.photosTableView.reloadData()
        }
    }
    
    private func instantiatePhotoCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCell.ID) as? PhotoCell else {
            return UITableViewCell()
        }
        let info = viewModel.getPhotoInfo(at: indexPath.row)
        cell.bindCell(info: info)
        return cell
    }
    
    private func instantiateAdPlaceholderCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdPlaceholderCell.ID) as? AdPlaceholderCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    private func instantiateProgressCell(_ tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgressCell.ID) as? ProgressCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    private func openPhotoDetails(index: Int) {
        guard let navigationController = navigationController else { return }
        let photoDetailsViewInfo = viewModel.getPhotoDetailsViewInfo(at: index)
        let navigationManger = NavigationManager(navigationController: navigationController)
        navigationManger.openPhotoDetails(photoDetailsViewInfo: photoDetailsViewInfo)
    }
}

// MARK: - UITableViewDelegate

extension PhotosListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !viewModel.checkIfAdCellType(at: indexPath.row) else { return }
        openPhotoDetails(index: indexPath.row)
    }
}

// MARK: - UITableViewDataSource

extension PhotosListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countPhotos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isProgressRow(for: indexPath) {
            return instantiateProgressCell(tableView)
        }
        else if viewModel.checkIfAdCellType(at: indexPath.row) {
            return instantiateAdPlaceholderCell(tableView)
            
        }
        else {
            return instantiatePhotoCell(tableView, indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isProgressRow(for: indexPath) {
            fetchMorePhotos()
        }
    }
    
    private func isProgressRow(for indexPath: IndexPath) -> Bool {
        guard self.viewModel.canFetchPhotos else { return false }
        return indexPath.row == viewModel.countPhotos() - 1
    }
}
