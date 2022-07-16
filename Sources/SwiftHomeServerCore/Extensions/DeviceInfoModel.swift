import Foundation
import SwiftHomeCore

public extension DeviceInfoModel {
    var asDBModel: DeviceInfoDBModel {
        return DeviceInfoDBModel(
            deviceId: deviceId,
            deviceLatitude: deviceLatitude,
            deviceLongitude: deviceLongitude,
            absoluteAltimeter: absoluteAltimeter)
    }
}
