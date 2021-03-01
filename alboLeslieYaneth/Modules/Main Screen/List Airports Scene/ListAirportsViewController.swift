//
//  ListAirportsViewController.swift
//  alboLeslieYaneth
//
//  Created by Lesliee Yaneth on 27/02/21.
//

import UIKit

protocol ListAirportsDisplayLogic: class {
}

class ListAirportsViewController: BaseViewController {
    // MARK: - Properties
    internal var interactor: (ListAirportsBusinessLogic & ListAirportsDataStore)?
    internal var router: (NSObjectProtocol & ListAirportsRoutingLogic & ListAirportsDataPassing)?
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Setup
    override func setup() {
        let viewController = self
        let interactor = ListAirportsInteractor()
        let presenter = ListAirportsPresenter()
        let router = ListAirportsRouter()
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
        tableView.reloadData()
    }
}

// MARK: - Display Logic Methods
extension ListAirportsViewController: ListAirportsDisplayLogic {
}

// MARK: - Table View Methods
extension ListAirportsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Airports.AirportsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirportsC", for: indexPath) as? AirportsCell
        let item = Airports.AirportsData[indexPath.row]
        cell!.nameLbl.text = item.name
        switch item.type {
        case "heliport":
            cell!.iconImg.image = #imageLiteral(resourceName: "icon-heliport")
        default:
            cell!.iconImg.image = #imageLiteral(resourceName: "icon-plane")
        }
        return cell!
    }
}
