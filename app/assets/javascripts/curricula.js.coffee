window.app =
  ready: ->
    $(document).foundation()
    $('#submit-payment').click(app.payment_submitted)
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

$(document).ready(app.ready)
