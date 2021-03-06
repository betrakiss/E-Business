﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetailsEdit.ascx.cs" Inherits="VacationReservations.UserControls.CustomerDetailsEdit" %>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="VacationReservations.Common.ProfileWrapper" SelectMethod="GetData" TypeName="VacationReservations.DataAccess.ProfileDataSource" UpdateMethod="UpdateData"></asp:ObjectDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:VacationReservationsConnection %>"
    SelectCommand="SELECT [ShippingRegionID], [ShippingRegion] FROM
[ShippingRegion]" />

<asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1">
    <EditItemTemplate>
        <table class="UserDetailsTable">
            <tr>
                <td>Адрес: </td>
                <td width="350px">
                    <asp:TextBox Width="340px" ID="Address1TextBox" runat="server"
                        Text='<%# Bind("Address1") %>' />
                </td>
            </tr>
            <tr>
                <td>Алтернативен адрес: </td>
                <td>
                    <asp:TextBox Width="340px" ID="Address2TextBox" runat="server"
                        Text='<%# Bind("Address2") %>' />
                </td>
            </tr>
            <tr>
                <td>Град: </td>
                <td>
                    <asp:TextBox Width="340px" ID="CityTextBox" runat="server"
                        Text='<%# Bind("City") %>' />
                </td>
            </tr>
            <tr>
                <td>Регион: </td>
                <td>
                    <asp:TextBox Width="340px" ID="RegionTextBox" runat="server"
                        Text='<%# Bind("Region") %>' />
                </td>
            </tr>
            <tr>
                <td>Пощенски код: </td>
                <td>
                    <asp:TextBox Width="340px" ID="PostalCodeTextBox"
                        runat="server" Text='<%# Bind("PostalCode") %>' />
                </td>
            </tr>
            <tr>
                <td>Държава: </td>
                <td>
                    <asp:TextBox Width="340px" ID="CountryTextBox" runat="server"
                        Text='<%# Bind("Country") %>' />
                </td>
            </tr>
            <tr>
                <td>Регион за изпращане: </td>
                <td>
                    <asp:DropDownList Width="350px" ID="DropDownList1"
                        runat="server"
                        SelectedValue='<%# Bind("ShippingRegion") %>'
                        DataSourceID="SqlDataSource1"
                        DataTextField="ShippingRegion"
                        DataValueField="ShippingRegionID">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Дневен телефон: </td>
                <td>
                    <asp:TextBox Width="340px" ID="DayPhoneTextBox" runat="server"
                        Text='<%# Bind("DayPhone") %>' />
                </td>
            </tr>
            <tr>
                <td>Нощен телефон: </td>
                <td>
                    <asp:TextBox Width="340px" ID="EvePhoneTextBox" runat="server"
                        Text='<%# Bind("EvePhone") %>' />
                </td>
            </tr>
            <tr>
                <td>Мобилен телефон: </td>
                <td>
                    <asp:TextBox Width="340px" ID="MobPhoneTextBox" runat="server"
                        Text='<%# Bind("MobPhone") %>' />
                </td>
            </tr>
            <tr>
                <td>Email: </td>
                <td>
                    <asp:TextBox Width="340px" ID="EmailBox" runat="server"
                        Text='<%# Bind("Email") %>' />
                </td>
            </tr>
            <tr>
                <td valign="top">Дебитна карта: </td>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="140px">Картодържател: </td>
                            <td width="200px">
                                <asp:TextBox Width="200px" ID="CreditCardHolderLabel"
                                    runat="server" Text='<%# Bind("CreditCardHolder") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>Тип: </td>
                            <td>
                                <asp:TextBox Width="200px" ID="CreditCardTypeLabel"
                                    runat="server" Text='<%# Bind("CreditCardType") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>IBAN: </td>
                            <td>
                                <asp:TextBox Width="200px" ID="CreditCardNumberLabel"
                                    runat="server" Text='<%# Bind("CreditCardNumber") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>Дата на издаване: </td>
                            <td>
                                <asp:TextBox Width="200px" ID="CreditCardIssueDateLabel"
                                    runat="server"
                                    Text='<%# Bind("CreditCardIssueDate") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>Дата на изтичане: </td>
                            <td>
                                <asp:TextBox Width="200px" ID="CreditCardExpiryDateLabel"
                                    runat="server"
                                    Text='<%# Bind("CreditCardExpiryDate") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>Номер на издаване: </td>
                            <td>
                                <asp:TextBox Width="200px" ID="CreditCardIssueNumberLabel"
                                    runat="server"
                                    Text='<%# Bind("CreditCardIssueNumber") %>' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="UpdateButton" runat="server"
                        CausesValidation="True" CommandName="Update"
                        Text="Обнови" />&nbsp;<asp:Button ID="UpdateCancelButton"
                            runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Откажи" />
                </td>
            </tr>
        </table>
    </EditItemTemplate>
    <ItemTemplate>
        <table class="UserDetailsTable">
            <tr>
                <td>Адрес: </td>
                <td width="350px">
                    <asp:Label ID="Address1Label" runat="server"
                        Text='<%# Bind("Address1") %>' />
                </td>
            </tr>
            <tr>
                <td>Алтернативен адрес: </td>
                <td>
                    <asp:Label ID="Address2Label" runat="server"
                        Text='<%# Bind("Address2") %>' />
                </td>
            </tr>
            <tr>
                <td>Град: </td>
                <td>
                    <asp:Label ID="CityLabel" runat="server"
                        Text='<%# Bind("City") %>' />
                </td>
            </tr>
            <tr>
                <td>Регион: </td>
                <td>
                    <asp:Label ID="RegionLabel" runat="server"
                        Text='<%# Bind("Region") %>' />
                </td>
            </tr>
            <tr>
                <td>Пощенски код: </td>
                <td>
                    <asp:Label ID="PostalCodeLabel" runat="server"
                        Text='<%# Bind("PostalCode") %>'>
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>Държава: </td>
                <td>
                    <asp:Label ID="CountryLabel" runat="server"
                        Text='<%# Bind("Country") %>' />
                </td>
            </tr>
            <tr>
                <td>Регион за изпращане: </td>
                <td>
                    <asp:DropDownList Width="350px" ID="ShippingRegionDropDown"
                        runat="server"
                        SelectedValue='<%# Bind("ShippingRegion") %>'
                        DataSourceID="SqlDataSource1"
                        DataTextField="ShippingRegion"
                        DataValueField="ShippingRegionID"
                        Enabled="false">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Дневен телефон: </td>
                <td>
                    <asp:Label ID="DayPhoneLabel" runat="server"
                        Text='<%# Bind("DayPhone") %>' />
                </td>
            </tr>
            <tr>
                <td>Нощен телефон: </td>
                <td>
                    <asp:Label ID="EvePhoneLabel" runat="server"
                        Text='<%# Bind("EvePhone") %>' />
                </td>
            </tr>
            <tr>
                <td>Мобилен телефон: </td>
                <td>
                    <asp:Label ID="MobPhoneLabel" runat="server"
                        Text='<%# Bind("MobPhone") %>' />
                </td>
            </tr>
            <tr>
                <td>Email: </td>
                <td>
                    <asp:Label ID="EmailLabel" runat="server"
                        Text='<%# Bind("Email") %>' />
                </td>
            </tr>
            <tr>
                <td>Дебитна карта: </td>
                <td>
                    <asp:Label ID="CreditCardLabel" runat="server"
                        Text='<%# Bind("CreditCard") %>' />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="EditButton" runat="server"
                        CausesValidation="False" CommandName="Edit"
                        Text="Редактирай" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:FormView>


