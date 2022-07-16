import Fluent
import Vapor

public struct NfcIdController: RouteCollection {
    private let nfcIdString = "nfcId"

    public init() {}

    public func boot(routes: RoutesBuilder) throws {
        let nfcIds = routes.grouped("NfcId")
        nfcIds.get(use: index)
        nfcIds.post(use: create)
        nfcIds.group(":\(nfcIdString)") { nfcId in
            nfcId.delete(use: delete)
        }
    }

    public func index(req: Request) async throws -> [NfcIdDBModel] {
        try await NfcIdDBModel.query(on: req.db).all()
    }

    public func create(req: Request) async throws -> NfcIdDBModel {
        let nfcId = try req.content.decode(NfcIdDBModel.self)
        try await nfcId.save(on: req.db)
        return nfcId
    }

    public func delete(req: Request) async throws -> HTTPStatus {
        guard let nfcId = try await DeviceInfoDBModel.find(req.parameters.get(nfcIdString), on: req.db) else {
            throw Abort(.notFound)
        }
        try await nfcId.delete(on: req.db)
        return .noContent
    }
}
