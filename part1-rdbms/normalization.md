## ANOMALY ANALYSIS
<!-- ---------------- -->

* INSERT ANOMALY :

Insert anomaly happens when user is not able to add a new information about one entity
without inserting un-related data

For Example - 

Here I am considering customer_id, order_id and product_id as required fields.
Suppose I want to add a new customer to the database. I will not be able to add a 
new customer who has not placed any order yet.

<!-- --------------------------------------------------------------------- -->

* UPDATE ANOMALY :

Update anamaly happens when the same information is exisiting in multiple rows and updating only one row 
may cause incosistency in data. So all the rows must be updated with the same information

  ### Query : SELECT * FROM orders_flat order by customer_name, customer_email

For Example - 

Suppose I want to update the customer city of "Amit Verma" from "Bangalore" to "Mysore", I should update
all city information of Amit Verma. If any of the city for Amit Verma remains old, the database will have
inconsistent data

<!-- --------------------------------------------------------------------- -->

* DELETE ANOMALY :

Delete anomaly happens when deleting one row deletes other important information

For Example -

 ### Query :  SELECT * FROM orders_flat where product_id = "P008";

Suppose I try to delete the data for product id - POO8 which exists only once 
All the information related to product P008 will get deleted or disappear from the DB. 
So deleting the order will remove the product information


<!-- ================================================================================= -->


## NORMALIZATION JUSTIFICATION
<!-- ---------------------- -->

Keeping all the data in one table can create problem in managing the data. It can create data redundancy 
and anomalies. So normalization should be preferred.

For example - Lets consider Insert Anomaly scenario. Consider a new product is added but it was not ordered
yet. So there is no way to insert this product in orders_flat table as it requires order related mandatory
data (order_id, customer_id). Hence, it will not be feasible to add new product detail in this case.

Now lets consider Update Anomaly scenario. Suppose a customer has placed multiple orders so customer data like
customer_name, customer_email, customer_city will be repeated for every order placed and hence creates update
anomaly. If the customer tries to change their city, the update should be done for every row where that customer 
exists. If my mistake any one row is missed , the data will become inconsistent.

Similary for  Delete Anomaly case , lets say there is an order with one product existing in orders_flat
table. So if user deletes that order , that particular product information is lost from the database. This is
loss of data.
