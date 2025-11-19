<form id="contactForm">
  <input type="text" name="name" placeholder="Entrer votre nom" required>
  <input type="email" name="email" placeholder="Entrer votre adresse e-mail" required>
  <textarea name="message" placeholder="Votre message" required></textarea>

  <!-- honeypot pour les bots -->
  <input type="text" name="honeypot" style="display:none">

  <button type="submit">Envoyer</button>
</form>

<p id="status"></p>

<script>
document.getElementById("contactForm").addEventListener("submit", async (e) => {
  e.preventDefault();

  const form = new FormData(e.target);
  form.append("sec", btoa(location.hostname + "|42")); // petit secret côté client

  try {
    const res = await fetch("/.netlify/functions/send", {
      method: "POST",
      body: form
    });

    const text = await res.text(); // récupère la réponse textuelle
    console.log("Réponse Netlify Function :", text);

    document.getElementById("status").innerText =
      res.ok ? "Envoyé ✔️" : "Erreur ❌";

  } catch (err) {
    console.error("Erreur JS :", err);
    document.getElementById("status").innerText = "Erreur JS ❌";
  }
});
</script>

<center>2025 Andrianaivo</center>
