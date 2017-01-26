<div class="login-box-body">
    <p class="login-box-msg">Lembras sua senha</p>

    <form action="<?php echo base_url(); ?>login/login/sendmail" method="post">
        <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="Matricula ou Usuário">
        </div>
        <div class="row">
            <div class="col-xs-8">
<!--                <div class="checkbox icheck">-->
<!--                    <label>-->
<!--                        <input type="checkbox"> Remember Me-->
<!--                    </label>-->
<!--                </div>-->
            </div>
            <!-- /.col -->
            <div class="col-xs-4">
                <button type="submit" class="btn btn-primary btn-block btn-flat">Enviar</button>
            </div>
            <!-- /.col -->
        </div>
    </form>
</div>
<!-- /.login-box-body -->