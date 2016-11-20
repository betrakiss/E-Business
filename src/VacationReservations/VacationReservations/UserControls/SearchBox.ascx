﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchBox.ascx.cs" Inherits="VacationReservations.UserControls.SearchBox" %>

<asp:Panel ID="searchPanel" runat="server" DefaultButton="goButton">
    <table class="SearchBox">
        <tr>
            <td class="SearchBoxHead">Search the Catalog</td>
        </tr>
        <tr>
            <td class="SearchBoxContent">
                <asp:TextBox ID="searchTextBox" runat="server" Width="128px"
                    MaxLength="100" />
                <asp:Button ID="goButton" runat="server"
                    Text="Go" Width="36px" OnClick="goButton_Click" style="height: 26px" /><br />
                <asp:CheckBox ID="allWordsCheckBox" runat="server"
                    Text="Search for all words" />
            </td>
        </tr>
    </table>
</asp:Panel>
