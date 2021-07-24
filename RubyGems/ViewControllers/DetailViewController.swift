//
//  ViewController.swift
//  RubyGems
//
//  Created by Christian Torres on 7/23/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var mainColorLbl: UILabel!
    @IBOutlet weak var crystalSystemLbl: UILabel!
    @IBOutlet weak var formulaLbl: UILabel!
    @IBOutlet weak var hardness: UILabel!
    @IBOutlet weak var transparency: UILabel!
    
    var gem: Gem? {
        didSet {
            refreshUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func refreshUI() {
        loadViewIfNeeded()
        if let imageName = gem?.imageName {
            imageView.image = UIImage(named: imageName)
        }
        infoLbl.text = gem?.info
        mainColorLbl.text = "Main color: \(gem?.mainColor ?? "")"
        crystalSystemLbl.text = "Crystal system: \(gem?.crystalSystem ?? "")"
        formulaLbl.text = "Chemical formula: \(gem?.formula ?? "")"
        hardness.text = "Hardness (Mohs hardness scale): \(gem?.hardness ?? "")"
        transparency.text = "Transparency: \(gem?.transparency ?? "")"
    }
}

extension DetailViewController: GemSelectionDelegate {
    
    func gemSelected(_ newGem: Gem) {
        gem = newGem
    }
    
}
