//
//  AuthController.swift
//  marktApp
//
//  Created by Ahmed on 2/17/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import Foundation

class AuthController {
    
    let UserDef = UserDefaults.standard
    
    func userRegisration(userDic: [String: Any], completion: @escaping(Bool) -> Void ){
        
        UserDef.saveData(valeu: userDic, key: kUSER_DIC)
        UserDef.setLogedin(value: true)
        completion(true)
        
    }
    
    /// Login function
    func login(username: String, password: String, completion: @escaping(Bool) -> Void ){
        guard let dic = UserDef.getUserDic() else {
            completion(false)
            return
        }
        
        let uname = dic[kUSERNAME] as! String, pass = dic[kPASSWORD] as! String
        
        if username == uname && password == pass{
            UserDef.setLogedin(value: true)
            completion(true)
        }
        
        completion(false)
    }
    
    /// return true if user logged in
    func isLoged() -> Bool{
        return UserDef.isLogin()
    }
    
    /// user log out function
    func logout(completion: @escaping() -> Void){
        UserDef.setLogedin(value: false)
        completion()
    }
    
    func getUserData(key: String) -> String? {
        if let dic = UserDef.dictionary(forKey: kUSER_DIC){
            return dic[key] as? String
        }
        return nil
    }
    
}
