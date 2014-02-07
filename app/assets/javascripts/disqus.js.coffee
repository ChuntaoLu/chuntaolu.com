# * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * *
disqus_shortname = "chuntaolu" # required: replace example with your forum shortname

# * * DON'T EDIT BELOW THIS LINE * *
(->
  dsq = document.createElement("script")
  dsq.type = "text/javascript"
  dsq.async = true
  dsq.src = "//" + disqus_shortname + ".disqus.com/embed.js"
  (document.getElementsByTagName("head")[0] or document.getElementsByTagName("body")[0]).appendChild dsq
  return
)()

#    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
#    <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>

