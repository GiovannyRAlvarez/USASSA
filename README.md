\documentclass[11pt]{article}
\usepackage[margin=1in]{geometry}
\usepackage{booktabs}
\usepackage{longtable}
\usepackage{tabularx}
\usepackage{enumitem}
\usepackage{hyperref}
\usepackage{xcolor}
\usepackage{tikz}
\usetikzlibrary{positioning, arrows.meta, calc}
    \definecolor{bgdark}{RGB}{30,41,59}    % Slate/Navy for Sources
    \definecolor{bgteal}{RGB}{13,148,136}  % Teal for Hand-Coding
    \definecolor{bgblue}{RGB}{2,132,199}   % Blue for AI Processing
    \definecolor{bgred}{RGB}{225,29,72}    % Crimson for Final Output
    \definecolor{arrowgray}{RGB}{148,163,184} % Gray for Arrows
    
\title{Comprehensive Codebook and User Manual: \\ U.S. Aid to Security Sector Actors (USASSA) Dataset \\ \large Version 2.0 (Country-Year Panel Data Replication)}
\author{Patricia Sullivan \and Giovanny Rincon Alvarez}
\date{2026}

\begin{document}

\maketitle

\section*{2026 Update Note}
This codebook accompanies the newly updated release of the USASSA dataset, which extends the temporal coverage to include the years 2020 through 2025 Fiscal Year. The data for this recent update originates from ForeignAssistance.gov, managed by the U.S. Department of State. Specifically, this update captures security assistance disbursements overseen by the following managing agencies:
\begin{itemize}[noitemsep, topsep=2pt]
    \item Department of State
    \item Department of Defense
    \item Department of the Army
    \item Department of the Navy
    \item Department of the Air Force
    \item Department of Justice
\end{itemize}

The metric utilized across the entire dataset tracking funding levels reflects actual financial disbursements according to each specified fiscal year, rather than generalized appropriations or obligations.

To process the high volume of recent data transparently, the authors utilized Gemini 3.1 Pro (an advanced large language model) to computationally execute the classification protocol. This AI-assisted drafting phase was subsequently reviewed and cleaned directly by the authors to ensure absolute accuracy, consistency, and strict adherence to the codebook's operational definitions.

\section{Introduction and Dataset Scope}
The U.S. Aid to Security Sector Actors (USASSA) dataset provides a systematic, global tracking of unclassified U.S. security assistance from 2000 through December 2025. The dataset is constructed across two distinct collection periods: the foundational 2000--2019 data was developed via a collaboration between academic researchers and the Security Assistance Monitor (SAM) at the Center for International Policy, while the 2020--2025 expansion data was compiled directly from U.S. Department of State records via ForeignAssistance.gov. By bridging these sources, the dataset consolidates qualitative line-item notification metrics into a single, standardized framework utilizing mutually exclusive, exhaustive typologies of aid type and recipient type.

This country-year version of the dataset maintains identical variable tracking structures and classification categories across all observations for United Nations member states. It enables quantitative researchers to disaggregate lethal versus nonlethal security assistance packages and trace funding paths across varying security force branches to assess downstream human rights, governance, and conflict impacts and to identify types of aid provided.

Figure~\ref{fig:methodology_pipeline} summarizes the comprehensive methodology utilized for collecting the raw data and systematically coding the USASSA dataset. The flowchart illustrates the dual-pipeline architecture necessary to construct the 2000--2025 panel, distinguishing between the historical hand-coding protocol applied to the 2000--2019 records and the AI-assisted parsing framework developed for the recent 2020--2025 disbursement logs. By mapping these parallel collection streams, the figure demonstrates how unstructured text from ForeignAssistance.gov is standardized into the unified, mutually exclusive typologies of aid and recipient types defined in this codebook.


\begin{figure}[htbp]
    \centering

    \begin{tikzpicture}[
        node distance=1.3cm and 1.8cm,
        box/.style={
            rectangle,
            rounded corners=1ex,
            minimum width=5cm,
            minimum height=2.8cm,
            align=center,
            text=white,
            font=\sffamily
        },
        arrow/.style={
            ->,
            >={Stealth[scale=1.3]},
            line width=2pt,
            color=arrowgray
        }
    ]

    % --- Nodes ---

    % Top Left: Sources (2000-2019)
    \node[box, fill=bgdark] (src1) {
        \begin{tabular}{c}
            \textbf{Sources (2000-2019)} \\[0.8em]
            \scriptsize Security Assistance Monitor
        \end{tabular}
    };

    % Bottom Left: Sources (2020-2025)
    \node[box, fill=bgdark, below=1cm of src1] (src2) {
        \begin{tabular}{c}
            \textbf{Sources (2020-2025)} \\[0.8em]
            \scriptsize ForeignAssistance.gov \\
            \scriptsize Disbursement Records
        \end{tabular}
    };

    % Top Middle: Hand-Coding Protocol
    \node[box, fill=bgteal, right=1.5cm of src1] (proc1) {
        \begin{tabular}{c}
            \textbf{Hand-Coding Protocol} \\[0.8em]
            \scriptsize Manual cross-referencing \\
            \scriptsize with external bibliographies \\
            \scriptsize (WOLA, CRS, Africa Center)
        \end{tabular}
    };

    % Bottom Middle: AI-Assisted Processing
    \node[box, fill=bgblue, right=1.5cm of src2] (proc2) {
        \begin{tabular}{c}
            \textbf{AI-Assisted Processing} \\[0.8em]
            \scriptsize Gemini regular expression \\
            \scriptsize text parsing appended with \\
            \scriptsize strict manual clearing
        \end{tabular}
    };

    % Right Middle: Unified Dataset (Calculate midpoint between proc1 and proc2)
    \path (proc1.east) -- (proc2.east) coordinate[midway] (midRight);

    \node[box, fill=bgred, right=1.5cm of midRight] (final) {
        \begin{tabular}{c}
            \textbf{Unified Dataset Panel} \\[0.8em]
            \scriptsize Mutually exclusive typologies \\
            \scriptsize across 192 UN states
        \end{tabular}
    };

    % --- Connecting Arrows ---

    % Horizontal arrows from Sources to Processing
    \draw[arrow] (src1.east) -- (proc1.west);
    \draw[arrow] (src2.east) -- (proc2.west);

    % Angled arrows from Processing to Final Unified Dataset
    \draw[arrow] (proc1.east) -- ([yshift=0.3cm]final.west);
    \draw[arrow] (proc2.east) -- ([yshift=-0.3cm]final.west);

    \end{tikzpicture}

    \vspace{0.5em}
    \caption{USASSA Methodology and Data Processing Pipeline}
    \label{fig:methodology_pipeline}
\end{figure}

\section{Available Datasets and Replication Structure}
The USASSA data ecosystem is distributed across five distinct dataset files and one primary replication Stata do-file (\texttt{.do}). These files correspond to distinct temporal scopes, levels of cleaning, and replication needs for the matching published paper in the \textit{Journal of Conflict Resolution} (JCR).

\textbf{Note on Variable Coverage and Raw Data Replication:} Due to storage capacity constraints, the distributed dataset files have been trimmed to retain only the standardized USASSA variable series; several ancillary variables present in the original ForeignAssistance.gov download have been dropped. Researchers who require the complete variable set can download the raw disbursement file directly from \href{https://www.foreignassistance.gov}{ForeignAssistance.gov} and reproduce the fully classified dataset by running the provided do-file \textbf{\texttt{USASSA FA V1.do}}, which replicates the entire cleaning, classification, and variable-construction pipeline from the raw source to the final analytical product.

\subsection{Historical Baseline and JCR Replication Data (2000--2019)}
Three distinct data layers comprise the foundational timeline matching the peer-reviewed JCR article:
\begin{enumerate}[label=\alph*)]
    \item \textbf{\texttt{USASSA\_2023\_complete line item coding\_V4.dta}}: The highly disaggregated line-item raw dataset reflecting individual entries and qualitative descriptions generated by the original manual coding initiative.
    \item \textbf{\texttt{US Assistance to Security Sector Actors\_USASSA\_2024\_country year.dta}}: The collapsed country-year summary sheet bridging the underlying categorical codes to global country panel identifiers.
    \item \textbf{\texttt{USASSA with outcome and control variables for JCR 2024 replication.dta}}: The complete analytical wide-format panel dataset by program.
\end{enumerate}

\subsection{Dataset Expansion Files (2020--2025)}
One file captures the expanded operational scope encompassing recent fiscal cycles derived from ForeignAssistance.gov:
\begin{enumerate}[label=\alph*)]
    \item \textbf{\texttt{USASSA20-25v1.2.dta}}: The clean, filtered expansion profile containing integrated keyword metrics, standardized recipient categories, and algorithmic classifications mapping the ForeignAssistance.gov tracking criteria directly onto original USASSA fields. Note that this file retains only the core USASSA variables; researchers needing the full original ForeignAssistance.gov variable set should download the raw file and run \texttt{USASSA FA V1.do} to replicate the complete dataset.
\end{enumerate}

\subsection{ForeignAssistance.gov Longitudinal Profile (2001--2025)}
\begin{itemize}
    \item \textbf{\texttt{USASSA FA 2001-2025 V1.0.csv}}: A specialized longitudinal dataset constructed exclusively from ForeignAssistance.gov source data tracking the fiscal cycles from 2001 through 2025. Unlike the composite master file, this dataset intentionally omits the historical baseline data from the Security Assistance Monitor to ensure absolute source homogeneity across the entire panel. It structurally preserves all standardized USASSA categorical typologies while natively embedding the \texttt{recipient\_level} geographic scope variable to allow researchers to dynamically manage bilateral vs. regional/global aid allocations. As with other distributed files, some ancillary variables from the original ForeignAssistance.gov download have been dropped due to storage constraints; the full variable set can be reproduced by downloading the raw file from ForeignAssistance.gov and running \texttt{USASSA FA V1.do}.
\end{itemize}

\subsection{Consolidated Longitudinal Profile (2000--2025)}
\begin{itemize}
    \item \textbf{\texttt{USASSA\_00-25v1.2.dta}} \textit{(forthcoming)}: The overarching longitudinal summary product. This master matrix will harmonize data lines from 2000 through 2025 fiscal year. To preserve system compatibility, it will retain exclusively the standardized USASSA variable series across the complete analytical timeline.
\end{itemize}

\subsection{Replication Source Script}
\begin{itemize}
    \item \textbf{\texttt{USASSA dataset JCR paper replication code.do}}: The definitive programmatic script written for Stata. This code runs the collapse schemas, structural transformation passes, loops, and statistical models required to replicate the baseline published findings and compile raw line items into the dynamic panels detailed throughout this text.
    \item \textbf{\texttt{USASSA FA V1.do}}: The do-file for reproducing the complete 2020--2025 expansion dataset from the raw ForeignAssistance.gov download. Researchers who require all original source variables—beyond those retained in the distributed \texttt{.dta} and \texttt{.csv} files—should download the raw disbursement records directly from \href{https://www.foreignassistance.gov}{ForeignAssistance.gov} and execute this script to replicate the full classified dataset.
\end{itemize}

\section{Data Collection and Processing Methodology}

\subsection{Primary Source Consolidation (2000--2019)}
The baseline raw data for the original 2000--2019 panel was gathered by SAM from official unclassified U.S. government documentation, including Congressional Foreign Operations Appropriations bills and Budget Justifications, Joint Reports to Congress on Foreign Military Training and Department of Defense (DoD) Engagement Activities of Interest, Excess Defense Articles (EDA) transactional logs, and strategic regional files obtained under Freedom of Information Act (FOIA) requests.

\subsection{The Hand-Coding Protocol (2000--2019)}
For the initial release, a research team manually reconciled tens of thousands of raw recipient-program-year rows into explicit qualitative descriptions. To categorize rows with ambiguous or standard labels, coders referenced external program bibliographies and supplemental documentation from organizations such as the Africa Center for Strategic Studies, the Congressional Research Service (CRS), and the Washington Office on Latin America (WOLA) to verify the operational reality of individual transfers.

\subsection{Script Automation and AI-Assisted Processing Protocol (2020--2025)}
To eliminate human error and maintain a fully reproducible coding standard for the historical data, the manual determinations were converted into an optimized Stata processing script.

For the 2020--2025 expansion data, the classification process relied exclusively on the text fields \texttt{fundingaccountname}, \texttt{activityname}, and \texttt{activitydescription} provided by the ForeignAssistance.gov release. To process these records transparently and reproducibly, the authors utilized Gemini 3.1 Pro as a data-processing agent to systematically execute the core keyword matching and classification logic.

The algorithmic pipeline operated as follows:
\begin{enumerate}
    \item \textbf{Program Identification:} The \texttt{fundingaccountname} field was analyzed to map each observation to one of the 67 designated Program Numbers.
    \item \textbf{Typology Classification:} The \texttt{activityname} and \texttt{activitydescription} text fields were parsed for specific operational keywords (e.g., ``ammunition,'' ``training,'' ``coast guard'') to systematically assign the granular \texttt{aidtype} and \texttt{recipienttype} identifiers.
    \item \textbf{Out-of-Scope Identification:} The algorithm structurally generated a binary variable (\texttt{out\_of\_scope}) to explicitly isolate and flag line items that fall outside the defined boundaries of U.S. security assistance.
    \item \textbf{Default Handling for Missing Text:} To ensure dataset completeness without introducing speculative bias, any valid security assistance record that lacked sufficient descriptive text to trigger a specific keyword match was computationally assigned the codebook's default values: \textbf{14 (Unclear)} for Aid Type and \textbf{8 (Unknown)} for Recipient Type.
\end{enumerate}

\textbf{Post-AI Manual Revision and Cleaning:} The automated AI process is strictly supplemented by a rigorous, line-by-line revision conducted by the authors and Ph.D.-level graduate research assistants after cleaning the raw dataset. This comprehensive data cleaning protocol consists of two distinct steps: first, algorithmically dropping records identified as non-security assistance using a predefined DO file; second, executing a one-by-one manual review of all observations flagged by the AI agent as \texttt{out\_of\_scope} to prevent false positives and verify proper categorization.

\textbf{Transparency and Raw Data Access:}
To ensure full transparency and allow for further revision, the output of this process is preserved as a discrete dataset file. This file contains the newly generated \texttt{program\_num}, \texttt{aidtype}, \texttt{recipienttype}, and \texttt{out\_of\_scope} classifications appended directly alongside the core USASSA variables. Researchers requiring the complete set of original ForeignAssistance.gov variables may download the raw disbursement records from \href{https://www.foreignassistance.gov}{ForeignAssistance.gov} and execute \texttt{USASSA FA V1.do} to reproduce the fully annotated dataset.

\subsection{Inclusion and Exclusion Criteria}
To ensure the dataset measures direct security assistance accurately, specific rules guide the inclusion and exclusion of funding accounts and geographic targets. For research purposes, programs focused on security-sector assistance and peacebuilding/stabilization are included, while those focused primarily on democracy, civil society, or health are excluded.

\textbf{Program Exclusions and Non-Security Flags:}
Funding accounts without a primary security assistance or military objective are inherently outside the scope of the lethal/non-lethal analytical framework. This strict boundary excludes programs focused on economic development, infrastructure building, public health, and general humanitarian action that do not constitute direct security assistance. Crucially, these non-security programs are excluded even when they are directly implemented or managed by military branches such as the Department of Defense, the Army, the Navy, or the Air Force. For instance, large-scale nation-building accounts like the Iraq Relief and Reconstruction Fund in the civil infrastructure component. This exclusion logic also applies to USAID programs, humanitarian assistance strictly for refugees, the Department of State's Global Health Programs, the DoD's HIV/AIDS Prevention Program, and the Department of State's Democracy Fund.


\textbf{Program Inclusions and Nuance:}
Certain programs operate at the intersection of security and civilian affairs but are retained due to their strategic military applications:
\begin{itemize}[noitemsep, topsep=2pt]
    \item \textbf{Overseas Humanitarian, Disaster, and Civic Aid (OHDACA):} Administered by the Department of Defense, this account is best understood as a security cooperation and humanitarian assistance program. Unlike the Democracy Fund, OHDACA is explicitly designed to use humanitarian activities to advance U.S. strategic, military, and national security objectives.
    \item \textbf{Peacekeeping Operations (PKO):} While challenging to classify because it combines security assistance, peacekeeping capacity-building, stabilization, and security-sector reform, the PKO account is included given its fundamental orientation toward security-sector and stabilization assistance.
\end{itemize}

\section{Core Dataset Variables}

\begin{longtable}{>{\ttfamily}p{0.25\textwidth} p{0.7\textwidth}}
\toprule
\textbf{Variable Name} & \textbf{Operational Definition, Scale, and Coding Protocol} \\
\midrule
\endhead

country & \textbf{Country Name:} Standard string labels corresponding to ISO-3166-1 baseline definitions. \\
\addlinespace
ccode & \textbf{Correlates of War Code:} Numeric country code matching the standard COW system. \\
\addlinespace
ccode\_iso & \textbf{ISO Numeric Code:} Numeric version of the country identifier. \\
\addlinespace
year & \textbf{Fiscal Year:} Numeric integer tracking the delivery cycle. \\
\addlinespace
total\_SA & \textbf{Total Security Assistance:} Aggregated financial disbursements to that entity in a given fiscal year, calculated in constant 2010 U.S. dollars. Source: Security Assistance Monitor.\\
\addlinespace
program\_num & \textbf{Program Number:} Numeric identifier mapping the funding line to one of 67 designated U.S. Security Assistance programs (See Appendix A). \\
\addlinespace
aidtype & \textbf{Aid Type:} Numeric categorical variable (1--14) identifying the functional nature of the assistance provided. \\
\addlinespace
recipienttype & \textbf{Recipient Type:} Numeric categorical variable (1--8) identifying the organizational branch receiving the assistance. \\
\addlinespace
recipient\_level & \textbf{Geographic Scope of Recipient:} Numeric categorical variable identifying the geographic scope of the recipient aid (1 = Bilateral, 2 = Regional, 3 = Global). \\
\addlinespace
lethal\_assistance & \textbf{Lethal Assistance (2020--2025):} Numeric categorical variable indicating whether the assistance enhances the recipient's capacity to use deadly force (0 = Unclear, 1 = Lethal, 2 = Nonlethal). \\
\addlinespace
command & \textbf{US Combatant Commands Deployed:} Numeric categorical variable (1--6) identifying the specific U.S. regional military command mapped to the recipient location. \\
\addlinespace
constantUSD & \textbf{Constant U.S. Dollars (Millions):} The total financial disbursement of security assistance for the given observation standardized into constant U.S. dollars. Source: ForeignAssistance.gov. \\

\bottomrule
\end{longtable}

\section{Disaggregated Typologies}

\subsection{Aid Type Categories (\texttt{aidtype})}
\begin{longtable}{>{\ttfamily}p{0.15\textwidth} p{0.8\textwidth}}
\toprule
\textbf{Value} & \textbf{Qualitative Coding Criteria} \\
\midrule
\endhead
1 (material) & \textbf{Material Support:} Physical transfers of weapons, active ammunition, gear, vehicles, military construction infrastructure, and direct operational expense subsidies. \\
\addlinespace
2 (training) & \textbf{Military Training:} Kinetic combat instruction, pilot configurations, tactical procedures, and exercises where military-grade weapon handling is integrated. \\
\addlinespace
3 (combat assist)& \textbf{Combat Assistance:} Direct tactical support and engagement operations. \\
\addlinespace
4 (train \& equip) & \textbf{Train and Equip:} Comprehensive defense packages requiring synchronized hardware delivery alongside operational field training. \\
\addlinespace
5 (education) & \textbf{Security Sector Education:} Non-combat officer modules, international humanitarian law compliance, human rights protections, and language training. \\
\addlinespace
6 (logistical) & \textbf{Logistical/Technical Support:} Technical maintenance contracts, staging, or transport coordination supplied by U.S. forces or defense contractors. \\
\addlinespace
7 (joint ex.) & \textbf{Joint Exercises:} Multi-national defense maneuvers involving co-deployed U.S. active troops and host-nation security actors. \\
\addlinespace
8 (SSR) & \textbf{Security Sector Reform:} Defense institution development, civil control enforcement mechanisms, legal system updates, and anti-corruption adjustments. \\
\addlinespace
9 (law enf.) & \textbf{Law Enforcement:} Civilian policing agencies, criminal investigation support, coastal guard maneuvers, and port security networks. Excludes kinetic anti-terror units. \\
\addlinespace
10 (counternar.) & \textbf{Counternarcotics:} Eradication efforts, crop interventions, border drug interdiction infrastructure, and operations against drug-trafficking syndicates. \\
\addlinespace
11 (humanit.) & \textbf{Humanitarian Aid:} Demining actions, active weapons destruction programs, and demobilization and reintegration support. \\
\addlinespace
12 (counterpro.) & \textbf{Counterproliferation:} Checking the distribution of nuclear, chemical, or biological assets (WMDs) alongside sensitive dual-use hardware tracks. \\
\addlinespace
13 (other) & \textbf{Other:} Security assistance that is clearly defined in the source documentation but does not fit within the predefined functional typologies 1 through 12. \\
\addlinespace
14 (unclear) & \textbf{Unclear/Unknown:} Default categorization for records lacking sufficient descriptive text to determine the specific nature of the assistance provided. \\
\bottomrule
\end{longtable}

\subsection{Recipient Type Categories (\texttt{recipienttype})}
\begin{longtable}{>{\ttfamily}p{0.15\textwidth} p{0.8\textwidth}}
\toprule
\textbf{Value} & \textbf{Target Entity Definition} \\
\midrule
\endhead
1 (Army/ground) & \textbf{Army and Ground Forces:} Conventional land infrastructure and army operations. \\
\addlinespace
2 (Air forces) & \textbf{Air Forces:} Fixed-wing and rotary tactical hardware and pilot training units. \\
\addlinespace
3 (Naval/river.) & \textbf{Naval/Riverine Forces:} Maritime surveillance, coastal commands, and open-water equipment. \\
\addlinespace
4 (Police) & \textbf{Police/Civil Law Enf.:} Domestic police forces and urban civilian stability units. \\
\addlinespace
5 (Special for.) & \textbf{Special Forces:} Elite kinetic units operating outside traditional civilian police brackets or standard military hierarchies. \\
\addlinespace
6 (Civilians) & \textbf{Civilians/Government:} Funding directly to civil oversight actors, defense ministry policy staff, or civil society groups. \\
\addlinespace
7 (Unspecified) & \textbf{Unspecified Security Forces:} Shared programs touching multiple military units or containing mixed force configurations. \\
\addlinespace
8 (Unknown) & \textbf{Unknown Target:} Base records missing identifying structural tracking markers for recipient forces. \\
\bottomrule
\end{longtable}

\subsection{Combatant Command Categories (\texttt{command})}
\begin{longtable}{>{\ttfamily}p{0.15\textwidth} p{0.8\textwidth}}
\toprule
\textbf{Value} & \textbf{Command Definition} \\
\midrule
\endhead
1 & \textbf{Africa Command} \\
\addlinespace
2 & \textbf{Central Command} \\
\addlinespace
3 & \textbf{European Command} \\
\addlinespace
4 & \textbf{Indo-Pacific Command} \\
\addlinespace
5 & \textbf{Northern Command} \\
\addlinespace
6 & \textbf{Southern Command} \\
\addlinespace
7 & \textbf{World -- No Specific Command} \\
\bottomrule
\end{longtable}

\subsection{Lethal Assistance (\texttt{lethal\_assistance})}
\begin{longtable}{>{\ttfamily}p{0.15\textwidth} p{0.8\textwidth}}
\toprule
\textbf{Value} & \textbf{Lethal Assistance Definition} \\
\midrule
\endhead
0 & \textbf{Unclear} \\
\addlinespace
1 & \textbf{Lethal} \\
\addlinespace
2 & \textbf{Nonlethal} \\
\bottomrule
\end{longtable}


\section{Lethal and Non-Lethal Aid Typologies for Replication}
To protect empirical comparisons from modeling noise across sparsely populated individual line items, the collection implements two critical composite transformations. These transformations aggregate the granular \texttt{aidtype} numeric categories into broader strategic indices:

\begin{itemize}
    \item \texttt{lethal}: Merges all values classified under material support (\texttt{aidtype == 1}), military training (\texttt{aidtype == 2}), and coordinated train-and-equip authorities (\texttt{aidtype == 4}) into a unified index tracking tools that directly enhance a state's capacity to use deadly force.
    \item \texttt{nonlethal}: Aggregates security sector education (\texttt{aidtype == 5}), structural security sector reform (\texttt{aidtype == 8}), humanitarian security interventions (\texttt{aidtype == 11}), and explicit counterproliferation spending (\texttt{aidtype == 12}).
    \item \textbf{Uncategorized/Dual-Use Types:} Aid types 3 (combat assistance), 6 (logistical support), 7 (joint exercises), 9 (law enforcement), and 10 (counternarcotics) are purposefully excluded from the binary lethal/nonlethal aggregation. These categories represent dual-use programs, non-material operational support, or domestic policing that do not cleanly align with the strict lethal/nonlethal military material framework.
\end{itemize}

For the foundational 2000--2019 dataset, the criteria used to delineate lethal from non-lethal aid relied heavily on qualitative item identification. This rigorous evaluation required the explicit identification of lethal aid components within the raw transaction text---such as munitions, weapons, or armory provisions---to classify the assistance into the respective lethal framework.

For the 2020--2025 dataset expansion, researchers can directly utilize the \texttt{lethal\_assistance} categorical variable (0 = Unclear, 1 = Lethal, 2 = Nonlethal) to immediately identify these programmatic distinctions.


\newpage
\appendix
\section{Appendix A: Program Number Definitions}

\begin{longtable}{r p{0.8\textwidth}}
\toprule
\textbf{No.} & \textbf{Program Name} \\
\midrule
\endhead
1 & Afghanistan Security Forces Fund \\
2 & Assistance for Europe, Eurasia and Central Asia \\
3 & Aviation Leadership Program \\
4 & Coalition Support Funds \\
5 & Combating Terrorism Fellowship Program \\
6 & Cooperative Threat Reduction \\
7 & Counter-Islamic State in Iraq and Syria \\
8 & Counterterrorism Partnerships Fund \\
9 & Defense Institute of International Legal Studies \\
10 & Defense Institution Reform Initiative \\
11 & Department of Homeland Security - U.S. Coast Guard Activities \\
12 & Developing Country Combined Exercise Program \\
13 & Emergency Drawdowns \\
14 & European Deterrence Initiative \\
15 & European Reassurance Initiative \\
16 & Excess Defense Articles \\
17 & Foreign Military Financing \\
18 & Freedom Support Act Security Assistance \\
19 & Global Lift and Sustain \\
20 & Global Security Contingency Fund \\
21 & Global Security Contingency Fund (DOD) \\
22 & Global Security Contingency Fund (DOS) \\
23 & International Counterproliferation Programs \\
24 & International Military Education and Training \\
25 & International Narcotics Control and Law Enforcement \\
26 & Iraq Security Forces Fund \\
27 & Iraq Train and Equip Fund \\
28 & Israel Cooperative Programs \\
29 & Misc Dept of State \& Dept of Defense Non-Security Assistance \\
30 & Non-Security Assistance - Unified Command \\
31 & Nonproliferation, Anti-Terrorism, Demining, and Related Programs \\
32 & Pakistan Counterinsurgency Capability Fund \\
33 & Peacekeeping Operations \\
34 & Regional Centers for Security Studies \\
35 & Section 1004 Counter-Drug Assistance \\
36 & Section 1033 Counter-Drug Assistance \\
37 & Section 1206 Train and Equip Authority \\
38 & Section 1207 Security and Stabilization Assistance \\
39 & Section 333 Building Partner Capacity \\
40 & Southeast Asia Maritime Security Initiative \\
41 & State Partnership Program \\
42 & Syria Train and Equip Fund \\
43 & Wales Initiative \\
44 & Afghanistan Train and Equip Authority \\
45 & African Partnership (Flight and Station) \\
46 & Continuing Promise \\
47 & Enhanced International Peacekeeping Capabilities \\
48 & Exchange Training \\
49 & Indo-Pacific Maritime Security Initiative \\
50 & Professional Military Education Exchanges \\
51 & Service Academies \\
52 & Section 1207(n) Transitional Authority \\
53 & Ukraine Security Assistance Initiative \\
54 & Inter-American Air Forces Academy \\
55 & Inter-European Air Forces Academy \\
56 & International Criminal Investigations and Training \\
57 & MAP \\
58 & Military to Military Engagements \\
59 & Ministry of Defense Advisors Program \\
60 & Pacific Partnership Station \\
61 & Section 1208 Authority \\
62 & Security Cooperation Programs \\
63 & Southern Partnership Station \\
64 & Western Hemisphere Institute for Security Cooperation \\
65 & Training with Friendly Foreign Countries \\
66 & Joint Combined Exchange Training \\
67 & Presidential Drawdown Authority \\
68 & Department of Justice Programs \\
\bottomrule
\end{longtable}

\end{document}
