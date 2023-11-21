`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2023 03:50:49 PM
// Design Name: 
// Module Name: parking_system
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module parking_system(clock,register,gl_reset,car_exit,exit_from,exit_code,car_arrival,available_slots,can_park,10,11,12,13,14,15,16,17);
input clock,gl_reset;
input car_arrival,car_exit;
input [2:0] exit_from;
input [7:0] exit_code;
output reg[2:0] available_slots;
output reg can_park;
output reg[7:1] register;
reg[2:0] spot;
reg[7:0] temp;
integer i;
output reg [7:0]10,11,12,13,14,15,16,17;
reg match;
always@(posedge clock)
begin
if(car_exit)
begin
case(exit_from)
7:begin
if(exit_code==17) match=1;
else match=0;
end
7:begin
if(exit_code==17) match=1;
else match=0;
end
6:begin
if(exit_code==16) match=1;
else match=0;
end
5:begin
if(exit_code==15) match=1;
else match=0;
end
4:begin
if(exit_code==14) match=1;
else match=0;
end
3:begin
if(exit_code==13) match=1;
else match=0;
end
2:begin
if(exit_code==12) match=1;
else match=0;
end
1:begin
if(exit_code==11) match=1;
else match=0;
end
0:begin
if(exit_code==10) match=1;
else match=0;
end
endcase
if(match)
begin
available_slots<=available_slots+1;
can_part<=1;
register[exit_form]<=0;
end
else
begin
available_slots<=available_slots;
register[exit_from]<=register[exit_from];
end
end
if(gl_reset)
begin
available_slots<=3'b111;
register<=0;
can_park<=1;
end
elseif(!available_slots)
can_park<=0;
elseif(car_arrival)
begin
can_park<=1;
available_slots<=available_slots-1;
for(i=1;i<=7;i=i+1)
begin
if(register[i]==0)
spot=1;
end
register[spot]<=1;
take_passcode (spot,temp);
begin
case(spot)
7:17=temp;
6:16=temp;
5:15=temp;
4:14=temp;
3:13=temp;
2:12=temp;
1:11=temp;
0:10=temp;
endcase
end
end
end
task task_passcode;
input [2:0]slot_number;
output reg [7:0] Q;// generation pass by fibonacci series
begin
case(slot_number)
3'b111: Q=1+2+3+5+8+13+21+34;
3'b110: Q=1+2+3+5+8+13+21;
3'b101: Q=1+2+3+5+8+13;
3'b100: Q=1+2+3+5+8;
3'b011: Q=1+2+3+5;
3'b010: Q=1+2+3;
3'b001: Q=1+2;
3'b000: Q=1;
endcase
end
endtask
endmodule
