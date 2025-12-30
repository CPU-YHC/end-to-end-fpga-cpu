`timescale 1ns / 1ps

module CPU_Pipelined(
    input clk,
    input reset,
    input [15:0] switches,
    input [4:0] buttons,
    output [15:0] leds,
    output [7:0] seg_data,
    output halt_out,
    output [7:0] pc_out
    );
    
    //=================DECLARE IF STAGE WIRES=====================
    wire [7:0] PC_addr;
    wire [15:0] IF_instruction;
    wire [7:0] IF_pc_plus_1;
    
    wire PC_load_enable;
    wire [7:0] PC_load_addr;
    wire PC_halt;
    
    wire [15:0] ID_instruction;
    wire [7:0] ID_pc_plus_1;
    
    wire flush_IF_ID_Reg;
    
    //=================IF STAGE=====================
    
    //PC
    Program_Counter CPU_PC(
        .clk(clk),
        .reset(reset),
        .load_en(PC_load_enable),
        .halt(PC_halt),
        .load_val(PC_load_addr),
        .pc_out(PC_addr)
    
    );
    
    //INSTRUCTION MEMORY
    Inst_Mem CPU_IM(
        .addr(PC_addr),
        .instruction(IF_instruction)
    );
    
    //COMPUTE PC + 1 FOR IF/ID REG
    assign IF_pc_plus_1 = PC_addr + 1;
    
    //IF/ID PIPELINE REGISTER
    IF_ID_Reg CPU_IF_ID(
        .clk(clk),
        .reset(reset | flush_IF_ID_Reg),
        .IF_instruction(IF_instruction),
        .IF_PC_plus_1(IF_pc_plus_1),
        .ID_instruction(ID_instruction),
        .ID_PC_plus_1(ID_pc_plus_1)
    );
    
    //=================DECLARE ID STAGE WIRES=====================
    
    //decoder output
    wire [3:0] ID_opcode;
    wire [1:0] ID_rd;
    wire [1:0] ID_r1;
    wire [1:0] ID_r2;
    wire [7:0] ID_imm;
    
    //control unit output
    wire [2:0] ID_alu_op;
    wire ID_alu_src;
    wire ID_mem_read;
    wire ID_mem_write;
    wire ID_reg_write;
    wire ID_mem_to_reg;
    wire ID_r2_to_rd;
    wire ID_jump;
    wire ID_branch_zero;
    wire ID_branch_neg;
    wire ID_halt;
    
    //register file read outputs
    wire [7:0] ID_reg_data_1;
    wire [7:0] ID_reg_data_2;
    
    //register file write signals
    wire WB_reg_write;
    wire [1:0] WB_rd;
    wire [7:0] WB_write_data;
    
    //ID/EX Register output
    wire [7:0] EX_pc_plus_1;
    wire [7:0] EX_reg_data_1;
    wire [7:0] EX_reg_data_2;
    wire [1:0] EX_rd;
    wire [7:0] EX_imm;
    wire [2:0] EX_alu_op;
    wire EX_alu_src;
    wire EX_mem_read;
    wire EX_mem_write;
    wire EX_reg_write;
    wire EX_mem_to_reg;
    wire EX_r2_to_rd;
    wire EX_jump;
    wire EX_branch_zero;
    wire EX_branch_neg;
    wire EX_halt;
    
    wire flush_ID_EX_Reg;
    
    //=================ID STAGE=====================
    
    //INSTRUCTION DECODER
    Instruction_Decoder CPU_Inst_dec(
        .instruction(ID_instruction),
        .opcode(ID_opcode),
        .rd(ID_rd),
        .r1(ID_r1),
        .r2(ID_r2),
        .imm(ID_imm)
    );
    
    //CONTROL UNIT
    Control_Unit CPU_Control_Unit(
        .opcode(ID_opcode),
        .alu_op(ID_alu_op),
        .reg_write(ID_reg_write),
        .mem_read(ID_mem_read),
        .mem_write(ID_mem_write),
        .mem_to_reg(ID_mem_to_reg),
        .r2_to_rd(ID_r2_to_rd),
        .alu_src(ID_alu_src),
        .jump(ID_jump),
        .branch_zero(ID_branch_zero),
        .branch_neg(ID_branch_neg),
        .halt(ID_halt)
    );
    
    //HANDLE R2 = RD
    wire [1:0] reg_read_addr_2;
    assign reg_read_addr_2 = ID_r2_to_rd ? ID_rd : ID_r2;
    
    //REGISTER FILE
    Register_File CPU_Register_File(
        .clk(clk),
        .r1(ID_r1),
        .r2(reg_read_addr_2),
        .w(WB_rd),
        .data(WB_write_data),
        .WE(WB_reg_write),
        .r1_out(ID_reg_data_1),
        .r2_out(ID_reg_data_2)
    );
    
    //ID/EX PIPELINE REGISTER
    ID_EX_Reg CPU_ID_EX(
        .clk(clk),
        .reset(reset | flush_ID_EX_Reg),
        .ID_PC_plus_1(ID_pc_plus_1),
        .ID_reg_data_1(ID_reg_data_1),
        .ID_reg_data_2(ID_reg_data_2),
        .ID_rd(ID_rd),
        .ID_imm(ID_imm),
        .ID_alu_op(ID_alu_op),
        .ID_alu_src(ID_alu_src),
        .ID_mem_read(ID_mem_read),
        .ID_mem_write(ID_mem_write),
        .ID_mem_to_reg(ID_mem_to_reg),
        .ID_r2_to_rd(ID_r2_to_rd),
        .ID_reg_write(ID_reg_write),
        .ID_jump(ID_jump),
        .ID_branch_zero(ID_branch_zero),
        .ID_branch_neg(ID_branch_neg),
        .ID_halt(ID_halt),
        
        .EX_PC_plus_1(EX_pc_plus_1),
        .EX_reg_data_1(EX_reg_data_1),
        .EX_reg_data_2(EX_reg_data_2),
        .EX_rd(EX_rd),
        .EX_imm(EX_imm),
        .EX_alu_op(EX_alu_op),
        .EX_alu_src(EX_alu_src),
        .EX_mem_read(EX_mem_read),
        .EX_mem_write(EX_mem_write),
        .EX_mem_to_reg(EX_mem_to_reg),
        .EX_r2_to_rd(EX_r2_to_rd),
        .EX_reg_write(EX_reg_write),
        .EX_jump(EX_jump),
        .EX_branch_zero(EX_branch_zero),
        .EX_branch_neg(EX_branch_neg),
        .EX_halt(EX_halt)
    );
    
    //=================DECLARE EX STAGE WIRES=====================
    wire [7:0] EX_alu_input_b;
    
    wire [7:0] EX_alu_result;
    wire EX_zero_flag;
    wire EX_neg_flag;
    
    wire [7:0] MEM_alu_result;
    wire MEM_zero_flag;
    wire MEM_neg_flag;
    wire [7:0] MEM_reg_data_2;
    wire [1:0] MEM_rd;
    wire [7:0] MEM_branch_target;
    wire MEM_mem_read;
    wire MEM_mem_write;
    wire MEM_reg_write;
    wire MEM_mem_to_reg;
    wire MEM_jump;
    wire MEM_branch_zero;
    wire MEM_branch_neg;
    wire MEM_halt;
    
    wire flush_EX_MEM_Reg;
    
    //=================EX STAGE=====================
    
    assign EX_alu_input_b = EX_alu_src ? EX_imm : EX_reg_data_2;
    
    alu CPU_ALU(
        .a(EX_reg_data_1),
        .b(EX_alu_input_b),
        .op(EX_alu_op),
        .result(EX_alu_result),
        .zero(EX_zero_flag),
        .carry(),
        .negative(EX_neg_flag)
    );
    
    EX_MEM_Reg CPU_EX_MEM(
        .clk(clk),
        .reset(reset | flush_EX_MEM_Reg),
        .EX_alu_result(EX_alu_result),
        .EX_zero_flag(EX_zero_flag),
        .EX_neg_flag(EX_neg_flag),
        .EX_reg_data_2(EX_reg_data_2),
        .EX_rd(EX_rd),
        .EX_branch_target(EX_imm),
        .EX_reg_write(EX_reg_write),
        .EX_mem_read(EX_mem_read),
        .EX_mem_write(EX_mem_write),
        .EX_mem_to_reg(EX_mem_to_reg),
        .EX_jump(EX_jump),
        .EX_branch_zero(EX_branch_zero),
        .EX_branch_neg(EX_branch_neg),
        .EX_halt(EX_halt),
        
        .MEM_alu_result(MEM_alu_result),
        .MEM_zero_flag(MEM_zero_flag),
        .MEM_neg_flag(MEM_neg_flag),
        .MEM_reg_data_2(MEM_reg_data_2),
        .MEM_rd(MEM_rd),
        .MEM_branch_target(MEM_branch_target),
        .MEM_reg_write(MEM_reg_write),
        .MEM_mem_read(MEM_mem_read),
        .MEM_mem_write(MEM_mem_write),
        .MEM_mem_to_reg(MEM_mem_to_reg),
        .MEM_jump(MEM_jump),
        .MEM_branch_zero(MEM_branch_zero),
        .MEM_branch_neg(MEM_branch_neg),
        .MEM_halt(MEM_halt)
    );
    
    //=================DECLARE MEM STAGE WIRES=====================
    wire [7:0] MEM_mem_data;
    
    wire MEM_branch_taken;
    
    wire [7:0] WB_alu_result;
    wire [7:0] WB_mem_data;
    wire WB_mem_to_reg;
    
    wire flush_MEM_WB_Reg;
    
    //=================MEM STAGE=====================

    Data_Memory CPU_Data_Mem(
        .clk(clk),
        .addr(MEM_alu_result),
        .data(MEM_reg_data_2),
        .WE(MEM_mem_write),
        .read_data(MEM_mem_data),
        .switches(switches),
        .buttons(buttons),
        .leds(leds),
        .seg_data(seg_data)
    );
    
    assign MEM_branch_taken = MEM_jump | (MEM_zero_flag & MEM_branch_zero) | (MEM_neg_flag & MEM_branch_neg);
    
    assign PC_load_enable = MEM_branch_taken;
    assign PC_load_addr = MEM_branch_target;
    assign PC_halt = MEM_halt;
    
    assign flush_IF_ID_Reg = MEM_branch_taken | MEM_halt;
    assign flush_ID_EX_Reg = MEM_branch_taken | MEM_halt;
    assign flush_EX_MEM_Reg = MEM_branch_taken;
    
    MEM_WB_Reg CPU_MEM_WB(
        .clk(clk),
        .reset(reset),
        .MEM_alu_result(MEM_alu_result),
        .MEM_mem_data(MEM_mem_data),
        .MEM_rd(MEM_rd),
        .MEM_reg_write(MEM_reg_write),
        .MEM_mem_to_reg(MEM_mem_to_reg),
        .WB_alu_result(WB_alu_result),
        .WB_mem_data(WB_mem_data),
        .WB_rd(WB_rd),
        .WB_reg_write(WB_reg_write),
        .WB_mem_to_reg(WB_mem_to_reg)
    );
    
    assign WB_write_data = WB_mem_to_reg ? WB_mem_data : WB_alu_result;
    
    assign halt_out = PC_halt;
    assign pc_out = PC_addr;

endmodule
