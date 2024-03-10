//
//  BufferWritableMonitorDelegate.swift
//  
//
//  Created by Zhennan Zhou on 3/5/24.
//

import Foundation

protocol BufferWritableMonitorDelegate: AnyObject {
    func onBufferWritableChanged(amountQueued: Int)
}
