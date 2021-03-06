﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Salary Calculator</title>
    <link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Salary Calculator</h1>
        <div id="instructions">
        <% If Not IsPostBack Then%>
            <!--This is the first time the page has loaded. Instructions will be posted.-->
            <p>This is Acme Incorporated's Employee Salary Calculator.<br />
                Please enter your hourly wage and hours worked this week, along with any pre-tax and/or after-tax deductions.<br />
                Taxes will automatically be deducted, and your net pay for the week will be displayed below.</p>

        <% Else%>
            <!-- Then then page is in postback. Instructions for any new desired calculations replace the text above. -->
            <p>To calculate a new weekly salary, edit any values and press <b>Calculate</b>.<br />
                To start over, press <b>Clear All</b>.<br />
                <b>NOTE:</b> These figures are only estimates.</p>
        <% End If%>
        </div>
        <table id="calc">
            <tr>
                <td class="right">
                    <asp:Label ID="lblWage" runat="server" Text="Hourly Wage:"></asp:Label>
                </td>
                    
                <td>
                    <asp:TextBox CssClass="right" ID="tbHourlyWage" runat="server" TabIndex="1" Width="120px" ViewStateMode="Enabled"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revCheckNumberFormat1" runat="server" ControlToValidate="tbHourlyWage" ValidationExpression="^\d*\.?\d*$" Text="*" ErrorMessage="Please enter only positive numbers." Font-Italic="True" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvWage" runat="server" ControlToValidate="tbHourlyWage" Text="*" ErrorMessage="Field required. Please enter a positive number" Font-Italic="True" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="right">
                    <asp:Label ID="lblHours" runat="server" Text="Hours Worked This Week:"></asp:Label>
                </td>
                    
                <td>
                    <asp:TextBox CssClass="right" ID="tbHoursWorked" runat="server" TabIndex="2" Width="120px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revCheckNumberFormat2" runat="server" ControlToValidate="tbHoursWorked" ValidationExpression="^\d*\.?\d*$" Text="*" ErrorMessage="Please enter only positive numbers." Font-Italic="True" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvHours" runat="server" ControlToValidate="tbHoursWorked" Text="*" ErrorMessage="Field required. Please enter a positive number" Font-Italic="True" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="right">
                    <asp:Label ID="lblPrTax" runat="server" Text="Pre-Tax Deductions:"></asp:Label>
                </td>
                    
                <td>
                    <asp:TextBox CssClass="right" ID="tbPreTax" runat="server" TabIndex="3" Width="120px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revCheckNumberFormat3" runat="server" ControlToValidate="tbPreTax" ValidationExpression="^\d*\.?\d*$" Text="*" ErrorMessage="Please enter only positive numbers." Font-Italic="True" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td class="right">
                    <asp:Label ID="lblAfTax" runat="server" Text="After-Tax Deductions:"></asp:Label>
                </td>
                    
                <td>
                    <asp:TextBox CssClass="right" ID="tbAfterTax" runat="server" TabIndex="4" Width="120px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revCheckNumberFormat4" runat="server" ControlToValidate="tbAfterTax" ValidationExpression="^\d*\.?\d*$" Text="*" ErrorMessage="Please enter only positive numbers." Font-Italic="True" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td>&nbsp; </td>

                <td><asp:Button ID="btnCalc" runat="server" Text="Calculate" Width="125px" BackColor="#E0F4FF" /></td>
            </tr>

            <tr>
                <td>&nbsp; </td>
                <td> 
                    <asp:ValidationSummary ID="valSummary" runat="server" Font-Italic="True" Font-Size="Small" ForeColor="Red" style="margin-bottom: 0px"/>
                </td>
            </tr>
            
            <tr>
                <td class="right">
                    <asp:Label ID="lblNetPay" runat="server" Text="Net Pay This Week:" ></asp:Label>
                </td>
                    
                <td>
                    <asp:TextBox CssClass="right" ID="tbDisplayNetPay" runat="server" Width="120px" Font-Bold="True" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>

                <td>
                    <asp:Button ID="btnClear" runat="server" CausesValidation="false" Text="Clear All" Width="125px" BackColor="#E0F4FF" />
                </td>
            </tr>
        </table>    
    </div>

    <div id="footnote">
        <h4>Gross Salary Tax Rates:</h4>
            <ul>
                <li>Weekly Salary &lt; $500: <b>18%</b></li>
                <li>Weekly Salary &ge; $500: <b>22%</b></li>
            </ul>
    </div>
    </form>
</body>
</html>
