import express from 'express';
import cors from 'cors';
import { DOTENV } from './const.js';

const app = express();
const PORT = DOTENV.BACKEND_PORT || 5000;

// CORS erlauben, damit das Frontend (z.B. auf Port 8080) anfragen darf
app.use(cors());
app.use(express.json());

// Einfacher In-Memory-Speicher für die Klicks
let clickCount = 0;

// GET: Klickstand abfragen
app.get('/api/clicks', (req, res) => {
  res.json({ clicks: clickCount });
});

// POST: Klickstand erhöhen
app.post('/api/clicks', (req, res) => {
  clickCount++;
  res.json({ clicks: clickCount });
});

app.listen(PORT, () => {
  console.log(`Backend started at http://localhost:${PORT}`);
});