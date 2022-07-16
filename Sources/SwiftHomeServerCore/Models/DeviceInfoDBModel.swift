import Fluent
import Vapor

public enum DeviceInfoModelFields: FieldKey {
    case deviceId
    case deviceLatitude
    case deviceLongitude
    case absoluteAltimeter
}

public final class DeviceInfoDBModel: Model, Content {

    public static let schema = "DeviceInfo"

    @ID(key: .id)
    public var id: UUID?

    @Field(key: DeviceInfoModelFields.deviceId.rawValue)
    public var deviceId: String
    @Field(key: DeviceInfoModelFields.deviceLatitude.rawValue)
    public var deviceLatitude: Double
    @Field(key: DeviceInfoModelFields.deviceLongitude.rawValue)
    public var deviceLongitude: Double
    @Field(key: DeviceInfoModelFields.absoluteAltimeter.rawValue)
    public var absoluteAltimeter: Double

    public init() {}

    public init(deviceId: String, deviceLatitude: Double, deviceLongitude: Double, absoluteAltimeter: Double) {
        self.id = UUID()
        self.deviceId = deviceId
        self.deviceLatitude = deviceLatitude
        self.deviceLongitude = deviceLongitude
        self.absoluteAltimeter = absoluteAltimeter
    }

    public func update(model: DeviceInfoDBModel) {
        deviceId = model.deviceId
        deviceLatitude = model.deviceLatitude
        deviceLongitude = model.deviceLongitude
        absoluteAltimeter = model.absoluteAltimeter
    }
}
