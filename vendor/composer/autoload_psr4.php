<?php

// autoload_psr4.php @generated by Composer

$vendorDir = dirname(dirname(__FILE__));
$baseDir = dirname($vendorDir);

return array(
    'Symfony\\Polyfill\\Mbstring\\' => array($vendorDir . '/symfony/polyfill-mbstring'),
    'Symfony\\Component\\Debug\\' => array($vendorDir . '/symfony/debug'),
    'Symfony\\Component\\Console\\' => array($vendorDir . '/symfony/console'),
    'Psr\\Log\\' => array($vendorDir . '/psr/log/Psr/Log'),
    'Entities\\' => array($baseDir . '/application/models/Entities'),
    'Doctrine\\ORM\\' => array($vendorDir . '/doctrine/orm/lib/Doctrine/ORM'),
    'Doctrine\\Instantiator\\' => array($vendorDir . '/doctrine/instantiator/src/Doctrine/Instantiator'),
    'Doctrine\\Common\\Cache\\' => array($vendorDir . '/doctrine/cache/lib/Doctrine/Common/Cache'),
    'Doctrine\\Common\\Annotations\\' => array($vendorDir . '/doctrine/annotations/lib/Doctrine/Common/Annotations'),
    'Doctrine\\Common\\' => array($vendorDir . '/doctrine/common/lib/Doctrine/Common'),
);
