<p align="center">
    <img 
        src="https://user-images.githubusercontent.com/1342803/75630258-105e9c00-5bb7-11ea-81b8-86afa000e188.png"
        height="64" 
        alt="NIOWebSocketClient"
    >
    <br>
    <br>
    <a href="https://docs.vapor.codes/4.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="API Docs">
    </a>
    <a href="http://vapor.team">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://github.com/vapor/websocket-kit/actions/workflows/test.yml">
        <img src="https://github.com/vapor/websocket-kit/actions/workflows/test.yml/badge.svg?event=push" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-5.6-brightgreen.svg" alt="Swift 5.6">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-5.8-brightgreen.svg" alt="Swift 5.8">
    </a>
</p>

This is a custom build of Vapor's Websocket Kit. In following changes are made:
- BufferWritableMonitorDelegate: a delegate that receives the amount of buffered bytes from the channel. This is not the actual representation of buffered bytes in the channel, but more of an estimate.
- BufferWritableMonitorHandler: a channel duplexer that handles buffering and report the buffered amount to the delegate.
- writeBufferWaterMark: the water mark that defines the amount of bytes that will be buffered in the channel. 
- WebSocketClient, WebSocket that uses the aforementioned utilities.
