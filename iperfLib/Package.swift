// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iperfLib",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "iperfLib",
            targets: ["Ciperf"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Ciperf",
            exclude: [
                "iperfLib/src/main.c",
                "iperfLib/src/t_timer.c",
                "iperfLib/src/t_units.c",
                "iperfLib/src/t_uuid.c",
            ],
            sources: [
                "iperfLib/src/cjson.c",
                "iperfLib/src/dscp.c",
                "iperfLib/src/iperf_api.c",
                "iperfLib/src/iperf_auth.c",
                "iperfLib/src/iperf_client_api.c",
                "iperfLib/src/iperf_error.c",
                "iperfLib/src/iperf_locale.c",
                "iperfLib/src/iperf_pthread.c",
                "iperfLib/src/iperf_sctp.c",
                "iperfLib/src/iperf_server_api.c",
                "iperfLib/src/iperf_tcp.c",
                "iperfLib/src/iperf_time.c",
                "iperfLib/src/iperf_udp.c",
                "iperfLib/src/iperf_util.c",
                "iperfLib/src/net.c",
                "iperfLib/src/tcp_info.c",
                "iperfLib/src/timer.c",
                "iperfLib/src/units.c",
            ],
            cSettings: [
                .headerSearchPath("iperfLib/src"),
                .headerSearchPath("extra"),
                .define("HAVE_CONFIG_H"),
            ]
        ),
        .testTarget(
            name: "iperfLibTests",
            dependencies: ["Ciperf"]
        ),
    ]
)
