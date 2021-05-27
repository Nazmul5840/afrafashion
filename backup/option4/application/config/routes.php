<?php

defined('BASEPATH') or exit('No direct script access allowed');

$route['default_controller'] = 'main';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

/** * :: Custom Routes :: * * */
$route['admin'] = 'admin/auth';

/** * :: World Of Jilan Section :: * * */
$route['world-of-jilan/biography'] = 'Worldofjilan/biography';
$route['world-of-jilan/inifdDhaka'] = 'Worldofjilan/inifdDhaka';
$route['world-of-jilan/intercoAcademyToronto'] = 'Worldofjilan/intercoAcademyToronto';
$route['world-of-jilan/certificate'] = 'Worldofjilan/certificate';
$route['world-of-jilan/academic/institute'] = 'Worldofjilan/institute';
$route['world-of-jilan/academic/university'] = 'Worldofjilan/university';
$route['world-of-jilan/family'] = 'Worldofjilan/family';
$route['world-of-jilan/office'] = 'Worldofjilan/office';
$route['world-of-jilan/studio'] = 'Worldofjilan/studio';
$route['world-of-jilan/theone'] = 'Worldofjilan/theone';
$route['world-of-jilan/eidfestdhaka'] = 'Worldofjilan/eidfestdhaka';
$route['world-of-jilan/eidfesttoronto'] = 'Worldofjilan/eidfesttoronto';
$route['world-of-jilan/memorydhaka'] = 'Worldofjilan/memorydhaka';
$route['world-of-jilan/memoryfrunkfrut'] = 'Worldofjilan/memoryfrunkfrut';
$route['world-of-jilan/torontoimage'] = 'Worldofjilan/torontoimage';
$route['world-of-jilan/memoryvideo'] = 'Worldofjilan/memoryvideo';
$route['world-of-jilan/turedhaka'] = 'Worldofjilan/turedhaka';
$route['world-of-jilan/gazipur'] = 'Worldofjilan/gazipur';
$route['world-of-jilan/coxbazar'] = 'Worldofjilan/coxbazar';
$route['world-of-jilan/dubaicity2018'] = 'Worldofjilan/dubaicity2018';
$route['world-of-jilan/Jeddah1997'] = 'Worldofjilan/Jeddah1997';
$route['world-of-jilan/Makkah1997'] = 'Worldofjilan/Makkah1997';
$route['world-of-jilan/Medina1997'] = 'Worldofjilan/Medina1997';


//$route['Collection/one-pice'] = 'Collection/one-pice';


$route['world-of-jilan/the-one'] = 'Worldofjilan/theOne';
$route['world-of-jilan/one-memory'] = 'Worldofjilan/oneMemory';

$route['world-of-jilan/entertainment'] = 'Worldofjilan/entertainment';
$route['world-of-jilan/entertainment/(:num)/(:any)'] = 'Worldofjilan/entertainment/$1/$2';

$route['world-of-jilan/entertainment-details'] = 'Entertainment/details';
$route['world-of-jilan/entertainment-details/(:num)/(:any)'] = 'Entertainment/details/$1/$2';

$route['activities-details'] = 'Activities/details';
$route['activities-details/(:num)/(:any)'] = 'Activities/details/$1/$2';

$route['media-details'] = 'Media/details';
$route['media-details/(:num)/(:any)'] = 'Media/details/$1/$2';

$route['jilan-collection-details'] = 'Jilancollection/details';
$route['jilan-collection-details/(:num)/(:any)'] = 'Jilancollection/details/$1/$2';

$route['jilan-collection-details-new-arrival/(:num)/(:any)'] = 'Jilancollection/detailsNewArrival/$1/$2';

$route['jilan-collection-lists'] = 'Jilancollection/lists';
$route['jilan-collection-lists/(:num)/(:any)'] = 'Jilancollection/lists/$1/$2';

$route['jilan-collection-view/(:num)/(:num)'] = 'Jilancollection/view/$1/$2';

$route['world-of-jilan/entertainment-details-view/(:num)/(:num)'] = 'Entertainment/view/$1/$2';

$route['activities-details-view/(:num)/(:num)'] = 'Activities/view/$1/$2';

$route['media-details-view/(:num)/(:num)'] = 'Media/view/$1/$2';

$route['contact-us'] = 'Main/contact';
$route['send-contact-request'] = 'Main/sendContactRequest';


/** * :: Activities Section :: * * */
