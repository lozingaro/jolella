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

type SplitRequestType: string { // the path for the file to be split
  .parts: int // number of parts the file should be split
}

type SplitResponseType: void {
  .splits[1,*]: string // the paths of the split files
}

type UnsplitRequestType: string // the path for the first split file, e.g. name.zip.part0

type UnsplitResponseType: string // the path for the joined file

interface FileWorkerInterface {
RequestResponse:
split   ( SplitRequestType )( SplitResponseType ),
unsplit ( UnsplitRequestType )( UnsplitResponseType )
}

outputPort FileWorker {
  Interfaces: FileWorkerInterface
}

embedded { // this Java service lives in the /lib folder
  Java: "org.jolie.worker.WorkerService" in FileWorker
}
