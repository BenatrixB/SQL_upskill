# SQL_upskill
Portfolio and learning/practising SQL.
Prad=ioje buvo tiesiog SQL from beginner to advanced
Tada SQL data cleaning project ir dar Exlplanatory data analysis project
Naudotas Github kodo versijavimui ir saugojimui
Naudotas MySQL localhost su workbench darbui su duomenimis
Duomenys buvo arba sukurti arba importuoti .csv formato.
Nautodtas CGPT progreso ataskaitų generavimui.
Readme Faile bus aprašomas progresas ir taskai


📝 Dienos ataskaita: [2025-05-28]
✅ PROGRESS / PADARYTA
Ištrintas senasis MySQL Workbench bei kiti susiję komponentai.

Įrašytas iš naujo:

Buvo problema su localhost service.

Sprendimas: pakeistas prievadas (port), problema išspręsta.

📝 Dienos ataskaita: [2025-05-29]
✅ PROGRESS / PADARYTA
🔹 GitHub

 Sukurta nauja repozitorija SQL mokymosi projektui

 Susieta su vietiniu projektu

 Pridėtas pirmasis commit su README.md ir struktūra

🔹 MySQL

 Sukurtas pirmasis duomenų bazės failas

 DB sukurta ir paruošta darbui

📝 Dienos ataskaita: [2025-05-30]
✅ SQL praktika (Alex the Analyst – YouTube kursas)
Apžiūrėta ir išmokta:

Tema	Laiko žyma (mm:ss)
SELECT	11:19
WHERE	21:47
GROUP BY	33:54
HAVING vs WHERE	44:18
LIMIT ir Aliasing	47:41
Viskas matosi faile numeris 2.SELECT_GROUP_BY.sql

📝 Dienos ataskaita: [2025-06-03]
✅ Atlikta – SQL praktika 
Tema	Laiko žyma
JOINS	51:10
UNIONS	1:08:04
STRING FUNCTIONS	1:15:10
CASE STATEMENTS	1:26:39

📝 Dienos ataskaita: [2025-06-04]
✅ Atlikta – SQL praktika 
Tema	Laiko žyma
WINDOW FUNCTIONS	1:45:58
CTEs	1:58:55
TEMP TABLES	2:09:07
STORED PROCEDURES	2:16:34
TRIGGERS / EVENTS	2:28:51

📝 Dienos ataskaita: [2025-06-05]
✅ PROGRESAS – SQL praktika 
Projektas	Laiko žyma
DATA CLEANING PROJECT	2:42:46

📝 Dienos ataskaita: [2025-06-06]
✅ ATLIKTA – SQL praktika (Alex the Analyst)

| Užduotis                            | Pastabos                                                           |
| ----------------------------------- | ------------------------------------------------------------------ |
| `Exploratory Data Analysis Project` | ✅ Baigtas kursas iki pabaigos                                      |
| Datasetų paieška                    | 🔍 Ieškota tinkamų duomenų analizės projektams                     |
| Datasetų šaltinis                   | ✅ [Maven Analytics](https://www.mavenanalytics.io/data-playground) |
| GitHub papildymas                   | ✅ Įkelta **7 datasetai** analizei                                  |


[2025-06-08]

🔜 ATLIKTA

SQL praktika:

Tolimesnis planavimas SS Udemy SQL kursui.

Aplinkos nustatymas PostgreSQL ir pgAdmin programoms.

Pradėtas kursas (dar nebaigtas pirmas dienos modulis).

SQL Portfolio projektas „Maven Toys Sales Analysis“:

Spręstos problemos importuojant CSV failus į localhost MySQL duomenų bazę.

Naudota YouTube ir GPT pagalba, nustatyti serverio ir kliento parametrai, kad leistų LOAD DATA LOCAL INFILE.

Didelių, apie 800k eilučių turinčių CSV failų importavimas per CMD MySQL klientą pavyko sėkmingai.

Sukurtos tuščios lentelės MySQL Workbench programoje.

Importuotos lentelės: sales, calendar, products, inventory, stores.

Tolimesni planai: duomenų modeliavimas (lentelių sujungimas per raktus), duomenų formatavimas (datos, kainos).

🗓️ 2025-06-09
✅ Atlikta:
🎓 Udemy SQL Course (UDC)

Peržiūrėti ir atlikti 1, 2 ir 3 dienos video bei iššūkiai.

Įdiegta PostgreSQL ir atliktas aplinkos paruošimas.

Pastebėta, kad duomenų importavimas į PostgreSQL duomenų bazę vyksta sklandžiau nei per MySQL – tikėtina dėl to, kad PostgreSQL veikia kaip lokali bazė be papildomo tarpininko.

🛠️ SQL praktika (per PostgreSQL):

Išmoktos ir praktiškai pritaikytos šios komandos:
SELECT, ORDER BY, DISTINCT, LIMIT, COUNT,
WHERE, BETWEEN, IN, AND/OR, LIKE,
GROUP BY, AVG, MIN, MAX, SUM, HAVING.

🧠 Pastaba: HAVING naudojamas tam, kad filtruotume agreguotus rezultatus (grupes), o ne pavienius įrašus (kaip tai daro WHERE).
🗓️ [2025-06-12]
✅ Atlikta:
🎓 Udemy SQL Course (UDC)

Baigta Diena 5 (D-5)

Išmoktos svarbios SQL funkcijos:

CASE – sąlygų tikrinimas ir loginiai sprendimai

CAST – duomenų tipo keitimas

COALESCE – pirmos reikšmės pasirinkimas iš kelių galimų (naudinga dirbant su NULL)

🧘‍♂️ Asmeninis įžvalgų momentas:

Nuspręsta neskubėti su D-6 (JOINs tema), nes jai reikalingas didesnis susikaupimas ir aiški galva.

Vakaras skirtas poilsiui ir kokybiškam pasiruošimui rytdienai.

✅ „Geriau lėčiau, bet giliau ir tvirtai“ – tai tvari mokymosi strategija, ypač gilėjant temoms.

🗓️ [2025-06-13]

✅ Atlikta:
UDC Day 6 – Joins, Joins, Joins!

Gilinimasis į JOIN’ų veikimą praktikoje.

Papildomas mokymasis su GPT: supratimas apie Entity Relationships (ER).

Aptarta: One-to-One, One-to-Many, Many-to-One, ir Many-to-Many ryšiai.

Ypač aktualu: suprasti Many-to-One santykį ir kaip jis pasireiškia praktiniuose duomenyse.

🔜 Toliau:
Rekomenduojama:

Paieškoti/pasuklausyti YouTube arba mini kursų apie Entity Relationship Modeling (ERD).

Rekomenduojami terminai paieškai:

"Entity Relationship Diagram Tutorial"

"One to Many vs Many to One relationships explained"

"How to create database schema diagrams"


Trumpas cheat sheet iš GPT apie entity relationships
🔹 1. One-to-One (1:1)
Vienas į vieną

✅ Apibrėžimas:
Vienas įrašas A lentelėje atitinka tik vieną įrašą B lentelėje, ir atvirkščiai.

📌 Pvz:
users ir user_profiles
(kiekvienas vartotojas turi vieną profilį, ir kiekvienas profilis priklauso tik vienam vartotojui)

🔗 Implementavimas:
Vienos lentelės id tampa kitos lentelės foreign key, kuris yra unikalus.

🔹 2. One-to-Many (1:N)
Vienas į daug

✅ Apibrėžimas:
Vienas įrašas A lentelėje gali turėti daug susijusių įrašų B lentelėje.

📌 Pvz:
flights → boarding_passes
(vienas skrydis turi daug keleivių)

products → sales
(vienas produktas gali būti parduotas daug kartų)

🔗 Implementavimas:
B lentelėje yra foreign key, kuris nurodo A lentelės id.

🔹 3. Many-to-One (N:1)
Daug į vieną (tas pats kaip One-to-Many, bet iš kitos pusės)

✅ Pvz:
sales → stores
(daug pardavimų įvyksta vienoje parduotuvėje)

✅ Dažniausiai šitas ryšys yra tas, kurį matai JOIN'e, kai JOIN'ini „daug“ lentelę su „viena“ lentele pagal foreign key.

🔹 4. Many-to-Many (M:N)
Daug į daug

✅ Apibrėžimas:
Vienas A lentelės įrašas gali būti susijęs su daug B lentelės įrašų, ir atvirkščiai.

📌 Pvz:
students ir courses
(vienas studentas lanko daug kursų, vieną kursą lanko daug studentų)

🔗 Implementavimas:
Sukuriama tarpinė lentelė (join table), pvz.: student_courses, su:

student_id

course_id

💡 Papildomi patarimai:


Ryšys	Foreign key yra	Tarpinė lentelė reikalinga
1:1	Vienoje iš lentelių (UNIQUE)	❌ Ne
1:N arba N:1	N pusėje	❌ Ne
M:N	Tarpinėje lentelėje	✅ Taip

🗓️ [2025-08-14]

✅ Atlikta:
UDC – Day 7

Temos: Advanced SQL – UNIONS & SUBQUERIES

💡 Pastabos:
Buvo labai įdomi diena su subqueries (vidinėmis užklausomis).

Praktikavau:

Subqueries WHERE sakiniuose

Subqueries SELECT sakiniuose

Correlated subqueries tiek WHERE, tiek SELECT vietose

Pasijaučiau tikrai užtikrintai – „I was damn good“ 💪

🗓️ [2025-06-15]

✅ Atlikta:
Pridėtas UDC D8 Course Project SQL failas, kuriame sudėtos visos kurso projekto užduotys (query tasks).
Įgyvendintos pirmos 3 užduotys iš projekto.
Daugiau nespėta dėl dienos planų.
🔜 Toliau:
Išvykstu kelioms dienoms – be asmeninio kompiuterio, todėl nebus naujų atnaujinimų šioje temoje.

Tačiau planuoju įgyvendinti UDemy – Intro to BigQuery kursą (~3h turinio).

Progreso atnaujinimus kelsiu per naršyklę/web.

✅ 2025-06-23
ATLIKTA:

🎯 UDC D-8 Project Challenges – įvykdytos visos 14 lygio užklausų (queries).
Prie6 tai dar pabaigtas ir Bigquery Intro kursas.

✅ 2025-06-24
ATLIKTA:

📘 UDC D-9 – SQL Managing Tables

Temos: CREATE TABLE, ALTER TABLE, data checks ir constraints

Įdomiausi atradimai:

✅ Data checks – nauja, naudinga informacija apie duomenų validaciją

🔑 Primary key su SERIAL – auto-increment logika, kurios anksčiau nežinojai

✅ 2025-06-25
ATLIKTA:

📘 UDC D-10 – Advanced: Views and Data Manipulation

SQL komandos:

UPDATE, DELETE, CREATE TABLE AS, CREATE VIEW, CREATE MATERIALIZED VIEW, IMPORT/EXPORT

View vs. Create Table As:

✅ CREATE TABLE AS sukuria fizinę duomenų kopiją – saugo momentinį duomenų "snapshot", kuri nesikeičia, jei lentelės duomenys atsinaujina. Reikia saugojimo vietos.

✅ VIEW nesaugo duomenų, tik užklausa (query) – duomenys visada atsinaujina realiu laiku iš originalių lentelių.

✅ VIEW naudinga paprastam naudojimui, skaitymui ar analizės palengvinimui. Jei užklausa per lėta – galima sukurti fizinę lentelę.

✅ MATERIALIZED VIEW – saugo duomenis kaip lentelę, reikia atnaujinti rankiniu būdu su REFRESH MATERIALIZED VIEW, arba naudojant triggerį.

✅ 2025/06/26
ATLIKTA
UDC D-11 – WINDOW FUNCTIONS

Išmokta SQL komandos ir funkcijos:

OVER()

PARTITION BY()

ORDER BY su OVER()

RANK()

FIRST_VALUE()

LEAD(), LAG()

Pastabos:

Window functions elgiasi kaip correlated subqueries, bet yra žymiai efektyvesnės išteklių požiūriu.

Todėl dažniausiai verta rinktis window funkcijas, o ne correlated subqueries, kai tik įmanoma.

Su OVER(PARTITION BY ...) galima naudoti tokias agregacijas kaip SUM(), COUNT(), RANK(), FIRST_VALUE(), LEAD(), LAG().

Galima particionuoti pagal kelis stulpelius – tai leidžia dar tiksliau grupuoti ir analizuoti duomenis eilutės kontekste.

2025/06/27
✅ ATLIKTA
UDC D-12
Temos:

GROUPING SETS, ROLLUP, CUBE – agregavimas keliuose lygmenyse vienu vaizdu.

SELF JOIN – kai jungi ta pačią lentelę su savimi (naudinga, pvz., hierarchijoms ar palyginimams).

NATURAL JOIN – automatiškai jungia lenteles pagal bendrus stulpelius (atsargiai naudoti).

CROSS JOIN – kartesinis (visų su visais) produktas, jei nenaudojamas ON (retai praverčia, bet naudinga žinoti).


📅 2025/06/28
✅ ATLIKTA
🧠 UDC D-14
SQL Temos:

User-Defined Functions (UDF)

Transactions

Stored Procedures

| Feature                    | **Function**                        | **Stored Procedure**                      |
| -------------------------- | ----------------------------------- | ----------------------------------------- |
| 🔁 **Returns Value**       | ✅ Yes (must return)                 | ❌ Optional (can return, but not required) |
| 📊 **Used in SELECT**      | ✅ Yes                               | ❌ No                                      |
| 🛠 **Used For**            | Calculations, value-returning logic | Data changes, multiple operations         |
| 💬 **Call Syntax**         | `SELECT my_func(args);`             | `CALL my_proc(args);`                     |
| ⚙️ **Can Modify Data**     | ⚠️ Limited (possible, not ideal)    | ✅ Yes                                     |
| 💣 **Transaction Control** | ❌ No `COMMIT`/`ROLLBACK`            | ✅ Yes                                     |
| 🧠 **Logic Complexity**    | Simple/medium logic                 | Complex workflows, branching, loops       |

Komentarai / Pastebėjimai
Diegimo problemos parodė, kaip svarbu nepasitikėti vien „default“ nuostatomis (localhost portas gali būti užimtas).

Dienos ataskaita 17/07/2025

✅ USER MANAGEMENT (VARTOTOJŲ VALDYMAS)
CREATE USER user_name WITH PASSWORD 'secret';
Sukuria vartotoją, bet neleidžia prisijungti, nebent suteikta LOGIN.

CREATE ROLE role_name WITH LOGIN PASSWORD 'secret';
Sukuria role'ę, kuri gali prisijungti kaip vartotojas (rekomenduojama vietoj CREATE USER).

GRANT privilege ON object TO user/role;
Pvz.: GRANT SELECT ON table_name TO mia;

REVOKE privilege ON object FROM user/role;
Pvz.: REVOKE INSERT ON table_name FROM mia;

✅ INDEXAI (INDEXES)
Kam skirti: Pagreitina SELECT, WHERE, ORDER BY, JOIN.
⚠️ Lėtina INSERT, UPDATE, DELETE + užima daugiau vietos.

📚 Indexų tipai:
Tipas	Kada naudoti	Pastabos
B-tree	Unikalūs ID, pirminiai raktai, didelė įvairovė	Dažniausiai numatytasis indeksas
Bitmap	Dažnai pasikartojančios reikšmės (pvz.: „yes“, „no“, „gender“)	Naudojamas daugiau analitiniuose scenarijuose, mažai DML operacijų

✅ INDEXO KŪRIMAS
sql
CREATE INDEX idx_column_name ON table_name(column_name);
Pavyzdys:
sql
CREATE INDEX idx_last_name ON employees(last_name);

Galima ateityje dokumentuoti „diegimo problemas ir sprendimus“ atskirai – naudinga portfolio ar net darbui.