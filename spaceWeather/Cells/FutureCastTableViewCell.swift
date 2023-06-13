//
//  FutureCastTableViewCell.swift
//  spaceWeather
//
//  Created by Mmako Sekhosana on 2023/06/12.
//

import UIKit

class FutureCastTableViewCell: UITableViewCell {
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var speedLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureStyling()
    }
    
    func cellSetup(with model: FutureCastCellModel) {
        dateLabel.text = model.futureCastDate
        temperatureLabel.text = model.temperature
        humidityLabel.text = model.humidity
        speedLabel.text = model.speed
        iconImageView.image = model.icon
    }
    
    private func configureStyling() {
        dateLabel.textColor = UIColor(red: 0.1, green: 0.5, blue: 0.6, alpha: 1.0)
    }
}
