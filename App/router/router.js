import { Router } from "express";
import portfolioController from "../Controllers/controlleur.portfolio.js";

const router = Router();

// Exemple de route GET


router.get("/", portfolioController.all);
router.get("/travaux", portfolioController.travaux);





export default router;
