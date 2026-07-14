// Einfacher Klickzähler in TypeScript
let count: number = 0;

const button = document.getElementById('counter-btn') as HTMLButtonElement | null;
const text = document.getElementById('counter-text') as HTMLParagraphElement | null;

if (button && text) {
  button.addEventListener('click', () => {
    count++;
    text.textContent = `Klicks: ${count}`;
  });
} else {
  console.error("HTML-Elemente wurden nicht gefunden!");
}