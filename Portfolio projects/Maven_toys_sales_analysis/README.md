# SQL_upskill
 # MAVEN TOYS SALES DATA ANALYSIS PROJECT

### Description
Data Source
Data was taken from a public Maven resource.

### Software Used:
MySQL (Workbench) – for data warehouse and database creation, cleaning, modeling, and preparing data for analysis.

Power BI (locally stored, not public) – for data visualization.

### Workflow:
Data must be imported into the MySQL database.

Data must be cleaned and properly modeled to prepare for analysis.

New tables must be created to enable revenue and other types of analysis.

Data must be analyzed and visualized.

Everything must be exported to GitHub. Power BI presentations should be screenshotted and visuals (files) imported as well.

### What do we know about the Maven Toys Sales data?
There are multiple CSV files with relational data.

The data appears to cover one a few years from 2022 to 2023/10.

We have store IDs and store information, allowing us to identify which stores perform best.

We have product data – 35 products sold in total. Product cost and price are available, enabling revenue calculations per product and insights into which products perform best and in which stores (optimal performance).

This also helps understand which products run out quickly and need to be restocked most often.

There is more to analyze, but primarily we want to understand which product, when, and where performs best. We will need to raise analytical questions properly, this will be an analysis stage.
 
### PROGRESS DIARY

 [2025-06-08]

🔜 ATLIKTA

SQL Portfolio projektas „Maven Toys Sales Analysis“:

Spręstos problemos importuojant CSV failus į localhost MySQL duomenų bazę.

Naudota YouTube ir GPT pagalba, nustatyti serverio ir kliento parametrai, kad leistų LOAD DATA LOCAL INFILE.

Didelių, apie 800k eilučių turinčių CSV failų importavimas per CMD MySQL klientą pavyko sėkmingai.

Sukurtos tuščios lentelės MySQL Workbench programoje.

Importuotos lentelės: sales, calendar, products, inventory, stores.

Tolimesni planai: duomenų modeliavimas (lentelių sujungimas per raktus), duomenų formatavimas (datos, kainos).

 ### KOMENTARAI:
Buvo sunku suprasti iš pradžių kaip teisingai importuoti failus į mysql localhost database. Tas tikrai davė man iššūkį, kurį išsprendžiau su youtube ir GPT pagalba. Tai duoda daugiau pasitikėjimo savo jėgomis ir daugiau motyvacijos toliau siekti portfolio projektų įgyvendinimo. Importuotas database schema tikrai įdomus ir ten daug labai visko galima padaryti ir sužinoti, ištraukti iš tų duomenų.