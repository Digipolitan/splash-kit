//
//  TimerSplashViewController.swift
//  SplashKit
//
//  Created by David LINHARES on 24/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

open class TimerSplashViewController: SplashViewController {

    public enum Consts {
        public static let duration: TimeInterval = 2
    }

    private var timer: Timer?
    public var duration: TimeInterval = Consts.duration

    public init(duration: TimeInterval = Consts.duration, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.duration = duration
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.timer = Timer.scheduledTimer(timeInterval: self.duration, target: self, selector: #selector(splashTimerDidFinish), userInfo: nil, repeats: false)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
    }

    public override func cancelSplash() {
        self.timer?.invalidate()
        super.cancelSplash()
    }

    public override func nextSplash() {
        self.timer?.invalidate()
        super.nextSplash()
    }

    @objc private func splashTimerDidFinish(_ timer: Timer) {
        self.nextSplash()
    }
}
