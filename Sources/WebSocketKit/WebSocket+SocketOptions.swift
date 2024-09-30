import Foundation
import NIOCore

extension NIOBSDSocket.Option {
    #if canImport(Darwin)
    public static let ip_bound_if: NIOBSDSocket.Option = Self(rawValue: IP_BOUND_IF)
    public static let ipv6_bound_if: NIOBSDSocket.Option = Self(rawValue: IPV6_BOUND_IF)
    #elseif canImport(Glibc)
    public static let so_bindtodevice = Self(rawValue: SO_BINDTODEVICE)
    #endif
}
