//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
import ned.DatarateChannel;
import nesting.node.ethernet.VlanEtherHostQ;
import nesting.node.ethernet.VlanEtherHostSched;
import nesting.node.ethernet.VlanEtherSwitchPreemptable;


package nesting.simulations.examples;
network Ashatest1
{
    types:
        channel C extends DatarateChannel
        {
            delay = 0.1us;
            datarate = 1Gbps;
        }
    submodules:
        switchA: VlanEtherSwitchPreemptable {
            parameters:
                @display("p=188,127");
            gates:
                ethg[5];
        }
        switchB: VlanEtherSwitchPreemptable {
            parameters:
                @display("p=327,127");
            gates:
                ethg[3];
        }
        mpnode3: VlanEtherHostQ {
            @display("p=79,62");
        }
        mpnode2: VlanEtherHostQ {
            @display("p=172,29");
        }
        genrec2: VlanEtherHostQ {
            @display("p=446,54");
        }
        hpnode1: VlanEtherHostSched {
            @display("p=79,202");
        }
        hprec1: VlanEtherHostQ {
            @display("p=440,202");
        }
        mpnode4: VlanEtherHostQ {
            @display("p=210,201");
        }
    connections:
        hpnode1.ethg <--> C <--> switchA.ethg[0];
        mpnode2.ethg <--> C <--> switchA.ethg[1];
        mpnode3.ethg <--> C <--> switchA.ethg[2];
        mpnode4.ethg <--> C <--> switchA.ethg[3];




        hprec1.ethg <--> C <--> switchB.ethg[0];
        genrec2.ethg <--> C <--> switchB.ethg[1];

        switchA.ethg[4] <--> C <--> switchB.ethg[2];
}
