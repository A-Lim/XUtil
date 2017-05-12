//
//  Result.swift
//  Ubiqtrac
//
//  Created by Alexius Lim Li Liang on 05/04/2017.
//  Copyright © 2017 SAINS. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(ErrorType)
}
