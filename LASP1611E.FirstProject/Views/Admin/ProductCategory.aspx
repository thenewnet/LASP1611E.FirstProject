<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" AutoEventWireup="true" CodeBehind="ProductCategory.aspx.cs" Inherits="LASP1611E.FirstProject.Views.Admin.ProductCategory" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphContent" runat="server">
    <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

                         <asp:GridView ID="grvListing" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False">
                             <Columns>
                                 <asp:BoundField DataField="ProductName" HeaderText="Ten San pham" />
                                 <asp:BoundField DataField="Details" HeaderText="Chi tiet" />
                                 <asp:CheckBoxField DataField="Display" HeaderText="Hien thi" />
                                 <asp:TemplateField HeaderText="Xem chi tiet">
                                     <ItemTemplate>
                                         <asp:LinkButton ID="lbtnSelect" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="lbtnSelect_Click">Chon</asp:LinkButton>
                                     </ItemTemplate>
                                     <ItemStyle HorizontalAlign="Center" />
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Xoa">
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkDelete" runat="server" />
                                     </ItemTemplate>
                                 </asp:TemplateField>
                             </Columns>
                             <EmptyDataTemplate>
                                 Khong co du lieu, vui long them moi.
                             </EmptyDataTemplate>
                            </asp:GridView>

                            <!-- /.table-responsive -->
                           <asp:Button ID="btnAddnew" runat="server" Text="Them moi" CssClass="btn-primary" Width="100" OnClick="btnAddnew_Click"/>
                           <asp:Button ID="btnDelete" runat="server" Text="Xoa" CssClass="btn-danger" Width="100"/>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
          
        <asp:Panel ID="pnlDetails" Visible="false" runat="server">
         <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Thong tin chi tiet
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-lg-10">
                                    <div class="form-group">
                                        <label>Ten loai san pham</label>
                                        <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Chi tiet loai san pham</label>
                                        <asp:TextBox ID="txtDetails" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <asp:HiddenField ID="hidId" runat="server" Value=""/>
                                    <asp:Button ID="btnSave" runat="server" Text="Luu thong tin" CssClass="btn-primary" Width="120" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Huy" CssClass="btn-primary" Width="120" />
                                </div>
                                
                            </div>                       
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
</asp:Panel>
        </div>
        <!-- /#page-wrapper -->
</asp:Content>