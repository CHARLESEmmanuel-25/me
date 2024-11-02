import datamapper from "../Model/DataMapper.js";
import { format } from 'date-fns';
import moment from "moment";

const portfolioController = {
  // Fonction utilitaire pour obtenir les informations des utilisateurs
  _getUtilisateurInfo: async () => {
    const utilisateurs = await datamapper.findUtilisateur();
    return utilisateurs.map(utilisateur => ({
      id: utilisateur.id,
      nom: utilisateur.nom,
      prenom: utilisateur.prenom,
      metier: utilisateur.metier,
      status: utilisateur.status,
      techno: utilisateur.techno,
      photo: utilisateur.photo,
      bio: utilisateur.bio,
    }));
  },

  // Route pour afficher tous les utilisateurs sur la page d'accueil
  all: async (req, res) => {
    try {
      const utilisateurInfo = await portfolioController._getUtilisateurInfo();
      res.render('index', { utilisateurInfo });
    } catch (error) {
      res.status(500).json({
        error: error.message,
        success: false,
      });
    }
  },

  // Route pour afficher les projets avec les informations des utilisateurs
  travaux: async (req, res) => {
    
    try {
      const projets = await datamapper.findProjet();
      console.log(projets);
  
      const projetsInfoFromDB = projets.map(projet => ({
        titre: projet.titre,
        description: projet.description,
        lien: projet.lien,
        image: projet.chemin,
        date: moment(projet.created_at).format('h:mm, D MMMM, YYYY')
       
        // Change le format selon tes besoins
      }));
  
      console.log(projetsInfoFromDB[0].date);
  
      const utilisateurInfo = await portfolioController._getUtilisateurInfo();
  
      res.render('projet', { 
        utilisateurInfo,
        projetsInfoFromDB,
      });
    } catch (error) {
      res.status(500).json({
        error: error.message,
        success: false,
      });
    }
  }
};

export default portfolioController;
