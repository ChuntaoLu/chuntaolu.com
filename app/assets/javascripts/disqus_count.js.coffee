# * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * *
disqus_shortname = "chuntaolu" # required: replace example with your forum shortname

# * * DON'T EDIT BELOW THIS LINE * *
(->
  s = document.createElement("script")
  s.async = true
  s.type = "text/javascript"
  s.src = "//" + disqus_shortname + ".disqus.com/count.js"
  (document.getElementsByTagName("HEAD")[0] or document.getElementsByTagName("BODY")[0]).appendChild s
  return
)()
