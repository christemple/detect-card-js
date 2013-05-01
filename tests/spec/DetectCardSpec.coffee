beforeEach ->
  $('body').append '<div id="testContainer"></div>'

afterEach ->
  $('#testContainer').remove()


describe 'DetectCard', ->

  beforeEach ->
    card_input_html = '<label for="card" >Card number:</label><input id="card" type="text">'
    $('#testContainer').append card_input_html
    $('#card').detectCard()

  afterEach ->
    $('#testContainer').children().remove()


  it 'should call the cardChange event if the card type has changed', ->

    spyOnEvent('#card', 'cardChange');
    enter_visa_number_to $('#card')
    expect('cardChange').toHaveBeenTriggeredOn('#card');


  it 'should not call the cardChanged event if the card type has not changed', ->

    spyOnEvent('#card', 'cardChange');
    enter_visa_number_to $('#card')
    expect('cardChange').toHaveBeenTriggeredOn('#card');
    jasmine.JQuery.events.cleanUp();
    enter_visa_number_to $('#card')
    expect('cardChange').toNotHaveBeenTriggeredOn('#card');
