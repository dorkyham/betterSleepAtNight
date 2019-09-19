//
//  History.swift
//  Better Sleep
//
//  Created by Annisa Nabila Nasution on 19/09/19.
//  Copyright © 2019 Annisa Nabila Nasution. All rights reserved.
//

import Foundation

class History {
    var sleeps : [Sleep] = []
    func save(sleep: Sleep){
       sleeps.append(sleep)
    }
}
