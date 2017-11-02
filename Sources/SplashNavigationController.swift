//
//  SplashNavigationController.swift
//  SplashKit
//
//  Created by David LINHARES on 24/10/2017.
//  Copyright © 2017 Digipolitan. All rights reserved.
//

import UIKit

public class SplashNavigationController: UINavigationController {

    public private(set) var splashViewControllers: [SplashViewController]!
    public var completion: SplashViewController.Completion!
    private var index: Int = 0

    public class func newInstance(splashViewControllers: SplashViewController..., completion: @escaping SplashViewController.Completion) -> SplashNavigationController {
        return SplashNavigationController(splashViewControllers: splashViewControllers, completion: completion)
    }

    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let splashViewController = viewController as? SplashViewController else {
            return
        }
        splashViewController.completion = { [weak self] completed in
            guard let target = self else {
                return
            }
            if completed {
                target.index += 1
                guard target.index < target.splashViewControllers.count else {
                    target.completion(true)
                    return
                }
                target.pushViewController(target.splashViewControllers[target.index], animated: true)
            } else {
                target.completion(false)
            }
        }
        super.pushViewController(splashViewController, animated: animated)
    }

    private init(splashViewControllers: [SplashViewController], completion: @escaping SplashViewController.Completion) {
        super.init(rootViewController: splashViewControllers[0])
        self.splashViewControllers = splashViewControllers
        self.completion = completion
    }

    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.isNavigationBarHidden = true
    }

    public override var childViewControllerForStatusBarStyle: UIViewController? {
        return self.visibleViewController
    }

    public override var childViewControllerForStatusBarHidden: UIViewController? {
        return self.visibleViewController
    }
}

open class SplashViewController: UIViewController {

    public typealias Completion = (Bool) -> Void

    fileprivate var completion: Completion!

    public func nextSplash() {
        guard self.isViewLoaded && self.view.window != nil else {
            return
        }
        self.completion(true)
    }

    public func cancelSplash() {
        guard self.isViewLoaded && self.view.window != nil else {
            return
        }
        self.completion(false)
    }
}
