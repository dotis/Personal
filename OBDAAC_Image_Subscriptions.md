## OBDAAC Subscription Information




### For connection issues
Please send an email to connection_problems@oceancolor.sci.gsfc.nasa.gov with as much information as possible to describe your connection issues. Some things that might be helpful:

    The date and time you last attempted to access the site

    The IP network address of your system.
    You may also want to verify that we see you as that address by visiting an IP-checking website:
    https://www.google.com/#q=what+is+my+ip+address

    Output from a traceroute command (on Windows use tracert)
    Examples:
    traceroute oceancolor.gsfc.nasa.gov
    or
    traceroute oceandata.sci.gsfc.nasa.gov

    Output from "wget -d https://oceancolor.gsfc.nasa.gov"
    or "wget -d oceandata.sci.gsfc.nasa.gov"

    Alternatively, you can try "curl -IL --verbose https://oceancolor.gsfc.nasa.gov"
    
For MOST subscription issues, the problem is the cookies file:
    
~/.urs_cookies; need to delete and re-create using this line:

echo "machine urs.earthdata.nasa.gov login USERNAME password PASSWD" > ~/.netrc ; > ~/.urs_cookies

chmod  0600 ~/.netrc

The above command needs to be run on a bash shell. This is the first thing to try if subscriptions break.
