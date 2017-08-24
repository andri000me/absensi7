<nav class="navbar navbar-default custom-header">
    <div class="container-fluid">
        <div class="navbar-header"><a class="navbar-brand navbar-link" href="#">Illiyin<span><strong>Studio</strong> </span> </a>
            <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav links">
                <li role="presentation"><a href="#"><i class="glyphicon glyphicon-th"></i> Dashboard </a></li>
                <li role="presentation"><a href="#" class="custom-navbar"> <i class="glyphicon glyphicon-th-list"></i> Accepted Today</a></li>
                <li role="presentation"><a href="#"><i class="glyphicon glyphicon-list-alt"></i>  Reports</a></li>
                <li role="presentation"><a href="#"><i class="glyphicon glyphicon-user"></i> Users </a></li>
                <li role="presentation">
                  <!-- <a href="#" class="custom-navbar"> <i class="glyphicon glyphicon-flag"></i> Setting</a> -->
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-stats"></i>
                    <span>Statistik</span>
                    <b class="caret"></b>
                  </a>
                  <ul class="dropdown-menu dropdown-navbar">
                    <li><a href="<?php echo base_url('Acc_C/lihat_pertanggal') ?>">Harian</a></li>
                    <li><a href="<?php echo base_url('Acc_C/lihat_perbulan') ?>">Bulanan</a></li>
                  </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="#"> <span class="caret"></span><img src="assets/img/avatar.jpg" class="dropdown-image"></a>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        <li role="presentation"><a href="#">Settings </a></li>
                        <li role="presentation"><a href="#">Logout </a></li>
                    </ul>
                </li>
                <li role="presentation"><a href="#"><i class="glyphicon glyphicon-user"></i> Login</a></li>
            </ul>
        </div>
    </div>
</nav>