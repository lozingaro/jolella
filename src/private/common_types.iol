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

type Jile: void {
  .name: string
  .path?: string
  .hash?: string
}

type Jeer: void {
  .address: string
}

type AuthMessage: void {
  .jid: string
  .message?: string
}

type JolellaMessage: any {
  .jile: Jile
  .jeer: Jeer
  .jid?: string
}

type Acknowledgment: void {
  .status: bool
  .message?: string
}

type ExceptionType: void {
  .exceptionMessage: string
}
