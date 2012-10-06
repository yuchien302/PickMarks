jQuery ->  
    # CONFIG 
    xOffset = 10
    yOffset = 30
    
    # END CONFIG 
    $("a.screenshot").live 'mouseenter', (e) ->
      @t = @title
      @title = ""
      c = (if (@t isnt "") then "<br/>" + @t else "")
      $("body").append "<p id='screenshot'><img src='" + @rel + "' alt='url preview' />" + c + "</p>"
      $("#screenshot").css("width", "300px").css("top", (e.pageY - window.pageYOffset + yOffset) + "px").css("left", (e.pageX - window.pageXOffset + xOffset) + "px").fadeIn "fast"
      # img = new Image()
      # img.url = @rel


    $("a.screenshot").live 'mouseleave', (e) ->
      @title = @t
      $("#screenshot").remove()

    $("a.screenshot").live 'mousemove', (e) ->
      $("#screenshot").css("top", (e.pageY - window.pageYOffset + yOffset) + "px").css "left", (e.pageX - window.pageXOffset + xOffset) + "px"



