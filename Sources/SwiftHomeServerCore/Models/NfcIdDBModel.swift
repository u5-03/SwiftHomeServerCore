import Fluent
import Vapor

public enum NfcIdModelFields: FieldKey {
    case nfcId
}

public final class NfcIdDBModel: Model, Content {
    public static let schema = "NfcId"

    @ID(key: .id)
    public var id: UUID?

    @Field(key: NfcIdModelFields.nfcId.rawValue)
    public var nfcId: String

    public init() { }

    public init(nfcId: String) {
        id = UUID()
        self.nfcId = nfcId
    }
}
