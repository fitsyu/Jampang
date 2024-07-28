//
//  RoutesWireframe.swift
//  Jampang
//
//  Created by Fitsyu  on 28/07/24.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class RoutesWireframe: BaseWireframe<RoutesViewController> {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Routes", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: RoutesViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = RoutesFormatter()
        let interactor = RoutesInteractor()
        let presenter = RoutesPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension RoutesWireframe: RoutesWireframeInterface {
    func navigateBack() {
        self.viewController.dismiss(animated: true)
    }
    
    func navigateToMap(recom: Recom) {
        guard let url = URL(string: "http://maps.apple.com/?daddr=\(recom.lat),\(recom.lng)&dirflg=w") else { return }
        UIApplication.shared.open(url)
    }
}
