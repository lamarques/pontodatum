<?php

/**
 * Created by PhpStorm.
 * User: NB0065
 * Date: 25/01/2017
 * Time: 17:50
 */
class Sessao
{

    public function start($name)
    {
        session_name($name);
        session_start();
    }

    public function isLogado(){
        if(isset($_SESSION['logado']) && count($_SESSION['logado']) > 0)
            return true;
        else
            return false;
    }

    public function login($dados){
        $_SESSION['logado'] = $dados;
    }

    public function end()
    {
        $_SESSION = [];
        unset($_SESSION);
        session_destroy();
    }

}