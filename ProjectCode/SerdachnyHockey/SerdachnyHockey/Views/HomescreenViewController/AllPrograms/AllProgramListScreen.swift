/*

 Program Name: AllProgramListScreen.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               1. The purpose of this program is to store program data into array and display into TableView
               2. Pass table cell data and redirect to webpage

 Copyright © 2020 Prime Software. All rights reserved.

*/

import Foundation
import UIKit
import SafariServices

/*
   Store data into program array
   
   Extentsion UITableViewDataSource, UITableViewDelegate: pass data from table cell to
                                                          detail page with identifier
*/
class AllProgramListScreen: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    var programs: [Program] = []
        
    override func viewDidLoad() {
            super.viewDidLoad()
            programs = createArray()
            
        }
        
    // Program Content Array
        func createArray() -> [Program]{
            
            var tempProgram: [Program] = []
            
            let program1 = Program(image: #imageLiteral(resourceName: "excellence"), title: "3-DAYS SKATING & SKILLS",programUrl: "https://www.elitepowerskating.com/programs/3-day/")
            
            let program2 = Program(image: #imageLiteral(resourceName: "power"), title: "POWER SKATING & SKILLS",programUrl: "https://www.elitepowerskating.com/programs/power-skating-and-skills/")
            
            let program3 = Program(image: #imageLiteral(resourceName: "3skills"), title: "PROGRAM OF EXCELLENCE",programUrl: "https://www.elitepowerskating.com/programs/program-of-excellence/")
            
            let program4 = Program(image:#imageLiteral(resourceName: "shootgoal"), title:"SHOOTING & GOAL SCORING",programUrl: "https://www.elitepowerskating.com/programs/shooting-and-goal-scoring/")
            
            let program5 = Program(image:#imageLiteral(resourceName: "stick-handling-moves"), title:"STICKHANDLING & MOVES",programUrl: "https://www.elitepowerskating.com/programs/stickhandling-and-moves/")
            
            let program6 = Program(image:#imageLiteral(resourceName: "defencemen"), title:"DEFENCEMEN CAMPS",programUrl: "https://www.elitepowerskating.com/programs/defencemen/")
            
            let program7 = Program(image:#imageLiteral(resourceName: "bodychecking"), title:"BODYCHECKING & CONTACT CAMPS",programUrl: "https://www.elitepowerskating.com/programs/bodychecking-and-contact/")
            
            let program8 = Program(image:#imageLiteral(resourceName: "edge"), title:"EDGE OFF-ICE PROGRAM",programUrl: "https://www.elitepowerskating.com/programs/edge-off-ice-acceleration/")
            
            let program9 = Program(image:#imageLiteral(resourceName: "stick-handling-moves"), title:"INTERNATIONAL PROGRAMS",programUrl: "https://www.elitepowerskating.com/programs/international-programs/")
            
            tempProgram.append(program1)
            tempProgram.append(program2)
            tempProgram.append(program3)
            tempProgram.append(program4)
            tempProgram.append(program5)
            tempProgram.append(program6)
            tempProgram.append(program7)
            tempProgram.append(program8)
            tempProgram.append(program9)
            
            return tempProgram
            
        }
        
}

//Program content tableview
extension AllProgramListScreen: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let program = programs[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgramItemDetail") as! AllProgramCell
        
        cell.setAllProgram(program: program)
        
        return cell
        
    }
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let url = URL(string: self.programs[indexPath.row].programUrl)
            
            let SafariVC = SFSafariViewController(url: url!)
            present(SafariVC, animated: true, completion: nil)
            
    }
    
}



