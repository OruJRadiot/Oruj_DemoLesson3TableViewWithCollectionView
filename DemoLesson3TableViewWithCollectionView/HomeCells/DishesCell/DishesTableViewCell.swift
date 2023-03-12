//
//  DishesTableViewCell.swift
//  DemoLesson3TableViewWithCollectionView
//
//  Created by Oruj Dursunzade on 11.03.23.
//

import UIKit

class DishesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    public var favouriteDishesCollectionViewList : [Meal] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favouriteDishesCollectionViewList = [
            .init(mealName: "Toyuq-file", mealImage: "chicken.png"),
            .init(mealName: "Steyk", mealImage: "steak.png"),
            .init(mealName: "Lazanya", mealImage: "lasagne.png"),
            .init(mealName: "Ayran", mealImage: "ayran.png"),
            .init(mealName: "Pizza", mealImage: "pizza.png"),
            .init(mealName: "Fanta", mealImage: "fanta.png"),
            .init(mealName: "Kofe", mealImage: "coffee.png"),
        ]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MealItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "MealItemCollectionViewCell")
        configureLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 128, height: 128)
        layout.scrollDirection = .horizontal
//        layout.sectionInset = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20)
        layout.minimumLineSpacing = 9
        layout.minimumInteritemSpacing = 8
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
    }
    
}

extension DishesTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favouriteDishesCollectionViewList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealItemCollectionViewCell", for: indexPath) as! MealItemCollectionViewCell
        cell.mealNameLabel.text = favouriteDishesCollectionViewList[indexPath.row].mealName
        cell.mealImageView.image = UIImage(named: favouriteDishesCollectionViewList[indexPath.row].mealImage)
        return cell
    }
    
    
}
