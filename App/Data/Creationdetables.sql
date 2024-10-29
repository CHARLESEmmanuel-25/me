BEGIN;

-- Suppression des tables si elles existent
DROP TABLE IF EXISTS "article" CASCADE;
DROP TABLE IF EXISTS "images_a" CASCADE;
DROP TABLE IF EXISTS "images_p" CASCADE;
DROP TABLE IF EXISTS "newsletter" CASCADE;
DROP TABLE IF EXISTS "portfolio" CASCADE;
DROP TABLE IF EXISTS "projet" CASCADE;

-- Création des tables
CREATE TABLE "article" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "titre" TEXT,
    "description" TEXT,
    "code_portfolio" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "images_a" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "chemin" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "images_p" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "chemin" TEXT,
    "code_projet" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "newsletter" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "email" TEXT,
    "confirme" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "portfolio" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "titre" TEXT,
    "nom" TEXT,
    "prenom" TEXT,
    "bio" TEXT,
    "code_abonee" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE "projet" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "titre" TEXT,
    "image" TEXT,
    "logo" TEXT,
    "description" TEXT,
    "technologie" TEXT,
    "lien" TEXT,
    "code_portfolio" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ
);

-- Réinitialisation des séquences
ALTER SEQUENCE "article_id_seq" RESTART WITH 1;
ALTER SEQUENCE "images_a_id_seq" RESTART WITH 1;
ALTER SEQUENCE "images_p_id_seq" RESTART WITH 1;
ALTER SEQUENCE "newsletter_id_seq" RESTART WITH 1;
ALTER SEQUENCE "portfolio_id_seq" RESTART WITH 1;
ALTER SEQUENCE "projet_id_seq" RESTART WITH 1;

COMMIT;
