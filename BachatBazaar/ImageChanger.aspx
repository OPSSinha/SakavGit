<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageChanger.aspx.cs" Inherits="BachatBazaar.ImageChanger" %>



<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Image Upload</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
          
          <form runat="server">
        <div class="wrapper">

  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
   <a href="Default.aspx" class="brand-link">
      <img src="/images/logo2.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           >
      <span class="brand-text font-weight-light">Sakav</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
   <br>
                    
                    

      <!-- Sidebar Menu -->
  <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
           
            <ul class="nav nav-treeview">
             <!-- <li class="nav-item">
                <a href="pages/layout/top-nav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/top-nav-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation + Sidebar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/boxed.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Boxed</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/fixed-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Sidebar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/fixed-topnav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Navbar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/fixed-footer.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Footer</p>
                </a>
              </li>-->
              <li class="nav-item">
                <a href="ImageUpload.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Image Upload </p>
                </a>
              </li>
            </ul>
          </li>
               <li class="nav-item">
                <a href="CategoryMaster.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Category Master</p>
                </a>
              </li>
          
              <li class="nav-item">
                <a href="SubCategoryMaster.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Sub Category Master</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="ItemMaster.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Item Master</p>
                </a>
              </li>
          
            <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Profile</p>
                </a>
              </li>
             
            
            
              <li class="nav-item">
                <a href="Contact.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Contacts</p>
                </a>
              </li>
            
              <li class="nav-item">
                <a href="OrderMasterAdmin.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Order Detail</p>
                </a>
              </li>
            <li class="nav-item">
                <a href="ImageChanger.aspx" class="nav-link">
 <p>Home Page Images  </p>
                </a>
              </li>
          
            </ul>
         
          
           
            
            
      </nav>




      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            
          
          
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section  id="blog">
         <div class="container py-xl-5 py-lg-3">
     
         
             <div class="title-section">
                
               <h5 class="mob-tempsls-title text-uppercase text-bl font-weight-bold text-center">Image Upload</h5>
                <br />
               
            </div>
            <div style="box-shadow: 0px 1px 6px 2px #888;border: 1px solid #2196f3;width:67%;margin-top: 20px;margin-bottom: 20px;    margin-left: 105px;padding-top: 10px;padding-bottom: 10px;">
                <table style ="width:80%">
                    <tr>
                        <td>
                            <label id="lbl">Select a Image File...(width-100%, height-400px)</label>
                        </td>
                        <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="lblIsActive">Is Active</label>
                        </td>
                        <td>
                        <asp:CheckBox ID="chkIsActive" runat ="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td class="text-center">
                            <br />
                           <asp:Button ID="lblUpload" runat ="server" Text ="Submit" OnClick="lblUpload_Click" class="btn btn-primary"/>
                        </td>
                    </tr>
                </table>
                <table width ="50%">
                <tr>
                    <td>
               <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" AllowSorting="true"   CssClass="myTableClass" Width="500px">
                                <HeaderStyle BackColor="#217b90" Font-Bold="true" ForeColor="White" />
                                <Columns>
                                      <asp:TemplateField HeaderText="S. No.#">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSno"  Width="80px" Text='<%# Eval("Sno") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                      <asp:TemplateField HeaderText="Image Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQuestion" Text='<%# Eval("ImageName") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:CheckBox  ID="chkSelect" runat ="server" ></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Is Active">
                                        <ItemTemplate>
                                            <asp:CheckBox  ID="chkIsActive" Checked ='<%# Eval("IsActive") %>'  runat ="server" ></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                   </td>
                </tr>
                    <tr>
                       <td class="text-center">
                           <asp:Button ID="btnUpdate" runat ="server" Text ="Update"  OnClick="btnUpdate_Click" class="btn btn-primary"/>
                        <asp:Button ID="btnSubmit" runat ="server" Text ="Delete"  OnClick="btnSubmit_Click" class="btn btn-danger"/>&nbsp;&nbsp;
                        
                       </td>
                    </tr>
</table>
      
       </div> 
      </div> 
      </section>
      </form>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
                    
</body>
</html>


   
