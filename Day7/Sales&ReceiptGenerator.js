const sales = [
    { item: "Laptop", quantity: 2, price: 800 },
    { item: "Monitor", quantity: 1, price: 150 },
    { item: "Mouse", quantity: 4, price: 25 }
];

const orderedItems = [
    { item: "Espresso", quantity: 3, price: 5 },
    { item: "Latte", quantity: 2, price: 4 },
    { item: "Capuccino", quantity: 1, price: 3.50 }
];

function calculateTotalSales(sales) {
    let total = 0;
    for (let i = 0; i < sales.length; i++) {
        total += sales[i].quantity * sales[i].price;
    }
    return total;
}

console.log("Total Sales Amount:", calculateTotalSales(sales)); 

function generateReceipt(orderedItems) {
  let total = 0;
  console.log("Receipt:");
  console.log("----------------------");
    for (let i = 0; i < orderedItems.length; i++) {
        const itemTotal = orderedItems[i].quantity * orderedItems[i].price;
        total += itemTotal;
        console.log(`${orderedItems[i].item} - Quantity: ${orderedItems[i].quantity}, Price: $${orderedItems[i].price}, Total: $${itemTotal}`);
    }
    console.log("----------------------");
    console.log(`Grand Total: $${total}`);

}

generateReceipt(orderedItems);
