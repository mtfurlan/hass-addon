# Home Assistant Add-on: HTTPS to HTTP redirect

## How to use

This will run an nginx server on port 443 that just redirects to http on port 80

This is cause firefox likes to default to https when it can't find a website,
such as if you refresh the webpage while homeassistant is start.ing
