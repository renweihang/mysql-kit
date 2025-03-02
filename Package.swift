// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "mysql-kit",
    platforms: [
       .macOS(.v10_15),
       .iOS(.v13),
    ],
    products: [
        .library(name: "MySQLKit", targets: ["MySQLKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/renweihang/mysql-nio.git", from: "1.0.0"),
        .package(url: "https://github.com/renweihang/sql-kit.git", from: "3.12.0"),
        .package(url: "https://github.com/renweihang/async-kit.git", from: "1.0.0"),
        .package(url: "https://github.com/renweihang/swift-crypto.git", from: "1.0.0"),
        .package(url: "https://github.com/renweihang/swift-nio.git", from: "2.0.0"),
        .package(url: "https://github.com/renweihang/swift-nio-ssl.git", from: "2.14.0"),
    ],
    targets: [
        .target(name: "MySQLKit", dependencies: [
            .product(name: "AsyncKit", package: "async-kit"),
            .product(name: "MySQLNIO", package: "mysql-nio"),
            .product(name: "SQLKit", package: "sql-kit"),
            .product(name: "Crypto", package: "swift-crypto"),
            .product(name: "NIOFoundationCompat", package: "swift-nio"),
            .product(name: "NIOSSL", package: "swift-nio-ssl"),
        ]),
        .testTarget(name: "MySQLKitTests", dependencies: [
            .target(name: "MySQLKit"),
            .product(name: "SQLKitBenchmark", package: "sql-kit"),
        ]),
    ]
)
