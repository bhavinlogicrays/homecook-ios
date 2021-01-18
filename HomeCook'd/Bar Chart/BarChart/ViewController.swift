//
//  ViewController.swift
//  BarChart
//
//  Created by Nguyen Vu Nhat Minh on 19/8/17.
//  Copyright © 2017 Nguyen Vu Nhat Minh. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var basicBarChart: BasicBarChart!
    @IBOutlet weak var barChart: BeautifulBarChart!
    var arrTitle = NSArray()
    
    private let numEntry = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let dataEntries = generateEmptyDataEntries()
        basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: false)
        barChart.updateDataEntries(dataEntries: dataEntries, animated: false)
//        basicBarChart.setDataEntries(values: [1,2,3,4,5,6])
        if #available(iOS 10.0, *) {
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) {[unowned self] (timer) in
                let dataEntries = self.generateRandomDataEntries()
                self.barChart.updateDataEntries(dataEntries: dataEntries, animated: true)
                self.basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: true)
            }
        } else {
            // Fallback on earlier versions
        }
//        timer.fire()
    }
    
    func generateEmptyDataEntries() -> [DataEntry] {
        var result: [DataEntry] = []
        Array(0..<numEntry).forEach {_ in
            result.append(DataEntry(color: UIColor.clear, height: 0, textValue: "0", title: ""))
        }
        return result
    }
    
    func generateRandomDataEntries() -> [DataEntry] {
//        let colors = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
//        let colors =   [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
        let colors = UIColor.init(red: 254.0/255.0, green: 235.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        var result: [DataEntry] = []
        for i in 0..<numEntry {
            let value = (arc4random() % 90) + 10
           
            let height: Float = Float(value) / 100.0
           
           
            
            
            
//            let formatter = DateFormatter()
//            formatter.dateFormat = "d MMM"
//            var date = Date()
//            date.addTimeInterval(TimeInterval(24*60*60*i))


//            result.append(DataEntry(color: colors[i % colors.count], height: height, textValue: "\(value) %", title: "Lavel \(i+1)" ))
             result.append(DataEntry(color: colors, height: height, textValue: "\(value)%", title: "Lavel \(i+1)" ))
        }
        return result
    }
}

