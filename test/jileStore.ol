/*

Jolella File Sharing P2P Netowork
Copyright (C) 2019 <stefanopio.zingaro@unibo.it>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

*/

interface JileStoreInterface {
OneWay: dowloadJileStore( int )
}

service JileStore
{
  Interfaces: JileStoreInterface
  main
  {
    dowloadJileStore( size );
    if( size < 6 ) {
      size = 5
    } else if ( size < 15  ) {
      size = 10
    } else if ( size < 25 ) {
      size = 20
    } else if ( size < 75 ) {
      size = 50
    } else if ( size < 150 ) {
      size = 100
    } else {
      size = 200
    }
    execRequest = "curl";
    with( execRequest ){
      .args[0] = "-L";
      .args[1] = "http://ipv4.download.thinkbroadband.com:81/" + size + "MB.zip";
      .args[2] = "-O";
      .workingDirectory = "./test/jileStore";
      .stdOutConsoleEnable = true // TODO put that to false
    };
    exec@Exec( execRequest )( execResponse )
  }
}

main
{
  // test
  downloadJileStore@JileStore( 50 )
}
