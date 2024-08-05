
WITH company_job_count as (


    SELECT 
        company_id,
        COUNT(*) as total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id

)

SELECT 
    company_dim.name as company_name,
    company_job_count.total_jobs 



FROM company_dim

LEFT JOIN company_job_count on company_job_count.company_id = company_dim.company_id

ORDER BY total_jobs DESC
