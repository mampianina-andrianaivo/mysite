import fetch from "node-fetch";

export async function handler(event, context) {
  // Vérifier méthode POST
  if (event.httpMethod !== "POST") {
    return { statusCode: 405, body: "Méthode non autorisée" };
  }

  const ORIGIN = event.headers.origin || "";
  const EXPECTED = "https://tonsite.netlify.app"; // ← remplace par ton vrai domaine

  // Bloque tout ce qui ne vient pas de ton site
  if (ORIGIN !== EXPECTED) {
    return { statusCode: 403, body: "Forbidden" };
  }

  // Lire le formulaire
  const data = event.body;

  // Vérifier le petit secret
  const parsed = new URLSearchParams(data);
  const sec = parsed.get("sec");

  if (sec !== Buffer.from("tonsite.netlify.app|42").toString("base64")) {
    return { statusCode: 401, body: "Invalid token" };
  }

  // Remplacer par TON URL Un-Static
  const UNSTATIC_URL = "https://forms.un-static.com/forms/6c2d1f338d1dd0f1ba01a94b4b434e07fe598420";

  // Envoyer à Un-Static
  const r = await fetch(UNSTATIC_URL, {
    method: "POST",
    body: data,
    headers: { "Content-Type": "application/x-www-form-urlencoded" }
  });

  return {
    statusCode: r.status,
    body: await r.text(),
  };
}
