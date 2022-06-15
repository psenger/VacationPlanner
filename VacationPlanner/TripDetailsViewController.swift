//
//  TripDetailsViewController.swift
//  VacationPlanner
//
//  Created by Philip A Senger on 15/6/22.
//

import Cocoa

class TripDetailsViewController: NSViewController {

    @IBOutlet weak var startDatePicker: NSDatePicker!
    @IBOutlet weak var endDatePicker: NSDatePicker!
    @IBOutlet weak var totlaTimeLabel: NSTextField!
    
    lazy var dateComponentsFormatter: DateComponentsFormatter = {
        let dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = .day
        dateComponentsFormatter.unitsStyle = .full
        return dateComponentsFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.startDatePicker.dateValue = Date()
        self.endDatePicker.dateValue = Date()
        dateChanged(self.startDatePicker)
    }
    
    @IBAction func dateChanged(_ sender: NSDatePicker) {
        let cal = Calendar( identifier: .gregorian)
        let midnightStartdDate = cal.startOfDay(for: self.startDatePicker.dateValue)
        
        // make even days, we go thru midnight of the next day
        let midnightEndDate = cal.startOfDay(for: self.endDatePicker.dateValue).addingTimeInterval(60 * 60 * 24 )
        
        let tripTime = midnightEndDate.timeIntervalSince(midnightStartdDate)
        
        self.totlaTimeLabel.stringValue = self.dateComponentsFormatter.string(from: tripTime)!
    }
}
