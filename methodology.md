<div align="right">
  <a href="index.html">Home</a> | 
  <a href="dataset.html">Dataset Versions</a> | 
  <a href="data_visualizations.html">Visualizations</a> | 
  <strong>Methodology</strong> | 
  <a href="papers.html">Publications</a>
</div>

# Data Pipeline and Methodology

Bridging the gap between raw government disbursement logs and rigorous academic analysis requires a structured, reproducible processing pipeline. 

## The USASSA Architecture

![Methodology Flowchart](methodology.png)

The creation of the Version 2.0 dataset (expanding coverage through 2026) relies on a hybrid approach that maximizes both scale and accuracy:

1.  **Primary Sources:** We begin with unstructured and semi-structured disbursement logs publicly provided by ForeignAssistance.gov and mandated Department of Defense (DoD) reports to Congress.
2.  **Data Processing:** To handle the massive volume of recent transactions, the raw text fields (`fundingaccountname`, `activityname`, `activitydescription`) are processed using an AI-assisted keyword matching script. This algorithm maps raw entries to our established typologies. Crucially, this automated drafting phase is subjected to rigorous manual verification by the research team to correct misclassifications and handle edge cases.
3.  **Final Output:** The pipeline yields a clean, country-year panel dataset. Every valid record is assigned a Program Number, a functional Aid Type (1-14), and a Recipient Type (1-8), alongside calculated composite indices for `lethal` and `nonlethal` aid.

*For a complete breakdown of the exclusion rules, geographic parameters, and qualitative coding criteria, please review the official codebook available on the [Dataset Downloads](dataset.html) page.*
