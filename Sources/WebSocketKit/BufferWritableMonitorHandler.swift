//
//  BufferWritableMonitorHandler.swift
//  
//
//  Created by Zhennan Zhou on 3/4/24.
//

import Foundation
import NIOCore

final class BufferWritableMonitorHandler: ChannelDuplexHandler {
    typealias InboundIn = ByteBuffer
    typealias InboundOut = ByteBuffer
    typealias OutboundIn = ByteBuffer
    typealias OutboundOut = ByteBuffer
    
    private var buffer: ByteBuffer
    private weak var delegate: BufferWritableMonitorDelegate?
    
    init(capacity: Int, delegate: BufferWritableMonitorDelegate? = nil) {
        let allocator = ByteBufferAllocator()
        self.buffer = allocator.buffer(capacity: capacity)
        self.delegate = delegate
    }
    
    func channelWritabilityChanged(context: ChannelHandlerContext) {
        writeToSocket(context: context, promise: nil)
    }
    
    func write(context: ChannelHandlerContext, data: NIOAny, promise: EventLoopPromise<Void>?) {
        var incoming = self.unwrapOutboundIn(data)
        buffer.writeBuffer(&incoming)
        delegate?.onBufferWritableChanged(amountQueued: buffer.readableBytes)
    }
    
    func flush(context: ChannelHandlerContext) {
        writeToSocket(context: context, promise: nil)
    }
    
    private func writeToSocket(context: ChannelHandlerContext, promise: EventLoopPromise<Void>?) {
        while context.channel.isWritable && buffer.readableBytes != 0 {
            // write as much data to the socket as possible
            // report the remaining queued bytes to the delegate
            let readLength = min(buffer.readableBytes, 65536)
            if let next = buffer.readSlice(length: readLength) {
                context.writeAndFlush(self.wrapOutboundOut(next), promise: promise)
                delegate?.onBufferWritableChanged(amountQueued: buffer.readableBytes)
            }
        }
    }
}
