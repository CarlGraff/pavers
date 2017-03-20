# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
setObjAttr =(object, isOn) ->
  if (logged_in?)
    $('#'+object).show()
    if (isOn)
      $('#'+object).css("color": "black")
      $('#paver_'+object).css("background-color": "white")
    else
      $('#'+object).css("color": "grey")
      $('#paver_'+object).css("background-color": "lightgrey")
  else
    $('#'+object).hide()
    if (isOn)
      $('#'+object).show()
    else
      $('#'+object).hide()

setObjects = ->
  selectedval = $(".paver_radio:checked").val()
  #alert $(".paver_radio:checked").val()
  if selectedval == "4x8"
      setObjAttr("Logo", false) 
      setObjAttr("Line4", false) 
      setObjAttr("Line5", false) 
   else
      setObjAttr("Logo", false) 
      setObjAttr("Line4", false) 
      setObjAttr("Line5", false) 
  if selectedval == "8x8-4"
    setObjAttr("Logo", true) 
    setObjAttr("Line4", true) 
    setObjAttr("Line5", false) 
  if selectedval == "8x8-5"
    setObjAttr("Logo", false) 
    setObjAttr("Line4", true) 
    setObjAttr("Line5", true)   

ready = ->
  #alert $(".paver_radio:checked").val()
  setObjects()
  $(".paver_radio").change ->
    setObjects()  

$(document).ready(ready)
$(document).on('page:load', ready)
