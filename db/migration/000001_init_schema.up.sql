CREATE TABLE "contacts"(
    "contact_id" UUID NOT NULL DEFAULT (uuid_generate_v4()),
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "phone_number" VARCHAR NOT NULL,
    "street" VARCHAR NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP NOT NULL,
    CONSTRAINT "contacts_pkey" PRIMARY KEY("contact_id")
);

-- CREATE UNIQUE INDEX ON "contacts" ("phone_number");
CREATE UNIQUE INDEX "contacts_phone_number_key" ON "contacts"("phone_number");