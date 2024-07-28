//
//  RoutesViewController.swift
//  Jampang
//
//  Created by Fitsyu  on 28/07/24.
//
//  This file was generated by the 🐍 VIPER generator
//

import Lottie
import UIKit

final class RoutesViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: RoutesPresenterInterface!
    
    @IBOutlet weak var lottieHolderView: UIView!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Lifecycle -
    
    private var recoms: [Recom] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RouteCell.self, forCellReuseIdentifier: "RouteCell")
        tableView.rowHeight = 104 + 16
        tableView.dataSource = self
        tableView.delegate = self
        
        presenter.viewDidLoad()
    }
    
    @IBAction func backButtonTap() {
        presenter.backButtonTap()
    }
}

extension RoutesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
         1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recoms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RouteCell", for: indexPath) as? RouteCell else {
            return UITableViewCell()
        }
        let recom = recoms[indexPath.row]
        
        cell.nameLabel.text = recom.location
        cell.revenueLabel.text = "Rp \(recom.salesPrediction)"
        cell.timeRangeLabel.text = recom.timeSlot
        
        return cell
    }
}

extension RoutesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recom = self.recoms[indexPath.row]
        presenter.didSelectRecom(recom: recom)
    }
}

// MARK: - Extensions -

extension RoutesViewController: RoutesViewInterface {
    func showLoading() {
        tableView.isHidden = true
        
        let lottieView = LottieAnimationView(name: "loading")
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .loop
        lottieView.frame = lottieHolderView.bounds
        lottieView.play()
        
        self.lottieHolderView.addSubview(lottieView)
        self.lottieHolderView.isHidden = false
    }
    
    func hideLoading() {
        self.lottieHolderView.subviews.first?.removeFromSuperview()
        self.lottieHolderView.isHidden = true
        
        tableView.isHidden = false
    }
    
    func showRecoms(recoms: [Recom]) {
        self.recoms = recoms
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
}


class RouteCell: UITableViewCell {
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple.withAlphaComponent(0.5)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "South Quarter C"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let key1Label: UILabel = {
        let label = UILabel()
        label.text = "Potential Revenue"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let revenueLabel: UILabel = {
        let label = UILabel()
        label.text = "Rp100.000"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let key2Label: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeRangeLabel: UILabel = {
        let label = UILabel()
        label.text = "8.00-3.00"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialSetup()
    }
    
    private func initialSetup() {
        self.contentView.addSubview(backView)
        self.backView.addSubview(nameLabel)
        self.backView.addSubview(key1Label)
        self.backView.addSubview(revenueLabel)
        self.backView.addSubview(key2Label)
        self.backView.addSubview(timeRangeLabel)
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            nameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            
            key1Label.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            key1Label.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            
            revenueLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            revenueLabel.topAnchor.constraint(equalTo: key1Label.bottomAnchor, constant: 4),
            revenueLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            
            key2Label.leadingAnchor.constraint(equalTo: backView.centerXAnchor),
            key2Label.centerYAnchor.constraint(equalTo: key1Label.centerYAnchor),
            
            timeRangeLabel.leadingAnchor.constraint(equalTo: key2Label.leadingAnchor),
            timeRangeLabel.topAnchor.constraint(equalTo: key2Label.bottomAnchor, constant: 4)
        ])
        
    
    }
}
