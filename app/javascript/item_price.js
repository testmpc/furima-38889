window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = parseInt(inputValue*0.1);
    const addProfitDom = document.getElementById("profit");
    addProfitDom .innerHTML = inputValue - parseInt(inputValue*0.1);
  })
});