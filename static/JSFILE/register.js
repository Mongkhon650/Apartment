document.querySelectorAll("form").forEach((form) => {
  form.addEventListener("submit", function (event) {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if (password !== confirmPassword) {
      event.preventDefault();
      alert("Passwords do not match");
    }
  });
});

function nextForm(formNumber) {
  const forms = document.getElementsByTagName("form");
  for (let i = 0; i < forms.length; i++) {
    forms[i].style.display = "none";
  }

  if (formNumber === 2) {
    const userType = document.getElementById("userType").value;
    document.getElementById("userType2").value = userType;
  }

  document.getElementById("form" + formNumber).style.display = "block";
}