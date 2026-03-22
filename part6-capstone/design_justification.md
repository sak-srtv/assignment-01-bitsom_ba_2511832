### Storage Systems

In this design, different storage systems are used for different goals because each type of data has different requirements. For predicting patient readmission risk, historical treatment data is stored in a relational database such as PostgreSQL or MySQL. This database stores structured information like patient records, diagnoses, medications, and hospital visits. Relational databases are useful because they maintain accurate relationships between tables and ensure data consistency, which is very important in healthcare systems.

To allow doctors to search patient history using plain English questions, a vector database such as FAISS or Pinecone is used. Patient notes and medical records are converted into embeddings (numerical representations of text) and stored in the vector database. When a doctor asks a question like “Has this patient had a cardiac event before?”, the system converts the question into an embedding and finds similar records. This allows the system to understand the meaning of the question instead of just matching keywords.

For monthly management reports, a data warehouse such as Amazon Redshift, Snowflake, or BigQuery is used. The data warehouse stores cleaned and structured data from operational systems. It is designed for running analytical queries, such as calculating bed occupancy rates, department costs, and hospital performance metrics. Using a data warehouse ensures that large reporting queries do not slow down the main hospital systems.

For real-time ICU monitoring, data from medical devices like heart rate monitors and oxygen sensors is streamed continuously. This data can be processed using a streaming platform such as Apache Kafka and stored in a time-series database such as InfluxDB or TimescaleDB. Time-series databases are designed to store large amounts of timestamped data and allow quick analysis of patient vital trends.

### OLTP vs OLAP Boundary

The OLTP (Online Transaction Processing) system includes the operational hospital databases that handle daily activities such as patient registration, treatment records, prescriptions, and doctor updates. These systems are optimized for fast transactions and reliable updates.

The OLAP (Online Analytical Processing) system begins when data from these operational systems is copied into the data warehouse through a data pipeline. Once the data is cleaned and stored in the warehouse, it can be used for reporting, dashboards, and predictive models such as readmission risk analysis. This separation prevents heavy reporting queries from affecting hospital operations.

### Trade-offs

One important trade-off in this design is the complexity of managing multiple data systems. Using several databases such as relational databases, vector databases, data warehouses, and time-series databases increases maintenance effort and integration challenges.

This issue can be reduced by using a central data pipeline and automation tools that manage data movement between systems. Monitoring tools and good data governance can also help ensure data quality and system reliability.