window.app =
  ready: ->
    $(document).foundation()
    $('#submit-payment').click(app.payment_submitted)
    $('#submit_email').click(app.email_submitted)
    $('#submit_password').click(app.password_submitted)
    $('#submit_add_user').click(app.add_user_submitted)
    $('#submit_cancel_subscription').click(app.cancel_subscription_submitted)
    Stripe.setPublishableKey('pk_test_LiVcoLuIswBbGF8Q8EhSqHPH');
  payment_submitted: (e) ->
    e.preventDefault()
    $('#submit-payment').attr('disabled', true)
    $('#submit-payment').val('Please wait...')
    Stripe.createToken($('#payment-form'), app.token_generated)
  token_generated: (status, response) ->
    if response.error
      $('#creditcard-error li').text(response.error.message)
      $('#creditcard-error').show()
      $('#submit-payment').attr('disabled', false)
      $('#submit-payment').val('Purchase Plan')
    else
      $('#payment-form').append($('#group-size'))
      $('#token-id').val(response.id)
      $('#payment-form').submit();
  group_size_updated: ->
    size = $('#group-size').val().toNumber()
    amount = $('#conf-amount').data('amount').toNumber()
    total = size * amount

    if size < 2
      $('#conf-group').text('Invalid group size')
      $('#conf-total').text('Invalid group size')
    else
      $('#conf-group').text(size)
      $('#conf-total').text(accounting.formatMoney(total))
  email_submitted: (e) ->
    e.preventDefault()
    $('#submit_email').attr('disabled', true)
    $('#submit_email').val('Please wait...')
    $(this).closest('form').submit()
  password_submitted: (e) ->
    e.preventDefault()
    $('#submit_password').attr('disabled', true)
    $('#submit_password').val('Please wait...')
    $(this).closest('form').submit()
  add_user_submitted: (e) ->
    e.preventDefault()
    $('#submit_add_user').attr('disabled', true)
    $('#submit_add_user').val('Please wait...')
    $(this).closest('form').submit()
  cancel_subscription_submitted: (e) ->
    e.preventDefault()
    $('#submit_cancel_subscription').attr('disabled', true)
    $('#submit_cancel_subscription').val('Please wait...')
    $(this).closest('form').submit()
  do_nothing: ->

$(document).ready(app.ready)
