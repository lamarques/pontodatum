<div class="login-box-body">
    <p class="login-box-msg">Entrar na Intranet</p>

    <?php if(isset($msg)): ?>
        <div class="alert alert-danger">
            <?php echo $msg; ?>
        </div>
    <?php endif; ?>
    <form action="<?php echo base_url(); ?>login/login/auth" method="post">
        <div class="form-group has-feedback">
            <input type="text" class="form-control" name="login" id="login" placeholder="Matricula ou Usuário">
        </div>
        <div class="form-group has-feedback">
            <input type="password" class="form-control"  name="senha" id="senha" placeholder="Senha">
        </div>
        <div class="row">
            <!-- /.col -->
            <div class="col-xs-4">
                <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
            </div>
            <!-- /.col -->
        </div>
    </form>

    <!-- /.social-auth-links -->

    <a href="<?php echo base_url(); ?>login/login/rememberme">Esqueceu a senha?</a><br>

</div>
<!-- /.login-box-body -->