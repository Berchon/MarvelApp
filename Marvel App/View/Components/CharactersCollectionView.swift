//
//  CollectionView.swift
//  Marvel App
//
//  Created by Luciano Berchon on 02/01/22.
//

import UIKit

protocol CharactersCollectionDelegate: AnyObject {
    func pushDetails()
}

//class CharactersViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}

@IBDesignable
class CharactersCollectionView: UIView {

    weak var delegate: CharactersCollectionDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionData: [String] = []
    
    //let navigationController = UINavigationController(nibName: "MainViewController", bundle: nil)
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
        
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("CharactersCollectionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Popula com os dados a serem exibidos
        collectionData = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸", "10 🍖", "11 🐯", "12 🌋"]
        
        collectionView.backgroundColor = .clear
        if collectionData.count == 0 {
            initCollectionView(nibName: "EmptyCollectionViewCell")
        }
        else {
            initCollectionView(nibName: "CollectionViewCell")
        }
    }
    
    private func initCollectionView(nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func numberOfColumns(numberOfCol: Int = 2) {

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let spaceBetweenCells = Int(layout.minimumInteritemSpacing)
        let totalSpaceBetweenColumns = (numberOfCol - 1) * spaceBetweenCells
        let width = (Int(contentView.frame.size.width) - totalSpaceBetweenColumns) / numberOfCol
        layout.itemSize = CGSize(width: width, height: Int(Double(width) * 4 / 3))
    }
    
}

extension CharactersCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionData.count == 0 {
            return 1
        }
        
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionData.count == 0 {
            return ConfigureEmptyCell(indexPath: indexPath)
        }
        
        return ConfigureCell(indexPath: indexPath)
    }
    
    func ConfigureEmptyCell(indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? EmptyCollectionViewCell else {
            fatalError("can't dequeue CustomCell")
        }
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let width = Int(contentView.frame.size.width)
        layout.itemSize = CGSize(width: width, height: 50)
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        cell.label.text = "Nenhum card encontrado"
        return cell
    }
    
    func ConfigureCell(indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CollectionViewCell else {
            fatalError("can't dequeue CustomCell")
        }

        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        numberOfColumns()

        cell.label.text = "Character \(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        delegate?.pushDetails()
        print(indexPath.row)
//        print(self.navigationController)
//        let vc = DetailsViewController()
        
//        let vc = SegundaTelaViewController()
//        let navigationController = UINavigationController(rootViewController: vc)

//        navigationController.modalPresentationStyle = .fullScreen

//        self.present(navigationController, animated: true, completion: nil)
        
        
//        navigationController.pushViewController(detaisVC, animated: true)
    }
}

//extension UINavigationController {
//    var rootViewController: UIViewController? {
//        return viewControllers.first
//    }
//}
