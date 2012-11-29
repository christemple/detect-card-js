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
          @get_type().replace " ", "_"

      get_type: ->
        if @number.match /^4/ then 'visa'
        else if @number.match /^5[1-5]/           then 'mastercard'
        else if @number.match /^3[47]/            then 'american express'
        else if @number.match /^6(?:011|5)/       then 'discover'
        else if @number.match /^(?:2131|1800|35)/ then 'jcb'
        else if @number.match /^3(?:0[0-5]|[68])/ then 'diners club'

      is_a_valid_number: ->
        @number isnt "" and not isNaN @number

      update_type: ->
        $(@element).data 'card', @detected_type
        $(@element).next('span.card').removeClass(@type).addClass(@detected_type) unless settings.preventDefault
        log "Changed card type from '#{@type}' to '#{@detected_type}'"
        @type = @detected_type

      display_type: ->
        $(".card.#{@type}").text @get_card_type_to_display()

      get_card_type_to_display: ->
        switch @type
          when "visa"             then "Visa"
          when 'mastercard'       then "MasterCard"
          when 'american_express' then "American Express"
          when 'discover'         then "Discover"
          when 'jcb'              then "JCB"
          when 'diners_club'      then "Diners Club"
          when 'none'             then ""


    return @each ()->

      card = new Card @
      card.setup_elements()

      $(@).on 'keyup', (e)->
        card.number = get_card_number_from $(@).val()
        card.detect_type()

        if card.type_has_changed()
          $(@).trigger 'cardChanged', card.detected_type
          card.update_type()
          card.display_type()


      get_card_number_from = (card_input)->
        remove_spaces_from card_input

      remove_spaces_from = (value)->
        value.replace /\s/g, ''


