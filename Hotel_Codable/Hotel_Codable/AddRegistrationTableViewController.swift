//
//  AddRegistrationTableViewController.swift
//  Hotel_Codable
//
//  Created by Anmol Mehta on 27/08/25.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController,SelectRoomTypeTableViewControllerDelegate {

    func selectRoomTypeTableViewController(
        _ controller: SelectRoomTypeTableViewController,
        didSelect roomType: RoomType
    ) {
        self.roomType = roomType
        updateRoomType()
    }

    
    
    
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkInDateLabel: UILabel!
 
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var lastNameTextFeild: UITextField!
    @IBOutlet weak var firstNameTextFeild: UITextField!
    
    @IBOutlet weak var numberOfAdultStepper: UIStepper!
    @IBOutlet weak var numberOfAdultLabel: UILabel!
    
    @IBOutlet weak var numberOfChildrenSteppe: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
  
    @IBOutlet weak var roomTypeLabel: UILabel!
    var roomType : RoomType?
    
    @IBOutlet weak var numberOfDaysLabel: UILabel!
    @IBOutlet weak var daysDescription: UILabel!

    @IBOutlet weak var roomChargeLabel: UILabel!
    
    @IBOutlet weak var totalCharge: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var roomChargeDescription: UILabel!
    
    @IBOutlet weak var wifiChargeDescription: UILabel!
    @IBOutlet weak var wifiChargeLabel: UILabel!
    
    
    
    var existingRegistration : Registration?
    
    
    
    func updateNumberOfGuests(){
        numberOfAdultLabel.text = "\(Int(numberOfAdultStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenSteppe.value))"
    }
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    override func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath :
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
        
    if indexPath == checkInDateLabelCellIndexPath &&
    isCheckOutDatePickerVisible == false {
    isCheckInDatePickerVisible.toggle()
    }
    else if indexPath == checkOutDateLabelCellIndexPath &&
    isCheckInDatePickerVisible == false {
    isCheckOutDatePickerVisible.toggle ()
    }
    else if indexPath == checkInDateLabelCellIndexPath ||
    indexPath == checkOutDateLabelCellIndexPath
        {
  
    isCheckInDatePickerVisible.toggle()
    isCheckOutDatePickerVisible.toggle()
    }
        else {
    return
    }
    tableView.beginUpdates ()
    tableView.endUpdates ()
    }
    
    
    override func viewDidLoad() {
        existingUser()
        super.viewDidLoad()
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        checkOutDatePicker.minimumDate = Calendar.current
            .date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        updateCharges()
        
    }
    
    func existingUser(){
        if let existingRegistration = existingRegistration{
            firstNameTextFeild.text = existingRegistration.firstName
            lastNameTextFeild.text = existingRegistration.lastName
            emailTextFeild.text = existingRegistration.emailAddress
            checkInDatePicker.date = existingRegistration.checkInDate
            checkOutDatePicker.date = existingRegistration.checkOutDate
            numberOfAdultStepper.value = Double(existingRegistration.numberOfAdults)
            numberOfChildrenSteppe.value = Double(
                existingRegistration.numberOfChildren
            )
            wifiSwitch.isOn = existingRegistration.wifi
            roomType = existingRegistration.roomType
            
            
        }
    }
    
    func updateRoomType(){
        if let roomType = roomType{
            roomTypeLabel.text = roomType.name
        }else {
            roomTypeLabel.text = "Not Set"
        }
        updateCharges()
    }
    @IBAction func wifiSwitchChanged(_ sender: Any) {
        updateCharges()
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController = SelectRoomTypeTableViewController(
            coder: coder
        )
        selectRoomTypeController?.delegate = self
        selectRoomTypeController?.roomType = roomType
            
        
        return selectRoomTypeController
    }
   
    var registration : Registration? {
        guard let roomType = roomType else {
            return nil
        }
        let firstname = firstNameTextFeild.text ?? ""
        let lastname = lastNameTextFeild.text ?? ""
        let email = emailTextFeild.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultStepper.value)
        let numberOfChildren =
        Int(numberOfChildrenSteppe.value)
        let hasWifi = wifiSwitch.isOn
        return Registration(
            firstName: firstname,
            lastName: lastname,
            emailAddress: email,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            numberOfAdults: numberOfAdults,
            numberOfChildren: numberOfChildren,
            wifi: hasWifi,
            roomType: roomType
        )
        
    }
            
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true,completion: nil)
    }
    func calculateNights() -> Int{
        let calender = Calendar.current
        let startDate = calender.startOfDay(for: checkInDatePicker.date)
        let endDate = calender.startOfDay(for: checkOutDatePicker.date)
        let components = calender.dateComponents(
            [.day],
            from: startDate,
            to: endDate
        )
        let nights = components.day ?? 0
        return max(nights,1)
    }
    func updateCharges(){
        let nights = calculateNights()
        let roomcharge = roomType?.price ?? 0
        let wifiBaseCharge = 10
        
        numberOfDaysLabel.text = "\(nights)"
        daysDescription.text = " \(checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)) - \(checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted))"
        
        roomChargeLabel.text = " $ \(roomcharge * nights)"
        roomChargeDescription.text = "\(roomType?.name ?? "Not Set") @ \(roomType?.price ?? 0)/Night "
        wifiChargeLabel.text = "$ \(wifiSwitch.isOn ? wifiBaseCharge*nights:0)"
        wifiChargeDescription.text = "\(wifiSwitch.isOn ? "Yes" : "No")"
        totalCharge.text = "$\(nights * (roomcharge + wifiBaseCharge))"
    }
        
       
//    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> selectRoomTypeTableViewController? {
//        let selectRoomTypeController = Hotel_Codable.selectRoomTypeTableViewController(
//            coder: coder
//        )
//        selectRoomTypeController?.delegate = self
//        selectRoomTypeController?.roomType = roomType
//        return selectRoomTypeController
//    }
    
    
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateNumberOfGuests()
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        updateDateViews()
    }
    func updateDateViews(){
        checkInDateLabel.text = checkInDatePicker.date
            .formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        updateCharges()
    }
   
}
