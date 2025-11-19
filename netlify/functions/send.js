import fetch from "node-fetch";

export async function handler(event, context) {
  if (event.httpMethod !== "POST") {
    return { statusCode: 405, body: "Méthode non autorisée" };
  }

  // Supprime la vérification de l'origine pour test initial
  // const ORIGIN = event.headers.origin || "";
  // if (ORIGIN !== "https://tonsite.netlify.app") return { statusCode: 403, body: "Forbidden" };

  const data = event.body;

  const UNSTATIC_URL = "https://forms.un-static.com/forms/6c2d1f338d1dd0f1ba01a94b4b434e07fe598420";

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
