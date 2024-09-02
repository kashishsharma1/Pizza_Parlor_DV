
**Scenario: Pizza Parlor Data Vault Implementation**
# Pizza_Parlor_DV
Data Vault 2.0 data modelling technique used to implement a Pizza Parlor Scenario.


 **Business Context:**
A rapidly growing pizza parlor is expanding its operations. The business management wants to implement a robust data warehousing solution to centralize data from various sources, including customer orders, pizza ingredients, and overall business operations. The goal is to enable comprehensive analysis and reporting on customer behavior, order trends, inventory management, and sales performance.

#### **Business Requirements:**
1. **Centralized Data Management:**
   - Consolidate data from multiple operational systems, including the POS (Point of Sale) systems at various locations, the inventory management system, and the customer loyalty program.
   - Enable the analysis of customer ordering patterns, preferences, and trends across different locations.
   
2. **Historical Data Tracking:**
   - Track changes in customer information, order details, and ingredient usage over time.
   - Maintain a historical record of all transactions to enable time-series analysis, trend forecasting, and compliance reporting.
   
3. **Scalable and Flexible Architecture:**
   - Implement a scalable data model that can grow with the business as it adds new locations, expands its menu, or changes its business processes.
   - Allow for easy integration of new data sources without disrupting the existing data warehouse.

4. **Data Integrity and Auditability:**
   - Ensure that all data transformations and movements are traceable and auditable.
   - Implement a system where data lineage from source systems to final reports is transparent and verifiable.

5. **Enhanced Reporting and Analytics:**
   - Provide the ability to create detailed reports on customer demographics, popular pizza combinations, ingredient usage, and order fulfillment times.
   - Enable advanced analytics such as predictive modeling for inventory management, customer segmentation, and sales forecasting.

#### **Data Sources:**
1. **Customer Data:**
   - Information about customers, including their contact details, loyalty program information, and order history.
   
2. **Order Data:**
   - Details of customer orders, including order ID, order date, items ordered, quantities, and total cost.
   
3. **Pizza Data:**
   - Information about the different types of pizzas offered, including their names, prices, and ingredients used.

4. **Ingredient Data:**
   - Details about the ingredients used in pizzas, including their names, quantities in stock, and suppliers.

5. **Order Items Data:**
   - Specific items ordered within each order, including the pizza ID and quantity.

6. **Pizza Ingredient Data:**
   - Information about which ingredients are used in each pizza.

#### **Data Vault 2.0 Implementation:**

**Hubs:**
- **Customer Hub (`CUSTOMER_HUB`):** Stores unique customer identifiers (hashed `CUSTOMER_ID`), tracking customer-related changes over time.
- **Order Hub (`ORDER_HUB`):** Captures unique order identifiers (hashed `ORDER_ID`), maintaining the history of each order.
- **Pizza Hub (`PIZZA_HUB`):** Holds unique identifiers for pizzas (hashed `PIZZA_ID`), allowing for historical tracking of pizza-related data.
- **Ingredient Hub (`INGREDIENT_HUB`):** Maintains unique identifiers for ingredients (hashed `INGREDIENT_ID`).

**Links:**
- **Customer-Order Link (`CUSTOMER_ORDER_LINK`):** Establishes the relationship between customers and their orders using hash keys (`CUSTOMER_HK`, `ORDER_HK`).
- **Order-Pizza Link (`ORDER_PIZZA_LINK`):** Connects orders to the specific pizzas ordered.
- **Pizza-Ingredient Link (`PIZZA_INGREDIENT_LINK`):** Ties pizzas to the ingredients used, allowing for detailed tracking of ingredient usage in different pizzas.

**Satellites:**
- **Customer Satellite (`CUSTOMERDETAILS_SAT`):** Stores descriptive attributes related to customers, such as their name, email and phone number.
- **Order Satellite (`ORDERDETAILS_SAT`):** Captures details about orders, including the order date, status, and total cost.
- **Pizza Satellite (`PIZZADETAILS_SAT`):** Stores attributes related to pizzas, such as name, price, and description.
- **Ingredient Satellite (`INGREDIENTDETAILS_SAT`):** Contains information about ingredients, such as ingredient name, quantity in stock, and supplier information.
- **Order-Pizza link's Satellite (`ORDERPIZZADETAILS_SAT`):** Contains information about pizzas in a order, such as quantity and item total.

### **Outcome:**
This Data Vault 2.0 model provides a robust, scalable, and flexible architecture that centralizes the pizza parlor's data, ensures historical tracking, and enhances data integrity and auditability. It enables the pizza parlor to perform detailed analysis and reporting, supporting decision-making processes and business growth.
