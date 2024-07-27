//
//  HomePresenter.swift
//  Jampang
//
//  Created by Fitsyu  on 28/07/24.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class HomePresenter {
    
    // MARK: - Private properties -

    private unowned let view: HomeViewInterface
    private let wireframe: HomeWireframeInterface

    // MARK: - Lifecycle -

    init(view: HomeViewInterface, wireframe: HomeWireframeInterface) {
        self.view = view
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension HomePresenter: HomePresenterInterface {
    func recommend(sale: String, location: String, time: String) {
        wireframe.navigateToRecommendation()
    }
}
