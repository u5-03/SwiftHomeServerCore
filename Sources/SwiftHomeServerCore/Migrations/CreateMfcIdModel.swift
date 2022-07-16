import Fluent

// if struct name suffix is `~Id`, `vapor run migrate` command can't find this struct.
public struct CreateMfcIdModel: AsyncMigration {

    public init() {}

    public func prepare(on database: Database) async throws {
        try await database.schema(NfcIdDBModel.schema)
            .id()
            .field(NfcIdModelFields.nfcId.rawValue, .string, .required)
            .create()
    }

    public func revert(on database: Database) async throws {
        try await database.schema(NfcIdDBModel.schema).delete()
    }
}
