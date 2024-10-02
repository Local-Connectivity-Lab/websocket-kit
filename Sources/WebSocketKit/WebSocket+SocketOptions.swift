import Foundation
import NIOCore

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#elseif canImport(Musl)
import Musl
#endif

extension NIOBSDSocket.Option {
    #if canImport(Darwin)
    public static let ip_bound_if: NIOBSDSocket.Option = Self(rawValue: IP_BOUND_IF)
    public static let ipv6_bound_if: NIOBSDSocket.Option = Self(rawValue: IPV6_BOUND_IF)
    #elseif canImport(Glibc) || canImport(Musl)
    public static let so_bindtodevice = Self(rawValue: SO_BINDTODEVICE)
    #endif
}

extension SocketOptionProvider {
    #if canImport(Glibc) || canImport(Musl)
    /// Sets the socket option SO_BINDTODEVICE to `value`.
    ///
    /// - parameters:
    ///     - value: The value to set SO_BINDTODEVICE to.
    /// - returns: An `EventLoopFuture` that fires when the option has been set,
    ///     or if an error has occurred.
    public func setBindToDevice(_ value: String) -> EventLoopFuture<Void> {
        self.unsafeSetSocketOption(level: .socket, name: .so_bindtodevice, value: value)
    }
    #endif
}
