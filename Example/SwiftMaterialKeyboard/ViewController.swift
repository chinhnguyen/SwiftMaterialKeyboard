//
//  ViewController.swift
//  SwiftMaterialKeyboard
//
//  Created by chinhnguyen on 01/12/2019.
//  Copyright (c) 2019 chinhnguyen. All rights reserved.
//

import UIKit
import Material
import RxSwift
import RxCocoa
import SnapKit

class ViewController: UIViewController {
    let field1 = TextField()
    let field2 = TextField()
    let layout = UIStackView()
    let pinpad = PinPad(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(layout)
        layout.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(64)
        }
        
        layout.axis = .vertical
        layout.distribution = .fill
        layout.alignment = .center
        layout.spacing = 32
        
        field1.font = RobotoFont.bold(with: 40)
        layout.addArrangedSubview(field1)
        field1.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(60)
        }
        
        field2.font = RobotoFont.bold(with: 40)
        layout.addArrangedSubview(field2)
        field2.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(60)
        }
        
        layout.addArrangedSubview(pinpad)
        layout.addArrangedSubview(UIView())
        
        
        pinpad.textFields = [field1, field2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

