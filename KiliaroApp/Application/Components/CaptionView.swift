//
//  CaptionView.swift
//  KiliaroApp
//
//  Created by Farhad on 2/26/22.
//

import UIKit

class CaptionView: UIView {
    
    // MARK: - Views
    private let vwBar: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = .black.withAlphaComponent(0.5)
        return vw
    }()
    
    
    private let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        addSubview(vwBar)
        vwBar.addSubview(lblTitle)
        
        setConstraint()
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            vwBar.leftAnchor.constraint(equalTo: leftAnchor),
            vwBar.rightAnchor.constraint(equalTo: rightAnchor),
            vwBar.topAnchor.constraint(equalTo: topAnchor),
            vwBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lblTitle.leftAnchor.constraint(equalTo: vwBar.leftAnchor,
                                              constant: 16),
            lblTitle.rightAnchor.constraint(equalTo: vwBar.rightAnchor,
                                              constant: -16),
            lblTitle.topAnchor.constraint(equalTo: vwBar.topAnchor,
                                              constant: 16),
            lblTitle.bottomAnchor.constraint(equalTo: vwBar.bottomAnchor,
                                              constant: -16),

        ])
    }
    
    func setConfig(title: String) {
        lblTitle.text = title
    }
}
