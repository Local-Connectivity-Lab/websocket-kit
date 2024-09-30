import Foundation
import NIOCore

extension ChannelOption where Self == ChannelOptions.Types.SocketOption {
    public static func ipv6Option(_ name: NIOBSDSocket.Option) -> Self {
        .init(level: .ipv6, name: name)
    }
}
