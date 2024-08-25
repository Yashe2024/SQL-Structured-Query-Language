Managing a Product Inventory and Pricing Strategy for an Electronics Store
Introduction:
The following SQL queries are part of a database management task for an electronics store that aims to effectively manage its product inventory, manufacturers' data, and pricing strategy. The queries cover a range of functionalities, including product listing, price analysis, and manufacturer relationships, helping the store make informed business decisions.

1. Inventory Listing and Product Details:
Listing All Products: The store begins by listing all the products available in the inventory to maintain an organized view of the current offerings. This includes the names of all products (Query 1.1) and extends to include both names and prices (Query 1.2).

Price-Based Filtering: Products are then filtered based on price, identifying those within specific price ranges (Queries 1.3 and 1.4). This is crucial for understanding the distribution of product prices, which can inform promotional strategies and stock management.

2. Price Analysis:
Price in Cents: The store calculates the price of each product in cents (Query 1.5) to facilitate easier comparison and potential pricing strategies, such as discounts or bundling offers.

Average Price Calculation: To gain insights into pricing, the store computes the average price of all products (Query 1.6). This information helps in setting competitive prices and understanding market positioning.

Manufacturer-Specific Pricing: The store examines the average price of products from specific manufacturers (Query 1.7), enabling targeted pricing strategies based on manufacturer reputation or quality.

3. Price Threshold and Sorting:
High-Price Product Count: Identifying the number of products priced above a certain threshold ($180) helps the store focus on premium products (Query 1.8), which are likely to have higher profit margins.

Sorted Product Listing: Products priced above $180 are listed and sorted by price in descending order, then by name in ascending order (Query 1.9). This helps the store easily identify and highlight premium products in marketing materials or online listings.

4. Manufacturer Integration and Analysis:
Manufacturer Data Integration: A comprehensive list of products, including details about their manufacturers, is generated (Queries 1.10 and 1.11). This integration is crucial for supply chain management and for customers who prefer specific brands.

Average Price by Manufacturer: The store calculates the average price of products for each manufacturer (Queries 1.12 and 1.13), providing insights into the value offered by different manufacturers. This data can influence stock decisions and negotiations with suppliers.

High-Value Manufacturers: Identifying manufacturers whose products have an average price above $150 (Query 1.14) helps the store align with premium brands, enhancing its brand image.

5. Product-Specific Insights:
Cheapest Product Identification: The store identifies the cheapest product (Query 1.15) to focus on budget offerings and potentially increase sales volume through promotions.

Most Expensive Product by Manufacturer: The most expensive product from each manufacturer is identified (Query 1.16), which helps in highlighting high-end products in marketing campaigns and promotional activities.

6. Inventory Management and Price Adjustments:
Adding New Products: A new product, Loudspeakers, is added to the inventory (Query 1.17), keeping the product lineup fresh and catering to changing customer demands.

Product Updates: The store updates product details, such as renaming a product (Query 1.18), ensuring the inventory reflects the latest offerings and correct product information.

Price Discounts: A 10% discount is applied across all products (Query 1.19), as well as selectively on products priced at $120 or above (Query 1.20), to stimulate sales, clear out old inventory, or match competitor pricing.

Conclusion:
Through these queries, the electronics store can effectively manage its product inventory, perform detailed price analysis, and make informed decisions on pricing and product updates. This structured approach ensures that the store remains competitive, meets customer demands, and maintains healthy profit margins.
