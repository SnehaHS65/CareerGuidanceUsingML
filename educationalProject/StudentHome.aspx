<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMasterpage.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="educationalProject.StudentHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">

    var image1 = new Image()
    image1.src = "../img/Edu_Banner5.JPG"
    var image2 = new Image()
    image2.src = "../img/Edu_Banner3.JPG"
    var image3 = new Image()
    image3.src = "../img/education6.JPG"
    var image4 = new Image()
    image4.src = "../img/Edu_Banner1.JPG"
    var image5 = new Image()
    image5.src = "../img/Edu_Banner4.JPG"
    var image6 = new Image()
    image6.src = "../img/Edu_Banner2.jpg"
                  
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="Panel1" runat="server">
    <!-- Start contact Area -->  
    <div id="about" class="about-area area-padding">
   <div class="container">
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
          <div class="section-headline text-center">
            <h2>Welcome to Student Home Page</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- single-well start-->
         <div id="Div1">
                <img src="../img/Edu_Banner5.JPG" width="960px" height="480px" name="slide" />
                <script type="text/javascript">
            <!--
                    var step = 1
                    function slideit() {
                        document.images.slide.src = eval("image" + step + ".src")
                        if (step < 6)
                            step++
                        else
                            step = 1
                        setTimeout("slideit()", 2500)
                    }
                    slideit()
            //-->
                </script>
            </div>
     
      </div>
    </div>
    </div>
  <!-- End Contact Area -->


    </asp:Panel>
</asp:Content>
