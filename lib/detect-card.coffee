$ = jQuery

$.fn.extend
  detectCard: (options) ->
    settings =
      debug: false

    settings = $.extend settings, options
    $(@).data 'card', 'none'

    log = (msg) ->
      console?.log msg if settings.debug

    return @each ()->
      $(@).on 'keyup', (e)->
        card_number = remove_spaces_from $(@).val()
        $(@).data 'card', 'none'
        if is_a_number card_number
          log "It's valid credit/debit card number"
          $(@).data 'card', 'visa'       if card_number.match /^4/
          $(@).data 'card', 'mastercard' if card_number.match /^5[1-5]/


      remove_spaces_from = (value)->
        value.replace /\s/g, ''

      is_a_number = (value)->
        value isnt "" and not isNaN value

