// OP1: insertMany() — insert all 3 documents from sample_documents.json

db.products.insertMany([
{
   "product_id":"E1001",
   "name":"Sony 55 inch 4K Smart TV",
   "category":"Electronics",
   "brand":"Sony",
   "price":64999,
   "warranty_years":2,
   "specifications":{
      "display_size":"55 inch",
      "resolution":"4K UHD",
      "voltage":"220-240V",
      "connectivity":[
         "WiFi",
         "Bluetooth",
         "HDMI",
         "USB"
      ],
      "smart_features":[
         "Netflix",
         "YouTube",
         "Prime Video"
      ]
   },
   "dimensions":{
      "width_cm":123,
      "height_cm":71,
      "weight_kg":14.5
   },
   "ratings":{
      "average":4.6,
      "reviews_count":1520
   }
},
{
   "product_id":"P2001",
   "name":"Men's Slim Fit Casual Shirt",
   "category":"Clothing",
   "brand":"Levi's",
   "price":3000,
   "material":"Cotton",
   "sizesAvailable":[
      "S",
      "M",
      "L",
      "XL"
   ],
   "colors":[
      "Blue",
      "Black"
   ],
   "fitDetails":{
      "fit":"Slim",
      "sleeve":"Full Sleeve",
      "collar":"Spread Collar"
   },
   "careInstructions":[
      "Machine wash cold",
      "Do not bleach"
   ],
   "ratings":{
      "average":4.3,
      "reviews":524
   },
   "tags":[
      "casual",
      "menswear",
      "shirt"
   ]
},
{
   "product_id":"P3001",
   "name":"Organic Basmati Rice",
   "category":"Grocery",
   "brand":"India Gate",
   "price":999,
   "weight":"5kg",
   "origin":{
      "country":"India",
      "state":"Punjab"
   },
   "nutritionalInfo":{
      "servingSize":"100g",
      "calories":130,
      "carbohydrates":"28g",
      "protein":"2.7g",
      "fat":"0.3g"
   },
   "packaging":{
      "type":"Resealable Bag",
      "expiryMonths":12
   },
   "certifications":[
      "Organic",
      "Non-GMO"
   ],
   "ratings":{
      "average":4.5,
      "reviews":910
   }
}
]);


// OP2: find() — retrieve all Electronics products with price > 20000

db.products.find({
   category: "Electronics",
   price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01

db.products.find({
  category: "Grocery",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product

db.products.updateOne(
   { product_id: "E1001" },
   { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field and explain why

db.products.createIndex({ category: 1 });

/*
Explanation :

createIndex() method is used to create an index on a field in a collection to find matching data.
MongoDB uses this index to find matching document faster instead of scanning the entire collection.
*/
