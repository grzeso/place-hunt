# Tech Stack

- **PHP 8.3**
- **Framework:** Symfony 7.3
- **Google Maps**
- **MySQL 8**
- **Twig**

---

# PRD — QR Scan Points Website

## Project Goal
A hobbyist gamified web application: users earn **1 point** for scanning a unique QR code placed in a physical location in Europe.

## Roles

### User
- registration, login
- map browsing
- QR scanning
- view of visited/not visited points (green/red)
- point details view

### Administrator
- full CRUD of points
- setting name, description, location (country, city, address, coordinates)
- adding a place photo
- activating/deactivating a point
- generating and downloading a QR with a unique token

## Main Flow
1. Admin creates a point.
2. Backend generates a **unique 30-character token (A–Z, a–z, 0–9)**.
3. The token is added to the link in the QR code.
4. User scans the QR → lands on the point’s page.
5. If logged in and no previous visit → receives a point (only once).
6. The dashboard marks the point as **green**.

## MVP — Key Features

### For the User
- registration (name + email) and login (email + password)
- public page with a map of active points
- dashboard with map and list of visited/not visited points
- list sorting (country, visit date)
- point details: name, description, photo, location, status

### For the Admin
- login panel
- CRUD of points
- on-demand QR generation
- point attributes: name, description, location, photo, activity, referral link

## Technology / Requirements
- responsive frontend (desktop + mobile)
- Map: **Google Maps (MVP)**, option to migrate to OSM/Leaflet
- Backend: auth, token generation, QR handling, visit history, admin panel, CRUD
- Prepared for i18n (MVP in PL)

## Acceptance Criteria
- QR always points to the correct location
- A point can only be earned once
- Dashboard correctly shows visited/not visited
- Deactivation instantly hides the point

## Out of MVP
- user geolocation
- rewards
- social login
- multilingual support (beyond PL)
- data export

---

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
