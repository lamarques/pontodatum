<?php

/**
 * Created by PhpStorm.
 * User: NB0065
 * Date: 24/01/2017
 * Time: 00:09
 */
defined('BASEPATH') OR exit('No direct script access allowed');

use Entities\AcessosUsuarios;
use Doctrine\ORM\Query\ResultSetMapping;

class Login extends CI_Controller
{

    public function index()
    {
        $data = [];
        $get = $this->input->get();
        if(isset($get['msg']) && (!empty($get['msg']))){
            $data = [
                'msg' => utf8_decode($this->input->get()['msg'])
            ];
        }
        $this->template->load('template-login', 'login/login', $data);
    }

    /**
     *Autenticação
     */
    public function auth()
    {
        $request = $this->input->post();
        $login = $request['login'];
        $senha = md5($request['senha']);
        /**
         * @var \Doctrine\ORM\EntityManager $em
         */
        $em = $this->doctrine->em;
        $sql =  "SELECT * FROM acessos.usuarios_grupos ug
                INNER JOIN acessos.usuarios u ON u.id_usuarios = ug.id_usuarios
                INNER JOIN acessos.grupos g ON g.id_grupos = ug.id_grupos
                WHERE
                u.login = '{$login}'
                AND
                u.senha = '{$senha}'";
        $query  = $em->getConnection()->prepare($sql);
        $query->execute();
        if($query->rowCount() > 0){
            $this->sessao->start('datumsystem');
            $dados = $query->fetch(PDO::FETCH_ASSOC);
            if($dados['grupo'] === 'root'){
                $sql = "SELECT controle FROM acessos.permissoes";
                $query_controles = $em->getConnection()->prepare($sql);
                $query_controles->execute();
                $dados_controles = $query_controles->fetchAll(PDO::FETCH_ASSOC);
                $dados_sessao = [
                    'id_usuarios' => $dados['id_usuarios'],
                    'id_grupos'   => $dados['id_grupos'],
                    'nome'        => $dados['nome'],
                    'login'       => $dados['login'],
                    'grupo'       => $dados['grupo'],
                    'controles'   => []
                ];
                foreach ($dados_controles as $dc){
                    $dados_sessao['controles'][] = [
                        'controle' => $dc['controle'],
                        'ver' => true,
                        'modificar' => true,
                        'administrar' => true
                    ];
                }
            } else {
                $sql = "SELECT
                            p.controle,
                            gp.ver,
                            gp.modificar,
                            gp.administrar
                        FROM acessos.grupos_permissoes gp
                        INNER JOIN acessos.grupos g ON g.id_grupos = gp.id_grupos
                        INNER JOIN acessos.permissoes p ON p.id_permissoes = gp.id_permissoes
                        WHERE g.id_grupos = {$dados['id_grupos']}";
                $query_controles = $em->getConnection()->prepare($sql);
                $query_controles->execute();
                $dados_controles = $query_controles->fetchAll(PDO::FETCH_ASSOC);
                $this->sessao->start('datumsystem');
                $dados_sessao = [
                    'id_usuarios' => $dados['id_usuarios'],
                    'id_grupos'   => $dados['id_grupos'],
                    'nome'        => $dados['nome'],
                    'login'       => $dados['login'],
                    'grupo'       => $dados['grupo'],
                    'controles'   => $dados_controles
                ];
            }

            $this->sessao->login($dados);
            redirect('/', 'refresh');
        } else {
            redirect('/login/login?msg=Usuário ou senha não existem', 'refresh');
        }
    }

    public function rememberme()
    {
        $this->template->load('template-login', 'login/rememberme');
    }

    public function sendmail()
    {
        echo "enviando Email";
    }

    public function logout()
    {
        $this->sessao->start('datumsystem');
        $this->sessao->end();
        redirect('/login/login', 'refresh');
    }

}