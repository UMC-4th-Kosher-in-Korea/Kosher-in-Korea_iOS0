//
//  StackNavigation.swift
//  Kosher_in_Korea
//
//  Created by 김정원 on 2023/07/14.
//

import UIKit
func goHome(controller : UIViewController) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let HomeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
    HomeVC.modalPresentationStyle = .fullScreen
    controller.present(HomeVC, animated: true, completion: nil)
}
func goRestaurantRecommendation(controller : UIViewController) {

    let storyboard = UIStoryboard(name: "RestaurantRecommendation", bundle: nil)
       let searchVC = storyboard.instantiateViewController(withIdentifier: "RestaurantRecommendationVC") as! RestaurantRecommendationVC
       let navController = UINavigationController(rootViewController: searchVC) // 네비게이션 컨트롤러로 감싸기
       navController.modalPresentationStyle = .fullScreen // 전체 화면으로 모달 표시
    controller.present(navController, animated: true, completion: nil)
}

func goAddressSearch (controller : UIViewController)
{
    let storyboard = UIStoryboard(name: "AddressSearch", bundle: nil)
    let searchVC = storyboard.instantiateViewController(withIdentifier: "AddressSearchVC") as! AddressSearchVC
    controller.present(searchVC, animated: true, completion: nil)
}
