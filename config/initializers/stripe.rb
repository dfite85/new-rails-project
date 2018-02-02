 # Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: 'pk_test_DmPql0o9fP3xpTGWQGER7DB2',
   secret_key: 'sk_test_Ubw5j2o9BSE6J5poxxBW0TfK'
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]