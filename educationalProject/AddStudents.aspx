<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="AddStudents.aspx.cs" Inherits="educationalProject.AddStudents" %>
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
            <h2>Add Students and their Details</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- single-well start-->
       
        <!-- single-well end-->
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="well-middle">
            <div class="single-well">
              <a href="#">
                <h4 class="sec-head">Register Students</h4>
              </a>
              
             

               

                <div class="form-group">
                <p>Enter RegNo</p>

            <asp:TextBox ID="txtRegNo" runat="server" Width="400px" Height="30px"></asp:TextBox>
                
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtRegNo" ErrorMessage="Enter RegNo" 
                        ValidationGroup="a" CssClass="error"></asp:RequiredFieldValidator>
                
                </div>
                <div class="form-group">
                 <p>Enter Password</p>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="400px" 
                        Height="30px"></asp:TextBox>
                 
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Enter Password" 
                        ValidationGroup="a" CssClass="error"></asp:RequiredFieldValidator>
                 
                </div>

                 <div class="form-group">
                  <p>Enter Name</p>
                  <asp:TextBox ID="txtName" runat="server" Width="400px" Height="30px"></asp:TextBox>
                
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="Enter Name" 
                        ValidationGroup="a" CssClass="error"></asp:RequiredFieldValidator>
                </div>

                 <div class="form-group">
                  <p>Enter Mobile</p>
                  <asp:TextBox ID="txtMobile" runat="server" Width="400px" Height="30px"></asp:TextBox>
                
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtMobile" ErrorMessage="Enter Mobile" 
                        ValidationGroup="a" CssClass="error"></asp:RequiredFieldValidator>
                </div>

                 <div class="form-group">
                  <p>Enter EmailId</p>
                  <asp:TextBox ID="txtEmailId" runat="server" Width="400px" Height="30px"></asp:TextBox>
                
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtEmailId" ErrorMessage="Enter Email Id" 
                        ValidationGroup="a" CssClass="error"></asp:RequiredFieldValidator>
                </div>

                 <div class="form-group">
                  <p>Enter Course</p>
                  <asp:TextBox ID="txtDept" runat="server" Width="400px" Height="30px"></asp:TextBox>
                
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtDept" ErrorMessage="Enter Dept Name" 
                        ValidationGroup="a" CssClass="error"></asp:RequiredFieldValidator>
                </div>

                 <div class="form-group">
                  <p>Enter Semester</p>
                  <asp:TextBox ID="txtSem" runat="server" Width="400px" Height="30px"></asp:TextBox>
                 <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="txtSem" ErrorMessage="Enter Semester" 
                        ValidationGroup="a" CssClass="error"></asp:RequiredFieldValidator>
                </div>

     <div>           
    <asp:Button ID="btnSubmit" runat="server" Text="Add Student" ValidationGroup="a" onclick="btnSubmit_Click" 
              />
               </div>
             


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
