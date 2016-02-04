<?php ?>
<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php" data-toggle="collapse" data-target=".navbar-collapse"><i class="fa fa-heartbeat"></i> Sistema de Control</a>
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="index.php"><i class="fa fa-home fa-fw"></i> Home</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-users fa-fw"></i> Administrador<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="admin-alta-user.php"><i class="fa fa-plus fa-fw"></i> Alta</a>
                                </li>
                                <li>
                                    <a href="admin-modificar-user.php"><i class="fa fa-pencil fa-fw"></i> Modificar</a>
                                </li>
                                <li>
                                    <a href="admin-eliminar-user.php"><i class="fa fa-minus fa-fw"></i> Eliminar</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <!-- <i class="fa fa-bar-chart-o fa-fw"></i> -->
                            <a href="#"><i class="fa fa-medkit fa-fw"></i> Control de Medicamentos<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="altauser.php"><i class="fa fa-stethoscope fa-fw"></i> Consultas</a>
                                </li>
                                <li>
                                    <a href="morris.html"><i class="fa fa-file-text-o fa-fw"></i> Pase de salida</a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-plus-square fa-fw"></i> Medicamento <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#"><i class="fa fa-plus fa-fw"></i> Nuevo</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-pencil fa-fw"></i> Actualizar</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-minus fa-fw"></i> Eliminar</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <!-- <i class="fa fa-bar-chart-o fa-fw"></i> -->
                            <a href="#"><i class="fa fa-file-text fa-fw"></i> Expediente M&eacute;dico<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="altauser.php"><i class="fa fa-stethoscope fa-fw"></i> Consultas</a>
                                </li>
                                <li>
                                    <a href="morris.html"><i class="fa fa-file-text fa-fw"></i> Expediente</a>
                                </li>
                                <li>
                                    <a href="morris.html"><i class="fa fa-file-text-o fa-fw"></i> Pase de salida</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <!-- <i class="fa fa-bar-chart-o fa-fw"></i> -->
                            <a href="#"><i class="fa fa-ambulance fa-fw"></i> Incapacidades<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="altauser.php"><i class="fa fa-file-o fa-fw"></i> Incapacidad</a>
                                </li>
                                <li>
                                    <a href="morris.html"><i class="fa fa-file fa-fw"></i> Memo</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <!-- <i class="fa fa-bar-chart-o fa-fw"></i> -->
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i></i> Reportes<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="altauser.php"><i class="fa fa-stethoscope fa-fw"></i> Consultas</a>
                                </li>
                                <li>
                                    <a href="morris.html"><i class="fa fa-user fa-fw"></i> Visitas</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>