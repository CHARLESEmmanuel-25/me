BEGIN;

-- Supprimer les tables si elles existent
DROP TABLE IF EXISTS Images_portfolio;
DROP TABLE IF EXISTS Images_article;
DROP TABLE IF EXISTS Article;
DROP TABLE IF EXISTS Utilisateur;
DROP TABLE IF EXISTS Portfolio;
DROP TABLE IF EXISTS Projet;
DROP TABLE IF EXISTS Emotion;
DROP TABLE IF EXISTS Newsletter;

-- Création des tables

CREATE TABLE Emotion (
   id SERIAL PRIMARY KEY,
   denomination TEXT,
   created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMPTZ
);

CREATE TABLE Portfolio (
   id SERIAL PRIMARY KEY,
   titre TEXT,
   nom TEXT,
   prenom TEXT,
   bio TEXT,
   created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMPTZ
);

CREATE TABLE Utilisateur (
   id SERIAL PRIMARY KEY,
   nom TEXT,
   prenom TEXT,
   mail TEXT,
   metier TEXT,
   status TEXT,
   id_emotion INT NOT NULL REFERENCES Emotion(id),
   id_portfolio INT NOT NULL REFERENCES Portfolio(id),
   created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMPTZ
);

CREATE TABLE Article (
   id SERIAL PRIMARY KEY,
   titre TEXT,
   description TEXT,
   id_utilisateur INT NOT NULL REFERENCES Utilisateur(id),
   id_portfolio INT NOT NULL REFERENCES Portfolio(id),
   created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMPTZ
);

CREATE TABLE Images_article (
    id SERIAL PRIMARY KEY,
    chemin TEXT,
    id_article INT NOT NULL REFERENCES Article(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ
);

CREATE TABLE Projet (
   id SERIAL PRIMARY KEY,
   titre TEXT,
   type TEXT,
   logo TEXT,
   description TEXT,
   lien TEXT,
   status TEXT,
   id_portfolio INT NOT NULL REFERENCES Portfolio(id),
   created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMPTZ
);

CREATE TABLE Images_portfolio (
   id SERIAL PRIMARY KEY,
   chemin TEXT,
   id_projet INT NOT NULL REFERENCES Projet(id),
   created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMPTZ
);

CREATE TABLE Newsletter (
   id SERIAL PRIMARY KEY,
   email TEXT,
   confirme BOOLEAN,  -- Utilisation d'un type booléen pour confirmer l'email
   created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMPTZ
);

COMMIT;
