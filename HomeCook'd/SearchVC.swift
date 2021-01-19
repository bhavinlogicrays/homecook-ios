//
//  SearchVC.swift
//

import UIKit

class SearchVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // MARK: - Variables
    // MARK: - UIControls
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var tblViewSearch: UITableView!
    
    // MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtSearch.attributedPlaceholder = NSAttributedString(string:"Humberger", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 156.0/255.0, green: 155.0/255.0, blue: 166.0/255.0, alpha: 1.0)])
        txtSearch.setLeftPaddingPoints(15)
        txtSearch.setRightPaddingPoints(15)
    }
    
    // MARK: - Delegate Method
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchVCCell") as! SearchVCCell
        
        
        
        return cell
        
    }


}
