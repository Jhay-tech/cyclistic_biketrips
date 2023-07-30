## Case Study: How Does a Bike-Share Navigate Speedy Success

Ater the completion of my Google Data Analytics Professional Certificate on Coursera, I was asked to complete this case study. In this case study, I work with a fictional bike-share company called Cyclistic. The objective is to design marketing strategies aimed at converting casual riders into annual members. I was assigned to spot differences in how annual members and casual riders use Cyclistic bikes differently. 

I used Cyclistic historical trip data to determine trends or relationships, and theorise what was causing them. After then, I develop an action plan based on those findings. 

### Introduction 
Cyclistic is a bike-share company with two categories of customers; casual riders (customers who purchase single-ride or full-day passes) and annual members (Customers who purchase annual memberships).
In 2016, Cyclistic launched a successful bike-share oﬀering. Since then, the program has grown to a ﬂeet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

**Characters and teams:**
> 1. **Cyclistic:** A bike-share program that features more than 5,800 bicycles and 600 docking stations.
> 2. **Lily Moreno:** The director of marketing and my manager.
> 3. **Cyclistic marketing analytics team:** A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy.
> 4. **Cyclistic executive team:** The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.

### ASK
**Problem Explanation** <br>
Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. There are 3 questions that will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently? <br>
2. Why would casual riders buy Cyclistic annual memberships? <br>
3. How can Cyclistic use digital media to influence casual riders to become members? <br>

For this project, the director of marketing assigned me to answer the first question (How do annual members and casual riders use Cyclistic bikes differently?).

**Business Task:** <br>
Analyse fictional company (Cyclistic) trip data to spot differences in how annual members and casual riders use Cyclistic bikes differently.

### Prepare
**Data Sources Description:** <br> 
I will be using Cyclistic historical trip data [link](https://divvy-tripdata.s3.amazonaws.com/index.html). It is a public data made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement). It includes Cyclistic historical trip data of customers for each month. The data is organized in folders containing CSV files of the data classified by month and year. Each CSV files have 13 columns, each record represents a trip and each trip is anonymised.<br>
I will be using data from July 2020 to June 2021. <br>
Data-privacy issues prohibit me from using riders’ personally identiﬁable information. This means that I won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes. <br>
In terms of bias and credibility, Cyclistic is a fictional company and the data is a public data, the data is reliable, original, current because it’s updated, comprehensive because not missing essential information required for the analysis and was collected ethically. <br>
Employed both manual and automated processes to verify data integrity.

### Process 
**Tools used:** Excel and R <br>
I downloaded the previous 12 months of Cyclistic trip data from July 2020 to June 2021. Unzip the files, created a folder on my desktop and housed the files. Created subfolders for the .CSV file and the .XLS file so I can have a copy of the original data. I launched Excel, opened each file, and chose to Save As an Excel Workbook file. For each .XLS file, I applied the following process: <br>

1. Changed some column names; **rideable_type** to **ride_type**, **started_at** to **start_datetime**, **ended_at** to **end_datetime**, and **membership_casual** to **customer_type**. <br>
2. Checked for duplicate values using **(Data < remove duplicates < for all columns)**, but no duplicate values. <br>
3. Checked for misspelled values under **bike_type**, **end_station_name**, **start_station_name** and **customer_type** using **(Review < spelling)**, no misspelled values found.<br>

After making these updates for all the 12 files, I saved each .XLS file as a new .CSV file. <br>

Since the datasets are large, I decided to continue my cleaning or manipulation process with **R** programming. <br>
Load data for 6 months due to **R** RAM space (from January 2021 to June 2021). The **R** code related to this step can be accessed here <br>

Continue my data cleaning and manipulation in **R** <br>

4. Changed the format of **start_datetime** and **end_datetime** columns to date and time format using **as.POSIXct() function**. <br>
5. Created new data frame called **cleaned_biketrips** to house the new columns created which are **ride_length**, **day_of_week**, **months** and **hour**. <br>
6. Created the 4 columns using the **mutate()** to house all; **difftime()** function to create the **ride_length** column subtracting the **end_datetime** columns from **start_datetime** column, **wday()** function to calculate the day of the week that each ride started called **day_of_week** column, **month()** and **hour()** functions to calculate the month and hour that each ride started called *month* and **start_hour** respectively. <br>
7. Changed the **ride_length** column to numeric format. <br>
8. Removed the bad data in column **ride_length** which are less than 1min or more than 24 hours (1440 minutes).

### Analyse 
Performed data aggregation and calculation, identified trends & relationships, analysed data and formatted data correctly using R programming.

Click here to view the R script and the summary of complete analysis process.

**Summary of Analysis** <br> 
1. casual riders have greater mean and median ride lengths than annual members. <br>
2. casual riders and annual member have the same minimum ride lengths, but casual riders have more maximum ride lengths than members. <br>
3. From January 2021 to June 2021, annual members have higher rides than casual riders, but casual riders have higher total ride lengths than annual members.<br>
4. Annual members have the most number of rides during Wednesdays and Thursdays, while casual riders have less and mostly prefer to ride bikes on Fridays, Saturdays and Sundays. Casual riders have significantly longer rides than annual members in all days of the week, with Sunday being the longest of the week.  <br>
5. Most annual members and casual riders prefer to begin their rides between 4PM and 6PM. <br>
6. The month of June has the highest number of rides for both casual and annual members. The month of May has the longest rides for casual riders while May and June both have the longest rides for annual members with the same records. <br>
7. The top start station for annual members are Clark St & Elm St., while the top start station for casual riders are Streeter Dr & Grand Ave.

### Share
I visualised my findings using **R** programming 

Click here to view the **R** script. 

Click here to view the image format of my visualisation.  





