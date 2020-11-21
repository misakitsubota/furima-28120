window.addEventListener('load', () => {
  const priceInput = document.getElementById("product-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = "(InputValue * 0.1)"
  })
});

