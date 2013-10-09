<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

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
        <hr />
        <br />

        <% If Not IsPostBack Then%>
            <!--This is the first time the page has loaded. Instructions will be posted.-->
            <asp:Label ID="lblInstructions" runat="server" Text="This is Acme Incorporated's Employee Salary Calculator.
                Please enter your hourly wage and hours worked this week, along with any pre-tax and/or after-tax deductions.
                Taxes will automatically be deducted, and your net pay for the week will be displayed below." Font-Size="Small"></asp:Label>
            <br />

        <% Else%>
            <!-- Then then page is in postback -->

        <% End If%>

        <table id="calc">
            <tr>
                <td class="right">
                    <asp:Label ID="lblWage" runat="server" Text="Hourly Wage:"></asp:Label>
                </td>
                    
                <td>
                    <asp:TextBox CssClass="right" ID="tbHourlyWage" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvWage" runat="server" ControlToValidate="tbHourlyWage" ErrorMessage="* Please enter a positive number" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="right">
                    <asp:Label ID="lblHours" runat="server" Text="Hours Worked This Week:"></asp:Label>
                </td>
                    
                <td>
                    <asp:TextBox CssClass="right" ID="tbHoursWorked" runat="server" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvHours" runat="server" ControlToValidate="tbHoursWorked" ErrorMessage="* Please enter a positive number" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="right">
                    <asp:Label ID="lblPrTax" runat="server" Text="Pre-Tax Deductions:"></asp:Label>
                </td>
                    
                <td>
                    <asp:TextBox CssClass="right" ID="tbPreTax" runat="server" TabIndex="3"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="right">
                    <asp:Label ID="lblAfTax" runat="server" Text="After-Tax Deductions:"></asp:Label>
                </td>
                    
                <td>
                    <asp:TextBox CssClass="right" ID="tbAfterTax" runat="server" TabIndex="4"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>&nbsp; </td>

                <td><asp:Button ID="btnCalc" runat="server" Text="Calculate" Width="248px" /></td>
            </tr>

            <tr>
                <td>&nbsp; </td>
                <td>&nbsp; </td>
            </tr>
            
            <tr>
                <td class="right">
                    <asp:Label ID="lblNetPay" runat="server" Text="Net Pay This Week:" Width="338px"></asp:Label>
                </td>
                    
                <td>
                    <asp:Label CssClass="right" ID="lblDisplayNetPay" runat="server" Width="248px" Font-Bold="True"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>

                <td>
                    <asp:Button ID="btnClear" runat="server" Text="Clear All" Width="248px" />
                </td>
            </tr>
        </table>
        <br />      
    </div>

    <div id="footnote">
        <h5>Gross Salary Tax Rates:</h5>
            <ul>
                <li>Weekly Salary &lt; $500: <b>18%</b></li>
                <li>Weekly Salary &ge; $500: <b>22%</b></li>
            </ul>
    </div>
    </form>
</body>
</html>
