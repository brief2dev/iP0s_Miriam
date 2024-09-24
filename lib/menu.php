<?php
session_start();
switch ($_SESSION['cargo']) {
    case '4':
        # code...   4 (Vendedor)
        echo '
                            <li class="menu-title"><Center>Menu</Center></li>    
                            <li>
                                <a href="Dashboard.php" class="waves-effect">
                                        <i class="mdi mdi-airplay"></i>
                                        <span>Dashboard</span>
                                </a>
                            </li>
                            <!-------------------------------------------------------------------->
                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="mdi mdi-cart"></i>
                                    <span>Ventas</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="vender.php"><i class=" mdi mdi-barcode-scan"></i>Realizar Ventas</a></li>
                                    <li><a href="VCredito.php"><i class=" mdi mdi-alert-decagram"></i>Creditos</a></li>
                                    <li><a href="VAprt.php"><i class=" mdi mdi-gift"></i>Apartados</a></li>
                                    <li><a href="VDev.php"><i class=" mdi mdi-set-right"></i>Devoluciones</a></li>
                                    <li><a href="CP.php"><i class=" mdi mdi-set-right"></i>Cupones</a></li>
                                    <li><a href="Vint.php"><i class=" mdi mdi-timetable"></i>Inventario de Ventas</a></li>
                                </ul>
                            </li>
                            <!-------------------------------------------------------------------->
                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <!-- i class="mdi-clipboard-text">
                                        </i> -->
                                    <i> <span class="mdi mdi-clipboard-text"></span></i>
                                    <span>Productos</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="PAdd.php"><i class=" mdi mdi-plus-circle"></i>Agregar</a></li>
                                    <li><a href="CatN.php"><i class=" mdi mdi-plus-circle"></i>Categorias</a></li>
                                    <li><a href="PR.php"><i class=" mdi mdi-pencil-circle"></i>Resurtir</a></li>
                                    <li><a href="Precios.php"><i class=" mdi mdi-format-list-bulleted"></i>Lista de Precios</a></li>
                                    <!-- <li><a href="Pint.php"><i class=" mdi mdi-format-list-bulleted"></i>Inventario Productos</a></li> -->
                                </ul>
                            </li>
                            <!-------------------------------------------------------------------->
                            <!-------------------------------------------------------------------->
                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i> <span class="mdi mdi-square-inc-cash"></span></i>
                                    <span>Movimientos</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="Mov_Ingreso.php"><i class=" mdi mdi-briefcase-download"></i>Ingreso</a></li>
                                    <li><a href="Mov_Retiro.php"><i class=" mdi mdi-briefcase-upload"></i>Retiros</a></li>
                                    <li><a href="Mov_Ventas.php"><i class=" mdi mdi-briefcase-upload"></i>Ventas</a></li>
                                    
                                </ul>
                            </li>
                            <!-------------------------------------------------------------------->
                            <!-------------------------------------------------------------------->
                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i> <span class="mdi mdi-professional-hexagon"></span></i>
                                    <span>Mutualista</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="NMT.php"><i class=" mdi mdi-calendar-plus"></i>Crear</a></li>
                                    <li><a href="MT.php"><i class=" mdi mdi-calendar-range"></i>Activos</a></li>
                                    <li><a href="FMT.php"><i class=" mdi mdi-calendar-check"></i>Finalizados</a></li>
                                </ul>
                            </li>
                            <!-------------------------------------------------------------------->
                            <br>
                            <br>
                            <!--Titulo-->
                            <li class="menu-title"><Center>Herramientas</Center></li>

                            <!-- <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="mdi mdi-barcode"></i>
                                    <span>Codigo de Barras</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="Code.php"><i class=" mdi mdi-multiplication-box"></i>Generar</a></li>
                                </ul>
                            </li> -->
                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="mdi mdi-account-circle-outline"></i>
                                    <span>Clientes</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                <li><a href="Cliente_N.php"><i class=" mdi mdi-account-plus"></i>Agregar Clientes</a></li>
                                <li><a href="Cliente_List.php"><i class=" mdi mdi-account-edit"></i>Editar Clientes</a></li>
                                </ul>
                            </li>
                            <li>
                            <a href="javascript: void(0);" class="has-arrow waves-effect">
                                <i class="mdi mdi-truck-fast"></i>
                                <span>Proveedores</span>
                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a href="Proveedor_N.php"><i class="mdi mdi-van-utility"></i>Agregar Proveedor</a></li>
                                <li><a href="Proveedor_List.php"><i class=" mdi mdi-worker"></i>Editar Proveedor</a></li>
                            </ul>
                        </li>
                            ';
        break;

    
    default:
        # code...  # code...  2 (Admin)
        echo '
        <li class="menu-title"><Center>Menu</Center></li>
        <!-------------------------------------------------------------------->
        <li>
            <a href="Dashboard.php" class="waves-effect">
                    <i class="mdi mdi-airplay"></i>
                    <!-- <span class="badge badge-pill badge-info float-right"></span> -->
                    <span>Dashboard</span>
            </a>
        </li>
        <!-------------------------------------------------------------------->
        <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <i class="mdi mdi-cart"></i>
                <span>Ventas</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">
                <li><a href="vender.php"><i class=" mdi mdi-barcode-scan"></i>Realizar Ventas</a></li>
                <li><a href="VCredito.php"><i class=" mdi mdi-alert-decagram"></i>Creditos</a></li>
                <li><a href="VAprt.php"><i class=" mdi mdi-gift"></i>Apartados</a></li>
                <li><a href="VDev.php"><i class=" mdi mdi-set-right"></i>Devoluciones</a></li>
                <li><a href="CP.php"><i class=" mdi mdi-set-right"></i>Cupones</a></li>
                <li><a href="Vint.php"><i class=" mdi mdi-timetable"></i>Inventario de Ventas</a></li>
            </ul>
        </li>
        
         <!-- <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <i class="mdi mdi-alert-decagram"></i>
                <span>Cotizacones</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">
                <li><a href="VCAbono.php"><i class=" mdi mdi-cash-100"></i>Abonos</a></li>
                <li><a href="VCredito.php"><i class=" mdi mdi-chart-line"></i>Inventario</a></li>
            </ul>
        </li> -->


        <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <!-- i class="mdi-clipboard-text">
                    </i> -->
                <i> <span class="mdi mdi-clipboard-text"></span></i>
                <span>Productos</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">
                <li><a href="PAdd.php"><i class=" mdi mdi-plus-circle"></i>Producto</a></li>
                <li><a href="CatN.php"><i class=" mdi mdi-playlist-plus"></i>Categoria</a></li>
                <li><a href="PRt.php"><i class=" mdi mdi-pencil-circle"></i>Editar/Resurtir</a></li>
                <li><a href="PAR.php"><i class=" mdi mdi-clipboard-check"></i>Sin Verificar</a></li>
                <li><a href="Precios.php"><i class=" mdi mdi-cash-usd"></i>Precios</a></li>
                <li><a href="Pint.php"><i class=" mdi mdi-format-list-bulleted"></i>Todos</a></li>
            </ul>
        </li>
        <!-------------------------------------------------------------------->
        <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <i> <span class="mdi mdi-square-inc-cash"></span></i>
                <span>Movimientos</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">
                <li><a href="Mov_Ingreso.php"><i class=" mdi mdi-briefcase-download"></i>Ingreso</a></li>
                <li><a href="Mov_Retiro.php"><i class=" mdi mdi-briefcase-upload"></i>Gastos</a></li>
                <li><a href="Mov_Ventas.php"><i class=" mdi mdi-briefcase-upload"></i>Ventas</a></li>
                <li><a href="Mov_Corte.php"><i class=" mdi mdi-content-save-all"></i>Corte de Caja</a></li>
                
            </ul>
        </li>
        <!-------------------------------------------------------------------->
        <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <i> <span class="mdi mdi-professional-hexagon"></span></i>
                <span>Mutualista</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">
                <li><a href="NMT.php"><i class=" mdi mdi-calendar-plus"></i>Crear</a></li>
                <li><a href="MT.php"><i class=" mdi mdi-calendar-check"></i>Activos</a></li>
                <li><a href="FMT.php"><i class=" mdi mdi-calendar-clock"></i>Historial</a></li>
            </ul>
        </li>
        <!-------------------------------------------------------------------->
        <br>
        <br>
        <!--Titulo-->
        <li class="menu-title"><Center>Herramientas</Center></li>
        
        <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <i class="mdi mdi-barcode"></i>
                <span>Codigo de Barras</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">
                <li><a href="Code.php"><i class=" mdi mdi-multiplication-box"></i>Generar</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <i class="mdi mdi-worker"></i>
                <span>Personal</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">
                <li><a href="Personal_New.php"><i class=" mdi mdi-account-plus"></i>Agregar Personal</a></li>
                <li><a href="Personal_List.php"><i class=" mdi mdi-account-edit"></i>Editar Personal</a></li>
                <li><a href="PB.php"><i class=" mdi mdi-account-minus"></i>Bajas</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <i class="mdi mdi-account-circle-outline"></i>
                <span>Clientes</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">
                <li><a href="Cliente_N.php"><i class=" mdi mdi-account-plus"></i>Agregar Clientes</a></li>
                <li><a href="Cliente_List.php"><i class=" mdi mdi-account-edit"></i>Editar Clientes</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <i class="mdi mdi-truck-fast"></i>
                <span>Proveedores</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">
                <li><a href="Proveedor_N.php"><i class="mdi mdi-van-utility"></i>Agregar Proveedor</a></li>
                <li><a href="Proveedor_List.php"><i class=" mdi mdi-worker"></i>Editar Proveedor</a></li>
            </ul>
        </li>
        <!------------------------------------------------->
       <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <i class="mdi mdi-factory"></i>
                <span>Mis Empresas</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">
                <li><a href="EN.php"><i class="mdi mdi-plus-circle-outline"></i>Crear Nueva</a></li>
                <li><a href="EL.php"><i class=" mdi mdi-format-list-checks"></i>Ver Todos</a></li>
            </ul>
        </li>
        <!------------------------------------------------->
       



        ';
        break;
}


?>