<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMasterpage.Master" AutoEventWireup="true" CodeBehind="StudentJobPrediction.aspx.cs" Inherits="educationalProject.StudentJobPrediction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="Panel1" runat="server">
    <!-- Start contact Area -->  
    <div id="about" class="about-area area-padding">
   <div class="container">
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
          <div class="section-headline text-center">
            <h2>JOB Prediction - Enter Parameters</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- single-well start-->
       
        <!-- single-well end-->
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="well-middle">
            <div class="single-well">
             <br/>
                  <br/>
                  
          <asp:DropDownList ID="DropDownList19" runat="server" Height="50px" Width="250px" 
                    AutoPostBack="True" 
                    onselectedindexchanged="DropDownList19_SelectedIndexChanged">
              <asp:ListItem Value="CS">Computer Science</asp:ListItem>
              <asp:ListItem Value="EC">Electronics &amp; Communication</asp:ListItem>
              <asp:ListItem Value="EE">Electrical &amp; Electronics</asp:ListItem>
              <asp:ListItem Value="ME">Mechanical</asp:ListItem>
          </asp:DropDownList>
           <br/>
                  <br />
                   <asp:Label ID="lblCourse" runat="server"></asp:Label>
                <br />
                   <br/>               





              
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                
              <a href="#">
                <h4 class="sec-head">Student Parameters</h4>
              </a>

                 <div class="form-group">
                <p>SSLC</p>

                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="1">SSLC_DISTINCTION
                        </asp:ListItem>
                        <asp:ListItem Value="2">SSLC_FIRST CLASS
                        </asp:ListItem>
                        <asp:ListItem Value="3">SSLC_SECOND CLASS

                    </asp:ListItem>
                    </asp:DropDownList>
                
                    <br />
                    <br />
               
                </div>
                <div class="form-group">
                 <p>PUC</p>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                       <asp:ListItem Value="1">PUC_DISTINCTION
                        </asp:ListItem>
                        <asp:ListItem Value="2">PUC_FIRST CLASS
                        </asp:ListItem>
                        <asp:ListItem Value="3">PUC_SECOND CLASS

                    </asp:ListItem>
                    </asp:DropDownList>
                    <br />
                 <br />


                  <div class="form-group">
                  <p>COMMUNICATION SKILL</p>
                     <asp:DropDownList ID="DropDownList5" runat="server">
                          <asp:ListItem Value="1">CS_S</asp:ListItem>
                         <asp:ListItem Value="2">CS_A</asp:ListItem>
                          <asp:ListItem Value="3">CS_B</asp:ListItem>
                     </asp:DropDownList>
                     <br />
                <br />
                   
                       
                </div>


                    <div class="form-group">
                  <p>APPTITUDE</p>
                     <asp:DropDownList ID="DropDownList6" runat="server">
                         <asp:ListItem Value="1">APTI_S</asp:ListItem>
                         <asp:ListItem Value="2">APTI_A</asp:ListItem>
                          <asp:ListItem Value="3">APTI_B</asp:ListItem>
                     </asp:DropDownList>
                     <br />
                <br />
                   
                        
                </div>
                
                </div>

                 <div class="form-group">
                  <p>PROGRAMMING SKILLS</p>
                     <asp:DropDownList ID="DropDownList3" runat="server">
                         <asp:ListItem Value="1">PROGRAMMING SKILLS_S</asp:ListItem>
                         <asp:ListItem Value="2">PROGRAMMING SKILLS_A</asp:ListItem>
                          <asp:ListItem Value="3">PROGRAMMING SKILLS_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>
                </asp:Panel>

               

               
                <asp:Panel ID="PanelCS" runat="server" Visible="False">

                 <div class="form-group">
                  <p>NETWORKS</p>
                     <asp:DropDownList ID="DropDownList4" runat="server">
                         <asp:ListItem Value="1">NETWORKS_S</asp:ListItem>
                         <asp:ListItem Value="2">NETWORKS_A</asp:ListItem>
                          <asp:ListItem Value="3">NETWORKS_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>

                 <div class="form-group">
                  <p>DBMS</p>
                     <asp:DropDownList ID="DropDownList7" runat="server">
                         <asp:ListItem Value="1">DBMS_S</asp:ListItem>
                         <asp:ListItem Value="2">DBMS_A</asp:ListItem>
                          <asp:ListItem Value="3">DBMS_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>

                 <div class="form-group">
                  <p>DATA STRUCTURES</p>
                     <asp:DropDownList ID="DropDownList8" runat="server">
                         <asp:ListItem Value="1">DS_S</asp:ListItem>
                         <asp:ListItem Value="2">DS_A</asp:ListItem>
                          <asp:ListItem Value="3">DS_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>

                 <div class="form-group">
                  <p>OPERATING SYSTEM</p>
                     <asp:DropDownList ID="DropDownList9" runat="server">
                         <asp:ListItem Value="1">OS_S</asp:ListItem>
                         <asp:ListItem Value="2">OS_A</asp:ListItem>
                          <asp:ListItem Value="3">OS_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>

                </asp:Panel>
                <asp:Panel ID="PanelEC" runat="server" Visible="False">

                  <div class="form-group">
                  <p>EMBEDDED SYSTEMS</p>
                     <asp:DropDownList ID="DropDownList10" runat="server">
                         <asp:ListItem Value="1">ES_S</asp:ListItem>
                         <asp:ListItem Value="2">ES_A</asp:ListItem>
                          <asp:ListItem Value="3">ES_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>

                 <div class="form-group">
                  <p>VLSI</p>
                     <asp:DropDownList ID="DropDownList11" runat="server">
                         <asp:ListItem Value="1">VLSI_S</asp:ListItem>
                         <asp:ListItem Value="2">VLSI_A</asp:ListItem>
                          <asp:ListItem Value="3">VLSI_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>

                 <div class="form-group">
                  <p>DIGITAL SYSTEM DESIGN</p>
                     <asp:DropDownList ID="DropDownList12" runat="server">
                         <asp:ListItem Value="1">DSD_S</asp:ListItem>
                         <asp:ListItem Value="2">DSD_A</asp:ListItem>
                          <asp:ListItem Value="3">DSD_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>



                </asp:Panel>
                <asp:Panel ID="PanelEE" runat="server" Visible="False">

                 <div class="form-group">
                  <p>POWER ELECTRONICS</p>
                     <asp:DropDownList ID="DropDownList13" runat="server">
                         <asp:ListItem Value="1">POWER ELECTRONICS_S</asp:ListItem>
                         <asp:ListItem Value="2">POWER ELECTRONICS_A</asp:ListItem>
                          <asp:ListItem Value="3">POWER ELECTRONICS_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>

                 <div class="form-group">
                  <p>ELECTROMAGNETIC FIELD THEORY</p>
                     <asp:DropDownList ID="DropDownList14" runat="server">
                         <asp:ListItem Value="1">ELECTROMAGNETIC FIELD THEORY_S</asp:ListItem>
                         <asp:ListItem Value="2">ELECTROMAGNETIC FIELD THEORY_A</asp:ListItem>
                          <asp:ListItem Value="3">ELECTROMAGNETIC FIELD THEORY_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>

                 <div class="form-group">
                  <p>ANALOG ELECTRONICS</p>
                     <asp:DropDownList ID="DropDownList15" runat="server">
                         <asp:ListItem Value="1">ANALOG ELECTRONICS_S</asp:ListItem>
                         <asp:ListItem Value="2">ANALOG ELECTRONICS_A</asp:ListItem>
                          <asp:ListItem Value="3">ANALOG ELECTRONICS_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>



                </asp:Panel>
                <asp:Panel ID="PanelME" runat="server" Visible="False">

                 <div class="form-group">
                  <p>THERMODYNAMICS</p>
                     <asp:DropDownList ID="DropDownList16" runat="server">
                         <asp:ListItem Value="1">THERMODYNAMICS_S</asp:ListItem>
                         <asp:ListItem Value="2">THERMODYNAMICS_A</asp:ListItem>
                          <asp:ListItem Value="3">THERMODYNAMICS_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>

                 <div class="form-group">
                  <p>DESIGN OF MACHINES</p>
                     <asp:DropDownList ID="DropDownList17" runat="server">
                         <asp:ListItem Value="1">DESIGN OF MACHINES_S</asp:ListItem>
                         <asp:ListItem Value="2">DESIGN OF MACHINES_A</asp:ListItem>
                          <asp:ListItem Value="3">DESIGN OF MACHINES_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>

                 <div class="form-group">
                  <p>STRENGTH OF MATERIALS</p>
                     <asp:DropDownList ID="DropDownList18" runat="server">
                         <asp:ListItem Value="1">STRENGTH OF MATERIALS_S</asp:ListItem>
                         <asp:ListItem Value="2">STRENGTH OF MATERIALS_A</asp:ListItem>
                          <asp:ListItem Value="3">STRENGTH OF MATERIALS_B</asp:ListItem>
                     </asp:DropDownList>
                <br />
                   
                     <br />

                        
                </div>


                </asp:Panel>
               

                

                
                <asp:Panel ID="Panel3" runat="server" Visible="False">
                
     <div>           
    <asp:Button ID="btnSubmit" runat="server" Text="Predict Suitable Job" 
             ValidationGroup="a" onclick="btnSubmit_Click" Height="50px" 
              />
               <br />
               <br />
               
         <br />
         <asp:Label ID="lblResult" runat="server"></asp:Label>
               </div>
                </asp:Panel>

             


            </div>
          </div>
        </div>
        <!-- End col-->
      </div>
    </div>
    </div>
  <!-- End Contact Area -->


    </asp:Panel>


</asp:Content>
