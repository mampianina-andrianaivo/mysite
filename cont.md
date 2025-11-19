## Contact

<form id="contactForm">
  <input type="text" name="name" placeholder="Entrer votre nom" required>
  <input type="email" name="email" placeholder="Entrer votre adresse e-mail" required>
  <textarea name="message" required></textarea>

  <input type="text" name="honeypot" style="display:none">

  <button type="submit">Envoyer</button>
</form>

<p id="status"></p>

<script>
document.getElementById("contactForm").addEventListener("submit", async (e) => {
  e.preventDefault();

  const form = new FormData(e.target);

  // Petit secret (généré côté client, pas devinable)
  form.append("sec", btoa(location.hostname + "|42"));

  const res = await fetch("/.netlify/functions/send", {
    method: "POST",
    body: form,
  });

  document.getElementById("status").innerText =
    res.ok ? "Envoyé ✔️" : "Erreur ❌";
});
</script>

Make it true

<center>2025 Andrianaivo</center>



