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
        card_number = get_card_number_from $(@).val()

        if is_a_number card_number
          log "It's valid credit/debit card number"
          detected_card_type = 'visa' if card_number.match /^4/
          detected_card_type = 'mastercard' if card_number.match /^5[1-5]/

        if detected_card_type isnt current_card_type
          update_card_type(@, detected_card_type, current_card_type)
          current_card_type = detected_card_type
          log "Current card type: #{current_card_type}"

      update_card_type = (card_element, detected_type, current_type)->
        $(card_element).data 'card', detected_type
        $(".card.#{current_type}").removeClass(current_type).addClass(detected_type)
        show_card_type_using detected_type

      show_card_type_using = (type)->
        $(".card.#{type}").text get_card_type_to_show(type)

      get_card_type_to_show = (card_type)->
        if card_type isnt 'none' then card_type else ''

      get_card_number_from = (card_input)->
        remove_spaces_from card_input

      remove_spaces_from = (value)->
        value.replace /\s/g, ''

      is_a_number = (value)->
        value isnt "" and not isNaN value


