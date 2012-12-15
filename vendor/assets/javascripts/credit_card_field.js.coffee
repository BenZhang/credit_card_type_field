class @CreditCardType
  constructor: (number) ->
    @card_number = number.replace(/[ -]/g, '')
  
  cardType: ->
    visaCard = /^4[0-9]{12}(?:[0-9]{3})?$/
    masterCard = /^5[1-5][0-9]{14}$/
    americanExpress = /^3[47][0-9]{13}$/
    dinerCard = /^3(?:0[0-5]|[68][0-9])[0-9]{11}$/
    return 'visa' if visaCard.test(@card_number)
    return 'master' if masterCard.test(@card_number)
    return 'american_express' if americanExpress.test(@card_number)
    return 'diners_club' if dinerCard.test(@card_number)
    'not_valid'

window.CreditCardField = {
  keyup: (e)->
    cardType = new CreditCardType($(this).val()).cardType()
    form = $(this).closest('form')
    form.find(".credit-card-type li").removeClass('active')
    form.find(".credit-card-type .#{cardType}").addClass('active')
    form.find('input[rel=credit-card-type]').val(cardType)
}