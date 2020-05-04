SELECT 
  jobs.id AS `jobs__id`, 
  jobs.NAME AS `jobs__name`, 
  jobs.media_id AS `jobs__media_id`, 
  jobs.job_category_id AS `jobs__job_category_id`, 
  jobs.job_type_id AS `jobs__job_type_id`, 
  jobs.description AS `jobs__description`, 
  jobs.detail AS `jobs__detail`, 
  jobs.business_skill AS `jobs__business_skill`, 
  jobs.knowledge AS `jobs__knowledge`, 
  jobs.location AS `jobs__location`, 
  jobs.activity AS `jobs__activity`, 
  jobs.academic_degree_doctor AS `jobs__academic_degree_doctor`, 
  jobs.academic_degree_master AS `jobs__academic_degree_master`, 
  jobs.academic_degree_professional AS `jobs__academic_degree_professional`, 
  jobs.academic_degree_bachelor AS `jobs__academic_degree_bachelor`, 
  jobs.salary_statistic_group AS `jobs__salary_statistic_group`, 
  jobs.salary_range_first_year AS `jobs__salary_range_first_year`, 
  jobs.salary_range_average AS `jobs__salary_range_average`, 
  jobs.salary_range_remarks AS `jobs__salary_range_remarks`, 
  jobs.restriction AS `jobs__restriction`, 
  jobs.estimated_total_workers AS `jobs__estimated_total_workers`, 
  jobs.remarks AS `jobs__remarks`, 
  jobs.url AS `jobs__url`, 
  jobs.seo_description AS `jobs__seo_description`, 
  jobs.seo_keywords AS `jobs__seo_keywords`, 
  jobs.sort_order AS `jobs__sort_order`, 
  jobs.publish_status AS `jobs__publish_status`, 
  jobs.version AS `jobs__version`, 
  jobs.created_by AS `jobs__created_by`, 
  jobs.created AS `jobs__created`, 
  jobs.modified AS `jobs__modified`, 
  jobs.deleted AS `jobs__deleted`, 
  jobcategories.id AS `jobcategories__id`, 
  jobcategories.NAME AS `jobcategories__name`, 
  jobcategories.sort_order AS `jobcategories__sort_order`, 
  jobcategories.created_by AS `jobcategories__created_by`, 
  jobcategories.created AS `jobcategories__created`, 
  jobcategories.modified AS `jobcategories__modified`, 
  jobcategories.deleted AS `jobcategories__deleted`, 
  jobtypes.id AS `jobtypes__id`, 
  jobtypes.NAME AS `jobtypes__name`, 
  jobtypes.job_category_id AS `jobtypes__job_category_id`, 
  jobtypes.sort_order AS `jobtypes__sort_order`, 
  jobtypes.created_by AS `jobtypes__created_by`, 
  jobtypes.created AS `jobtypes__created`, 
  jobtypes.modified AS `jobtypes__modified`, 
  jobtypes.deleted AS `jobtypes__deleted` 
FROM 
  jobs jobs 
  LEFT JOIN jobs_personalities jobspersonalities ON jobs.id = (jobspersonalities.job_id) 
  LEFT JOIN personalities personalities ON (
    personalities.id = (
      jobspersonalities.personality_id
    ) 
    AND (personalities.deleted) IS NULL
  ) 
  LEFT JOIN jobs_practical_skills jobspracticalskills ON jobs.id = (jobspracticalskills.job_id) 
  LEFT JOIN practical_skills practicalskills ON (
    practicalskills.id = (
      jobspracticalskills.practical_skill_id
    ) 
    AND (practicalskills.deleted) IS NULL
  ) 
  LEFT JOIN jobs_basic_abilities jobsbasicabilities ON jobs.id = (jobsbasicabilities.job_id) 
  LEFT JOIN basic_abilities basicabilities ON (
    basicabilities.id = (
      jobsbasicabilities.basic_ability_id
    ) 
    AND (basicabilities.deleted) IS NULL
  ) 
  LEFT JOIN jobs_tools jobstools ON jobs.id = (jobstools.job_id) 
  LEFT JOIN affiliates tools ON (
    tools.type = 1 
    AND tools.id = (jobstools.affiliate_id) 
    AND (tools.deleted) IS NULL
  ) 
  LEFT JOIN jobs_career_paths jobscareerpaths ON jobs.id = (jobscareerpaths.job_id) 
  LEFT JOIN affiliates careerpaths ON (
    careerpaths.type = 3 
    AND careerpaths.id = (jobscareerpaths.affiliate_id) 
    AND (careerpaths.deleted) IS NULL
  ) 
  LEFT JOIN jobs_rec_qualifications jobsrecqualifications ON jobs.id = (jobsrecqualifications.job_id) 
  LEFT JOIN affiliates recqualifications ON (
    recqualifications.type = 2 
    AND recqualifications.id = (
      jobsrecqualifications.affiliate_id
    ) 
    AND (recqualifications.deleted) IS NULL
  ) 
  LEFT JOIN jobs_req_qualifications jobsreqqualifications ON jobs.id = (jobsreqqualifications.job_id) 
  LEFT JOIN affiliates reqqualifications ON (
    reqqualifications.type = 2 
    AND reqqualifications.id = (
      jobsreqqualifications.affiliate_id
    ) 
    AND (reqqualifications.deleted) IS NULL
  ) 
  INNER JOIN job_categories jobcategories ON (
    jobcategories.id = (jobs.job_category_id) 
    AND (jobcategories.deleted) IS NULL
  ) 
  INNER JOIN job_types jobtypes ON (
    jobtypes.id = (jobs.job_type_id) 
    AND (jobtypes.deleted) IS NULL
  ) 
WHERE 
  (
    (
      jobcategories.NAME LIKE '​%キャビンアテンダント%' ​ 
      OR jobtypes.NAME LIKE '​%キャビンアテンダント%​' 
      OR jobs.NAME LIKE '​%キャビンアテンダント%​' 
      OR jobs.description LIKE '​%キャビンアテンダント%​' 
      OR jobs.detail LIKE '​%キャビン アテンダント%​' 
      OR jobs.business_skill LIKE '​%キャビンアテンダ ント%​' 
      OR jobs.knowledge LIKE '​%キャビンアテンダント%​' 
      OR jobs.location LIKE '​%キャビンアテンダント%​' 
      OR jobs.activity LIKE '​%キャビンアテンダント%​' 
      OR jobs.salary_statistic_group LIKE '​%キャビンアテンダント%​' 
      OR jobs.salary_range_remarks LIKE '​%キャビンアテンダント%​' 
      OR jobs.restriction LIKE '​%キャ ビンアテンダント%​' 
      OR jobs.remarks LIKE '​%キャビンアテンダ ント%​' 
      OR personalities.NAME LIKE '​%キャビンアテンダント%​' 
      OR practicalskills.NAME LIKE '​%キャビンアテンダント%​' 
      OR basicabilities.NAME LIKE '​%キャビンアテンダント%​' 
      OR tools.NAME LIKE '​%キャビンアテンダント%​' 
      OR careerpaths.NAME LIKE '​%キャビンアテンダント%​' 
      OR recqualifications.NAME LIKE '​%キャビンアテンダント%​' 
      OR reqqualifications.NAME LIKE '​%キャビンアテンダント%​'
    ) 
    AND publish_status = 1 
    AND (jobs.deleted) IS NULL
  ) 
GROUP BY 
  jobs.id 
ORDER BY 
  jobs.sort_order DESC, 
  jobs.id DESC 
limit 
  50 offset 0
