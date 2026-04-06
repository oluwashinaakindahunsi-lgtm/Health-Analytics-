#	Aggregation medicare_raw to medicare cleaned 
CREATE TABLE medicare_cleaned AS
SELECT 
    UPPER(TRIM(generic_name)) AS drug_name_clean,
    SUM(total_claim_count) AS total_prescriptions,
    SUM(total_drug_cost) AS total_drug_cost
FROM medicare_raw
WHERE generic_name IS NOT NULL 
  AND total_claim_count > 0
GROUP BY UPPER(TRIM(generic_name));
#	Recreating the join for drug_revenue_std
CREATE TABLE drug_revenue_std AS
SELECT 
    c.Drug_Origin,
    c.Ingredient_Clean,
    m.total_prescriptions,
    m.total_drug_cost
FROM classified_drugs c
JOIN medicare_cleaned m 
    ON UPPER(TRIM(c.Ingredient_Clean)) = m.drug_name_clean;
#	Business queries (prescriptions and revenue by origin)
SELECT 
    c.Drug_Origin,
    SUM(m.total_prescriptions) AS total_prescriptions,
    SUM(m.total_drug_cost) AS total_revenue,
    COUNT(DISTINCT c.Ingredient_Clean) AS number_of_drugs
FROM classified_drugs c
JOIN medicare_cleaned m
    ON UPPER(TRIM(c.Ingredient_Clean)) = m.drug_name_clean
GROUP BY c.Drug_Origin;
#	Top 20 drugs by revenue
SELECT 
    c.Ingredient_Clean AS drug_name,
    c.Drug_Origin,
    m.total_prescriptions,
    m.total_drug_cost AS revenue
FROM classified_drugs c
JOIN medicare_cleaned m
    ON UPPER(TRIM(c.Ingredient_Clean)) = m.drug_name_clean
ORDER BY revenue DESC
LIMIT 20;
