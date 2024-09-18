-- name: CreateUser :one
INSERT INTO "user" (name, email, company_id) VALUES ($1, $2, $3) RETURNING *;


-- name: GetUser :one
SELECT * FROM "user" WHERE id = $1;


-- name: GetUsers :many
SELECT * FROM "user";


-- name: UpdateUser :one
UPDATE "user" SET name = $1, email = $2, company_id = $3 WHERE id = $4 RETURNING *;


-- name: CreateCompany :one
INSERT INTO "company" (name, address) VALUES ($1, $2) RETURNING *;


-- name: GetCompany :one
SELECT * FROM "company" WHERE id = $1;


-- name: GetCompanies :many
SELECT * FROM "company";