module Sign_Extend(In,Imm_Ext,ImmSrc);

    input [31:0] In;
    input ImmSrc;
    output [31:0] Imm_Ext;

    // assign Imm_Ext = (In[31]) ? {20'b11111111111111111111,In[31:20]} : {20'b00000000000000000000,In[31:20]};

    assign Imm_Ext = (ImmSrc == 1'b1) ? 
                                    {{20{In[31]}},{In[31:25],In[11:7]}} : 
                                    {{20{In[31]}},In[31:20]};
endmodule