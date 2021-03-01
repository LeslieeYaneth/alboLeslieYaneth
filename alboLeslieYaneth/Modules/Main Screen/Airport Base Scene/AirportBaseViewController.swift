//
//  AirportBaseViewController.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

class AirportBaseViewController: UIViewController {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var collectionTab: UICollectionView!
    internal var router: (NSObjectProtocol & AirportBaseRoutingLogic)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        router!.routeToHome()
    }

    // MARK: - Setup
     func setup() {
        let viewController = self
        let router = AirportBaseRouter()
        viewController.router = router
        router.viewController = viewController
    }
}

// MARK: - Collection View Delegate
extension AirportBaseViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTabC", for: indexPath) as! TabMenuViewCell
        switch indexPath.item {
        case 0:
            cell.imgTab.image = UIImage(named: "icon-pin")
        default:
            cell.imgTab.image = UIImage(named: "icon-list")
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
           router!.routeToHome()
        default:
            router!.routeToList()
        }
    }
}
