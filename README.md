# Health Pharmaceuticals – Drug Portfolio Analytics: A data‑driven R&D allocation strategy using FDA and Medicare data.
This project combines chemical domain knowledge with a full analytics pipeline (Excel → SQL → Python → Tableau) to compare the market performance of natural‑derived, synthetic, and biotech drugs. The result is an evidence‑based recommendation for a annual R&D budget.
Data: FDA Drugs@FDA (3,200+ drugs) + Medicare Part D 2023 (prescriptions & costs)
Classification: Chemical suffix patterns (-statin → natural, -mab → biotech, -zole → synthetic) validated against DrugBank (92% accuracy)
Key finding: Natural‑derived drugs offer the best risk‑adjusted return – strong revenue ($11.4B), high prescription volume (204M), and higher clinical trial success rates.
Recommendation: 50% natural, 30% biotech, 20% synthetic.
#  Repository Contents        Folder	Contents
  /pdf                        pdf report file 
  /data	                      Cleaned CSV files (classified drugs, Medicare aggregates)
  /notebooks	                Jupyter notebook with EDA, t‑test, ANOVA, visualisations
  /sql	                      All SQL queries (aggregation, joins, business questions)
  /tableau	                  https://public.tableau.com/app/profile/dayo.akindahunsi
  requirements.txt	          Python dependencies
#  How to Reproduce
Clone the repo and install dependencies: pip install -r requirements.txt
Explore the SQLite database (rxhealth_analysis.db) using DB Browser
Run the Jupyter notebook to reproduce statistics and plots
View the interactive dashboard via the link in /tableau
#  Key Results
Biotech: Highest revenue per drug ($185M), lowest patient volume (4.5M prescriptions). High‑risk, high‑reward.
Natural‑derived: Balanced – $11.4B revenue, 204M prescriptions, superior clinical success rates.
Synthetic: Highest prescription volume (216M) but lowest revenue ($5.3B) and lowest cost per prescription ($24). Generic‑driven.
Statistical tests (ANOVA p = 0.038, Welch’s t‑test p < 0.05) confirm that the differences are significant and not random.
#  Business Recommendation
Allocate the R&D budget as:
50% to natural‑derived – Balanced return, lower risk, proven success.
30% to biotech – High upside, but manage risk via partnerships.
20% to synthetic – Only novel, patent‑protected molecules.
A quarterly dashboard review is recommended to adapt to market changes.





