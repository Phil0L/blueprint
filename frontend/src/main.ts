const BACKEND_URL = `/api/clicks`;

const button = document.getElementById('counter-btn') as HTMLButtonElement | null;
const text = document.getElementById('counter-text') as HTMLParagraphElement | null;

// Funktion zum Abrufen des aktuellen Klickstands vom Server
async function fetchClicks() {
  try {
    const response = await fetch(BACKEND_URL);
    const data = await response.json();
    updateUI(data.clicks);
  } catch (error) {
    console.error('Fehler beim Abrufen der Klicks:', error);
  }
}

// Funktion zum Erhöhen des Klickstands im Backend
async function incrementClicks() {
  try {
    const response = await fetch(BACKEND_URL, { method: 'POST' });
    const data = await response.json();
    updateUI(data.clicks);
  } catch (error) {
    console.error('Fehler beim Erhöhen der Klicks:', error);
  }
}

function updateUI(clicks: number) {
  if (text) {
    text.textContent = `Klicks auf dem Server: ${clicks}`;
  }
}

// Event-Listener registrieren und initialen Stand laden
if (button && text) {
  button.addEventListener('click', incrementClicks);
  fetchClicks(); // Beim Laden der Seite aktuellen Stand holen
} else {
  console.error("HTML-Elemente wurden nicht gefunden!");
}