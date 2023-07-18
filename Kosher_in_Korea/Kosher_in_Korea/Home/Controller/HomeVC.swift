//
//  ViewController.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/13.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    let list : [BannerInfo] = BannerInfo.list
    @IBAction func addressButtonTapped(_ sender: Any) {
        goAddressSearch(controller: self)
    }
   
    let bannerInfos : [BannerInfo] = BannerInfo.list
    typealias Item = BannerInfo
    var datasoucre : UICollectionViewDiffableDataSource<Section , Item>!
    enum Section {
        case main
    }
    @IBAction func selectLocalTapped(_ sender: Any) {
       goAddressSearch(controller: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // presentation diffable datasource
        collectionView.delegate = self
        datasoucre = UICollectionViewDiffableDataSource<Section, Item> (collectionView: collectionView, cellProvider: {collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantViewCell", for: indexPath)
                    as? RestaurantViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(item)
            //cell.backgroundColor = self.colors[indexPath.item]
            return cell
        })
        
        // data : snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item> ()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfos,toSection: .main)
        datasoucre.apply(snapshot)
        
        // layout : compositional layout
        
        collectionView.collectionViewLayout = layout()
        pageControl.numberOfPages = bannerInfos.count
        collectionView.alwaysBounceVertical = false

    }
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1) , heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group:group)
        section.orthogonalScrollingBehavior = .groupPagingCentered // 너비에 구애받지 않게 연속적으로 나타나게끔
        section.interGroupSpacing = 20
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    

}

extension HomeVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        //let framework = list[indexPath.item]
//        print("d")
//        let storyboard = UIStoryboard(name: "Reservation", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "ReservationVC") as! ReservationVC
//        present(vc, animated: true)
        goReservation(controller: self)
        

    }
}
