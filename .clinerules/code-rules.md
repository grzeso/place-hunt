# Code Rules

## 1. Basics
- `declare(strict_types=1);`
- PSR-12, PHP CS Fixer, PHPStan
- Use types and typed properties
- One class = one file

## 2. Controllers
- Thin layer: accept Request → delegate to service → return Response
- No business logic
- Routing attributes

## 3. Services
- Business logic only
- Constructor injection
- No `container->get()` in the code

## 4. Doctrine
- Minimal entities, private fields
- Repository for queries
- Migrations required
- Short transactions

## 5. Validation and DTO
- Use DTO instead of passing entities from Request
- Validator Component

## 6. Errors and Logs
- Throw specific exceptions
- Monolog with proper log levels

## 7. Security
- Hash passwords using PasswordHasher
- Voters for authorization
- Secrets via `.env` / `symfony secrets`

## 8. Configuration
- `config/packages` and `packages/prod`
- Dynamic data as env vars

## 9. Tests
- PHPUnit: unit and functional tests
- Coverage of key paths

## 10. Performance
- OPcache, preload
- HTTP cache and Redis
- Profiling in dev

## 11. PR Checklist
- Tests passing
- PHPStan with no errors
- Linter OK
- Migrations included
- Request → DTO conversion correct