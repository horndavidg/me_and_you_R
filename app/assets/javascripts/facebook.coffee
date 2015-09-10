jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/sdk.js"
    dataType: 'script'
    cache: true


window.fbAsyncInit = ->
  FB.init(appId: 903509093070590, cookie: true, xfbml: true, version: 'v2.4')

  $('#sign_in').click (e) ->
    e.preventDefault()
    FB.login ((response) ->
      window.location = '/auth/facebook/callback' if response.authResponse), scope: "public_profile,email"

  $('#sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true