# Database Migration

* Migration tool: Flyway with Gradle
* Migration scripts: /core/src/main/resources/migration/

## Migration with Gradle

```
cd {project root}/dbmigration
gradle flywayMigrate -i -Pflyway.user=xxxx -Pflyway.password=xxxx
```
