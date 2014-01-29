TruncateHtml.configure do |config|
  #config.length         = 500
  config.word_boundary  = /\S[\.\?\!]/
  config.omission       = '...'
  config.break_token    = '<!-- truncate -->'
end