include "console.iol"
include "string_utils.iol"

include "../src/private/file_worker.iol"

main
{
  split@FileWorker( "toSplit/test.m4p" { .parts = 3 } )( response);
  valueToPrettyString@StringUtils( response )( ps );
  println@Console( ps )();
  unsplit@FileWorker( "toSplit/test.m4p.part0" )( response);
  valueToPrettyString@StringUtils( response )( ps );
  println@Console( ps )()
}
