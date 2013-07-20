Marklogic-XQuery-Functions-Library (MXFL)
============================

Marklogic XQuery Functions Library is another try of filling up at least _some_ gaps of missing funcionality or functions that are available elsewhere (for instance, in XSLT).
List of currently added functions is:
* mxfl:generate-uuid-v4()
* mxfl:remove-files-incrementally($collection as xs:string) 

To run this library
----------------------------
In order to import this library, download and put onto ML server where it would be accessible by your application. After that, call it in to your XQuery function like this:

xquery version "1.0";
 
import module namespace mxfl='http://www.vaitkus.com/xquery/functions' at '/lib/mxfl.xquery';


Issues?
----------------------------
Any issues please log it on github.com, [blog](http://www.vaitkus.com),
or email arunas@vaitkus.com


