xquery version "1.0";
module namespace mxfl = "http://www.vaitkus.com/xquery/functions";

(:
  PURPOSE: Creating randomised HEX values in string datatype
  VAR: $length - stringed HEX length
  RETURN: HEX casted into string
:)
declare function mxfl:generate-stringed-hex($length as xs:integer) as xs:string
{
  
  (: 
  Let assign random hex. It is created by casting random integer (range: 0-15) to hex.
  Upon return, check if hex can be casted to string 
  :)
  string-join(
      for $number in 1 to $length  
        let $hex := xdmp:integer-to-hex(xdmp:random(15))
        return if ($hex castable as xs:string) then (xs:string($hex)) else()
      )
  
};

(:
 PURPOSE: Create a v4 UUID (random number generator version
 VAR: none
 RETURN: UUID in string datatype
:)
declare function mxfl:generate-uuid-v4() as xs:string 
{ 
  let $hex-v4-pool := ("8", "9", "a", "b")
  let $random-seq-no := xdmp:random(3) + 1
  let $uuid-v4 := string-join(
      (        
        mxfl:generate-stringed-hex(8), (: first group of 8 HEX bits :)
        mxfl:generate-stringed-hex(4), (: second group of 4 HEX bits :)
        string-join(("4",mxfl:generate-stringed-hex(3)), ""), (: third group of 3 random HEX bits preceded by 4 (v4 UUID) :)
        string-join(($hex-v4-pool[$random-seq-no],mxfl:generate-stringed-hex(3)), ""), (: fourth group of 3 rand HEX bits preceded by random (8/9/a/b) (v4 UUID) :)
        mxfl:generate-stringed-hex(12) (: fifth group of 12 HEX bits :)
      ), "-"
    )    
  return $uuid-v4
};

(:
 PURPOSE: remove-files-incrementally-from-ML
 VAR: collection name as a string datatype
 RETURN: true/false
:)
declare function mxfl:remove-files-incrementally($collection as xs:string) as xs:string {
    for $doc in subsequence(collection($collection), 1, 10000)
        for $item in $doc
            return xdmp:document-delete(fn:document-uri($item)) 
};
