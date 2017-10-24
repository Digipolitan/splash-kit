//
//  DefaultSplashViewController.swift
//  SplashKit
//
//  Created by David LINHARES on 24/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit
import RuntimeEnvironment

public class DefaultSplashViewController: TimerSplashViewController {

    @IBOutlet var environmentLabel: UILabel!
    @IBOutlet var versionLabel: UILabel!

    public override func viewDidLoad() {
        super.viewDidLoad()
        let infoDictionary = Bundle.main.infoDictionary
        var version = infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        let environment = RuntimeEnvironment.shared.mode
        if environment != .production {
            self.environmentLabel.text = environment.rawValue
            let buildVersion = infoDictionary?[kCFBundleVersionKey as String] as? String ?? ""
            version.append("#\(buildVersion)")
        }
        self.versionLabel.text = version
    }
}
