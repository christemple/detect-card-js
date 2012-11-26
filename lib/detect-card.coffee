$ = jQuery

$.fn.extend

  detectCard: (options) ->
    settings =
      debug: false

    settings = $.extend settings, options

    log = (msg) ->
      console?.log msg if settings.debug

    class Card
      current_type: 'none'
      detected_type: ''
      number: ''

      constructor: (@element)->

      type_has_changed: ->
        @detected_type isnt @current_type

      detect_type: ->
        @detected_type = 'none'
        if @is_a_valid_number()
          log "#{@number} is a valid number"
          @detected_type = @get_detected_type()
        log "Card type detected was: #{@detected_type}"

      get_detected_type: ->
        if @number.match /^4/ then 'visa'
        else if @number.match /^5[1-5]/ then 'mastercard'
        else 'none'

      is_a_valid_number: ->
        @number isnt "" and not isNaN @number

      update_type: ->
        $(@element).data 'card', @detected_type
        $(".card.#{@current_type}").removeClass(@current_type).addClass(@detected_type)
        log "Changed card type from '#{@current_type}' to '#{@detected_type}'"
        @current_type = @detected_type

      display_detected_card_type: ->
        $(".card.#{@detected_type}").text @get_card_type_to_display()

      get_card_type_to_display: ->
        if @detected_type isnt 'none' then @detected_type else ''


    return @each ()->

      $(@).data 'card', 'none'
      $(@).after "<span class=\"card none\"/>"
      card = new Card @

      $(@).on 'keyup', (e)->
        card.number = get_card_number_from $(@).val()
        log "Card number is: #{card.number}"
        card.detect_type()

        if card.type_has_changed()
          card.update_type()
          card.display_detected_card_type()

      get_card_number_from = (card_input)->
        remove_spaces_from card_input

      remove_spaces_from = (value)->
        value.replace /\s/g, ''


