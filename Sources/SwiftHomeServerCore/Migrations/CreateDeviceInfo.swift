import Fluent

public struct CreateDeviceInfo: AsyncMigration {

    public init() {}
    
    public func prepare(on database: Database) async throws {
        try await database.schema(DeviceInfoDBModel.schema)
            .id()
            .field(DeviceInfoModelFields.deviceId.rawValue, .string, .required)
            .field(DeviceInfoModelFields.deviceLatitude.rawValue, .double, .required)
            .field(DeviceInfoModelFields.deviceLongitude.rawValue, .double, .required)
            .field(DeviceInfoModelFields.absoluteAltimeter.rawValue, .double, .required)
            .create()
    }

    public func revert(on database: Database) async throws {
        try await database.schema(DeviceInfoDBModel.schema).delete()
    }
}
