import express from 'express';
import path from 'path';
import router from './router/router.js'

const app = express();

// Configuration du moteur de vues EJS
app.set('view engine', 'ejs');
app.set('views', path.join(process.cwd(), 'views'));

// Middleware pour les fichiers statiques
app.use(express.static(path.join(process.cwd(), 'App/Public')));

// Utilisation du router
app.use(router);

export default app;
