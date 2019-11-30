//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Abservetech on 16/10/19.
//  Copyright © 2019 Abservetech. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    let presistentManager : PresistentManager
    var users = [User]()
    
    init(presistentManager : PresistentManager){
            self.presistentManager = presistentManager
            super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Came to viewcontroller")
//        self.saveData()
        self.getData()
//        self.deleteAlldata()
       
    }

    // Manualy create Entity and manage Object
    
    func saveManualEntityData(){
        //1.create referent 2. crete context ,3. create entity , 4.manageobject , 5.setvalue
        let context = presistentManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newuser = NSManagedObject(entity: entity!, insertInto: context)
        newuser.setValue("Saranya", forKey: "username")
        newuser.setValue("30", forKey: "age")
        
        do{
            try! context.save()
            print("####Data saved successfully")
        }catch{
            print("@@@@Error in coredata")
        }
    }
    
    func fetchManualEntityData(){
        let context = presistentManager.persistentContainer.viewContext
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchrequest.returnsObjectsAsFaults = false
        do{
          let result = try! context.fetch(fetchrequest)
            print("####result" , result)
            for data in result as! [NSManagedObject] {
                print("ValueinDB===>",data.value(forKey: "username"))
            }
        }catch{
            print("@@@@Error in fetch data")
        }
    }

    
    
    //by create ManageObject we create Some object
    
    func saveData(){
        let user = User(context: presistentManager.context)
        user.username = "Barath"
        user.age = "20"
        presistentManager.save()
    }
    
    func getData(){
//        guard let userData =  try! presistentManager.context.fetch(User.fetchRequest()) as? [User] else {return}

        
        let users = presistentManager.fetch(User.self)
        self.users = users
        users.forEach({
            print("Data" , $0.username)
        })
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
//            self.updateData()
//            self.deleteData()
        }
    }
    
    func updateData(){
        let user = users[users.count-3]
        user.username = " And saranyas are sisters"
        presistentManager.save()
    }
    
    func deleteData(){
        let user = users.first!
        presistentManager.delete(user)
        //        presistentManager.context.delete(user)
//        presistentManager.save()
    }
    
    func deleteAlldata(){
        presistentManager.deleteAllData(User.self)
    }
}

