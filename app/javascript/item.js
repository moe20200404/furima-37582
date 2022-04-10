window.addEventListener('load',() => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit");
    const addTax = parseInt(inputValue * 0.1, 10);
    addTaxDom.innerHTML = addTax
    addProfitDom.innerHTML = parseInt(inputValue - addTax)
  });
});