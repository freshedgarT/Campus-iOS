//
//  MoreTableViewController.swift
//  
//
//  Created by Mathias Quintero on 12/8/15.
//
//

import UIKit

class MoreTableViewController: UITableViewController, ImageDownloadSubscriber, DetailViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        if let mvc = tabBarController as? CampusTabBarController {
            user = mvc.user
            manager = mvc.manager
        }
    }
    
    var manager: TumDataManager?
    
    var user: User? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        nameLabel.text = user?.name
        avatarView.image = user?.image ?? UIImage(named: "avatar")
    }
    
    func updateImageView() {
        updateView()
    }
    
    func dataManager() -> TumDataManager {
        return manager ?? TumDataManager(user: nil)
    }
    
    @IBOutlet weak var avatarView: UIImageView! {
        didSet {
            avatarView.clipsToBounds = true
            avatarView.layer.cornerRadius = avatarView.frame.width / 2
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let mvc = segue.destinationViewController as? MovieDetailTableViewController {
            mvc.delegate = self
        }
        if let mvc = segue.destinationViewController as? CalendarViewController {
            mvc.delegate = self
        }
        if let mvc = segue.destinationViewController as? SearchViewController {
            mvc.delegate = self
        }
        if let mvc = segue.destinationViewController as? TuitionTableViewController {
            mvc.delegate = self
        }
    }

}
