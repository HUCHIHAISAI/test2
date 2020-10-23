module basketball(timerH,timerL,alarm,nrest,npause,cp);
input nrest,npause,cp;
wire nrest,npause,cp;
output[3:0]timerH,timerL;
reg[3:0]  timerH,timerL;
output alarm;
assign alarm=({timerH,timerL}==8'h00)&(nrest==1'b1);
always@(posedge cp or negedge nrest or negedge npause)
  begin
    if(~nrest)
	       {timerH,timerL} <= 8'h24;
	 else if(~npause)
	       {timerH,timerL} <= {timerH,timerL};
	 else if({timerH,timerL}==8'H00)
	   begin {timerH,timerL} <= {timerH,timerL};
		end
	 else if(timerL==4'h0)
	   begin timerH <= timerH-1'b1;
		      timerL <= 4'h9;
		end
	 else
	   begin timerH <= timerH;
		      timerL <= timerL-1'b1;
		end
	end
endmodule