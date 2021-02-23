#new idea for australian fires project would be using sentinel two data
#but first we need to try how to make it work

library(maps)
ImageCollection('COPERNICUS/S2_SR')
function maskS2clouds(image) {
  var qa = image.select('QA60')
  
  #okay, no chance, I know too little about it, dont even know if it could work with r
  
  
