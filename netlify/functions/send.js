import fetch from "node-fetch";

export async function handler(event, context) {
  if (event.httpMethod !== "POST") {
    return { statusCode: 405, body: "Méthode non autorisée" };
  }

  // Pour test initial, on désactive la vérif d'origine
  // Plus tard tu peux remettre l'Origin check pour bloquer les submissions externes

  const data = event.body;

  // Ton URL de formulaire Un-Static
  const UNSTATIC_URL = "https://forms.un-static.com/forms/6c2d1f338d1dd0f1ba01a94b4b434e07fe598420";

  try {
    const r = await fetch(UNSTATIC_URL, {
      method: "POST",
      body: data,
      headers: { "Content-Type": "application/x-www-form-urlencoded" }
    });

    const text = await r.text(); // récupérer la réponse pour debug
    return {
      statusCode: r.status,
      body: text
    };
  } catch (err) {
    console.error("Erreur Function :", err);
    return { statusCode: 500, body: "Erreur serveur" };
  }
}
