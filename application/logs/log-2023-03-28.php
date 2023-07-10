<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2023-03-28 08:51:47 --> Severity: Notice --> Undefined index: HTTP_REFERER C:\xampp2\htdocs\X-UI\application\controllers\Auth.php 22
ERROR - 2023-03-28 09:04:04 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 09:04:04 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 09:04:04 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 09:17:30 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 09:17:30 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 09:17:30 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 09:33:08 --> Query error: Unknown column 'bf_leads.agent_date_time' in 'where clause' - Invalid query: SELECT `t1`.`id`, `t2`.`id` as `company_id`, `t1`.`first_name`, `t1`.`last_name`, `t1`.`middle_name`, `t2`.`name` as `Company`, `direct_number`, `mobile_number`, `office_number`, `title`, `t5`.`name` `job_level`, `t6`.`name` `job_function`, `t12`.`name` `Industry`, `t13`.`name` `Employee`, `t14`.`name` `Revenue`, `t7`.`name` `country`, `t1`.`state`, `t1`.`city`, `t1`.`zip`, `job_info`, `prospect_technology`, `company_technology`
FROM `bf_prospects` `t1`
LEFT JOIN `bf_companies` `t2` ON `t1`.`company_id`=`t2`.`id`
LEFT JOIN `bf_domains` `t3` ON `t2`.`id`=`t3`.`company_id`
LEFT JOIN `bf_udc_job_level` `t5` ON `t1`.`job_level_id`=`t5`.`id`
LEFT JOIN `bf_udc_job_function` `t6` ON `t1`.`job_functions_id`=`t6`.`id`
LEFT JOIN `bf_udc_country` `t7` ON `t1`.`country`=`t7`.`id`
LEFT JOIN `bf_udc_industry` `t12` ON `t2`.`Industry_Type_id`=`t12`.`id`
LEFT JOIN `bf_udc_employee_size` `t13` ON `t2`.`Employee_Size_id`=`t13`.`id`
LEFT JOIN `bf_udc_revenue` `t14` ON `t2`.`Revenue_id`=`t14`.`id`
LEFT JOIN `bf_prospects_technology` ON `t1`.`id` = `bf_prospects_technology`.`prospect_id`
LEFT JOIN `bf_company_technology` ON `t1`.`company_id` = `bf_company_technology`.`company_id`
WHERE `t1`.`job_level_id` IN('9')
AND `t1`.`job_functions_id` IN('20')
AND `t2`.`Industry_Type_id` IN('296')
AND `t2`.`Employee_Size_id` IN('13')
AND `t1`.`country` IN('107')
AND   (
`t1`.`title` LIKE '%manager%' ESCAPE '!'
 )
AND   (
`prospect_technology` LIKE '%sss%' ESCAPE '!'
 )
AND   (
`company_technology` LIKE '%sss%' ESCAPE '!'
 )
AND   (
`bf_leads`.`agent_date_time` >= '2023-03-01T09:32'
AND `t1`.`created_on` <= '2023-04-02T09:33'
 )
AND `t1`.`customer_id` = '2'
ORDER BY `t1`.`id`
 LIMIT 1
ERROR - 2023-03-28 10:00:24 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 10:00:29 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 10:00:30 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 10:00:30 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 10:00:31 --> Severity: Notice --> Undefined variable: grade C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 101
ERROR - 2023-03-28 10:00:31 --> Severity: Warning --> Invalid argument supplied for foreach() C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 101
ERROR - 2023-03-28 10:00:31 --> Severity: Notice --> Undefined variable: client C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 110
ERROR - 2023-03-28 10:00:31 --> Severity: Warning --> Invalid argument supplied for foreach() C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 110
ERROR - 2023-03-28 11:21:21 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:21:29 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:21:30 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:21:31 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:21:31 --> Severity: Notice --> Undefined variable: grade C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 101
ERROR - 2023-03-28 11:21:31 --> Severity: Warning --> Invalid argument supplied for foreach() C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 101
ERROR - 2023-03-28 11:21:31 --> Severity: Notice --> Undefined variable: client C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 110
ERROR - 2023-03-28 11:21:31 --> Severity: Warning --> Invalid argument supplied for foreach() C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 110
ERROR - 2023-03-28 11:28:16 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:28:20 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:28:20 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:30:59 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:31:01 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:31:01 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:39:19 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:39:20 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:39:20 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:44:37 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:44:40 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 11:44:41 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 12:18:49 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 12:19:00 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 12:19:03 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 12:19:04 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 12:19:07 --> Severity: Notice --> Undefined variable: grade C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 101
ERROR - 2023-03-28 12:19:07 --> Severity: Warning --> Invalid argument supplied for foreach() C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 101
ERROR - 2023-03-28 12:19:07 --> Severity: Notice --> Undefined variable: client C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 110
ERROR - 2023-03-28 12:19:07 --> Severity: Warning --> Invalid argument supplied for foreach() C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 110
ERROR - 2023-03-28 12:26:41 --> Severity: Error --> Maximum execution time of 120 seconds exceeded C:\xampp2\htdocs\X-UI\system\database\drivers\mysqli\mysqli_driver.php 305
ERROR - 2023-03-28 12:26:41 --> Severity: Warning --> Unknown: Cannot call session save handler in a recursive manner Unknown 0
ERROR - 2023-03-28 12:26:41 --> Severity: Warning --> Unknown: Failed to write session data using user defined save handler. (session.save_path: C:\xampp2\tmp) Unknown 0
ERROR - 2023-03-28 12:54:58 --> Severity: error --> Exception: Object of class CI_DB_mysqli_result could not be converted to string C:\xampp2\htdocs\X-UI\system\database\DB_query_builder.php 836
ERROR - 2023-03-28 13:12:27 --> Severity: Notice --> Undefined variable: grade C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 101
ERROR - 2023-03-28 13:12:27 --> Severity: Warning --> Invalid argument supplied for foreach() C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 101
ERROR - 2023-03-28 13:12:27 --> Severity: Notice --> Undefined variable: client C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 110
ERROR - 2023-03-28 13:12:27 --> Severity: Warning --> Invalid argument supplied for foreach() C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 110
ERROR - 2023-03-28 13:18:55 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:18:55 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:18:55 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:19:47 --> Severity: error --> Exception: Object of class CI_DB_mysqli_driver could not be converted to string C:\xampp2\htdocs\X-UI\application\controllers\Prospects.php 110
ERROR - 2023-03-28 13:24:47 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:24:50 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:24:51 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:29:03 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:29:05 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:29:06 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:30:25 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:30:31 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:30:31 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:50:45 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:50:45 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 13:50:45 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 14:42:56 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 14:43:20 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 14:44:05 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 14:44:38 --> 404 Page Not Found: Resources/themes
ERROR - 2023-03-28 14:44:42 --> Severity: Notice --> Undefined variable: grade C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 101
ERROR - 2023-03-28 14:44:42 --> Severity: Warning --> Invalid argument supplied for foreach() C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 101
ERROR - 2023-03-28 14:44:42 --> Severity: Notice --> Undefined variable: client C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 110
ERROR - 2023-03-28 14:44:42 --> Severity: Warning --> Invalid argument supplied for foreach() C:\xampp2\htdocs\X-UI\resources\themes\zanex\view\campaign\models\create.php 110
ERROR - 2023-03-28 16:11:44 --> Severity: Error --> Maximum execution time of 120 seconds exceeded C:\xampp2\htdocs\X-UI\system\database\drivers\mysqli\mysqli_driver.php 305
