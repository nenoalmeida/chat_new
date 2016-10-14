  App.chat = App.cable.subscriptions.create "ChatChannel",

  connected: ->

  disconnected: ->
    # Called when the subscription has been terminated by the server
  received: (data) ->

    #alert(data['message'])

    $('#messages').append data['message']

  speak: (message) ->

	   @perform 'speak', message: message
    $(document).on 'keypress', '[data-behavior~=chat_speaker]', (event) ->
      if event.keyCode is 13 # return = send
        App.chat.speak event.target.value
        event.preventDefault()
