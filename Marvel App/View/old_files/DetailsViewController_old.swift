//
//  DetailsCollectionViewController.swift
//  Marvel App
//
//  Created by Luciano Berchon on 09/01/22.
//

import UIKit

class DetailsViewController_old: UIViewController {

    override var nibName: String? {
        "DetailsViewController"
    }

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        commonInit()
    }

    
    
//    private func commonInit() {
//        navigationController?.viewControllers.last?.title = "Details"
//
//        registerCell(nibName: "ImageCollectionViewCell", identifier: "ImageCell")
//        registerCell(nibName: "DescriptionCollectionViewCell", identifier: "DescriptionCell")
//        registerCell(nibName: "TitleCollectionViewCell", identifier: "TitleCell")
//        registerCell(nibName: "CarouselCollectionViewCell", identifier: "CarouselCell")
//
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = CGSize(width: 1, height: 100)
//        }
//
//        collectionView.dataSource = self
//        collectionView.delegate = self
//    }
//
//    private func registerCell(nibName: String, identifier: String) {
//        let nib = UINib(nibName: nibName, bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 6
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch (indexPath.row) {
//        case 0:
//            return cellImage(indexPath: indexPath)
//        case 2:
//            return cellTitle(title: "Comics", indexPath: indexPath)
//        case 3:
//            return cellCarousel(indexPath: indexPath)
//        case 4:
//            return cellTitle(title: "Series", indexPath: indexPath)
//        case 5:
//            return cellCarousel(indexPath: indexPath)
//        default:
//            return cellDescription(indexPath: indexPath)
//        }
//
//    }
//
//
//    func cellImage(indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCollectionViewCell else {
//            fatalError("can't dequeue CustomCell")
//        }
//
////        cell.layer.borderWidth = 1
////        cell.layer.cornerRadius = 10
//
////        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//
////        layout.itemSize = UICollectionViewFlowLayout.automaticSize
////        layout.itemSize.width = collectionView.frame.size.width
////        cell.frame.size.width = collectionView.frame.size.width
//
//        return cell
//    }
//
//    func cellDescription(indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCell", for: indexPath) as? DescriptionCollectionViewCell else {
//            fatalError("can't dequeue CustomCell")
//        }
//
////        cell.layer.borderWidth = 1
////        cell.layer.cornerRadius = 10
//
//        cell.desc.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
//
//        return cell
//    }
//
//    func cellTitle(title: String, indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCell", for: indexPath) as? TitleCollectionViewCell else {
//            fatalError("can't dequeue CustomCell")
//        }
//
////        cell.layer.borderWidth = 1
////        cell.layer.cornerRadius = 10
//
//        cell.title.text = title
//
//        return cell
//    }
//
//    func cellCarousel(indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as? CarouselCollectionViewCell else {
//            fatalError("can't dequeue CustomCell")
//        }
//
//        cell.layer.borderWidth = 1
//        cell.layer.cornerRadius = 10
//
//        return cell
//    }
//
}
