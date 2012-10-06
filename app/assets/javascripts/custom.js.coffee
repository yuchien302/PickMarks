
# Create the tooltips only on document load

#
#       * You'll need your own API key, don't abuse mine please!
#       * Get yours here: http://www.websnapr.com/free_services/
#       
jQuery ->

  clickevent = (e) ->
    e.preventDefault()
    alert "123"

  $("h1").live('click', clickevent)
    

  # apiKey = "AL7RP8h1izzN"

  # # Notice the use of the each method to gain access to each element individually
  # $("#retrieve_list a").each ->
    
  #   # Grab the URL from our link
  #   url = encodeURIComponent($(this).attr("href"))
    
  #   # Create image thumbnail using Websnapr thumbnail service
  #   thumbnail = $("<img />").attr(
  #     src: "http://images.websnapr.com/?url=" + url + "&key=" + apiKey + "&hash=" + encodeURIComponent(websnapr_hash)
  #     alt: "Loading thumbnail..."
  #     width: 202
  #     height: 152
  #   )
    
  #   # Setup the tooltip with the content
  #   $(this).qtip
  #     content: thumbnail
  #     position:
  #       corner:
  #         tooltip: "bottomMiddle"
  #         target: "topMiddle"

  #     style:
  #       tip: true # Give it a speech bubble tip with automatic corner detection
  #       name: "cream"


