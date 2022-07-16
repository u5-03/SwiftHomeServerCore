import Fluent
import Vapor

public struct DeviceInfoController: RouteCollection {
    private let deviceInfoIdString = "deviceInfoId"

    public init() {}

    public func boot(routes: RoutesBuilder) throws {
        let deviceInfoModels = routes.grouped("DeviceInfo")
        deviceInfoModels.get(use: index)
        deviceInfoModels.post(use: create)
        deviceInfoModels.group(":\(deviceInfoIdString)") { deviceInfoModel in
            deviceInfoModel.delete(use: delete)
        }
    }

    public func index(req: Request) async throws -> [DeviceInfoDBModel] {
        try await DeviceInfoDBModel.query(on: req.db).all()
    }

    public func create(req: Request) async throws -> DeviceInfoDBModel {
        let deviceInfoModel = try req.content.decode(DeviceInfoDBModel.self)
        try await deviceInfoModel.save(on: req.db)
        return deviceInfoModel
    }

    public func delete(req: Request) async throws -> HTTPStatus {
        guard let deviceInfoModel = try await DeviceInfoDBModel.find(req.parameters.get(deviceInfoIdString), on: req.db) else {
            throw Abort(.notFound)
        }
        try await deviceInfoModel.delete(on: req.db)
        return .noContent
    }
}
