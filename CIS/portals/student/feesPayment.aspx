<%@ Page Title="" Language="C#" MasterPageFile="~/portals/student/student.Master" AutoEventWireup="true" CodeBehind="feesPayment.aspx.cs" Inherits="CIS.portals.student.feesPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel">

        <div class="panel-body">
            <label>Current Fees :</label>
            <asp:TextBox ID="txtfees" runat="server" Enabled="False"></asp:TextBox>

        </div>
    </div>
    
<script src="https://js.stripe.com/v3/"></script>
    <div class="panel panel-default">
        <div class="panel-heading"> <h3>Fees Payment</h3></div>
        <div class="panel-body">
    
   
    <div>
        <div>
            <div class="form-group">
                <label> Amount To Debit</label>
                <asp:TextBox ID="txt_amount" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
        </div>
        <form action="/charge" method="post" id="payment-form">
  <div class="form-row">
     <div class="form-row">
    <label for="card-element">
      Credit or debit card
    </label>
    <div id="card-element">
      <!-- a Stripe Element will be inserted here. -->
    </div>

    <!-- Used to display form errors -->
    <div id="card-errors" role="alert"></div>
  </div>

      <asp:Button ID="btnpay" runat="server" Text="Pay"  CssClass="btn btn-success form-control" OnClick="btnpay_Click"/>
      </div>
            <script>

                // Create a Stripe client
                var stripe = Stripe('pk_test_6pRNASCoBOKtIshFeQd4XMUh');

                // Create an instance of Elements
                var elements = stripe.elements();

                // Custom styling can be passed to options when creating an Element.
                // (Note that this demo uses a wider set of styles than the guide below.)
                var style = {
                    base: {
                        color: '#32325d',
                        lineHeight: '18px',
                        fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
                        fontSmoothing: 'antialiased',
                        fontSize: '16px',
                        '::placeholder': {
                            color: '#aab7c4'
                        }
                    },
                    invalid: {
                        color: '#fa755a',
                        iconColor: '#fa755a'
                    }
                };

                // Create an instance of the card Element
                var card = elements.create('card', { style: style });

                // Add an instance of the card Element into the `card-element` <div>
                card.mount('#card-element');

                // Handle real-time validation errors from the card Element.
                card.addEventListener('change', function (event) {
                    var displayError = document.getElementById('card-errors');
                    if (event.error) {
                        displayError.textContent = event.error.message;
                    } else {
                        displayError.textContent = '';
                    }
                });

                // Handle form submission
                
                var form = document.getElementById('payment-form');
                form.addEventListener('submit', function (event) {
                    event.preventDefault();

                    stripe.createToken(card).then(function (result) {
                        if (result.error) {
                            // Inform the user if there was an error
                            var errorElement = document.getElementById('card-errors');
                            errorElement.textContent = result.error.message;
                        } else {
                            // Send the token to your server
                            stripeTokenHandler(result.token);
                        }
                    });
                });
            </script>
    </div>
            </div>
        </div>
</asp:Content>
