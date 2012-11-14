$ = jQuery

$.fn.extend
  detectCard: (options) ->
    settings =
      debug: false

    settings = $.extend settings, options

    log = (msg) ->
      console?.log msg if settings.debug

    return @each ()->

      current_card_type = 'none'
      $(@).data 'card', current_card_type
      $(@).after "<span class=\"card #{current_card_type}\"/>"

      $(@).on 'keyup', (e)->
        detected_card_type = 'none'
        card_number = remove_spaces_from $(@).val()

        if is_a_number card_number
          log "It's valid credit/debit card number"
          detected_card_type = 'visa' if card_number.match /^4/
          detected_card_type = 'mastercard' if card_number.match /^5[1-5]/

        $(@).data 'card', detected_card_type
        $(".card.#{current_card_type}").text(detected_card_type)
        current_card_type = detected_card_type
        log "Current card type: #{current_card_type}"

      remove_spaces_from = (value)->
        value.replace /\s/g, ''

      is_a_number = (value)->
        value isnt "" and not isNaN value


