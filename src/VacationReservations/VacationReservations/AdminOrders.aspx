﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AdminOrders.aspx.cs" Inherits="VacationReservations.AdminOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="server">
    <span class="AdminTitle">Админ зона
 <br />
        Поръчки
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="server">
    Покажи най-новите
 <asp:TextBox ID="recentCountTextBox" runat="server" MaxLength="4" Width="40px" Text="20" />
    записа
 <asp:Button ID="byRecentGo" runat="server" Text="Напред" /><br />
    Покажи всички поръчки между
 <asp:TextBox ID="startDateTextBox" runat="server" Width="72px" />
    и
 <asp:TextBox ID="endDateTextBox" runat="server" Width="72px" />
    <asp:Button ID="byDateGo" runat="server" Text="Напред" />
    <br />
    Покажи всички неверифицирани поръчки
 <asp:Button ID="unverfiedGo" runat="server" Text="Напред" />
    <br />
    Покажи всички незавършени поръчки
 <asp:Button ID="uncompletedGo" runat="server" Text="Напред" />
    <br />
      <asp:Label ID="errorLabel" runat="server" CssClass="AdminError" EnableViewState="False"></asp:Label>
  &nbsp;<asp:RangeValidator ID="startDateValidator" runat="server" ControlToValidate="startDateTextBox"
    Display="None" ErrorMessage="Invalid start date" MaximumValue="1/1/2015" MinimumValue="1/1/2009"
    Type="Date"></asp:RangeValidator>
  &nbsp;<asp:RangeValidator ID="endDateValidator" runat="server" ControlToValidate="endDateTextBox"
    Display="None" ErrorMessage="Invalid end date" MaximumValue="1/1/2015" MinimumValue="1/1/2009"
    Type="Date"></asp:RangeValidator>
  &nbsp;<asp:CompareValidator ID="compareDatesValidator" runat="server" ControlToCompare="endDateTextBox"
    ControlToValidate="startDateTextBox" Display="None" ErrorMessage="Start date should be more recent than end date"
    Operator="LessThan" Type="Date"></asp:CompareValidator>
  <asp:ValidationSummary ID="validationSummary" runat="server" CssClass="AdminError"
    HeaderText="Data validation errors:" />
  <br />
  <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID"
    OnSelectedIndexChanged="grid_SelectedIndexChanged">
    <Columns>
      <asp:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="True" SortExpression="OrderID" />
      <asp:BoundField DataField="DateCreated" HeaderText="Date Created" ReadOnly="True"
        SortExpression="DateCreated" />
      <asp:BoundField DataField="DateShipped" HeaderText="Date Shipped" ReadOnly="True"
        SortExpression="DateShipped" />
      <asp:BoundField DataField="StatusAsString" HeaderText="Status" ReadOnly="True" SortExpression="StatusAsString" />
      <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" ReadOnly="True"
        SortExpression="CustomerName" />
      <asp:ButtonField CommandName="Select" Text="Select" />
    </Columns>
  </asp:GridView>
    <br />
</asp:Content>
