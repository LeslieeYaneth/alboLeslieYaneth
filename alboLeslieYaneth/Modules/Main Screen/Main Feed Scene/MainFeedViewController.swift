//
//  MainFeedViewController.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

protocol MainFeedDisplayLogic: class {
}

class MainFeedViewController: BaseViewController {
    // MARK: - Properties
    internal var interactor: (MainFeedBusinessLogic & MainFeedDataStore)?
    internal var router: (NSObjectProtocol & MainFeedRoutingLogic & MainFeedDataPassing)?
    // MARK: - Outlets
    @IBOutlet weak var kmLbl: UILabel!
    @IBOutlet weak var KmSlider: UISlider!

    // MARK: - Setup
    override func setup() {
        let viewController = self
        let interactor = MainFeedInteractor()
        let presenter = MainFeedPresenter()
        let router = MainFeedRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor!.requestUserLocation()
    }

    @IBAction func sliderPressed(_ sender: Any) {
        kmLbl.text = "\(Int(KmSlider.value))"
        FinderKm.FinderString = "\(Int(KmSlider.value))"
    }

    @IBAction func searchPressed(_ sender: Any) {
        router!.routeToAirports()
    }
}

// MARK: - Display Logic Methods
extension MainFeedViewController: MainFeedDisplayLogic {
}
