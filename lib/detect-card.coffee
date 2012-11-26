$ = jQuery

$.fn.extend

  detectCard: (options) ->
    settings =
      debug: false

    settings = $.extend settings, options

    log = (msg) ->
      console?.log msg if settings.debug

    class Card
      type: 'none'
      detected_type: ''
      number: ''

      constructor: (@element)->

      setup_elements: ->
        $(@element).data 'card', 'none'
        $(@element).after "<span class=\"card none\"/>"

      type_has_changed: ->
         @type isnt @detected_type

      detect_type: ->
        @detected_type = @get_detected_type()
        @detected_type ?= 'none'
        log "Card type detected was: #{@detected_type}"

      get_detected_type: ->
        if @is_a_valid_number()
          log "Card number '#{@number}' is valid"
          if @number.match /^4/ then 'visa'
          else if @number.match /^5[1-5]/ then 'mastercard'

      is_a_valid_number: ->
        @number isnt "" and not isNaN @number

      update_type: ->
        $(@element).data 'card', @detected_type
        $(@element).next('span.card').removeClass(@type).addClass(@detected_type)
        log "Changed card type from '#{@type}' to '#{@detected_type}'"
        @type = @detected_type

      display_type: ->
        $(".card.#{@type}").text @get_card_type_to_display()

      get_card_type_to_display: ->
        if @type isnt 'none' then @type else ''


    return @each ()->

      card = new Card @
      card.setup_elements()

      $(@).on 'keyup', (e)->
        card.number = get_card_number_from $(@).val()
        card.detect_type()

        if card.type_has_changed()
          card.update_type()
          card.display_type()


      get_card_number_from = (card_input)->
        remove_spaces_from card_input

      remove_spaces_from = (value)->
        value.replace /\s/g, ''


