import client from "../Config/client.js";

const datamapper = {
    findPortfolio: async () => {
    try {
      const res = await client.query("SELECT * FROM portfolio");
      return res.rows;
    } catch (error) {
      console.error("Erreur lors de l'exécution de la requête find :", error);
      throw error; // Laisse l'erreur remonter pour la gérer dans le contrôleur
    }
  },

  findUtilisateur: async () => {
    try {
      const res = await client.query("SELECT * FROM utilisateur");
      return res.rows;
    } catch (error) {
      console.error("Erreur lors de l'exécution de la requête find :", error);
      throw error; // Laisse l'erreur remonter pour la gérer dans le contrôleur
    }
  },

  findProjet: async()=>{
    const res = await client.query("select * from projet");
      return res.rows;
  }
};

export default datamapper;
