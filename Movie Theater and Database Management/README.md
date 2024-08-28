Movie Theater and Database Management

Business Problem Overview

A movie theater chain faced several challenges related to the management of movie screenings and the integrity of its movie database. The issues included:

Data Retrieval:

Difficulty in extracting specific movie details and theater information for operational decisions. Screening Management:

Need for identifying theaters that were not currently showing any movies, as well as movies that were not being screened at any theater. Data Update and Maintenance:

Requirements for updating unrated movies, adding new movies, and maintaining the accuracy of theater records, particularly those showing movies with certain ratings. Data Cleanup:

Necessity to remove theaters from the database that were showing movies with an NC-17 rating to comply with content guidelines. Solution Overview To address these challenges, a series of SQL queries and operations were designed and implemented. These solutions provided the ability to:

Retrieve and Analyze Data:

Extract movie titles, distinct ratings, and identify unrated movies in the database. Manage Theater Screenings:

Identify theaters not currently showing any movies and retrieve comprehensive data on theaters and the movies they are showing. Update Database Records:

Add new movies to the database, update the ratings of unrated movies, and clean up data related to theaters showing restricted content. Cleanup and Compliance:

Remove records of theaters showing movies rated NC-17 to ensure compliance with company policies. SQL Queries and Operations

Data Retrieval:
Retrieve All Movie Titles:

Screening Management:
Select Theaters Not Showing Any Movies:

Database Updates and Maintenance:
Add a New Unrated Movie:

Data Cleanup and Compliance:
Remove Theaters Showing "NC-17" Rated Movies:

Business Impact By implementing these SQL queries and operations, the organization achieved:

Enhanced Data Accuracy:

Ensured all movie and theater information is accurate and up-to-date, improving decision-making. Improved Theater Management:

Provided better visibility into theater operations, leading to more efficient scheduling and resource allocation. Streamlined Data Maintenance:

Simplified the process of updating movie ratings and adding new movies, ensuring data consistency. Compliance with Content Policies:

Ensured that theaters screening restricted content were removed from the database, maintaining compliance with company policies. How to Use Database Setup:

Ensure that the Movies and MovieTheaters tables are properly created and populated with relevant data. Run Queries:

Execute the provided SQL statements in your database management system to manage and clean up movie and theater data. Review Results:

Analyze the outputs to ensure that they align with business requirements, and make adjustments if necessary. Contribution Feedback and contributions are encouraged to further refine these solutions. Please submit any issues or enhancements.

Contact For any questions or further information, please contact:

Name: Yash Sinha

Email: yashsinha12354@gmail.com
