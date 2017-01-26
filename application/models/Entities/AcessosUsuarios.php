<?php
namespace Entities;
/**
 * Created by PhpStorm.
 * User: NB0065
 * Date: 24/01/2017
 * Time: 13:15
 */
use Doctrine\ORM\Mapping as ORM;
use Entities\AcessosUsuariosRepository;

/**
 * @ORM\Entity
 * @ORM\Table(name="usuarios", schema="acessos")
 */
class AcessosUsuarios
{
    /**
     * @var int
     *
     * @column(type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="acessos.seq_usuarios", initialValue=1, allocationSize=2147483647)
     */
    private $id_usuarios;

    /**
     * @var string
     *
     * @ORM\Column(name="`nome`", type="string")
     */
    private $nome;

    /**
     * @var string
     *
     * @ORM\Column(name="`login`", type="string")
     */
    private $login;

    /**
     * @var string
     *
     * @ORM\Column(name="`senha`", type="string")
     */
    private $senha;

    /**
     *@var bool
     *
     * @ORM\Column(name="`ativo`", type="boolean")
     */
    private $ativo;

    /**
     * @param int $id_usuarios
     */
    public function setIdUsuarios($id_usuarios)
    {
        $this->id_usuarios =(int)$id_usuarios;
    }

    /**
     * @param string $nome
     */
    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    /**
     * @param string $login
     */
    public function setLogin($login)
    {
        $this->login = $login;
    }

    /**
     * @param string $senha
     */
    public function setSenha($senha)
    {
        $this->senha = md5($senha);
    }

    /**
     * @param bool $ativo
     */
    public function setAtivo($ativo)
    {
        $this->ativo = (bool)$ativo;
    }

    /**
     * @return int
     */
    public function getIdUsuarios()
    {
        return $this->id_usuarios;
    }

    /**
     * @return string
     */
    public function getNome()
    {
        return $this->nome;
    }

    /**
     * @return string
     */
    public function getLogin()
    {
        return $this->login;
    }

    /**
     * @return string
     */
    public function getSenha()
    {
        return $this->senha;
    }

    /**
     * @return bool
     */
    public function isAtivo()
    {
        return ($this->ativo)? true : false;
    }



}