BEGIN;

-- Insertion des émotions
INSERT INTO Emotion (denomination) VALUES 
('Heureux'),
('Triste'),
('Excité'),
('Anxieux');

-- Insertion des portfolios
INSERT INTO Portfolio (titre, nom, prenom, bio) VALUES 
('Portfolio de développement web', 'Durand', 'Alice', 'Développeuse web full-stack spécialisée en JavaScript et Node.js.'),
('Portfolio design graphique', 'Martin', 'Bob', 'Graphiste expérimenté, passionné par le design moderne et minimaliste.');

-- Insertion des utilisateurs
INSERT INTO Utilisateur (nom, prenom, mail, metier, status, id_emotion, id_portfolio) VALUES 
('Durand', 'Alice', 'alice.durand@example.com', 'Développeuse web', 'Actif', 1, 1),
('Martin', 'Bob', 'bob.martin@example.com', 'Graphiste', 'Actif', 2, 2);

-- Insertion des articles
INSERT INTO Article (titre, description, id_utilisateur, id_portfolio) VALUES 
('Les bases du développement JavaScript', 'Introduction aux concepts fondamentaux du JavaScript pour les débutants.', 1, 1),
('Tendances du design en 2023', 'Exploration des tendances actuelles en design graphique.', 2, 2);

-- Insertion d'images pour les articles
INSERT INTO Images_article (chemin, id_article) VALUES 
('/images/articles/javascript.jpg', 1),
('/images/articles/design_trends.jpg', 2);

-- Insertion des projets
INSERT INTO Projet (titre, type, logo, description, lien, status, id_portfolio) VALUES 
('Application de gestion de tâches', 'Application web', '/logos/todo_app.png', 'Une application pour gérer les tâches au quotidien', 'https://github.com/alice/todo-app', 'En cours', 1),
('Portfolio de design', 'Site web', '/logos/portfolio_design.png', 'Mon portfolio personnel de projets de design', 'https://bobdesigns.com', 'Complet', 2);

-- Insertion d'images pour les portfolios
INSERT INTO Images_portfolio (chemin, id_projet) VALUES 
('/images/portfolios/todo_screenshot.jpg', 1),
('/images/portfolios/portfolio_preview.jpg', 2);

-- Insertion d'adresses email pour la newsletter
INSERT INTO Newsletter (email, confirme) VALUES 
('contact@example.com', true),
('newsletter@example.com', false);

COMMIT;
