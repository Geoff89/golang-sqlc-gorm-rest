-- name: CreateContact :one
INSERT INTO contacts(
    first_name,
    last_name,
    phone_number,
    street,
    created_at,
    updated_at
) VALUES (
    $1, $2, $3, $4, $5, $6
) RETURNING *;

-- name: GetContactById :one
SELECT * FROM contacts
WHERE contact_id = $1 LIMIT 1;

-- name: ListContacts :many
SELECT * FROM contacts
ORDER BY contact_id
LIMIT $1
OFFSET $2;

-- name: UpdateContact :one
UPDATE contacts
SET
first_name = coalesce(sqlc.narg('first_name'), first_name),
last_name = coalesce(sqlc.narg('last_name'), last_name),
phone_number = coalesce(sqlc.narg('phone_number'), phone_number),
street = coalesce(sqlc.narg('street'), street),
updated_at = coalesce(sqlc.narg('updated_at'), updated_at)
WHERE contact_id = sqlc.arg('contact_id')
RETURNING *;

-- name: DeleteContact :exec
DELETE FROM contacts
WHERE contact_id = $1;