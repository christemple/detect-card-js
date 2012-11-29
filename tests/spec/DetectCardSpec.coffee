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


  it 'should call the cardChanged event if the card type has changed', ->

    spyOnEvent('#card', 'cardChanged');
    enter_visa_number_to $('#card')
    expect('cardChanged').toHaveBeenTriggeredOn('#card');


  it 'should not call the cardChanged event if the card type has not changed', ->

    spyOnEvent('#card', 'cardChanged');
    enter_visa_number_to $('#card')
    expect('cardChanged').toHaveBeenTriggeredOn('#card');
    jasmine.JQuery.events.cleanUp();
    enter_visa_number_to $('#card')
    expect('cardChanged').toNotHaveBeenTriggeredOn('#card');
