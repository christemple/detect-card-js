$ = jQuery

$.fn.extend
  detectCard: (options) ->
    settings =
      debug: false

    settings = $.extend settings, options

    # Simple logger.
    log = (msg) ->
      console?.log msg if settings.debug

    return @each ()->
      log "Preparing magic show."
