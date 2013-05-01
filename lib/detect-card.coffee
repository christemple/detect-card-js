$ = jQuery

$.fn.extend

  detectCard: (options) ->
    settings =
      debug: false

    settings = $.extend settings, options

    log = (msg) ->
      console?.log msg if settings.debug

    class Card
      type: ''
      detected_type: ''
      number: ''

      type_has_changed: ->
        @type isnt @detected_type

      detect_type: ->
        @detected_type = @get_detected_type()
        @detected_type ?= ''
        log "Card type detected was: #{@detected_type}"

      get_detected_type: ->
        if @is_a_valid_number()
          log "Card number '#{@number}' is valid"
          @get_type()

      get_type: ->
        if      @number.match /^4/                  then 'visa'
        else if @number.match /^5[1-5]/             then 'mastercard'
        else if @number.match /^3[47]/              then 'american-express'
        else if @number.match /^6(?:011|5)/         then 'discover'
        else if @number.match /^(?:2131|1800|35)/   then 'jcb'
        else if @number.match /^3(?:0[0-5]|[68])/   then 'diners-club'
        else if @number.match /^5018|5020|5038|5893|6304|67(59|61|62|63)|0604/ then 'maestro'
        else ''

      is_a_valid_number: ->
        @number isnt "" and not isNaN @number

      update_type: ->
        log "Changed card type from '#{@type}' to '#{@detected_type}'"
        @type = @detected_type


    return @each ()->

      card = new Card

      $(@).on 'keyup', (e)->
        card.number = get_card_number_from $(@).val()
        card.detect_type()

        if card.type_has_changed()
          card.update_type()
          $(@).trigger 'cardChange', card.type


      get_card_number_from = (card_input)->
        remove_spaces_from card_input

      remove_spaces_from = (value)->
        value.replace /\s/g, ''


