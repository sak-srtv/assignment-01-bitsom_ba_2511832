 ## Database Recommendation

To build a patient management system, I would prefer to go with MYSQL.
Since a healthcare system manages important data related to patients, 
like patient record, prescriptions, billing information and medical 
history. This system requires cosistent and reliable data transactions.

MYSQL follows ACID (Automaticity, Consistency, Isolation and Durability) 
which ensures data remains complete and valid. 
In contrast BASE model prioritizes scalability and availability over consistency
ACID is important in healthcare system where inconsistent data can cause
serious consequences on patients care. 

Now if the system needs to have fraud detection module as well which requires
processing of large volume of transactional or behavioral data. Also it may require
high scalability and flexible schemas, which NoSQL databases like MongoDB 
handles well. 

## Conclusion -

For patient management system bettter choice sould be MYSQL where consistency is important
For fraud detection where scalability is required, NoSQL database can be used.