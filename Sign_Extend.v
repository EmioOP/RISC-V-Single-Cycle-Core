module Sign_Extend(In,Imm_Ext);

    input [31:0] In;
    output [31:0] Imm_Ext;

    // assign Imm_Ext = (In[31]) ? {20'b11111111111111111111,In[31:20]} : {20'b00000000000000000000,In[31:20]};
    assign Imm_Ext = (In[31]) ? {{20{1'b1}},In[31:20]} : {{20{1'b0}},In[31:20]};
endmodule