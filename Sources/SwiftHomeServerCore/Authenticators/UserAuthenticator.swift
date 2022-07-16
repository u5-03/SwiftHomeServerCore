import Vapor
import SwiftHomeCredentials

// Ref: https://docs.vapor.codes/security/authentication/
public struct User: Authenticatable {
    public let name: String
}

public struct UserAuthenticator: AsyncBasicAuthenticator {
    public init() {}

    public func authenticate(
        basic: BasicAuthorization,
        for request: Request
    ) async throws {
        let userCredential = SwiftHomeCredentials.basicAuthentication
        if basic.username == userCredential.id && basic.password == userCredential.password {
            request.auth.login(User(name: "Vapor"))
        }
   }
}
