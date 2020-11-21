window.addEventListener('load', () => {
  const priceInput = document.getElementById("product-price");
  priceInput.addEventListener("input", () => {
    console.log("イベント発火")
  })
});

