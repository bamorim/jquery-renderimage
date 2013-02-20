$ = jQuery
$.fn.renderImage = ->
  # Set jQuery $this reference
  $this = $(this)

  # Set the options and exceptions
  if arguments.length < 1
    return false

  if arguments.length == 1
    arg = arguments[0]
    if arg instanceof File
      file = arg
    else
      file = arg.file
      d_width = arg.width
      d_height = arg.height
      onfinish = arg.onFinish
  else
    file = arguments[0]
    d_width = arguments[1]
    d_height = arguments[2]
    onfinish = arguments[3]

  if !(file instanceof File)
    return false

  # Check if file is image
  imageType = /image.*/
  if !file.type.match imageType
    return false

  # Create and append the image element
  image = document.createElement("img")
  image.file = file
  $(image).css "display", "none" # Grants invisibility to image
  document.body.appendChild image


  # Read the file and put in the image
  reader = new FileReader()

  reader.onload = (e) ->
    image.src = e.target.result 

  ret = reader.readAsDataURL file

  image.onload = ->
    # Get source dimensions
    s_height = $(this).height()
    s_width = $(this).width()
    sr = s_width/s_height

    # Set destination dimensions
    d_width = s_width if !d_width
    d_height = s_height if !d_height
    dr = d_width/d_height

    # Calculate crop
    if dr > sr
      sw = s_width
      sh = s_width/dr
    else
      sh = s_height
      sw = s_height*dr

    # Create and append or use the canvas
    if $this[0].tagName.toLowerCase() == "canvas"
      canvas = $this[0]
    else
      canvas = document.createElement "canvas"
      $this.append canvas

    # Get canvas context
    ctx = canvas.getContext "2d"

    # Set canvas height
    canvas.width = d_width
    canvas.height = d_height

    # Draw the canvas and remove the image
    ctx.drawImage(image, 0, 0, sw, sh, 0, 0 , d_width, d_height)
    $(image).remove()

    onfinish.call() if onfinish

  true