
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnCalc_Click(sender As Object, e As EventArgs) Handles btnCalc.Click

        ' Variables for user input & calculations
        Dim hrWage As Double
        Dim hrWorked As Double
        Dim preTaxD As Double
        Dim afterTaxD As Double
        Dim grossPay As Double
        Dim netPay As Double

        ' Convert user input to appropriate variable type
        hrWage = CDbl(tbHourlyWage.Text)
        hrWorked = CDbl(tbHoursWorked.Text)

        ' Calculate gross pay
        grossPay = (hrWage * hrWorked)

        ' Factor in deductions and taxes, display error handling
        If tbPreTax.Text <> String.Empty Then
            Try
                preTaxD = CDbl(tbPreTax.Text)
                grossPay -= preTaxD
            Catch formatExceptionParameter As InvalidCastException
                MsgBox("If you have a pre-tax deduction, please enter a positive number in the appropriate box.")
            End Try
        End If

        Select Case grossPay
            Case Is < 500
                netPay = grossPay - (grossPay * 0.18)
            Case Else
                netPay = grossPay - (grossPay * 0.22)
        End Select

        If tbAfterTax.Text <> String.Empty Then
            Try
                afterTaxD = CDbl(tbAfterTax.Text)
                netPay -= afterTaxD
            Catch formatExceptionParameter As InvalidCastException
                MsgBox("If you have a pre-tax deduction, please enter a positive number in the appropriate box.")
            End Try
        End If

        'Display results in label
        lblDisplayNetPay.Text = String.Format("{0:C}", netPay)
    End Sub

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click

        ' Clear all textboxes
        tbHourlyWage.Text = ""
        tbHoursWorked.Text = ""
        tbPreTax.Text = ""
        tbAfterTax.Text = ""

    End Sub
End Class
