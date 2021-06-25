//
//  FirebaseReference.swift
//  SleepWalk
//
//  Created by Kevin Umarov  on 06/01/2021.
//  Copyright © 2021 Kevin Umarov. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Menu
    case Order
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
