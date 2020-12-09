// const pay = () => {
//   Payjp.setPublicKey("pk_test_c49ed170c7cfc1ac4d82d8cf");
//   const form = document.getElementById("charge-form");
//   form.addEventListener("commit", (e) => {
//     e.preventDefault();
    
//     const formResult = document.getElementById("charge-form");
//     const formData = new FormData(formResult);

//     const card = {
//       number: formData.get("product_transaction[number]"),
//       cvc: formData.get("product_transaction[cvc]"),
//       exp_month: formData.get("product_transaction[exp_month]"),
//       exp_year: `20${formData.get("product_transaction[exp_year]")}`,
//     };

//     Payjp.createToken(card, (status, response) => {
//       if (status == 200) {
//         const token = response.id;
//         console.log(token)
//       }
//     });
//   });
// };

// window.addEventListener("load", pay);
