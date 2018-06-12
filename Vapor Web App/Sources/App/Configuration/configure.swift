import FluentMySQL
import Vapor

public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    try services.register(FluentMySQLProvider())
    
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    var middlewares = MiddlewareConfig()
    //middlewares.use(DateMiddleware.self)
    middlewares.use(ErrorMiddleware.self)
    services.register(middlewares)

    var databases = DatabasesConfig()
    let config = MySQLDatabaseConfig(hostname: "localhost", username: "root", password: "yourpassword", database: "chatter")
    databases.add(database: MySQLDatabase(config: config), as: .mysql)
    services.register(databases)

    var migrations = MigrationConfig()
    migrations.add(model: User.self, database: .mysql)
    services.register(migrations)
}
