`timescale 1ns / 1ps

module digits(
    input clk_1Hz,
    input reset,
    output reg [7:0] count
    );
    // ones reg control
    always @(posedge clk_1Hz or posedge reset) 
    begin
          if(reset)
            count[3:0] <= 4'b0000;	 				
          else
            if(count[3:0] == 4'b1001)
                count[3:0] <= 4'b0000;
            else
                count[3:0] <= count[3:0] + 4'b0001;
	end
    // tens reg control       
    always @(posedge clk_1Hz or posedge reset)
	 begin
        if(reset) begin
            count[7:4] <= 4'b0000;
			 end
			else
            if(count[3:0] == 4'b1001) begin
                if(count[7:4] == 4'b1001)
		            begin
                    count[7:4] <= 4'b0000;
		            end                   
                else
                    count[7:4] <= count[7:4] + 4'b0001;
				end
		end
  
	  endmodule

  
