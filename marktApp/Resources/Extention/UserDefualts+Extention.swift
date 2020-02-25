//
//  UserDefualts+Extention.swift
//  marktApp
//
//  Created by Ahmed on 2/17/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import Foundation

extension UserDefaults{
    func saveData(valeu: Any, key: String){
        set(valeu, forKey: key)
        synchronize()
    }
    
    func isLogin() -> Bool{
        return bool(forKey: kIS_LOGIN)
    }
    
    func setLogedin(value:Bool) {
        set(value, forKey: kIS_LOGIN)
        synchronize()
    }
    
    func getUserDic() -> [String: Any]?{
        if let dic = dictionary(forKey: kUSER_DIC){
            return dic
        }
        return nil
    }
    
}
