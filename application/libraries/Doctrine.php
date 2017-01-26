<?php

/**
 * Created by PhpStorm.
 * User: NB0065
 * Date: 24/01/2017
 * Time: 10:34
 */

use Doctrine\Common\Cache\ArrayCache,
    Doctrine\ORM\Configuration,
    Doctrine\ORM\EntityManager,
    Doctrine\DBAL\Logging\EchoSQLLogger;

class Doctrine
{

    public $em = null;

    public function __construct()
    {
        //Busca Configuração
        require_once __DIR__ . "/../config/database.php";

        $config = new Configuration;
        $cache = new ArrayCache();
        $config->setMetadataCacheImpl($cache);
        $driverImpl = $config->newDefaultAnnotationDriver(array(__DIR__ . '/../models/Entities'));
        $config->setMetadataDriverImpl($driverImpl);
        $config->setQueryCacheImpl($cache);

        $config->setQueryCacheImpl($cache);

        $config->setProxyDir(__DIR__ . '/../models/proxies');
        $config->setProxyNamespace('Proxies');

        $logger = new EchoSQLLogger;
        $config->setSQLLogger($logger);

        $connectionOptions = array(
            'driver' => 'pdo_pgsql',
            'user' =>     $db['default']['username'],
            'password' => $db['default']['password'],
            'host' =>     $db['default']['hostname'],
            'dbname' =>   $db['default']['database']
        );

        $this->em = EntityManager::create($connectionOptions, $config);
    }

}