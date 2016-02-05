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
                        <li><a href="login.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                                    <a href="control-agendar-consulta.php"><i class="fa fa-calendar-plus-o fa-fw"></i> Agendar Consulta</a>
                                </li>
                                <li>
                                    <a href="control-agendar-visita.php"><i class="fa fa-calendar-plus-o fa-fw"></i> Agendar Visita</a>
                                </li>
                                <li>
                                    <a href="pase-salida.php"><i class="fa fa-file-text-o fa-fw"></i> Pase de Salida</a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-plus-square fa-fw"></i> Medicamento <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="medicamento-nuevo.php"><i class="fa fa-plus fa-fw"></i> Nuevo</a>
                                        </li>
                                        <li>
                                            <a href="medicamento-modificar.php"><i class="fa fa-pencil fa-fw"></i> Actualizar</a>
                                        </li>
                                        <li>
                                            <a href="medicamento-eliminar.php"><i class="fa fa-minus fa-fw"></i> Eliminar</a>
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
                                    <a href="expediente-revisar-consulta.php"><i class="fa fa-calendar fa-fw"></i> Revisar Consultas</a>
                                </li>
                                <li>
                                    <a href="expediente-guardar.php"><i class="fa fa-file-text fa-fw"></i> Guardar Expediente</a>
                                </li>
                                <li>
                                    <a href="pase-salida.php"><i class="fa fa-file-text-o fa-fw"></i> Pase de Salida</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <!-- <i class="fa fa-bar-chart-o fa-fw"></i> -->
                            <a href="#"><i class="fa fa-ambulance fa-fw"></i> Incapacidades<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="incapacidad-guardar.php"><i class="fa fa-file-o fa-fw"></i> Guardar Incapacidad</a>
                                </li>
                                <li>
                                    <a href="memo-guardar.php"><i class="fa fa-file fa-fw"></i> Guardar Memo</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <!-- <i class="fa fa-bar-chart-o fa-fw"></i> -->
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i></i> Reportes<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="reportes-inventario.php"><i class="fa fa-list fa-fw"></i> Inventario de Medicamentos</a>
                                </li>
                                <li>
                                    <a href="reportes-consulta-rango-fecha.php"><i class="fa fa-calendar-check-o fa-fw"></i> Consultas Agendadas</a>
                                </li>
                                <li>
                                    <a href="reportes-visita-rango-fecha.php"><i class="fa fa-calendar-check-o fa-fw"></i> Visitas Agendadas</a>
                                </li>
                                <li>
                                    <a href="reportes-pase-por-fecha.php"><i class="fa fa-calendar-check-o fa-fw"></i> Pases de Salida Agendados</a>
                                </li>
                                <li>
                                    <a href="reportes-expediente-por-fecha.php"><i class="fa fa-calendar-check-o fa-fw"></i> Expedientes Agendados</a>
                                </li>
                                <li>
                                    <a href="reportes-incapacidad-por-fecha.php"><i class="fa fa-calendar fa-fw"></i> Incapacidades por Fecha</a>
                                </li>
                                <li>
                                    <a href="reportes-memo-por-fecha.php"><i class="fa fa-calendar fa-fw"></i> Memos por Fecha</a>
                                </li>
                                <li>
                                    <a href="reportes-medicamentos-rank.php"><i class="fa fa-list-ol fa-fw"></i> Rango de Uso de Medicamento</a>
                                </li>
                                <li>
                                    <a href="reportes-diagnosticos-rank.php"><i class="fa fa-list-ol fa-fw"></i> Rango de Diagnosticos</a>
                                </li>
                                <li>
                                    <a href="reportes-empleados-consultas.php"><i class="fa fa-list-alt fa-fw"></i> Consultas Emmpleados</a>
                                </li>
                                <li>
                                    <a href="reportes-empleados-visitas.php"><i class="fa fa-list-alt fa-fw"></i> Visitas Emmpleados</a>
                                </li>
                                <li>
                                    <a href="reportes-empleados-pases.php"><i class="fa fa-list-alt fa-fw"></i> Pases de Salida Emmpleados</a>
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