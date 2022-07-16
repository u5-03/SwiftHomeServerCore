import Foundation
import SwiftHomeCore

public extension NfcIdModel {
    var asDBModel: NfcIdDBModel {
        return NfcIdDBModel(nfcId: nfcId)
    }
}
