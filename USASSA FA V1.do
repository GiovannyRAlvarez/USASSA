*********************************************************************************
*      					USASSA FA - After AI Coding								*
*																				*
*  	This code is for ForeignAssitant.gov dataset, after AI coding.				*
* 																				*
* Author:Giovanny Alvarez														*
* Date: July 2026																*
* 																				*
*********************************************************************************




label variable program_num "Program Number mapping to U.S. Security Assistance programs"

label define program_num_lbl ///
    1 "Afghanistan Security Forces Fund" ///
    2 "Assistance for Europe, Eurasia and Central Asia" ///
    3 "Aviation Leadership Program" ///
    4 "Coalition Support Funds" ///
    5 "Combating Terrorism Fellowship Program" ///
    6 "Cooperative Threat Reduction" ///
    7 "Counter-Islamic State in Iraq and Syria" ///
    8 "Counterterrorism Partnerships Fund" ///
    9 "Defense Institute of International Legal Studies" ///
    10 "Defense Institution Reform Initiative" ///
    11 "Department of Homeland Security - U.S. Coast Guard Activities" ///
    12 "Developing Country Combined Exercise Program" ///
    13 "Emergency Drawdowns" ///
    14 "European Deterrence Initiative" ///
    15 "European Reassurance Initiative" ///
    16 "Excess Defense Articles" ///
    17 "Foreign Military Financing" ///
    18 "Freedom Support Act Security Assistance" ///
    19 "Global Lift and Sustain" ///
    20 "Global Security Contingency Fund" ///
    21 "Global Security Contingency Fund (DOD)" ///
    22 "Global Security Contingency Fund (DOS)" ///
    23 "International Counterproliferation Programs" ///
    24 "International Military Education and Training" ///
    25 "International Narcotics Control and Law Enforcement" ///
    26 "Iraq Security Forces Fund" ///
    27 "Iraq Train and Equip Fund" ///
    28 "Israel Cooperative Programs" ///
    29 "Misc Dept of State & Dept of Defense Non-Security Assistance" ///
    30 "Non-Security Assistance - Unified Command" ///
    31 "Nonproliferation, Anti-Terrorism, Demining, and Related Programs" ///
    32 "Pakistan Counterinsurgency Capability Fund" ///
    33 "Peacekeeping Operations" ///
    34 "Regional Centers for Security Studies" ///
    35 "Section 1004 Counter-Drug Assistance" ///
    36 "Section 1033 Counter-Drug Assistance" ///
    37 "Section 1206 Train and Equip Authority" ///
    38 "Section 1207 Security and Stabilization Assistance" ///
    39 "Section 333 Building Partner Capacity" ///
    40 "Southeast Asia Maritime Security Initiative" ///
    41 "State Partnership Program" ///
    42 "Syria Train and Equip Fund" ///
    43 "Wales Initiative" ///
    44 "Afghanistan Train and Equip Authority" ///
    45 "African Partnership (Flight and Station)" ///
    46 "Continuing Promise" ///
    47 "Enhanced International Peacekeeping Capabilities" ///
    48 "Exchange Training" ///
    49 "Indo-Pacific Maritime Security Initiative" ///
    50 "Professional Military Education Exchanges" ///
    51 "Service Academies" ///
    52 "Section 1207(n) Transitional Authority" ///
    53 "Ukraine Security Assistance Initiative" ///
    54 "Inter-American Air Forces Academy" ///
    55 "Inter-European Air Forces Academy" ///
    56 "International Criminal Investigations and Training" ///
    57 "MAP" ///
    58 "Military to Military Engagements" ///
    59 "Ministry of Defense Advisors Program" ///
    60 "Pacific Partnership Station" ///
    61 "Section 1208 Authority" ///
    62 "Security Cooperation Programs" ///
    63 "Southern Partnership Station" ///
    64 "Western Hemisphere Institute for Security Cooperation" ///
    65 "Training with Friendly Foreign Countries" ///
    66 "Joint Combined Exchange Training" ///
    67 "Presidential Drawdown Authority" ///
	68 "Department of Justice Programs" ///

label values program_num program_num_lbl
numlabel program_num_lbl, add mask("[#] ") 
codebook program_num
tabulate program_num


* Command

gen command=.
label var command "US Combatant Commands Deployed"
label define command 1 "Africa Command" 2 "Central Command" 3 "European Command" 4 "Indo-Pacific Command" 5 "Northern Command" 6 "Southern Command" 7 "World - No specific Command", replace
label values command command

rename countryname country

* Africa Commands
replace command=1 if ustrregexm(country,"Cape Verde",1)
replace command=1 if ustrregexm(country,"Príncipe",1)
replace command=1 if ustrregexm(country,"Comoros",1)
replace command=1 if ustrregexm(country,"Madagascar",1)
replace command=1 if ustrregexm(country,"Mauritius",1)
replace command=1 if ustrregexm(country,"Seychelles",1)
replace command=1 if ustrregexm(country,"Comoros",1)
replace command=1 if ustrregexm(country,"Madagascar",1)
replace command=1 if ustrregexm(country,"Algeria",1)
replace command=1 if ustrregexm(country,"Libya",1)
replace command=1 if ustrregexm(country,"Morocco",1)
replace command=1 if ustrregexm(country,"Tunisia",1)
replace command=1 if ustrregexm(country,"Burundi",1)
replace command=1 if ustrregexm(country,"Western Sahara",1)
replace command=1 if ustrregexm(country,"Djibouti",1)
replace command=1 if ustrregexm(country,"Eritrea",1)
replace command=1 if ustrregexm(country,"Kenya",1)
replace command=1 if ustrregexm(country,"Malawi",1)
replace command=1 if ustrregexm(country,"Mozambique",1)
replace command=1 if ustrregexm(country,"Rwanda",1)
replace command=1 if ustrregexm(country,"Somalia",1)
replace command=1 if ustrregexm(country,"Sudan",1)
replace command=1 if ustrregexm(country,"Tanzania",1)
replace command=1 if ustrregexm(country,"Uganda",1)
replace command=1 if ustrregexm(country,"Zambia",1)
replace command=1 if ustrregexm(country,"Zimbabwe",1)
replace command=1 if ustrregexm(country,"Angola",1)
replace command=1 if ustrregexm(country,"South Africa",1)
replace command=1 if ustrregexm(country,"Chad",1)
replace command=1 if ustrregexm(country,"Congo",1)
replace command=1 if ustrregexm(country,"Guinea",1)
replace command=1 if ustrregexm(country,"Gabon",1)
replace command=1 if ustrregexm(country,"Botswana",1)
replace command=1 if ustrregexm(country,"Eswatini",1)
replace command=1 if ustrregexm(country,"Ethiopia",1) 
replace command=1 if ustrregexm(country,"Lesotho",1)
replace command=1 if ustrregexm(country,"Namibia",1)
replace command=1 if ustrregexm(country,"Benin",1)
replace command=1 if ustrregexm(country,"Burkina",1)
replace command=1 if ustrregexm(country,"Cape Verde",1)
replace command=1 if ustrregexm(country,"Gambia",1)
replace command=1 if ustrregexm(country,"Ghana",1)
replace command=1 if ustrregexm(country,"Ivory Coast",1)
replace command=1 if ustrregexm(country,"Liberia",1)
replace command=1 if ustrregexm(country,"Mali",1)
replace command=1 if ustrregexm(country,"Mauritania",1)
replace command=1 if ustrregexm(country,"Niger",1)
replace command=1 if ustrregexm(country,"Senegal",1)
replace command=1 if ustrregexm(country,"Sierra Leone",1)
replace command=1 if ustrregexm(country,"Swaziland",1)
replace command=1 if ustrregexm(country,"Togo",1)
replace command=1 if ustrregexm(country,"Sao Tome and Principe",1)
replace command=1 if ustrregexm(country,"Cote d'Ivoire",1) 
replace command=1 if ustrregexm(country,"Cameroon",1) 
replace command=1 if ustrregexm(country,"Cabo verde",1) 

 

* Central Command
replace command=2 if ustrregexm(country,"Afghanistan",1)
replace command=2 if ustrregexm(country,"Bahrain",1)
replace command=2 if ustrregexm(country,"Egypt",1)
replace command=2 if ustrregexm(country,"Iran",1)
replace command=2 if ustrregexm(country,"Iraq",1)
replace command=2 if ustrregexm(country,"Israel",1)
replace command=2 if ustrregexm(country,"Jordan",1)
replace command=2 if ustrregexm(country,"Kazakhstan",1)
replace command=2 if ustrregexm(country,"Kuwait",1)
replace command=2 if ustrregexm(country,"Kyrgyzstan",1)
replace command=2 if ustrregexm(country,"Lebanon",1)
replace command=2 if ustrregexm(country,"Oman",1)
replace command=2 if ustrregexm(country,"Pakistan",1)
replace command=2 if ustrregexm(country,"Qatar",1)
replace command=2 if ustrregexm(country,"Saudi",1)
replace command=2 if ustrregexm(country,"Syria",1)
replace command=2 if ustrregexm(country,"Tajikistan",1)
replace command=2 if ustrregexm(country,"Turkmenistan",1)
replace command=2 if ustrregexm(country,"Emirates",1)
replace command=2 if ustrregexm(country,"Uzbekistan",1)
replace command=2 if ustrregexm(country,"Yemen",1)
replace command=2 if ustrregexm(country,"Kyrgyz",1)
replace command=2 if ustrregexm(country,"Palestinian",1)



* European Command

replace command=3 if ustrregexm(country,"Russia",1)
replace command=3 if ustrregexm(country,"Greenland",1)
replace command=3 if ustrregexm(country,"Albania",1)
replace command=3 if ustrregexm(country,"Andorra",1)
replace command=3 if ustrregexm(country,"Armenia",1)
replace command=3 if ustrregexm(country,"Austria",1)
replace command=3 if ustrregexm(country,"Azerbaijan",1)
replace command=3 if ustrregexm(country,"Belarus",1)
replace command=3 if ustrregexm(country,"Belgium",1)
replace command=3 if ustrregexm(country,"Bosnia",1)
replace command=3 if ustrregexm(country,"Bulgaria",1)
replace command=3 if ustrregexm(country,"Croatia",1)
replace command=3 if ustrregexm(country,"cyprus",1)
replace command=3 if ustrregexm(country,"Czech",1)
replace command=3 if ustrregexm(country,"Denmark",1)  
replace command=3 if ustrregexm(country,"Estonia",1)
replace command=3 if ustrregexm(country,"Finland",1)
replace command=3 if ustrregexm(country,"France",1)
replace command=3 if ustrregexm(country,"Georgia",1)
replace command=3 if ustrregexm(country,"Germany",1)
replace command=3 if ustrregexm(country,"Greece",1)
replace command=3 if ustrregexm(country,"Hungary",1)
replace command=3 if ustrregexm(country,"Iceland",1)
replace command=3 if ustrregexm(country,"Ireland",1)
replace command=3 if ustrregexm(country,"Italy",1)
replace command=3 if ustrregexm(country,"Kazakhstan",1)
replace command=3 if ustrregexm(country,"Latvia",1)
replace command=3 if ustrregexm(country,"Liechtenstein",1)
replace command=3 if ustrregexm(country,"Luxembourg",1)
replace command=3 if ustrregexm(country,"Malta",1)
replace command=3 if ustrregexm(country,"Moldova",1)
replace command=3 if ustrregexm(country,"Montenegro",1)
replace command=3 if ustrregexm(country,"Netherlands",1)
replace command=3 if ustrregexm(country,"Macedonia",1)
replace command=3 if ustrregexm(country,"Norway",1)
replace command=3 if ustrregexm(country,"Poland",1)
replace command=3 if ustrregexm(country,"Portugal",1)
replace command=3 if ustrregexm(country,"Romania",1)
replace command=3 if ustrregexm(country,"Marino",1)
replace command=3 if ustrregexm(country,"Serbia",1)
replace command=3 if ustrregexm(country,"Slovakia",1)
replace command=3 if ustrregexm(country,"Slovenia",1)
replace command=3 if ustrregexm(country,"Spain",1)
replace command=3 if ustrregexm(country,"Sweden",1)
replace command=3 if ustrregexm(country,"Switzerland",1)
replace command=3 if ustrregexm(country,"Turkey",1)
replace command=3 if ustrregexm(country,"Ukraine",1)
replace command=3 if ustrregexm(country,"United Kingdom",1)
replace command=3 if ustrregexm(country,"Kosovo",1)
replace command=3 if ustrregexm(country,"Monaco",1)
replace command=3 if ustrregexm(country,"Lithuania",1)
 
 


* Indo-Pacific Command
replace command=4 if ustrregexm(country,"Australia",1)
replace command=4 if ustrregexm(country,"Bangladesh",1)
replace command=4 if ustrregexm(country,"Bhutan",1)
replace command=4 if ustrregexm(country,"Brunei",1)
replace command=4 if ustrregexm(country,"Burma",1)
replace command=4 if ustrregexm(country,"Cambodia",1)
replace command=4 if ustrregexm(country,"China",1)
replace command=4 if ustrregexm(country,"Fiji",1)
replace command=4 if ustrregexm(country,"India",1)
replace command=4 if ustrregexm(country,"Indonesia",1)
replace command=4 if ustrregexm(country,"Japan",1)
replace command=4 if ustrregexm(country,"Kiribati",1)
replace command=4 if ustrregexm(country,"Laos",1)
replace command=4 if ustrregexm(country,"Malaysia",1)
replace command=4 if ustrregexm(country,"Maldives",1)
replace command=4 if ustrregexm(country,"Marshall",1)
replace command=4 if ustrregexm(country,"Micronesia",1)
replace command=4 if ustrregexm(country,"Mongolia",1)
replace command=4 if ustrregexm(country,"Nauru",1)
replace command=4 if ustrregexm(country,"Nepal",1)
replace command=4 if ustrregexm(country,"Zealand",1)
replace command=4 if ustrregexm(country,"Korea",1)
replace command=4 if ustrregexm(country,"Palau",1)
replace command=4 if ustrregexm(country,"Papua",1)
replace command=4 if ustrregexm(country,"New Guinea",1)
replace command=4 if ustrregexm(country,"Philippines",1)
replace command=4 if ustrregexm(country,"Solomon",1)
replace command=4 if ustrregexm(country,"Sri Lanka",1)
replace command=4 if ustrregexm(country,"Thailand",1)
replace command=4 if ustrregexm(country,"Timor",1)
replace command=4 if ustrregexm(country,"Tonga",1)
replace command=4 if ustrregexm(country,"Tuvalu",1)
replace command=4 if ustrregexm(country,"Vanuatu",1)
replace command=4 if ustrregexm(country,"Vietnam",1)
replace command=4 if ustrregexm(country,"Taiwan",1)
replace command=4 if ustrregexm(country,"Singapore",1)
replace command=4 if ustrregexm(country,"Hong Kong",1)
replace command=4 if ustrregexm(country,"Samoa",1)
replace command=4 if ustrregexm(country,"New Caledonia",1)
replace command=4 if ustrregexm(country,"Niue",1)
replace command=4 if ustrregexm(country,"Guam",1)   
replace command=4 if ustrregexm(country,"French Polynesia",1)   
replace command=4 if ustrregexm(country,"Cook Islands",1)   

* Northern command
replace command=5 if ustrregexm(country,"Canada",1)
replace command=5 if ustrregexm(country,"Mexico",1)
replace command=5 if ustrregexm(country,"Bahamas",1)
replace command=5 if ustrregexm(country,"Puerto Rico",1)

* Southern command
replace command=6 if ustrregexm(country,"Antigua",1)
replace command=6 if ustrregexm(country,"Argentina",1)
replace command=6 if ustrregexm(country,"Barbados",1)
replace command=6 if ustrregexm(country,"Belize",1)
replace command=6 if ustrregexm(country,"Bolivia",1)
replace command=6 if ustrregexm(country,"Brazil",1)
replace command=6 if ustrregexm(country,"Chile",1)
replace command=6 if ustrregexm(country,"Colombia",1)
replace command=6 if ustrregexm(country,"Costa Rica",1)
replace command=6 if ustrregexm(country,"Cuba",1)
replace command=6 if ustrregexm(country,"Dominica",1)
replace command=6 if ustrregexm(country,"Nicaragua",1)
replace command=6 if ustrregexm(country,"Ecuador",1)
replace command=6 if ustrregexm(country,"El Salvador",1)
replace command=6 if ustrregexm(country,"Grenada",1)
replace command=6 if ustrregexm(country,"Guatemala",1)
replace command=6 if ustrregexm(country,"Guyana",1)
replace command=6 if ustrregexm(country,"Haiti",1)
replace command=6 if ustrregexm(country,"Honduras",1)
replace command=6 if ustrregexm(country,"Jamaica",1)
replace command=6 if ustrregexm(country,"Panama",1)
replace command=6 if ustrregexm(country,"Paraguay",1)
replace command=6 if ustrregexm(country,"Peru",1)
replace command=6 if ustrregexm(country,"Kitts",1)
replace command=6 if ustrregexm(country,"Saint Lucia",1)
replace command=6 if ustrregexm(country,"St. Lucia",1)
replace command=6 if ustrregexm(country,"Saint Vincent",1)
replace command=6 if ustrregexm(country,"Grenadines",1)
replace command=6 if ustrregexm(country,"Suriname",1)
replace command=6 if ustrregexm(country,"Trinidad and Tobago",1)
replace command=6 if ustrregexm(country,"Uruguay",1)
replace command=6 if ustrregexm(country,"Venezuela",1)
replace command=6 if ustrregexm(country,"Turks and Caicos",1)
replace command=6 if ustrregexm(country,"Martinique",1)
replace command=6 if ustrregexm(country,"Curacao",1) 
replace command=6 if ustrregexm(country,"Bermuda",1)
replace command=6 if ustrregexm(country,"Aruba",1) 
replace command=6 if ustrregexm(country,"Cayman Islands",1)

rename country countryname

* Commands by regions
* 1 "Africa Command" (AFRICOM)
replace command = 1 if inlist(countryname, "Central African Republic", "Eastern Africa Region", "Eastern and Central Africa Region")
replace command = 1 if inlist(countryname, "North Africa Region", "Southern Africa Region", "Sub-Saharan Africa Region", "West Africa Region")

* 2 "Central Command" (CENTCOM)
replace command = 2 if inlist(countryname, "Middle East Region", "Middle East and North Africa Region", "West Bank and Gaza", "Asia, Middle East and North Africa Region")
replace command = 2 if inlist(countryname, "South and Central Asia Region") 

* 3 "European Command" (EUCOM)
replace command = 3 if inlist(countryname, "Central and Eastern Europe Region", "Eastern Europe Region", "Eurasia Region")
replace command = 3 if inlist(countryname, "Europe Region", "Europe and Eurasia Region", "Slovak Republic")

* 4 "Indo-Pacific Command" (INDOPACOM)
replace command = 4 if inlist(countryname, "Asia Region", "East Asia and Oceania Region", "Eastern Asia Region")
replace command = 4 if inlist(countryname, "Oceania Region", "South East Asia Region", "Southern Asia Region")

* 5 "Northern Command" (NORTHCOM)
replace command = 5 if inlist(countryname, "North and Central America Region")

* 6 "Southern Command" (SOUTHCOM)
replace command = 6 if inlist(countryname, "Caribbean Region", "Central America Region", "Latin America and Caribbean Region")
replace command = 6 if inlist(countryname, "South America Region", "Western Hemisphere Region")


table program_num, stat(mean aidtype) stat(count aidtype) stat(count fiscalyear) stat(count recipienttype) totals(program_num)

table program_num aidtype, totals(program_num)

table program_num aidtype recipienttype, totals(program_num)


* Recipiente Level variable for 2001-2026 Dataset

gen recipient_level=1
replace recipient_level=2 if countryid>=1003
replace recipient_level=3 if countryid==1002

label variable recipient_level "Geographic scope of the recipient aid"
label define recipient_level 1 "Bilateral" 2 "Regional" 3 "Global"
label values recipient_level recipient_level
numlabel recipient_level, add mask("[#] ") 


* Lethal assistance for 2020-2026 Dataset

gen lethal_assistance = 0
replace lethal_assistance = 1 if inlist(aidtype, 1, 2, 4)
replace lethal_assistance = 2 if inlist(aidtype, 5, 8, 11, 12)

label variable lethal_assistance "Lethal Assistance Provided"
label define lethal_assistance 0 "Unclear" 1 "Lethal" 2 "Nonlethal"
label values lethal_assistance lethal_assistance

label define source 1 "SAM" 2 "FA.gov"
label values source source


gen constantUSD= constantdollaramount/1000000


gen constantUSD= CYP_amt/1000000
label variable constantUSD "Constant USD in Million"





****** Data clean FA.Gov. **********
drop if ustrregexm(ussectorname,"Health - General",1)
drop if ustrregexm(ussectorname,"Macroeconomic Foundation for Growth",1)
drop if ustrregexm(ussectorname,"Political Competition and Consensus-Building",1)
drop if ustrregexm(ussectorname,"Civil Society",1)
drop if ustrregexm(ussectorname,"International Contributions",1)
drop if ustrregexm(ussectorname,"Labor Policies and Markets",1)
drop if ustrregexm(fundingaccountname,"Department of State, Democracy Fund",1)
drop if ustrregexm(internationalsectorname,"HIV/AIDS",1)
drop if ustrregexm(fundingagencyacronym,"USAID",1)
drop if ustrregexm(managingsubagencyorbureauname,"Population, Refugees, and Migration",1)
drop if ustrregexm(managingsubagencyorbureauname,"Diplomatic Security",1)
drop if ustrregexm(internationalcategoryname,"Agriculture",1) 
drop if ustrregexm(internationalcategoryname,"Health and Population",1)
drop if ustrregexm(internationalcategoryname,"Commodity Assistance",1)
drop if ustrregexm(internationalcategoryname,"Infrastructure",1)
drop if ustrregexm(internationalcategoryname,"Economic Growth",1)
drop if ustrregexm(internationalcategoryname,"Other",1)
drop if ustrregexm(ussectorname,"Direct Administrative Costs",1)
drop if ustrregexm(internationalcategoryname,"Administrative Costs",1)
drop if ustrregexm(fundingaccountname,"Peace Keeping Operations",1)
drop if ustrregexm(fundingaccountname,"Cultural Exchange Programs",1)
drop if ustrregexm(fundingaccountname,"Iraq Relief and Reconstruction Fund",1)
drop if ustrregexm(implementingpartnername,"National Endowment for Democracy",1)
drop if ustrregexm(fundingaccountname,"National Endowment for Democracy",1)
drop if ustrregexm(activityname,"Trial Competitions",1)
drop if ustrregexm(activityname,"PEACEKEEPING PKO",1)
drop if ustrregexm(activityname,"CAFE",1)
drop if ustrregexm(fundingaccountname,"Department of Homeland Security",1)
drop if ustrregexm(fundingaccountname,"Millennium Challenge Corporation",1)

*** Program Number ****

replace program_num=1 if ustrregexm(activityname,"Commander's Emergency Response Program",1)
replace program_num=3 if ustrregexm(activityname,"Aviation Leadership",1) 
replace program_num=7 if ustrregexm(activityname,"Counter-Islamic State",1)
replace program_num=8 if ustrregexm(activityname,"Counter Terrorism",1)
replace program_num=23 if ustrregexm(activityname,"International Counterproliferation Program",1)
replace program_num=25 if ustrregexm(activityname,"narcotics",1)
replace program_num=25 if ustrregexm(activityname,"DEA ",1)
replace program_num=25 if ustrregexm(fundingaccountname,"Interagency Drug Enforcement, Drug Enforcement Administration",1)
replace program_num=28 if ustrregexm(fundingaccountname,"Israeli Arab Scholarship Program",1)
replace program_num=31 if ustrregexm(fundingaccountname,"Nonproliferation, Anti-Terrorism, Demining and Related Programs",1)
replace program_num=35 if ustrregexm(fundingaccountname,"Department of Defense, Drug Interdiction and Counter-Drug Activities",1)
replace program_num=37 if ustrregexm(activityname,"Global Train and Equip Program",1)
replace program_num=39 if ustrregexm(activityname,"Warsaw Initiative",1)
replace program_num=39 if ustrregexm(activityname,"Institutional Capacity Building",1)
replace program_num=39 if ustrregexm(activityname,"Section 333",1)
replace program_num=49 if ustrregexm(activityname,"Indo-Pacific Maritime",1)
replace program_num=51 if ustrregexm(activityname,"Service Academy Foreign",1) 
replace program_num=53 if ustrregexm(activityname,"Ukraine Security Assistance",1)
replace program_num=55 if ustrregexm(activityname,"Inter-European",1)
replace program_num=59 if ustrregexm(activityname,"Ministry of Defense Advisors Program",1)
replace program_num=68 if ustrregexm(fundingagencyname,"Department of Justice",1) 

*** Aid Typology ****
replace aidtype=2 if program_num==3 
replace aidtype=2 if program_num==51 
replace aidtype=2 if program_num==55
 
replace aidtype=14 if ustrregexm(activityname,"INFORMATION REDACTED",1)
replace aidtype=14 if ustrregexm(activitydescription,"Information Redacted",1)
replace aidtype=14 if ustrregexm(activitydescription,"Covers services supplied",1)
replace aidtype=14 if ustrregexm(activitydescription,"transfer of money",1)
replace aidtype=14 if ustrregexm(activitydescription,"including revenue- sharing",1)
replace aidtype=14 if ustrregexm(activitydescription,"other aid",1)
replace aidtype=14 if ustrregexm(activitydescription,"Program Evaluation",1)

replace aidtype=1 if ustrregexm(activityname,"Aviation Operation",1)
replace aidtype=1 if ustrregexm(activityname,"Defense Transformation Support",1)
replace aidtype=1 if ustrregexm(activityname,"Force Sustainment",1)
replace aidtype=1 if ustrregexm(activityname,"Defense Technology Security",1)
replace aidtype=1 if ustrregexm(activityname,"Base Construction",1)
replace aidtype=1 if ustrregexm(activityname,"ranger",1)
replace aidtype=2 if ustrregexm(activityname,"Commander's Emergency Response Program",1)
replace aidtype=2 if ustrregexm(activityname,"Infantry Forum",1)
replace aidtype=2 if ustrregexm(activityname,"Violence Training",1)
replace aidtype=2 if ustrregexm(activityname,"GREAT Training",1)
replace aidtype=2 if ustrregexm(activityname,"Anti-Terrorism Assistance Training",1)
replace aidtype=2 if ustrregexm(activityname,"Workshop",1)
replace aidtype=5 if ustrregexm(activityname,"ENGLISH LANGUAGE",1)
replace aidtype=5 if ustrregexm(activityname,"English Program",1)
replace aidtype=5 if ustrregexm(activityname,"SECURITY SEMINAR",1)
replace aidtype=5 if ustrregexm(activityname,"SEMINAR ON REGIONAL SECURITY",1)
replace aidtype=5 if ustrregexm(activityname,"International Legal Studies",1)
replace aidtype=5 if ustrregexm(activityname,"Center for Security Studies",1)
replace aidtype=5 if ustrregexm(activityname,"Institute for Security Governance",1)
replace aidtype=5 if ustrregexm(activityname,"Curricu",1)
replace aidtype=5 if ustrregexm(activityname,"Education",1) 
replace aidtype=7 if ustrregexm(activityname,"United States Army Europe",1)
replace aidtype=8 if ustrregexm(activityname,"Accountability",1)
replace aidtype=8 if ustrregexm(activityname,"Protection",1)
replace aidtype=8 if ustrregexm(activityname,"Gender Based Violence",1)
replace aidtype=8 if ustrregexm(activityname,"GBV",1)
replace aidtype=8 if ustrregexm(activityname,"WIF",1)
replace aidtype=8 if ustrregexm(activityname,"DIRI ",1)
replace aidtype=9 if ustrregexm(activityname,"Anti Crime",1)
replace aidtype=9 if ustrregexm(activityname,"Counter Illegal",1)
replace aidtype=9 if ustrregexm(activityname,"Human Trafficking",1)
replace aidtype=9 if ustrregexm(activityname,"Wildlife Trafficking",1)
replace aidtype=9 if ustrregexm(activityname,"Countering Violent Extremism",1)
replace aidtype=9 if ustrregexm(activityname,"Reducing Prevalence of Child",1)
replace aidtype=9 if ustrregexm(activityname,"Money Laundering",1)
replace aidtype=9 if ustrregexm(activityname,"Community Police Model",1)
replace aidtype=12 if ustrregexm(activityname,"clearance of mines",1)
replace aidtype=12 if ustrregexm(activityname,"nuclear",1)

replace aidtype=4 if ustrregexm(activitydescription,"training and equipment",1)
replace aidtype=4 if ustrregexm(activitydescription,"training, equipment",1)
replace aidtype=4 if ustrregexm(activitydescription,"Parts, & Training",1)
replace aidtype=5 if ustrregexm(activitydescription,"educational program",1)
replace aidtype=6 if ustrregexm(activitydescription,"logistic",1)
replace aidtype=8 if ustrregexm(activitydescription,"Improving Justice Systems",1)
replace aidtype=8 if ustrregexm(activitydescription,"Accountability",1)
replace aidtype=9 if ustrregexm(activitydescription,"law enforcement",1)
replace aidtype=9 if ustrregexm(activitydescription,"forensic",1)
replace aidtype=9 if ustrregexm(activitydescription,"criminal justice",1)
replace aidtype=9 if ustrregexm(activitydescription,"policing",1)
replace aidtype=9 if ustrregexm(activitydescription,"transnational Crime",1)
replace aidtype=9 if ustrregexm(activitydescription,"wildlife trafficking",1)
replace aidtype=9 if ustrregexm(activitydescription,"Trafficking in Persons",1)
replace aidtype=9 if ustrregexm(activitydescription,"Organized Crime",1)
replace aidtype=9 if ustrregexm(activitydescription,"Rule of Law",1)
replace aidtype=9 if ustrregexm(activitydescription,"investigate",1)




replace aidtype=14 if missing(aidtype)

replace aidtype=1 if ustrregexm(activityname,"salaries",1) & aidtype==14
replace aidtype=1 if ustrregexm(activityname,"salary",1) & aidtype==14
replace aidtype=1 if ustrregexm(activityname,"Supplies",1) & aidtype==14
replace aidtype=1 if ustrregexm(activityname,"Combat",1) & aidtype==14
replace aidtype=1 if ustrregexm(activityname,"Stockpile",1) & aidtype==14
replace aidtype=5 if ustrregexm(activityname,"Conference",1) & aidtype==14
replace aidtype=5 if ustrregexm(activityname,"English lan",1) & aidtype==14
replace aidtype=5 if ustrregexm(activityname,"LE Training",1) & aidtype==14
replace aidtype=8 if ustrregexm(activityname,"victim",1) & aidtype==14
replace aidtype=8 if ustrregexm(activityname,"Justice",1) & aidtype==14
replace aidtype=8 if ustrregexm(activityname,"Judicial",1) & aidtype==14
replace aidtype=8 if ustrregexm(activityname,"Corruption",1) & aidtype==14
replace aidtype=8 if ustrregexm(activityname,"Prevent",1) & aidtype==14
replace aidtype=8 if ustrregexm(activityname,"Protect",1) & aidtype==14
replace aidtype=8 if ustrregexm(activityname,"court",1) & aidtype==14
replace aidtype=9 if ustrregexm(activityname,"forensic",1) & aidtype==14
replace aidtype=9 if ustrregexm(activityname,"prosecu",1) & aidtype==14
replace aidtype=9 if ustrregexm(activityname,"Counterterrorism",1) & aidtype==14 | aidtype==13
replace aidtype=10 if ustrregexm(activityname,"Anti Narcotics",1) & aidtype==14
replace aidtype=10 if ustrregexm(activityname,"Counter Narcotics",1) & aidtype==14
replace aidtype=10 if ustrregexm(activityname,"DEA",1) & aidtype==14


 
*** Recipient Typology ****


replace recipienttype=5 if ustrregexm(activityname,"special forces",1)



replace recipienttype=1 if ustrregexm(activitydescription,"army",1)
replace recipienttype=2 if ustrregexm(activitydescription,"Aerial",1)
replace recipienttype=3 if ustrregexm(activitydescription,"navy",1)
replace recipienttype=3 if ustrregexm(activitydescription,"marine",1)
replace recipienttype=3 if ustrregexm(activitydescription,"maritime",1)
replace recipienttype=2 if ustrregexm(activitydescription,"air force",1)
replace recipienttype=5 if ustrregexm(activitydescription,"special forces",1)
replace recipienttype=1 if ustrregexm(activitydescription,"Land Forces",1)
replace recipienttype=2 if ustrregexm(activitydescription,"Air-to-Air",1)
replace recipienttype=3 if ustrregexm(activitydescription,"Riverine",1)
replace recipienttype=3 if ustrregexm(activitydescription,"Harpoon",1)
replace recipienttype=4 if ustrregexm(activitydescription,"police",1)
replace recipienttype=4 if ustrregexm(activitydescription,"police",1)
replace recipienttype=7 if ustrregexm(activitydescription,"security forces",1)
replace recipienttype=7 if ustrregexm(activitydescription,"Police/Military",1)
replace recipienttype=7 if ustrregexm(activitydescription,"Information Redacted",1)
replace recipienttype=7 if ustrregexm(activitydescription,"military",1)
replace recipienttype=2 if ustrregexm(activityname,"aviation",1)
replace recipienttype=8 if ustrregexm(activityname,"INFORMATION REDACTED",1)
replace recipienttype=8 if missing(recipienttype)

 
