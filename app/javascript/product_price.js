window.addEventListener('load', () => {
  const priceInput = document.getElementById("product-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const valueResult = inputValue * 0.1
    
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(valueResult))

    const profitNumber = document.getElementById("profit");
    profitNumber.innerHTML = (Math.floor(inputValue - valueResult));
  })
});

