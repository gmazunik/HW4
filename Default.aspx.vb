
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnCalc_Click(sender As Object, e As EventArgs) Handles btnCalc.Click

        ' Variables for user input & calculations
        Dim hrWage As Double
        Dim hrWorked As Double
        Dim preTaxD As Double
        Dim afterTaxD As Double
        Dim grossPay As Double
        Dim taxablePay As Double
        Dim tax As Double
        Dim postTaxPay As Double
        Dim netPay As Double

        ' Convert user input to appropriate variable type
        hrWage = CDbl(tbHourlyWage.Text)
        hrWorked = CDbl(tbHoursWorked.Text)
        preTaxD = CDbl(tbPreTax.Text)
        afterTaxD = CDbl(tbAfterTax.Text)

        ' Calculate gross pay
        grossPay = (hrWage * hrWorked)

        ' Factor in deductions and taxes
        taxablePay = grossPay - preTaxD
            
        ' Calculate tax rate
        If grossPay < 500 Then
            tax = taxablePay * 0.18
        Else
            tax = taxablePay * 0.22
        End If

        ' Calculate post-tax pay amount
        postTaxPay = taxablePay - tax

        ' Calculate net pay, subtracting any after-tax deductions
        netPay = postTaxPay - afterTaxD

        'Display results in label
        lblDisplayNetPay.Text = String.Format("{0:C}", netPay)

    End Sub

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click

        ' Clear all textboxes
        tbHourlyWage.Text = ""
        tbHoursWorked.Text = ""
        tbPreTax.Text = ""
        tbAfterTax.Text = ""

        ' Focus on wage textbox
        tbHourlyWage.Focus()

    End Sub
End Class
