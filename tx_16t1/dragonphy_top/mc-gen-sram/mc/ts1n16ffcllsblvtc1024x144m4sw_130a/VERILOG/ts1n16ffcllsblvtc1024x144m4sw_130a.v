//*#*********************************************************************************************************************/
//*
//*# Technology     : TSMC 16nm CMOS Logic FinFet Compact (FFC) Low Leakage HKMG  						*/
//*# Memory Type    : TSMC 16nm FFC High Density Single Port Single-Bank SRAM Compiler with d0734 bit cell	 				*/
//*# Library Name   : ts1n16ffcllsblvtc1024x144m4sw (user specify : ts1n16ffcllsblvtc1024x144m4sw)			*/
//*# Library Version: 130a												*/
//*# Generated Time : 2020/05/11, 12:57:39										*/
//*#*********************************************************************************************************************/
//*#															*/
//*# STATEMENT OF USE													*/
//*#															*/
//*# This information contains confidential and proprietary information of TSMC.					*/
//*# No part of this information may be reproduced, transmitted, transcribed,						*/
//*# stored in a retrieval system, or translated into any human or computer						*/
//*# language, in any form or by any means, electronic, mechanical, magnetic,						*/
//*# optical, chemical, manual, or otherwise, without the prior written permission					*/
//*# of TSMC. This information was prepared for informational purpose and is for					*/
//*# use by TSMC's customers only. TSMC reserves the right to make changes in the					*/
//*# information at any time and without notice.									*/
//*#															*/
//*#*********************************************************************************************************************/
//********************************************************************************/
//*                                                                              */
//*      Usage Limitation: PLEASE READ CAREFULLY FOR CORRECT USAGE               */
//*                                                                              */
//* Please be careful when using non 2^n  memory.                                */
//* In a non-fully decoded array, a write cycle to a nonexistent address location*/
//* does not change the memory array contents and output remains the same.       */
//* In a non-fully decoded array, a read cycle to a nonexistent address location */
//* does not change the memory array contents but the output becomes unknown.    */
//*                                                                              */
//* In the verilog model, the behavior of unknown clock will corrupt the         */
//* memory data and make output unknown regardless of CEB signal.  But in the    */
//* silicon, the unknown clock at CEB high, the memory and output data will be   */
//* held. The verilog model behavior is more conservative in this condition.     */
//*                                                                              */
//* The model doesn't identify physical column and row address.                  */
//*                                                                              */
//* The verilog model provides TSMC_CM_UNIT_DELAY mode for the fast function     */
//* simulation.                                                                  */
//* All timing values in the specification are not checked in the                */
//* TSMC_CM_UNIT_DELAY mode simulation.                                          */
//* The timing values specified in this model do not reflect real circuit        */
//* behavior. For real timing simulation, please back annotate SDF file.         */
//*                                                                              */
//* Template Version : S_01_61301                                                */
//****************************************************************************** */
//*      Macro Usage       : (+define[MACRO] for Verilog compiliers)             */
//* +TSMC_CM_UNIT_DELAY : Enable fast function simulation.                       */
//* +TSMC_CM_NO_WARNING : Disable all runtime warnings message from this model.  */
//* +TSMC_INITIALIZE_MEM : Initialize the memory data in verilog format.         */
//* +TSMC_INITIALIZE_FAULT : Initialize the memory fault data in verilog format. */
//* +TSMC_NO_TESTPINS_DEFAULT_VALUE_CHECK : Disable the wrong test pins          */
//*                           connection error  message if necessary.            */
//* +TSMC_STUCKAT_FAULT : Enable injectSA task. Please don't use this option     */
//*                       with initial options like +vcs+initmem+0/1 or          */
//*                       +vcs+initreg+0/1 ...                                   */
//****************************************************************************** */
`resetall

`celldefine

`timescale 1ns/1ps
`delay_mode_path
`suppress_faults
`enable_portfaults
      
module TS1N16FFCLLSBLVTC1024X144M4SW (
            CLK, CEB, WEB,
            A, D,
            BWEB,
            RTSEL,
            WTSEL,
            Q);

parameter numWord = 1024;
parameter numRow = 256;
parameter numCM = 4;
parameter numIOBit = 144;
parameter numBit = 144;
parameter numWordAddr = 10;
parameter numRowAddr = 8;
parameter numCMAddr = 2;
`ifdef TSMC_STUCKAT_FAULT
parameter numStuckAt = 20;
`endif

`ifdef TSMC_CM_UNIT_DELAY
parameter SRAM_DELAY = 0.0010;
`endif
`ifdef TSMC_INITIALIZE_MEM
parameter INITIAL_MEM_DELAY = 0.01;
`else
  `ifdef TSMC_INITIALIZE_MEM_USING_DEFAULT_TASKS
parameter INITIAL_MEM_DELAY = 0.01;
  `endif
`endif
`ifdef TSMC_INITIALIZE_FAULT
parameter INITIAL_FAULT_DELAY = 0.01;
`endif

`ifdef TSMC_INITIALIZE_MEM
parameter cdeFileInit  = "TS1N16FFCLLSBLVTC1024X144M4SW_initial.cde";
`endif
`ifdef TSMC_INITIALIZE_FAULT
parameter cdeFileFault = "TS1N16FFCLLSBLVTC1024X144M4SW_fault.cde";
`endif

`ifdef TSMC_CM_NO_WARNING
parameter MES_ALL = "OFF";
`else
parameter MES_ALL = "ON";
`endif

//=== IO Ports ===//

// Normal Mode Input
input CLK;
input CEB;
input WEB;
input [9:0] A;
input [143:0] D;
input [143:0] BWEB;


// Data Output
output [143:0] Q;


// Test Mode
input [1:0] RTSEL;
input [1:0] WTSEL;

//=== Internal Signals ===//
        
// Normal Mode Input
wire SLP_b;
wire SLP_i = 1'b0;
wire DSLP_b;
wire DSLP_i = 1'b0;
wire SD_i;
wire CLK_i;
wire CEB_i;
wire WEB_i;
wire [numWordAddr-1:0] A_i;
wire [numIOBit-1:0] D_i;
wire [numIOBit-1:0] BWEB_i;

wire BIST_i;
assign BIST_i = 1'b0;


// Data Output
wire [numIOBit-1:0] Q_i;

// Serial Shift Register Data

// Test Mode
wire [1:0] RTSEL_i;
wire [1:0] WTSEL_i;

//=== IO Buffers ===//
        
// Normal Mode Input
buf (CLK_i, CLK);
buf (CEB_i, CEB);
buf (WEB_i, WEB);
buf (A_i[0], A[0]);
buf (A_i[1], A[1]);
buf (A_i[2], A[2]);
buf (A_i[3], A[3]);
buf (A_i[4], A[4]);
buf (A_i[5], A[5]);
buf (A_i[6], A[6]);
buf (A_i[7], A[7]);
buf (A_i[8], A[8]);
buf (A_i[9], A[9]);
buf (D_i[0], D[0]);
buf (D_i[1], D[1]);
buf (D_i[2], D[2]);
buf (D_i[3], D[3]);
buf (D_i[4], D[4]);
buf (D_i[5], D[5]);
buf (D_i[6], D[6]);
buf (D_i[7], D[7]);
buf (D_i[8], D[8]);
buf (D_i[9], D[9]);
buf (D_i[10], D[10]);
buf (D_i[11], D[11]);
buf (D_i[12], D[12]);
buf (D_i[13], D[13]);
buf (D_i[14], D[14]);
buf (D_i[15], D[15]);
buf (D_i[16], D[16]);
buf (D_i[17], D[17]);
buf (D_i[18], D[18]);
buf (D_i[19], D[19]);
buf (D_i[20], D[20]);
buf (D_i[21], D[21]);
buf (D_i[22], D[22]);
buf (D_i[23], D[23]);
buf (D_i[24], D[24]);
buf (D_i[25], D[25]);
buf (D_i[26], D[26]);
buf (D_i[27], D[27]);
buf (D_i[28], D[28]);
buf (D_i[29], D[29]);
buf (D_i[30], D[30]);
buf (D_i[31], D[31]);
buf (D_i[32], D[32]);
buf (D_i[33], D[33]);
buf (D_i[34], D[34]);
buf (D_i[35], D[35]);
buf (D_i[36], D[36]);
buf (D_i[37], D[37]);
buf (D_i[38], D[38]);
buf (D_i[39], D[39]);
buf (D_i[40], D[40]);
buf (D_i[41], D[41]);
buf (D_i[42], D[42]);
buf (D_i[43], D[43]);
buf (D_i[44], D[44]);
buf (D_i[45], D[45]);
buf (D_i[46], D[46]);
buf (D_i[47], D[47]);
buf (D_i[48], D[48]);
buf (D_i[49], D[49]);
buf (D_i[50], D[50]);
buf (D_i[51], D[51]);
buf (D_i[52], D[52]);
buf (D_i[53], D[53]);
buf (D_i[54], D[54]);
buf (D_i[55], D[55]);
buf (D_i[56], D[56]);
buf (D_i[57], D[57]);
buf (D_i[58], D[58]);
buf (D_i[59], D[59]);
buf (D_i[60], D[60]);
buf (D_i[61], D[61]);
buf (D_i[62], D[62]);
buf (D_i[63], D[63]);
buf (D_i[64], D[64]);
buf (D_i[65], D[65]);
buf (D_i[66], D[66]);
buf (D_i[67], D[67]);
buf (D_i[68], D[68]);
buf (D_i[69], D[69]);
buf (D_i[70], D[70]);
buf (D_i[71], D[71]);
buf (D_i[72], D[72]);
buf (D_i[73], D[73]);
buf (D_i[74], D[74]);
buf (D_i[75], D[75]);
buf (D_i[76], D[76]);
buf (D_i[77], D[77]);
buf (D_i[78], D[78]);
buf (D_i[79], D[79]);
buf (D_i[80], D[80]);
buf (D_i[81], D[81]);
buf (D_i[82], D[82]);
buf (D_i[83], D[83]);
buf (D_i[84], D[84]);
buf (D_i[85], D[85]);
buf (D_i[86], D[86]);
buf (D_i[87], D[87]);
buf (D_i[88], D[88]);
buf (D_i[89], D[89]);
buf (D_i[90], D[90]);
buf (D_i[91], D[91]);
buf (D_i[92], D[92]);
buf (D_i[93], D[93]);
buf (D_i[94], D[94]);
buf (D_i[95], D[95]);
buf (D_i[96], D[96]);
buf (D_i[97], D[97]);
buf (D_i[98], D[98]);
buf (D_i[99], D[99]);
buf (D_i[100], D[100]);
buf (D_i[101], D[101]);
buf (D_i[102], D[102]);
buf (D_i[103], D[103]);
buf (D_i[104], D[104]);
buf (D_i[105], D[105]);
buf (D_i[106], D[106]);
buf (D_i[107], D[107]);
buf (D_i[108], D[108]);
buf (D_i[109], D[109]);
buf (D_i[110], D[110]);
buf (D_i[111], D[111]);
buf (D_i[112], D[112]);
buf (D_i[113], D[113]);
buf (D_i[114], D[114]);
buf (D_i[115], D[115]);
buf (D_i[116], D[116]);
buf (D_i[117], D[117]);
buf (D_i[118], D[118]);
buf (D_i[119], D[119]);
buf (D_i[120], D[120]);
buf (D_i[121], D[121]);
buf (D_i[122], D[122]);
buf (D_i[123], D[123]);
buf (D_i[124], D[124]);
buf (D_i[125], D[125]);
buf (D_i[126], D[126]);
buf (D_i[127], D[127]);
buf (D_i[128], D[128]);
buf (D_i[129], D[129]);
buf (D_i[130], D[130]);
buf (D_i[131], D[131]);
buf (D_i[132], D[132]);
buf (D_i[133], D[133]);
buf (D_i[134], D[134]);
buf (D_i[135], D[135]);
buf (D_i[136], D[136]);
buf (D_i[137], D[137]);
buf (D_i[138], D[138]);
buf (D_i[139], D[139]);
buf (D_i[140], D[140]);
buf (D_i[141], D[141]);
buf (D_i[142], D[142]);
buf (D_i[143], D[143]);
buf (BWEB_i[0], BWEB[0]);
buf (BWEB_i[1], BWEB[1]);
buf (BWEB_i[2], BWEB[2]);
buf (BWEB_i[3], BWEB[3]);
buf (BWEB_i[4], BWEB[4]);
buf (BWEB_i[5], BWEB[5]);
buf (BWEB_i[6], BWEB[6]);
buf (BWEB_i[7], BWEB[7]);
buf (BWEB_i[8], BWEB[8]);
buf (BWEB_i[9], BWEB[9]);
buf (BWEB_i[10], BWEB[10]);
buf (BWEB_i[11], BWEB[11]);
buf (BWEB_i[12], BWEB[12]);
buf (BWEB_i[13], BWEB[13]);
buf (BWEB_i[14], BWEB[14]);
buf (BWEB_i[15], BWEB[15]);
buf (BWEB_i[16], BWEB[16]);
buf (BWEB_i[17], BWEB[17]);
buf (BWEB_i[18], BWEB[18]);
buf (BWEB_i[19], BWEB[19]);
buf (BWEB_i[20], BWEB[20]);
buf (BWEB_i[21], BWEB[21]);
buf (BWEB_i[22], BWEB[22]);
buf (BWEB_i[23], BWEB[23]);
buf (BWEB_i[24], BWEB[24]);
buf (BWEB_i[25], BWEB[25]);
buf (BWEB_i[26], BWEB[26]);
buf (BWEB_i[27], BWEB[27]);
buf (BWEB_i[28], BWEB[28]);
buf (BWEB_i[29], BWEB[29]);
buf (BWEB_i[30], BWEB[30]);
buf (BWEB_i[31], BWEB[31]);
buf (BWEB_i[32], BWEB[32]);
buf (BWEB_i[33], BWEB[33]);
buf (BWEB_i[34], BWEB[34]);
buf (BWEB_i[35], BWEB[35]);
buf (BWEB_i[36], BWEB[36]);
buf (BWEB_i[37], BWEB[37]);
buf (BWEB_i[38], BWEB[38]);
buf (BWEB_i[39], BWEB[39]);
buf (BWEB_i[40], BWEB[40]);
buf (BWEB_i[41], BWEB[41]);
buf (BWEB_i[42], BWEB[42]);
buf (BWEB_i[43], BWEB[43]);
buf (BWEB_i[44], BWEB[44]);
buf (BWEB_i[45], BWEB[45]);
buf (BWEB_i[46], BWEB[46]);
buf (BWEB_i[47], BWEB[47]);
buf (BWEB_i[48], BWEB[48]);
buf (BWEB_i[49], BWEB[49]);
buf (BWEB_i[50], BWEB[50]);
buf (BWEB_i[51], BWEB[51]);
buf (BWEB_i[52], BWEB[52]);
buf (BWEB_i[53], BWEB[53]);
buf (BWEB_i[54], BWEB[54]);
buf (BWEB_i[55], BWEB[55]);
buf (BWEB_i[56], BWEB[56]);
buf (BWEB_i[57], BWEB[57]);
buf (BWEB_i[58], BWEB[58]);
buf (BWEB_i[59], BWEB[59]);
buf (BWEB_i[60], BWEB[60]);
buf (BWEB_i[61], BWEB[61]);
buf (BWEB_i[62], BWEB[62]);
buf (BWEB_i[63], BWEB[63]);
buf (BWEB_i[64], BWEB[64]);
buf (BWEB_i[65], BWEB[65]);
buf (BWEB_i[66], BWEB[66]);
buf (BWEB_i[67], BWEB[67]);
buf (BWEB_i[68], BWEB[68]);
buf (BWEB_i[69], BWEB[69]);
buf (BWEB_i[70], BWEB[70]);
buf (BWEB_i[71], BWEB[71]);
buf (BWEB_i[72], BWEB[72]);
buf (BWEB_i[73], BWEB[73]);
buf (BWEB_i[74], BWEB[74]);
buf (BWEB_i[75], BWEB[75]);
buf (BWEB_i[76], BWEB[76]);
buf (BWEB_i[77], BWEB[77]);
buf (BWEB_i[78], BWEB[78]);
buf (BWEB_i[79], BWEB[79]);
buf (BWEB_i[80], BWEB[80]);
buf (BWEB_i[81], BWEB[81]);
buf (BWEB_i[82], BWEB[82]);
buf (BWEB_i[83], BWEB[83]);
buf (BWEB_i[84], BWEB[84]);
buf (BWEB_i[85], BWEB[85]);
buf (BWEB_i[86], BWEB[86]);
buf (BWEB_i[87], BWEB[87]);
buf (BWEB_i[88], BWEB[88]);
buf (BWEB_i[89], BWEB[89]);
buf (BWEB_i[90], BWEB[90]);
buf (BWEB_i[91], BWEB[91]);
buf (BWEB_i[92], BWEB[92]);
buf (BWEB_i[93], BWEB[93]);
buf (BWEB_i[94], BWEB[94]);
buf (BWEB_i[95], BWEB[95]);
buf (BWEB_i[96], BWEB[96]);
buf (BWEB_i[97], BWEB[97]);
buf (BWEB_i[98], BWEB[98]);
buf (BWEB_i[99], BWEB[99]);
buf (BWEB_i[100], BWEB[100]);
buf (BWEB_i[101], BWEB[101]);
buf (BWEB_i[102], BWEB[102]);
buf (BWEB_i[103], BWEB[103]);
buf (BWEB_i[104], BWEB[104]);
buf (BWEB_i[105], BWEB[105]);
buf (BWEB_i[106], BWEB[106]);
buf (BWEB_i[107], BWEB[107]);
buf (BWEB_i[108], BWEB[108]);
buf (BWEB_i[109], BWEB[109]);
buf (BWEB_i[110], BWEB[110]);
buf (BWEB_i[111], BWEB[111]);
buf (BWEB_i[112], BWEB[112]);
buf (BWEB_i[113], BWEB[113]);
buf (BWEB_i[114], BWEB[114]);
buf (BWEB_i[115], BWEB[115]);
buf (BWEB_i[116], BWEB[116]);
buf (BWEB_i[117], BWEB[117]);
buf (BWEB_i[118], BWEB[118]);
buf (BWEB_i[119], BWEB[119]);
buf (BWEB_i[120], BWEB[120]);
buf (BWEB_i[121], BWEB[121]);
buf (BWEB_i[122], BWEB[122]);
buf (BWEB_i[123], BWEB[123]);
buf (BWEB_i[124], BWEB[124]);
buf (BWEB_i[125], BWEB[125]);
buf (BWEB_i[126], BWEB[126]);
buf (BWEB_i[127], BWEB[127]);
buf (BWEB_i[128], BWEB[128]);
buf (BWEB_i[129], BWEB[129]);
buf (BWEB_i[130], BWEB[130]);
buf (BWEB_i[131], BWEB[131]);
buf (BWEB_i[132], BWEB[132]);
buf (BWEB_i[133], BWEB[133]);
buf (BWEB_i[134], BWEB[134]);
buf (BWEB_i[135], BWEB[135]);
buf (BWEB_i[136], BWEB[136]);
buf (BWEB_i[137], BWEB[137]);
buf (BWEB_i[138], BWEB[138]);
buf (BWEB_i[139], BWEB[139]);
buf (BWEB_i[140], BWEB[140]);
buf (BWEB_i[141], BWEB[141]);
buf (BWEB_i[142], BWEB[142]);
buf (BWEB_i[143], BWEB[143]);



// Data Output
nmos (Q[0], Q_i[0], 1'b1);
nmos (Q[1], Q_i[1], 1'b1);
nmos (Q[2], Q_i[2], 1'b1);
nmos (Q[3], Q_i[3], 1'b1);
nmos (Q[4], Q_i[4], 1'b1);
nmos (Q[5], Q_i[5], 1'b1);
nmos (Q[6], Q_i[6], 1'b1);
nmos (Q[7], Q_i[7], 1'b1);
nmos (Q[8], Q_i[8], 1'b1);
nmos (Q[9], Q_i[9], 1'b1);
nmos (Q[10], Q_i[10], 1'b1);
nmos (Q[11], Q_i[11], 1'b1);
nmos (Q[12], Q_i[12], 1'b1);
nmos (Q[13], Q_i[13], 1'b1);
nmos (Q[14], Q_i[14], 1'b1);
nmos (Q[15], Q_i[15], 1'b1);
nmos (Q[16], Q_i[16], 1'b1);
nmos (Q[17], Q_i[17], 1'b1);
nmos (Q[18], Q_i[18], 1'b1);
nmos (Q[19], Q_i[19], 1'b1);
nmos (Q[20], Q_i[20], 1'b1);
nmos (Q[21], Q_i[21], 1'b1);
nmos (Q[22], Q_i[22], 1'b1);
nmos (Q[23], Q_i[23], 1'b1);
nmos (Q[24], Q_i[24], 1'b1);
nmos (Q[25], Q_i[25], 1'b1);
nmos (Q[26], Q_i[26], 1'b1);
nmos (Q[27], Q_i[27], 1'b1);
nmos (Q[28], Q_i[28], 1'b1);
nmos (Q[29], Q_i[29], 1'b1);
nmos (Q[30], Q_i[30], 1'b1);
nmos (Q[31], Q_i[31], 1'b1);
nmos (Q[32], Q_i[32], 1'b1);
nmos (Q[33], Q_i[33], 1'b1);
nmos (Q[34], Q_i[34], 1'b1);
nmos (Q[35], Q_i[35], 1'b1);
nmos (Q[36], Q_i[36], 1'b1);
nmos (Q[37], Q_i[37], 1'b1);
nmos (Q[38], Q_i[38], 1'b1);
nmos (Q[39], Q_i[39], 1'b1);
nmos (Q[40], Q_i[40], 1'b1);
nmos (Q[41], Q_i[41], 1'b1);
nmos (Q[42], Q_i[42], 1'b1);
nmos (Q[43], Q_i[43], 1'b1);
nmos (Q[44], Q_i[44], 1'b1);
nmos (Q[45], Q_i[45], 1'b1);
nmos (Q[46], Q_i[46], 1'b1);
nmos (Q[47], Q_i[47], 1'b1);
nmos (Q[48], Q_i[48], 1'b1);
nmos (Q[49], Q_i[49], 1'b1);
nmos (Q[50], Q_i[50], 1'b1);
nmos (Q[51], Q_i[51], 1'b1);
nmos (Q[52], Q_i[52], 1'b1);
nmos (Q[53], Q_i[53], 1'b1);
nmos (Q[54], Q_i[54], 1'b1);
nmos (Q[55], Q_i[55], 1'b1);
nmos (Q[56], Q_i[56], 1'b1);
nmos (Q[57], Q_i[57], 1'b1);
nmos (Q[58], Q_i[58], 1'b1);
nmos (Q[59], Q_i[59], 1'b1);
nmos (Q[60], Q_i[60], 1'b1);
nmos (Q[61], Q_i[61], 1'b1);
nmos (Q[62], Q_i[62], 1'b1);
nmos (Q[63], Q_i[63], 1'b1);
nmos (Q[64], Q_i[64], 1'b1);
nmos (Q[65], Q_i[65], 1'b1);
nmos (Q[66], Q_i[66], 1'b1);
nmos (Q[67], Q_i[67], 1'b1);
nmos (Q[68], Q_i[68], 1'b1);
nmos (Q[69], Q_i[69], 1'b1);
nmos (Q[70], Q_i[70], 1'b1);
nmos (Q[71], Q_i[71], 1'b1);
nmos (Q[72], Q_i[72], 1'b1);
nmos (Q[73], Q_i[73], 1'b1);
nmos (Q[74], Q_i[74], 1'b1);
nmos (Q[75], Q_i[75], 1'b1);
nmos (Q[76], Q_i[76], 1'b1);
nmos (Q[77], Q_i[77], 1'b1);
nmos (Q[78], Q_i[78], 1'b1);
nmos (Q[79], Q_i[79], 1'b1);
nmos (Q[80], Q_i[80], 1'b1);
nmos (Q[81], Q_i[81], 1'b1);
nmos (Q[82], Q_i[82], 1'b1);
nmos (Q[83], Q_i[83], 1'b1);
nmos (Q[84], Q_i[84], 1'b1);
nmos (Q[85], Q_i[85], 1'b1);
nmos (Q[86], Q_i[86], 1'b1);
nmos (Q[87], Q_i[87], 1'b1);
nmos (Q[88], Q_i[88], 1'b1);
nmos (Q[89], Q_i[89], 1'b1);
nmos (Q[90], Q_i[90], 1'b1);
nmos (Q[91], Q_i[91], 1'b1);
nmos (Q[92], Q_i[92], 1'b1);
nmos (Q[93], Q_i[93], 1'b1);
nmos (Q[94], Q_i[94], 1'b1);
nmos (Q[95], Q_i[95], 1'b1);
nmos (Q[96], Q_i[96], 1'b1);
nmos (Q[97], Q_i[97], 1'b1);
nmos (Q[98], Q_i[98], 1'b1);
nmos (Q[99], Q_i[99], 1'b1);
nmos (Q[100], Q_i[100], 1'b1);
nmos (Q[101], Q_i[101], 1'b1);
nmos (Q[102], Q_i[102], 1'b1);
nmos (Q[103], Q_i[103], 1'b1);
nmos (Q[104], Q_i[104], 1'b1);
nmos (Q[105], Q_i[105], 1'b1);
nmos (Q[106], Q_i[106], 1'b1);
nmos (Q[107], Q_i[107], 1'b1);
nmos (Q[108], Q_i[108], 1'b1);
nmos (Q[109], Q_i[109], 1'b1);
nmos (Q[110], Q_i[110], 1'b1);
nmos (Q[111], Q_i[111], 1'b1);
nmos (Q[112], Q_i[112], 1'b1);
nmos (Q[113], Q_i[113], 1'b1);
nmos (Q[114], Q_i[114], 1'b1);
nmos (Q[115], Q_i[115], 1'b1);
nmos (Q[116], Q_i[116], 1'b1);
nmos (Q[117], Q_i[117], 1'b1);
nmos (Q[118], Q_i[118], 1'b1);
nmos (Q[119], Q_i[119], 1'b1);
nmos (Q[120], Q_i[120], 1'b1);
nmos (Q[121], Q_i[121], 1'b1);
nmos (Q[122], Q_i[122], 1'b1);
nmos (Q[123], Q_i[123], 1'b1);
nmos (Q[124], Q_i[124], 1'b1);
nmos (Q[125], Q_i[125], 1'b1);
nmos (Q[126], Q_i[126], 1'b1);
nmos (Q[127], Q_i[127], 1'b1);
nmos (Q[128], Q_i[128], 1'b1);
nmos (Q[129], Q_i[129], 1'b1);
nmos (Q[130], Q_i[130], 1'b1);
nmos (Q[131], Q_i[131], 1'b1);
nmos (Q[132], Q_i[132], 1'b1);
nmos (Q[133], Q_i[133], 1'b1);
nmos (Q[134], Q_i[134], 1'b1);
nmos (Q[135], Q_i[135], 1'b1);
nmos (Q[136], Q_i[136], 1'b1);
nmos (Q[137], Q_i[137], 1'b1);
nmos (Q[138], Q_i[138], 1'b1);
nmos (Q[139], Q_i[139], 1'b1);
nmos (Q[140], Q_i[140], 1'b1);
nmos (Q[141], Q_i[141], 1'b1);
nmos (Q[142], Q_i[142], 1'b1);
nmos (Q[143], Q_i[143], 1'b1);



// Test Mode
buf sRTSEL0 (RTSEL_i[0], RTSEL[0]);
buf sRTSEL1 (RTSEL_i[1], RTSEL[1]);
buf sWTSEL0 (WTSEL_i[0], WTSEL[0]);
buf sWTSEL1 (WTSEL_i[1], WTSEL[1]);

//=== Data Structure ===//
reg invalid_slp;
reg invalid_dslp;
reg invalid_sd_dslp;
integer awt_counter;
integer wk_counter;

reg [numBit-1:0] MEMORY[numRow-1:0][numCM-1:0];
reg [numBit-1:0] MEMORY_FAULT[numRow-1:0][numCM-1:0];
reg [numIOBit-1:0] Q_d, bQ_tmp;
reg [numBit-1:0] Q_d_tmp;
reg [numIOBit-1:0] PRELOAD[0:numWord-1];
reg [numIOBit-1:0] PRELOAD2[0:numWord-1];
reg [numBit-1:0] DIN_tmp;

`ifdef TSMC_STUCKAT_FAULT
reg [numBit-1:0] ERR_tmp;
reg [numWordAddr-1:0] stuckAt0Addr [numStuckAt:0];
reg [numWordAddr-1:0] stuckAt1Addr [numStuckAt:0];
reg [numBit-1:0] stuckAt0Bit [numStuckAt:0];
reg [numBit-1:0] stuckAt1Bit [numStuckAt:0];
`endif

reg [numWordAddr-numCMAddr-1:0] row_tmp;
reg [numCMAddr-1:0] col_tmp;

integer i, j;
reg read_flag, write_flag, idle_flag;
reg slp_mode;
reg dslp_mode;
reg sd_mode;
reg clk_latch;
reg awt_mode;

`ifdef TSMC_CM_UNIT_DELAY
`else
reg notify_testpin;
reg notify_clk;
reg notify_sd_dslp;
reg notify_bist;
reg notify_ceb;
reg notify_web;
reg notify_addr;
reg notify_d0;
reg notify_bweb0;
reg notify_d1;
reg notify_bweb1;
reg notify_d2;
reg notify_bweb2;
reg notify_d3;
reg notify_bweb3;
reg notify_d4;
reg notify_bweb4;
reg notify_d5;
reg notify_bweb5;
reg notify_d6;
reg notify_bweb6;
reg notify_d7;
reg notify_bweb7;
reg notify_d8;
reg notify_bweb8;
reg notify_d9;
reg notify_bweb9;
reg notify_d10;
reg notify_bweb10;
reg notify_d11;
reg notify_bweb11;
reg notify_d12;
reg notify_bweb12;
reg notify_d13;
reg notify_bweb13;
reg notify_d14;
reg notify_bweb14;
reg notify_d15;
reg notify_bweb15;
reg notify_d16;
reg notify_bweb16;
reg notify_d17;
reg notify_bweb17;
reg notify_d18;
reg notify_bweb18;
reg notify_d19;
reg notify_bweb19;
reg notify_d20;
reg notify_bweb20;
reg notify_d21;
reg notify_bweb21;
reg notify_d22;
reg notify_bweb22;
reg notify_d23;
reg notify_bweb23;
reg notify_d24;
reg notify_bweb24;
reg notify_d25;
reg notify_bweb25;
reg notify_d26;
reg notify_bweb26;
reg notify_d27;
reg notify_bweb27;
reg notify_d28;
reg notify_bweb28;
reg notify_d29;
reg notify_bweb29;
reg notify_d30;
reg notify_bweb30;
reg notify_d31;
reg notify_bweb31;
reg notify_d32;
reg notify_bweb32;
reg notify_d33;
reg notify_bweb33;
reg notify_d34;
reg notify_bweb34;
reg notify_d35;
reg notify_bweb35;
reg notify_d36;
reg notify_bweb36;
reg notify_d37;
reg notify_bweb37;
reg notify_d38;
reg notify_bweb38;
reg notify_d39;
reg notify_bweb39;
reg notify_d40;
reg notify_bweb40;
reg notify_d41;
reg notify_bweb41;
reg notify_d42;
reg notify_bweb42;
reg notify_d43;
reg notify_bweb43;
reg notify_d44;
reg notify_bweb44;
reg notify_d45;
reg notify_bweb45;
reg notify_d46;
reg notify_bweb46;
reg notify_d47;
reg notify_bweb47;
reg notify_d48;
reg notify_bweb48;
reg notify_d49;
reg notify_bweb49;
reg notify_d50;
reg notify_bweb50;
reg notify_d51;
reg notify_bweb51;
reg notify_d52;
reg notify_bweb52;
reg notify_d53;
reg notify_bweb53;
reg notify_d54;
reg notify_bweb54;
reg notify_d55;
reg notify_bweb55;
reg notify_d56;
reg notify_bweb56;
reg notify_d57;
reg notify_bweb57;
reg notify_d58;
reg notify_bweb58;
reg notify_d59;
reg notify_bweb59;
reg notify_d60;
reg notify_bweb60;
reg notify_d61;
reg notify_bweb61;
reg notify_d62;
reg notify_bweb62;
reg notify_d63;
reg notify_bweb63;
reg notify_d64;
reg notify_bweb64;
reg notify_d65;
reg notify_bweb65;
reg notify_d66;
reg notify_bweb66;
reg notify_d67;
reg notify_bweb67;
reg notify_d68;
reg notify_bweb68;
reg notify_d69;
reg notify_bweb69;
reg notify_d70;
reg notify_bweb70;
reg notify_d71;
reg notify_bweb71;
reg notify_d72;
reg notify_bweb72;
reg notify_d73;
reg notify_bweb73;
reg notify_d74;
reg notify_bweb74;
reg notify_d75;
reg notify_bweb75;
reg notify_d76;
reg notify_bweb76;
reg notify_d77;
reg notify_bweb77;
reg notify_d78;
reg notify_bweb78;
reg notify_d79;
reg notify_bweb79;
reg notify_d80;
reg notify_bweb80;
reg notify_d81;
reg notify_bweb81;
reg notify_d82;
reg notify_bweb82;
reg notify_d83;
reg notify_bweb83;
reg notify_d84;
reg notify_bweb84;
reg notify_d85;
reg notify_bweb85;
reg notify_d86;
reg notify_bweb86;
reg notify_d87;
reg notify_bweb87;
reg notify_d88;
reg notify_bweb88;
reg notify_d89;
reg notify_bweb89;
reg notify_d90;
reg notify_bweb90;
reg notify_d91;
reg notify_bweb91;
reg notify_d92;
reg notify_bweb92;
reg notify_d93;
reg notify_bweb93;
reg notify_d94;
reg notify_bweb94;
reg notify_d95;
reg notify_bweb95;
reg notify_d96;
reg notify_bweb96;
reg notify_d97;
reg notify_bweb97;
reg notify_d98;
reg notify_bweb98;
reg notify_d99;
reg notify_bweb99;
reg notify_d100;
reg notify_bweb100;
reg notify_d101;
reg notify_bweb101;
reg notify_d102;
reg notify_bweb102;
reg notify_d103;
reg notify_bweb103;
reg notify_d104;
reg notify_bweb104;
reg notify_d105;
reg notify_bweb105;
reg notify_d106;
reg notify_bweb106;
reg notify_d107;
reg notify_bweb107;
reg notify_d108;
reg notify_bweb108;
reg notify_d109;
reg notify_bweb109;
reg notify_d110;
reg notify_bweb110;
reg notify_d111;
reg notify_bweb111;
reg notify_d112;
reg notify_bweb112;
reg notify_d113;
reg notify_bweb113;
reg notify_d114;
reg notify_bweb114;
reg notify_d115;
reg notify_bweb115;
reg notify_d116;
reg notify_bweb116;
reg notify_d117;
reg notify_bweb117;
reg notify_d118;
reg notify_bweb118;
reg notify_d119;
reg notify_bweb119;
reg notify_d120;
reg notify_bweb120;
reg notify_d121;
reg notify_bweb121;
reg notify_d122;
reg notify_bweb122;
reg notify_d123;
reg notify_bweb123;
reg notify_d124;
reg notify_bweb124;
reg notify_d125;
reg notify_bweb125;
reg notify_d126;
reg notify_bweb126;
reg notify_d127;
reg notify_bweb127;
reg notify_d128;
reg notify_bweb128;
reg notify_d129;
reg notify_bweb129;
reg notify_d130;
reg notify_bweb130;
reg notify_d131;
reg notify_bweb131;
reg notify_d132;
reg notify_bweb132;
reg notify_d133;
reg notify_bweb133;
reg notify_d134;
reg notify_bweb134;
reg notify_d135;
reg notify_bweb135;
reg notify_d136;
reg notify_bweb136;
reg notify_d137;
reg notify_bweb137;
reg notify_d138;
reg notify_bweb138;
reg notify_d139;
reg notify_bweb139;
reg notify_d140;
reg notify_bweb140;
reg notify_d141;
reg notify_bweb141;
reg notify_d142;
reg notify_bweb142;
reg notify_d143;
reg notify_bweb143;
`endif    //end `ifdef TSMC_CM_UNIT_DELAY

reg CEBL;
reg WEBL;

wire iCEB = (BIST_i===1) ? CEB_i : CEB_i;
wire iWEB = (BIST_i===1) ? WEB_i : WEB_i;
wire [numWordAddr-1:0] iA = A_i;
reg RCEB;

reg [numWordAddr-numCMAddr-1:0] iRowAddr;
reg [numCMAddr-1:0] iColAddr;
wire [numIOBit-1:0] iD = D_i;
wire [numIOBit-1:0] iBWEB = BWEB_i;


assign SD_i=1'b0;
assign DSLP_b=1'b0;
assign SLP_b=1'b0;

wire bDFTBYP;
wire bSE;
assign bDFTBYP = 1'b0;
assign bSE = 1'b0;

`ifdef TSMC_CM_UNIT_DELAY
`else
wire check_invalid_sd_dslp = invalid_sd_dslp;
wire check_read = read_flag & ~SD_i & ~DSLP_i & ~SLP_i;
wire check_write = write_flag & ~SD_i & ~DSLP_i & ~SLP_i & ~bDFTBYP & ~bSE;
wire check_nosd = ~SD_i & ~invalid_sd_dslp;
wire check_nosd_invalid = ~SD_i;
wire check_nosddslp = ~SD_i & ~DSLP_i ;
wire check_nopd = ~SD_i & ~DSLP_i & ~SLP_i;
wire mem_nopd = ~SD_i & ~DSLP_i & ~SLP_i & ~bDFTBYP & ~bSE;
wire check_noidle = ~idle_flag & ~SD_i & ~DSLP_i & ~SLP_i & ~bDFTBYP & ~bSE;
wire check_wk_2_clk = (~idle_flag | bDFTBYP) & ~SD_i & ~DSLP_i & ~SLP_i & ~invalid_sd_dslp;
wire check_wk_2_clk_invalid = (~idle_flag | bDFTBYP) & ~SD_i & ~DSLP_i & ~SLP_i;
wire check_idle = idle_flag & ~SD_i & ~DSLP_i & ~SLP_i & ~bDFTBYP & ~bSE;
wire check_ceb = ~CEB_i & ~SD_i & ~DSLP_i & ~SLP_i & ~bDFTBYP & ~bSE;

`endif    //end `ifdef TSMC_CM_UNIT_DELAY


assign Q_i= Q_d;


`ifdef TSMC_CM_UNIT_DELAY
`else

`ifdef TSMC_CM_ACCESS
`else
`define TSMC_CM_ACCESS 0.02
`endif
`ifdef TSMC_CM_RETAIN
`else
`define TSMC_CM_RETAIN 0.015
`endif
`ifdef TSMC_CM_SETUP
`else
`define TSMC_CM_SETUP 0.001
`endif
`ifdef TSMC_CM_HOLD
`else
`define TSMC_CM_HOLD 0.001
`endif
`ifdef TSMC_CM_PERIOD
`else
`define TSMC_CM_PERIOD 1
`endif
`ifdef TSMC_CM_WIDTH
`else
`define TSMC_CM_WIDTH 0.5
`endif
`ifdef TSMC_CM_CONTENTION
`else
`define TSMC_CM_CONTENTION 0.001
`endif

specify
    specparam PATHPULSE$ = ( 0, 0.001 );

    specparam tCYC = (`TSMC_CM_PERIOD);
    specparam tCKH = (`TSMC_CM_WIDTH);
    specparam tCKL = (`TSMC_CM_WIDTH);
    specparam tCS = (`TSMC_CM_SETUP);
    specparam tCH = (`TSMC_CM_HOLD);
    specparam tWS = (`TSMC_CM_SETUP);
    specparam tWH = (`TSMC_CM_HOLD);
    specparam tAS = (`TSMC_CM_SETUP);
    specparam tAH = (`TSMC_CM_HOLD);
    specparam tDS = (`TSMC_CM_SETUP);
    specparam tDH = (`TSMC_CM_HOLD);
    specparam tCD = (`TSMC_CM_ACCESS);
`ifdef TSMC_CM_READ_X_SQUASHING
    specparam tHOLD = (`TSMC_CM_ACCESS);
`else    
    specparam tHOLD = (`TSMC_CM_RETAIN);
`endif    


    specparam tBWS = (`TSMC_CM_SETUP);
    specparam tBWH = (`TSMC_CM_HOLD);
    specparam ttests = (`TSMC_CM_SETUP);
    specparam ttesth = (`TSMC_CM_HOLD);





    if(!CEB & WEB) (posedge CLK => (Q[0] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[1] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[2] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[3] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[4] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[5] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[6] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[7] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[8] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[9] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[10] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[11] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[12] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[13] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[14] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[15] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[16] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[17] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[18] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[19] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[20] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[21] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[22] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[23] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[24] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[25] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[26] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[27] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[28] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[29] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[30] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[31] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[32] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[33] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[34] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[35] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[36] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[37] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[38] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[39] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[40] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[41] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[42] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[43] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[44] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[45] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[46] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[47] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[48] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[49] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[50] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[51] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[52] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[53] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[54] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[55] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[56] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[57] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[58] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[59] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[60] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[61] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[62] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[63] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[64] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[65] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[66] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[67] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[68] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[69] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[70] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[71] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[72] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[73] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[74] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[75] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[76] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[77] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[78] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[79] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[80] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[81] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[82] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[83] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[84] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[85] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[86] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[87] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[88] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[89] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[90] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[91] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[92] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[93] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[94] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[95] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[96] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[97] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[98] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[99] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[100] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[101] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[102] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[103] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[104] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[105] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[106] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[107] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[108] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[109] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[110] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[111] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[112] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[113] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[114] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[115] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[116] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[117] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[118] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[119] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[120] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[121] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[122] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[123] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[124] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[125] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[126] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[127] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[128] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[129] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[130] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[131] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[132] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[133] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[134] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[135] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[136] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[137] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[138] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[139] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[140] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[141] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[142] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);
    if(!CEB & WEB) (posedge CLK => (Q[143] : 1'bx)) = (tCD, tCD, tHOLD, tCD, tHOLD, tCD);









    $period(posedge CLK &&& check_ceb, tCYC, notify_clk);
    $period(negedge CLK &&& check_ceb, tCYC, notify_clk);
    $width(posedge CLK &&& check_ceb, tCKH, 0, notify_clk);
    $width(negedge CLK &&& check_ceb, tCKL, 0, notify_clk);


    $setuphold(posedge CLK &&& mem_nopd, negedge CEB, tCS, tCH, notify_ceb);
    $setuphold(posedge CLK &&& mem_nopd, posedge CEB, tCS, tCH, notify_ceb);

    $setuphold(posedge CLK &&& check_noidle, negedge WEB, tWS, tWH, notify_web);
    $setuphold(posedge CLK &&& check_noidle, posedge WEB, tWS, tWH, notify_web);

    $setuphold(posedge CLK &&& check_noidle, negedge A[0], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, negedge A[1], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, negedge A[2], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, negedge A[3], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, negedge A[4], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, negedge A[5], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, negedge A[6], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, negedge A[7], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, negedge A[8], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, negedge A[9], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, posedge A[0], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, posedge A[1], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, posedge A[2], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, posedge A[3], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, posedge A[4], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, posedge A[5], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, posedge A[6], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, posedge A[7], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, posedge A[8], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_noidle, posedge A[9], tAS, tAH, notify_addr);
    $setuphold(posedge CLK &&& check_write, negedge D[0], tDS, tDH, notify_d0);
    $setuphold(posedge CLK &&& check_write, negedge D[1], tDS, tDH, notify_d1);
    $setuphold(posedge CLK &&& check_write, negedge D[2], tDS, tDH, notify_d2);
    $setuphold(posedge CLK &&& check_write, negedge D[3], tDS, tDH, notify_d3);
    $setuphold(posedge CLK &&& check_write, negedge D[4], tDS, tDH, notify_d4);
    $setuphold(posedge CLK &&& check_write, negedge D[5], tDS, tDH, notify_d5);
    $setuphold(posedge CLK &&& check_write, negedge D[6], tDS, tDH, notify_d6);
    $setuphold(posedge CLK &&& check_write, negedge D[7], tDS, tDH, notify_d7);
    $setuphold(posedge CLK &&& check_write, negedge D[8], tDS, tDH, notify_d8);
    $setuphold(posedge CLK &&& check_write, negedge D[9], tDS, tDH, notify_d9);
    $setuphold(posedge CLK &&& check_write, negedge D[10], tDS, tDH, notify_d10);
    $setuphold(posedge CLK &&& check_write, negedge D[11], tDS, tDH, notify_d11);
    $setuphold(posedge CLK &&& check_write, negedge D[12], tDS, tDH, notify_d12);
    $setuphold(posedge CLK &&& check_write, negedge D[13], tDS, tDH, notify_d13);
    $setuphold(posedge CLK &&& check_write, negedge D[14], tDS, tDH, notify_d14);
    $setuphold(posedge CLK &&& check_write, negedge D[15], tDS, tDH, notify_d15);
    $setuphold(posedge CLK &&& check_write, negedge D[16], tDS, tDH, notify_d16);
    $setuphold(posedge CLK &&& check_write, negedge D[17], tDS, tDH, notify_d17);
    $setuphold(posedge CLK &&& check_write, negedge D[18], tDS, tDH, notify_d18);
    $setuphold(posedge CLK &&& check_write, negedge D[19], tDS, tDH, notify_d19);
    $setuphold(posedge CLK &&& check_write, negedge D[20], tDS, tDH, notify_d20);
    $setuphold(posedge CLK &&& check_write, negedge D[21], tDS, tDH, notify_d21);
    $setuphold(posedge CLK &&& check_write, negedge D[22], tDS, tDH, notify_d22);
    $setuphold(posedge CLK &&& check_write, negedge D[23], tDS, tDH, notify_d23);
    $setuphold(posedge CLK &&& check_write, negedge D[24], tDS, tDH, notify_d24);
    $setuphold(posedge CLK &&& check_write, negedge D[25], tDS, tDH, notify_d25);
    $setuphold(posedge CLK &&& check_write, negedge D[26], tDS, tDH, notify_d26);
    $setuphold(posedge CLK &&& check_write, negedge D[27], tDS, tDH, notify_d27);
    $setuphold(posedge CLK &&& check_write, negedge D[28], tDS, tDH, notify_d28);
    $setuphold(posedge CLK &&& check_write, negedge D[29], tDS, tDH, notify_d29);
    $setuphold(posedge CLK &&& check_write, negedge D[30], tDS, tDH, notify_d30);
    $setuphold(posedge CLK &&& check_write, negedge D[31], tDS, tDH, notify_d31);
    $setuphold(posedge CLK &&& check_write, negedge D[32], tDS, tDH, notify_d32);
    $setuphold(posedge CLK &&& check_write, negedge D[33], tDS, tDH, notify_d33);
    $setuphold(posedge CLK &&& check_write, negedge D[34], tDS, tDH, notify_d34);
    $setuphold(posedge CLK &&& check_write, negedge D[35], tDS, tDH, notify_d35);
    $setuphold(posedge CLK &&& check_write, negedge D[36], tDS, tDH, notify_d36);
    $setuphold(posedge CLK &&& check_write, negedge D[37], tDS, tDH, notify_d37);
    $setuphold(posedge CLK &&& check_write, negedge D[38], tDS, tDH, notify_d38);
    $setuphold(posedge CLK &&& check_write, negedge D[39], tDS, tDH, notify_d39);
    $setuphold(posedge CLK &&& check_write, negedge D[40], tDS, tDH, notify_d40);
    $setuphold(posedge CLK &&& check_write, negedge D[41], tDS, tDH, notify_d41);
    $setuphold(posedge CLK &&& check_write, negedge D[42], tDS, tDH, notify_d42);
    $setuphold(posedge CLK &&& check_write, negedge D[43], tDS, tDH, notify_d43);
    $setuphold(posedge CLK &&& check_write, negedge D[44], tDS, tDH, notify_d44);
    $setuphold(posedge CLK &&& check_write, negedge D[45], tDS, tDH, notify_d45);
    $setuphold(posedge CLK &&& check_write, negedge D[46], tDS, tDH, notify_d46);
    $setuphold(posedge CLK &&& check_write, negedge D[47], tDS, tDH, notify_d47);
    $setuphold(posedge CLK &&& check_write, negedge D[48], tDS, tDH, notify_d48);
    $setuphold(posedge CLK &&& check_write, negedge D[49], tDS, tDH, notify_d49);
    $setuphold(posedge CLK &&& check_write, negedge D[50], tDS, tDH, notify_d50);
    $setuphold(posedge CLK &&& check_write, negedge D[51], tDS, tDH, notify_d51);
    $setuphold(posedge CLK &&& check_write, negedge D[52], tDS, tDH, notify_d52);
    $setuphold(posedge CLK &&& check_write, negedge D[53], tDS, tDH, notify_d53);
    $setuphold(posedge CLK &&& check_write, negedge D[54], tDS, tDH, notify_d54);
    $setuphold(posedge CLK &&& check_write, negedge D[55], tDS, tDH, notify_d55);
    $setuphold(posedge CLK &&& check_write, negedge D[56], tDS, tDH, notify_d56);
    $setuphold(posedge CLK &&& check_write, negedge D[57], tDS, tDH, notify_d57);
    $setuphold(posedge CLK &&& check_write, negedge D[58], tDS, tDH, notify_d58);
    $setuphold(posedge CLK &&& check_write, negedge D[59], tDS, tDH, notify_d59);
    $setuphold(posedge CLK &&& check_write, negedge D[60], tDS, tDH, notify_d60);
    $setuphold(posedge CLK &&& check_write, negedge D[61], tDS, tDH, notify_d61);
    $setuphold(posedge CLK &&& check_write, negedge D[62], tDS, tDH, notify_d62);
    $setuphold(posedge CLK &&& check_write, negedge D[63], tDS, tDH, notify_d63);
    $setuphold(posedge CLK &&& check_write, negedge D[64], tDS, tDH, notify_d64);
    $setuphold(posedge CLK &&& check_write, negedge D[65], tDS, tDH, notify_d65);
    $setuphold(posedge CLK &&& check_write, negedge D[66], tDS, tDH, notify_d66);
    $setuphold(posedge CLK &&& check_write, negedge D[67], tDS, tDH, notify_d67);
    $setuphold(posedge CLK &&& check_write, negedge D[68], tDS, tDH, notify_d68);
    $setuphold(posedge CLK &&& check_write, negedge D[69], tDS, tDH, notify_d69);
    $setuphold(posedge CLK &&& check_write, negedge D[70], tDS, tDH, notify_d70);
    $setuphold(posedge CLK &&& check_write, negedge D[71], tDS, tDH, notify_d71);
    $setuphold(posedge CLK &&& check_write, negedge D[72], tDS, tDH, notify_d72);
    $setuphold(posedge CLK &&& check_write, negedge D[73], tDS, tDH, notify_d73);
    $setuphold(posedge CLK &&& check_write, negedge D[74], tDS, tDH, notify_d74);
    $setuphold(posedge CLK &&& check_write, negedge D[75], tDS, tDH, notify_d75);
    $setuphold(posedge CLK &&& check_write, negedge D[76], tDS, tDH, notify_d76);
    $setuphold(posedge CLK &&& check_write, negedge D[77], tDS, tDH, notify_d77);
    $setuphold(posedge CLK &&& check_write, negedge D[78], tDS, tDH, notify_d78);
    $setuphold(posedge CLK &&& check_write, negedge D[79], tDS, tDH, notify_d79);
    $setuphold(posedge CLK &&& check_write, negedge D[80], tDS, tDH, notify_d80);
    $setuphold(posedge CLK &&& check_write, negedge D[81], tDS, tDH, notify_d81);
    $setuphold(posedge CLK &&& check_write, negedge D[82], tDS, tDH, notify_d82);
    $setuphold(posedge CLK &&& check_write, negedge D[83], tDS, tDH, notify_d83);
    $setuphold(posedge CLK &&& check_write, negedge D[84], tDS, tDH, notify_d84);
    $setuphold(posedge CLK &&& check_write, negedge D[85], tDS, tDH, notify_d85);
    $setuphold(posedge CLK &&& check_write, negedge D[86], tDS, tDH, notify_d86);
    $setuphold(posedge CLK &&& check_write, negedge D[87], tDS, tDH, notify_d87);
    $setuphold(posedge CLK &&& check_write, negedge D[88], tDS, tDH, notify_d88);
    $setuphold(posedge CLK &&& check_write, negedge D[89], tDS, tDH, notify_d89);
    $setuphold(posedge CLK &&& check_write, negedge D[90], tDS, tDH, notify_d90);
    $setuphold(posedge CLK &&& check_write, negedge D[91], tDS, tDH, notify_d91);
    $setuphold(posedge CLK &&& check_write, negedge D[92], tDS, tDH, notify_d92);
    $setuphold(posedge CLK &&& check_write, negedge D[93], tDS, tDH, notify_d93);
    $setuphold(posedge CLK &&& check_write, negedge D[94], tDS, tDH, notify_d94);
    $setuphold(posedge CLK &&& check_write, negedge D[95], tDS, tDH, notify_d95);
    $setuphold(posedge CLK &&& check_write, negedge D[96], tDS, tDH, notify_d96);
    $setuphold(posedge CLK &&& check_write, negedge D[97], tDS, tDH, notify_d97);
    $setuphold(posedge CLK &&& check_write, negedge D[98], tDS, tDH, notify_d98);
    $setuphold(posedge CLK &&& check_write, negedge D[99], tDS, tDH, notify_d99);
    $setuphold(posedge CLK &&& check_write, negedge D[100], tDS, tDH, notify_d100);
    $setuphold(posedge CLK &&& check_write, negedge D[101], tDS, tDH, notify_d101);
    $setuphold(posedge CLK &&& check_write, negedge D[102], tDS, tDH, notify_d102);
    $setuphold(posedge CLK &&& check_write, negedge D[103], tDS, tDH, notify_d103);
    $setuphold(posedge CLK &&& check_write, negedge D[104], tDS, tDH, notify_d104);
    $setuphold(posedge CLK &&& check_write, negedge D[105], tDS, tDH, notify_d105);
    $setuphold(posedge CLK &&& check_write, negedge D[106], tDS, tDH, notify_d106);
    $setuphold(posedge CLK &&& check_write, negedge D[107], tDS, tDH, notify_d107);
    $setuphold(posedge CLK &&& check_write, negedge D[108], tDS, tDH, notify_d108);
    $setuphold(posedge CLK &&& check_write, negedge D[109], tDS, tDH, notify_d109);
    $setuphold(posedge CLK &&& check_write, negedge D[110], tDS, tDH, notify_d110);
    $setuphold(posedge CLK &&& check_write, negedge D[111], tDS, tDH, notify_d111);
    $setuphold(posedge CLK &&& check_write, negedge D[112], tDS, tDH, notify_d112);
    $setuphold(posedge CLK &&& check_write, negedge D[113], tDS, tDH, notify_d113);
    $setuphold(posedge CLK &&& check_write, negedge D[114], tDS, tDH, notify_d114);
    $setuphold(posedge CLK &&& check_write, negedge D[115], tDS, tDH, notify_d115);
    $setuphold(posedge CLK &&& check_write, negedge D[116], tDS, tDH, notify_d116);
    $setuphold(posedge CLK &&& check_write, negedge D[117], tDS, tDH, notify_d117);
    $setuphold(posedge CLK &&& check_write, negedge D[118], tDS, tDH, notify_d118);
    $setuphold(posedge CLK &&& check_write, negedge D[119], tDS, tDH, notify_d119);
    $setuphold(posedge CLK &&& check_write, negedge D[120], tDS, tDH, notify_d120);
    $setuphold(posedge CLK &&& check_write, negedge D[121], tDS, tDH, notify_d121);
    $setuphold(posedge CLK &&& check_write, negedge D[122], tDS, tDH, notify_d122);
    $setuphold(posedge CLK &&& check_write, negedge D[123], tDS, tDH, notify_d123);
    $setuphold(posedge CLK &&& check_write, negedge D[124], tDS, tDH, notify_d124);
    $setuphold(posedge CLK &&& check_write, negedge D[125], tDS, tDH, notify_d125);
    $setuphold(posedge CLK &&& check_write, negedge D[126], tDS, tDH, notify_d126);
    $setuphold(posedge CLK &&& check_write, negedge D[127], tDS, tDH, notify_d127);
    $setuphold(posedge CLK &&& check_write, negedge D[128], tDS, tDH, notify_d128);
    $setuphold(posedge CLK &&& check_write, negedge D[129], tDS, tDH, notify_d129);
    $setuphold(posedge CLK &&& check_write, negedge D[130], tDS, tDH, notify_d130);
    $setuphold(posedge CLK &&& check_write, negedge D[131], tDS, tDH, notify_d131);
    $setuphold(posedge CLK &&& check_write, negedge D[132], tDS, tDH, notify_d132);
    $setuphold(posedge CLK &&& check_write, negedge D[133], tDS, tDH, notify_d133);
    $setuphold(posedge CLK &&& check_write, negedge D[134], tDS, tDH, notify_d134);
    $setuphold(posedge CLK &&& check_write, negedge D[135], tDS, tDH, notify_d135);
    $setuphold(posedge CLK &&& check_write, negedge D[136], tDS, tDH, notify_d136);
    $setuphold(posedge CLK &&& check_write, negedge D[137], tDS, tDH, notify_d137);
    $setuphold(posedge CLK &&& check_write, negedge D[138], tDS, tDH, notify_d138);
    $setuphold(posedge CLK &&& check_write, negedge D[139], tDS, tDH, notify_d139);
    $setuphold(posedge CLK &&& check_write, negedge D[140], tDS, tDH, notify_d140);
    $setuphold(posedge CLK &&& check_write, negedge D[141], tDS, tDH, notify_d141);
    $setuphold(posedge CLK &&& check_write, negedge D[142], tDS, tDH, notify_d142);
    $setuphold(posedge CLK &&& check_write, negedge D[143], tDS, tDH, notify_d143);
    $setuphold(posedge CLK &&& check_write, posedge D[0], tDS, tDH, notify_d0);
    $setuphold(posedge CLK &&& check_write, posedge D[1], tDS, tDH, notify_d1);
    $setuphold(posedge CLK &&& check_write, posedge D[2], tDS, tDH, notify_d2);
    $setuphold(posedge CLK &&& check_write, posedge D[3], tDS, tDH, notify_d3);
    $setuphold(posedge CLK &&& check_write, posedge D[4], tDS, tDH, notify_d4);
    $setuphold(posedge CLK &&& check_write, posedge D[5], tDS, tDH, notify_d5);
    $setuphold(posedge CLK &&& check_write, posedge D[6], tDS, tDH, notify_d6);
    $setuphold(posedge CLK &&& check_write, posedge D[7], tDS, tDH, notify_d7);
    $setuphold(posedge CLK &&& check_write, posedge D[8], tDS, tDH, notify_d8);
    $setuphold(posedge CLK &&& check_write, posedge D[9], tDS, tDH, notify_d9);
    $setuphold(posedge CLK &&& check_write, posedge D[10], tDS, tDH, notify_d10);
    $setuphold(posedge CLK &&& check_write, posedge D[11], tDS, tDH, notify_d11);
    $setuphold(posedge CLK &&& check_write, posedge D[12], tDS, tDH, notify_d12);
    $setuphold(posedge CLK &&& check_write, posedge D[13], tDS, tDH, notify_d13);
    $setuphold(posedge CLK &&& check_write, posedge D[14], tDS, tDH, notify_d14);
    $setuphold(posedge CLK &&& check_write, posedge D[15], tDS, tDH, notify_d15);
    $setuphold(posedge CLK &&& check_write, posedge D[16], tDS, tDH, notify_d16);
    $setuphold(posedge CLK &&& check_write, posedge D[17], tDS, tDH, notify_d17);
    $setuphold(posedge CLK &&& check_write, posedge D[18], tDS, tDH, notify_d18);
    $setuphold(posedge CLK &&& check_write, posedge D[19], tDS, tDH, notify_d19);
    $setuphold(posedge CLK &&& check_write, posedge D[20], tDS, tDH, notify_d20);
    $setuphold(posedge CLK &&& check_write, posedge D[21], tDS, tDH, notify_d21);
    $setuphold(posedge CLK &&& check_write, posedge D[22], tDS, tDH, notify_d22);
    $setuphold(posedge CLK &&& check_write, posedge D[23], tDS, tDH, notify_d23);
    $setuphold(posedge CLK &&& check_write, posedge D[24], tDS, tDH, notify_d24);
    $setuphold(posedge CLK &&& check_write, posedge D[25], tDS, tDH, notify_d25);
    $setuphold(posedge CLK &&& check_write, posedge D[26], tDS, tDH, notify_d26);
    $setuphold(posedge CLK &&& check_write, posedge D[27], tDS, tDH, notify_d27);
    $setuphold(posedge CLK &&& check_write, posedge D[28], tDS, tDH, notify_d28);
    $setuphold(posedge CLK &&& check_write, posedge D[29], tDS, tDH, notify_d29);
    $setuphold(posedge CLK &&& check_write, posedge D[30], tDS, tDH, notify_d30);
    $setuphold(posedge CLK &&& check_write, posedge D[31], tDS, tDH, notify_d31);
    $setuphold(posedge CLK &&& check_write, posedge D[32], tDS, tDH, notify_d32);
    $setuphold(posedge CLK &&& check_write, posedge D[33], tDS, tDH, notify_d33);
    $setuphold(posedge CLK &&& check_write, posedge D[34], tDS, tDH, notify_d34);
    $setuphold(posedge CLK &&& check_write, posedge D[35], tDS, tDH, notify_d35);
    $setuphold(posedge CLK &&& check_write, posedge D[36], tDS, tDH, notify_d36);
    $setuphold(posedge CLK &&& check_write, posedge D[37], tDS, tDH, notify_d37);
    $setuphold(posedge CLK &&& check_write, posedge D[38], tDS, tDH, notify_d38);
    $setuphold(posedge CLK &&& check_write, posedge D[39], tDS, tDH, notify_d39);
    $setuphold(posedge CLK &&& check_write, posedge D[40], tDS, tDH, notify_d40);
    $setuphold(posedge CLK &&& check_write, posedge D[41], tDS, tDH, notify_d41);
    $setuphold(posedge CLK &&& check_write, posedge D[42], tDS, tDH, notify_d42);
    $setuphold(posedge CLK &&& check_write, posedge D[43], tDS, tDH, notify_d43);
    $setuphold(posedge CLK &&& check_write, posedge D[44], tDS, tDH, notify_d44);
    $setuphold(posedge CLK &&& check_write, posedge D[45], tDS, tDH, notify_d45);
    $setuphold(posedge CLK &&& check_write, posedge D[46], tDS, tDH, notify_d46);
    $setuphold(posedge CLK &&& check_write, posedge D[47], tDS, tDH, notify_d47);
    $setuphold(posedge CLK &&& check_write, posedge D[48], tDS, tDH, notify_d48);
    $setuphold(posedge CLK &&& check_write, posedge D[49], tDS, tDH, notify_d49);
    $setuphold(posedge CLK &&& check_write, posedge D[50], tDS, tDH, notify_d50);
    $setuphold(posedge CLK &&& check_write, posedge D[51], tDS, tDH, notify_d51);
    $setuphold(posedge CLK &&& check_write, posedge D[52], tDS, tDH, notify_d52);
    $setuphold(posedge CLK &&& check_write, posedge D[53], tDS, tDH, notify_d53);
    $setuphold(posedge CLK &&& check_write, posedge D[54], tDS, tDH, notify_d54);
    $setuphold(posedge CLK &&& check_write, posedge D[55], tDS, tDH, notify_d55);
    $setuphold(posedge CLK &&& check_write, posedge D[56], tDS, tDH, notify_d56);
    $setuphold(posedge CLK &&& check_write, posedge D[57], tDS, tDH, notify_d57);
    $setuphold(posedge CLK &&& check_write, posedge D[58], tDS, tDH, notify_d58);
    $setuphold(posedge CLK &&& check_write, posedge D[59], tDS, tDH, notify_d59);
    $setuphold(posedge CLK &&& check_write, posedge D[60], tDS, tDH, notify_d60);
    $setuphold(posedge CLK &&& check_write, posedge D[61], tDS, tDH, notify_d61);
    $setuphold(posedge CLK &&& check_write, posedge D[62], tDS, tDH, notify_d62);
    $setuphold(posedge CLK &&& check_write, posedge D[63], tDS, tDH, notify_d63);
    $setuphold(posedge CLK &&& check_write, posedge D[64], tDS, tDH, notify_d64);
    $setuphold(posedge CLK &&& check_write, posedge D[65], tDS, tDH, notify_d65);
    $setuphold(posedge CLK &&& check_write, posedge D[66], tDS, tDH, notify_d66);
    $setuphold(posedge CLK &&& check_write, posedge D[67], tDS, tDH, notify_d67);
    $setuphold(posedge CLK &&& check_write, posedge D[68], tDS, tDH, notify_d68);
    $setuphold(posedge CLK &&& check_write, posedge D[69], tDS, tDH, notify_d69);
    $setuphold(posedge CLK &&& check_write, posedge D[70], tDS, tDH, notify_d70);
    $setuphold(posedge CLK &&& check_write, posedge D[71], tDS, tDH, notify_d71);
    $setuphold(posedge CLK &&& check_write, posedge D[72], tDS, tDH, notify_d72);
    $setuphold(posedge CLK &&& check_write, posedge D[73], tDS, tDH, notify_d73);
    $setuphold(posedge CLK &&& check_write, posedge D[74], tDS, tDH, notify_d74);
    $setuphold(posedge CLK &&& check_write, posedge D[75], tDS, tDH, notify_d75);
    $setuphold(posedge CLK &&& check_write, posedge D[76], tDS, tDH, notify_d76);
    $setuphold(posedge CLK &&& check_write, posedge D[77], tDS, tDH, notify_d77);
    $setuphold(posedge CLK &&& check_write, posedge D[78], tDS, tDH, notify_d78);
    $setuphold(posedge CLK &&& check_write, posedge D[79], tDS, tDH, notify_d79);
    $setuphold(posedge CLK &&& check_write, posedge D[80], tDS, tDH, notify_d80);
    $setuphold(posedge CLK &&& check_write, posedge D[81], tDS, tDH, notify_d81);
    $setuphold(posedge CLK &&& check_write, posedge D[82], tDS, tDH, notify_d82);
    $setuphold(posedge CLK &&& check_write, posedge D[83], tDS, tDH, notify_d83);
    $setuphold(posedge CLK &&& check_write, posedge D[84], tDS, tDH, notify_d84);
    $setuphold(posedge CLK &&& check_write, posedge D[85], tDS, tDH, notify_d85);
    $setuphold(posedge CLK &&& check_write, posedge D[86], tDS, tDH, notify_d86);
    $setuphold(posedge CLK &&& check_write, posedge D[87], tDS, tDH, notify_d87);
    $setuphold(posedge CLK &&& check_write, posedge D[88], tDS, tDH, notify_d88);
    $setuphold(posedge CLK &&& check_write, posedge D[89], tDS, tDH, notify_d89);
    $setuphold(posedge CLK &&& check_write, posedge D[90], tDS, tDH, notify_d90);
    $setuphold(posedge CLK &&& check_write, posedge D[91], tDS, tDH, notify_d91);
    $setuphold(posedge CLK &&& check_write, posedge D[92], tDS, tDH, notify_d92);
    $setuphold(posedge CLK &&& check_write, posedge D[93], tDS, tDH, notify_d93);
    $setuphold(posedge CLK &&& check_write, posedge D[94], tDS, tDH, notify_d94);
    $setuphold(posedge CLK &&& check_write, posedge D[95], tDS, tDH, notify_d95);
    $setuphold(posedge CLK &&& check_write, posedge D[96], tDS, tDH, notify_d96);
    $setuphold(posedge CLK &&& check_write, posedge D[97], tDS, tDH, notify_d97);
    $setuphold(posedge CLK &&& check_write, posedge D[98], tDS, tDH, notify_d98);
    $setuphold(posedge CLK &&& check_write, posedge D[99], tDS, tDH, notify_d99);
    $setuphold(posedge CLK &&& check_write, posedge D[100], tDS, tDH, notify_d100);
    $setuphold(posedge CLK &&& check_write, posedge D[101], tDS, tDH, notify_d101);
    $setuphold(posedge CLK &&& check_write, posedge D[102], tDS, tDH, notify_d102);
    $setuphold(posedge CLK &&& check_write, posedge D[103], tDS, tDH, notify_d103);
    $setuphold(posedge CLK &&& check_write, posedge D[104], tDS, tDH, notify_d104);
    $setuphold(posedge CLK &&& check_write, posedge D[105], tDS, tDH, notify_d105);
    $setuphold(posedge CLK &&& check_write, posedge D[106], tDS, tDH, notify_d106);
    $setuphold(posedge CLK &&& check_write, posedge D[107], tDS, tDH, notify_d107);
    $setuphold(posedge CLK &&& check_write, posedge D[108], tDS, tDH, notify_d108);
    $setuphold(posedge CLK &&& check_write, posedge D[109], tDS, tDH, notify_d109);
    $setuphold(posedge CLK &&& check_write, posedge D[110], tDS, tDH, notify_d110);
    $setuphold(posedge CLK &&& check_write, posedge D[111], tDS, tDH, notify_d111);
    $setuphold(posedge CLK &&& check_write, posedge D[112], tDS, tDH, notify_d112);
    $setuphold(posedge CLK &&& check_write, posedge D[113], tDS, tDH, notify_d113);
    $setuphold(posedge CLK &&& check_write, posedge D[114], tDS, tDH, notify_d114);
    $setuphold(posedge CLK &&& check_write, posedge D[115], tDS, tDH, notify_d115);
    $setuphold(posedge CLK &&& check_write, posedge D[116], tDS, tDH, notify_d116);
    $setuphold(posedge CLK &&& check_write, posedge D[117], tDS, tDH, notify_d117);
    $setuphold(posedge CLK &&& check_write, posedge D[118], tDS, tDH, notify_d118);
    $setuphold(posedge CLK &&& check_write, posedge D[119], tDS, tDH, notify_d119);
    $setuphold(posedge CLK &&& check_write, posedge D[120], tDS, tDH, notify_d120);
    $setuphold(posedge CLK &&& check_write, posedge D[121], tDS, tDH, notify_d121);
    $setuphold(posedge CLK &&& check_write, posedge D[122], tDS, tDH, notify_d122);
    $setuphold(posedge CLK &&& check_write, posedge D[123], tDS, tDH, notify_d123);
    $setuphold(posedge CLK &&& check_write, posedge D[124], tDS, tDH, notify_d124);
    $setuphold(posedge CLK &&& check_write, posedge D[125], tDS, tDH, notify_d125);
    $setuphold(posedge CLK &&& check_write, posedge D[126], tDS, tDH, notify_d126);
    $setuphold(posedge CLK &&& check_write, posedge D[127], tDS, tDH, notify_d127);
    $setuphold(posedge CLK &&& check_write, posedge D[128], tDS, tDH, notify_d128);
    $setuphold(posedge CLK &&& check_write, posedge D[129], tDS, tDH, notify_d129);
    $setuphold(posedge CLK &&& check_write, posedge D[130], tDS, tDH, notify_d130);
    $setuphold(posedge CLK &&& check_write, posedge D[131], tDS, tDH, notify_d131);
    $setuphold(posedge CLK &&& check_write, posedge D[132], tDS, tDH, notify_d132);
    $setuphold(posedge CLK &&& check_write, posedge D[133], tDS, tDH, notify_d133);
    $setuphold(posedge CLK &&& check_write, posedge D[134], tDS, tDH, notify_d134);
    $setuphold(posedge CLK &&& check_write, posedge D[135], tDS, tDH, notify_d135);
    $setuphold(posedge CLK &&& check_write, posedge D[136], tDS, tDH, notify_d136);
    $setuphold(posedge CLK &&& check_write, posedge D[137], tDS, tDH, notify_d137);
    $setuphold(posedge CLK &&& check_write, posedge D[138], tDS, tDH, notify_d138);
    $setuphold(posedge CLK &&& check_write, posedge D[139], tDS, tDH, notify_d139);
    $setuphold(posedge CLK &&& check_write, posedge D[140], tDS, tDH, notify_d140);
    $setuphold(posedge CLK &&& check_write, posedge D[141], tDS, tDH, notify_d141);
    $setuphold(posedge CLK &&& check_write, posedge D[142], tDS, tDH, notify_d142);
    $setuphold(posedge CLK &&& check_write, posedge D[143], tDS, tDH, notify_d143);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[0], tBWS, tBWH, notify_bweb0);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[1], tBWS, tBWH, notify_bweb1);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[2], tBWS, tBWH, notify_bweb2);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[3], tBWS, tBWH, notify_bweb3);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[4], tBWS, tBWH, notify_bweb4);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[5], tBWS, tBWH, notify_bweb5);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[6], tBWS, tBWH, notify_bweb6);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[7], tBWS, tBWH, notify_bweb7);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[8], tBWS, tBWH, notify_bweb8);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[9], tBWS, tBWH, notify_bweb9);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[10], tBWS, tBWH, notify_bweb10);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[11], tBWS, tBWH, notify_bweb11);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[12], tBWS, tBWH, notify_bweb12);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[13], tBWS, tBWH, notify_bweb13);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[14], tBWS, tBWH, notify_bweb14);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[15], tBWS, tBWH, notify_bweb15);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[16], tBWS, tBWH, notify_bweb16);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[17], tBWS, tBWH, notify_bweb17);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[18], tBWS, tBWH, notify_bweb18);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[19], tBWS, tBWH, notify_bweb19);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[20], tBWS, tBWH, notify_bweb20);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[21], tBWS, tBWH, notify_bweb21);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[22], tBWS, tBWH, notify_bweb22);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[23], tBWS, tBWH, notify_bweb23);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[24], tBWS, tBWH, notify_bweb24);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[25], tBWS, tBWH, notify_bweb25);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[26], tBWS, tBWH, notify_bweb26);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[27], tBWS, tBWH, notify_bweb27);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[28], tBWS, tBWH, notify_bweb28);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[29], tBWS, tBWH, notify_bweb29);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[30], tBWS, tBWH, notify_bweb30);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[31], tBWS, tBWH, notify_bweb31);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[32], tBWS, tBWH, notify_bweb32);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[33], tBWS, tBWH, notify_bweb33);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[34], tBWS, tBWH, notify_bweb34);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[35], tBWS, tBWH, notify_bweb35);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[36], tBWS, tBWH, notify_bweb36);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[37], tBWS, tBWH, notify_bweb37);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[38], tBWS, tBWH, notify_bweb38);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[39], tBWS, tBWH, notify_bweb39);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[40], tBWS, tBWH, notify_bweb40);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[41], tBWS, tBWH, notify_bweb41);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[42], tBWS, tBWH, notify_bweb42);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[43], tBWS, tBWH, notify_bweb43);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[44], tBWS, tBWH, notify_bweb44);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[45], tBWS, tBWH, notify_bweb45);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[46], tBWS, tBWH, notify_bweb46);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[47], tBWS, tBWH, notify_bweb47);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[48], tBWS, tBWH, notify_bweb48);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[49], tBWS, tBWH, notify_bweb49);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[50], tBWS, tBWH, notify_bweb50);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[51], tBWS, tBWH, notify_bweb51);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[52], tBWS, tBWH, notify_bweb52);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[53], tBWS, tBWH, notify_bweb53);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[54], tBWS, tBWH, notify_bweb54);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[55], tBWS, tBWH, notify_bweb55);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[56], tBWS, tBWH, notify_bweb56);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[57], tBWS, tBWH, notify_bweb57);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[58], tBWS, tBWH, notify_bweb58);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[59], tBWS, tBWH, notify_bweb59);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[60], tBWS, tBWH, notify_bweb60);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[61], tBWS, tBWH, notify_bweb61);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[62], tBWS, tBWH, notify_bweb62);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[63], tBWS, tBWH, notify_bweb63);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[64], tBWS, tBWH, notify_bweb64);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[65], tBWS, tBWH, notify_bweb65);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[66], tBWS, tBWH, notify_bweb66);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[67], tBWS, tBWH, notify_bweb67);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[68], tBWS, tBWH, notify_bweb68);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[69], tBWS, tBWH, notify_bweb69);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[70], tBWS, tBWH, notify_bweb70);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[71], tBWS, tBWH, notify_bweb71);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[72], tBWS, tBWH, notify_bweb72);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[73], tBWS, tBWH, notify_bweb73);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[74], tBWS, tBWH, notify_bweb74);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[75], tBWS, tBWH, notify_bweb75);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[76], tBWS, tBWH, notify_bweb76);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[77], tBWS, tBWH, notify_bweb77);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[78], tBWS, tBWH, notify_bweb78);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[79], tBWS, tBWH, notify_bweb79);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[80], tBWS, tBWH, notify_bweb80);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[81], tBWS, tBWH, notify_bweb81);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[82], tBWS, tBWH, notify_bweb82);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[83], tBWS, tBWH, notify_bweb83);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[84], tBWS, tBWH, notify_bweb84);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[85], tBWS, tBWH, notify_bweb85);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[86], tBWS, tBWH, notify_bweb86);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[87], tBWS, tBWH, notify_bweb87);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[88], tBWS, tBWH, notify_bweb88);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[89], tBWS, tBWH, notify_bweb89);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[90], tBWS, tBWH, notify_bweb90);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[91], tBWS, tBWH, notify_bweb91);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[92], tBWS, tBWH, notify_bweb92);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[93], tBWS, tBWH, notify_bweb93);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[94], tBWS, tBWH, notify_bweb94);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[95], tBWS, tBWH, notify_bweb95);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[96], tBWS, tBWH, notify_bweb96);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[97], tBWS, tBWH, notify_bweb97);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[98], tBWS, tBWH, notify_bweb98);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[99], tBWS, tBWH, notify_bweb99);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[100], tBWS, tBWH, notify_bweb100);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[101], tBWS, tBWH, notify_bweb101);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[102], tBWS, tBWH, notify_bweb102);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[103], tBWS, tBWH, notify_bweb103);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[104], tBWS, tBWH, notify_bweb104);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[105], tBWS, tBWH, notify_bweb105);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[106], tBWS, tBWH, notify_bweb106);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[107], tBWS, tBWH, notify_bweb107);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[108], tBWS, tBWH, notify_bweb108);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[109], tBWS, tBWH, notify_bweb109);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[110], tBWS, tBWH, notify_bweb110);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[111], tBWS, tBWH, notify_bweb111);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[112], tBWS, tBWH, notify_bweb112);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[113], tBWS, tBWH, notify_bweb113);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[114], tBWS, tBWH, notify_bweb114);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[115], tBWS, tBWH, notify_bweb115);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[116], tBWS, tBWH, notify_bweb116);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[117], tBWS, tBWH, notify_bweb117);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[118], tBWS, tBWH, notify_bweb118);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[119], tBWS, tBWH, notify_bweb119);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[120], tBWS, tBWH, notify_bweb120);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[121], tBWS, tBWH, notify_bweb121);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[122], tBWS, tBWH, notify_bweb122);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[123], tBWS, tBWH, notify_bweb123);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[124], tBWS, tBWH, notify_bweb124);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[125], tBWS, tBWH, notify_bweb125);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[126], tBWS, tBWH, notify_bweb126);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[127], tBWS, tBWH, notify_bweb127);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[128], tBWS, tBWH, notify_bweb128);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[129], tBWS, tBWH, notify_bweb129);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[130], tBWS, tBWH, notify_bweb130);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[131], tBWS, tBWH, notify_bweb131);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[132], tBWS, tBWH, notify_bweb132);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[133], tBWS, tBWH, notify_bweb133);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[134], tBWS, tBWH, notify_bweb134);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[135], tBWS, tBWH, notify_bweb135);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[136], tBWS, tBWH, notify_bweb136);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[137], tBWS, tBWH, notify_bweb137);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[138], tBWS, tBWH, notify_bweb138);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[139], tBWS, tBWH, notify_bweb139);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[140], tBWS, tBWH, notify_bweb140);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[141], tBWS, tBWH, notify_bweb141);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[142], tBWS, tBWH, notify_bweb142);
    $setuphold(posedge CLK &&& check_write, negedge BWEB[143], tBWS, tBWH, notify_bweb143);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[0], tBWS, tBWH, notify_bweb0);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[1], tBWS, tBWH, notify_bweb1);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[2], tBWS, tBWH, notify_bweb2);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[3], tBWS, tBWH, notify_bweb3);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[4], tBWS, tBWH, notify_bweb4);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[5], tBWS, tBWH, notify_bweb5);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[6], tBWS, tBWH, notify_bweb6);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[7], tBWS, tBWH, notify_bweb7);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[8], tBWS, tBWH, notify_bweb8);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[9], tBWS, tBWH, notify_bweb9);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[10], tBWS, tBWH, notify_bweb10);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[11], tBWS, tBWH, notify_bweb11);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[12], tBWS, tBWH, notify_bweb12);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[13], tBWS, tBWH, notify_bweb13);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[14], tBWS, tBWH, notify_bweb14);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[15], tBWS, tBWH, notify_bweb15);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[16], tBWS, tBWH, notify_bweb16);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[17], tBWS, tBWH, notify_bweb17);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[18], tBWS, tBWH, notify_bweb18);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[19], tBWS, tBWH, notify_bweb19);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[20], tBWS, tBWH, notify_bweb20);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[21], tBWS, tBWH, notify_bweb21);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[22], tBWS, tBWH, notify_bweb22);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[23], tBWS, tBWH, notify_bweb23);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[24], tBWS, tBWH, notify_bweb24);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[25], tBWS, tBWH, notify_bweb25);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[26], tBWS, tBWH, notify_bweb26);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[27], tBWS, tBWH, notify_bweb27);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[28], tBWS, tBWH, notify_bweb28);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[29], tBWS, tBWH, notify_bweb29);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[30], tBWS, tBWH, notify_bweb30);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[31], tBWS, tBWH, notify_bweb31);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[32], tBWS, tBWH, notify_bweb32);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[33], tBWS, tBWH, notify_bweb33);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[34], tBWS, tBWH, notify_bweb34);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[35], tBWS, tBWH, notify_bweb35);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[36], tBWS, tBWH, notify_bweb36);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[37], tBWS, tBWH, notify_bweb37);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[38], tBWS, tBWH, notify_bweb38);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[39], tBWS, tBWH, notify_bweb39);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[40], tBWS, tBWH, notify_bweb40);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[41], tBWS, tBWH, notify_bweb41);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[42], tBWS, tBWH, notify_bweb42);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[43], tBWS, tBWH, notify_bweb43);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[44], tBWS, tBWH, notify_bweb44);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[45], tBWS, tBWH, notify_bweb45);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[46], tBWS, tBWH, notify_bweb46);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[47], tBWS, tBWH, notify_bweb47);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[48], tBWS, tBWH, notify_bweb48);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[49], tBWS, tBWH, notify_bweb49);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[50], tBWS, tBWH, notify_bweb50);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[51], tBWS, tBWH, notify_bweb51);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[52], tBWS, tBWH, notify_bweb52);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[53], tBWS, tBWH, notify_bweb53);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[54], tBWS, tBWH, notify_bweb54);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[55], tBWS, tBWH, notify_bweb55);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[56], tBWS, tBWH, notify_bweb56);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[57], tBWS, tBWH, notify_bweb57);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[58], tBWS, tBWH, notify_bweb58);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[59], tBWS, tBWH, notify_bweb59);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[60], tBWS, tBWH, notify_bweb60);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[61], tBWS, tBWH, notify_bweb61);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[62], tBWS, tBWH, notify_bweb62);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[63], tBWS, tBWH, notify_bweb63);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[64], tBWS, tBWH, notify_bweb64);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[65], tBWS, tBWH, notify_bweb65);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[66], tBWS, tBWH, notify_bweb66);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[67], tBWS, tBWH, notify_bweb67);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[68], tBWS, tBWH, notify_bweb68);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[69], tBWS, tBWH, notify_bweb69);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[70], tBWS, tBWH, notify_bweb70);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[71], tBWS, tBWH, notify_bweb71);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[72], tBWS, tBWH, notify_bweb72);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[73], tBWS, tBWH, notify_bweb73);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[74], tBWS, tBWH, notify_bweb74);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[75], tBWS, tBWH, notify_bweb75);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[76], tBWS, tBWH, notify_bweb76);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[77], tBWS, tBWH, notify_bweb77);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[78], tBWS, tBWH, notify_bweb78);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[79], tBWS, tBWH, notify_bweb79);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[80], tBWS, tBWH, notify_bweb80);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[81], tBWS, tBWH, notify_bweb81);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[82], tBWS, tBWH, notify_bweb82);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[83], tBWS, tBWH, notify_bweb83);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[84], tBWS, tBWH, notify_bweb84);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[85], tBWS, tBWH, notify_bweb85);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[86], tBWS, tBWH, notify_bweb86);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[87], tBWS, tBWH, notify_bweb87);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[88], tBWS, tBWH, notify_bweb88);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[89], tBWS, tBWH, notify_bweb89);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[90], tBWS, tBWH, notify_bweb90);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[91], tBWS, tBWH, notify_bweb91);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[92], tBWS, tBWH, notify_bweb92);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[93], tBWS, tBWH, notify_bweb93);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[94], tBWS, tBWH, notify_bweb94);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[95], tBWS, tBWH, notify_bweb95);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[96], tBWS, tBWH, notify_bweb96);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[97], tBWS, tBWH, notify_bweb97);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[98], tBWS, tBWH, notify_bweb98);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[99], tBWS, tBWH, notify_bweb99);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[100], tBWS, tBWH, notify_bweb100);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[101], tBWS, tBWH, notify_bweb101);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[102], tBWS, tBWH, notify_bweb102);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[103], tBWS, tBWH, notify_bweb103);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[104], tBWS, tBWH, notify_bweb104);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[105], tBWS, tBWH, notify_bweb105);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[106], tBWS, tBWH, notify_bweb106);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[107], tBWS, tBWH, notify_bweb107);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[108], tBWS, tBWH, notify_bweb108);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[109], tBWS, tBWH, notify_bweb109);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[110], tBWS, tBWH, notify_bweb110);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[111], tBWS, tBWH, notify_bweb111);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[112], tBWS, tBWH, notify_bweb112);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[113], tBWS, tBWH, notify_bweb113);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[114], tBWS, tBWH, notify_bweb114);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[115], tBWS, tBWH, notify_bweb115);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[116], tBWS, tBWH, notify_bweb116);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[117], tBWS, tBWH, notify_bweb117);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[118], tBWS, tBWH, notify_bweb118);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[119], tBWS, tBWH, notify_bweb119);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[120], tBWS, tBWH, notify_bweb120);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[121], tBWS, tBWH, notify_bweb121);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[122], tBWS, tBWH, notify_bweb122);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[123], tBWS, tBWH, notify_bweb123);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[124], tBWS, tBWH, notify_bweb124);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[125], tBWS, tBWH, notify_bweb125);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[126], tBWS, tBWH, notify_bweb126);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[127], tBWS, tBWH, notify_bweb127);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[128], tBWS, tBWH, notify_bweb128);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[129], tBWS, tBWH, notify_bweb129);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[130], tBWS, tBWH, notify_bweb130);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[131], tBWS, tBWH, notify_bweb131);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[132], tBWS, tBWH, notify_bweb132);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[133], tBWS, tBWH, notify_bweb133);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[134], tBWS, tBWH, notify_bweb134);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[135], tBWS, tBWH, notify_bweb135);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[136], tBWS, tBWH, notify_bweb136);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[137], tBWS, tBWH, notify_bweb137);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[138], tBWS, tBWH, notify_bweb138);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[139], tBWS, tBWH, notify_bweb139);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[140], tBWS, tBWH, notify_bweb140);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[141], tBWS, tBWH, notify_bweb141);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[142], tBWS, tBWH, notify_bweb142);
    $setuphold(posedge CLK &&& check_write, posedge BWEB[143], tBWS, tBWH, notify_bweb143);





    $setuphold (posedge CLK &&& check_noidle, posedge RTSEL[0], ttests, 0, notify_testpin); 
    $setuphold (posedge CLK &&& check_noidle, negedge RTSEL[0], ttests, 0, notify_testpin);
    $setuphold (posedge CLK &&& check_idle, posedge RTSEL[0], 0, ttesth, notify_testpin); 
    $setuphold (posedge CLK &&& check_idle, negedge RTSEL[0], 0, ttesth, notify_testpin);
    $setuphold (posedge CLK &&& check_noidle, posedge RTSEL[1], ttests, 0, notify_testpin); 
    $setuphold (posedge CLK &&& check_noidle, negedge RTSEL[1], ttests, 0, notify_testpin);
    $setuphold (posedge CLK &&& check_idle, posedge RTSEL[1], 0, ttesth, notify_testpin); 
    $setuphold (posedge CLK &&& check_idle, negedge RTSEL[1], 0, ttesth, notify_testpin);
    $setuphold (posedge CLK &&& check_noidle, posedge WTSEL[0], ttests, 0, notify_testpin); 
    $setuphold (posedge CLK &&& check_noidle, negedge WTSEL[0], ttests, 0, notify_testpin);
    $setuphold (posedge CLK &&& check_idle, posedge WTSEL[0], 0, ttesth, notify_testpin); 
    $setuphold (posedge CLK &&& check_idle, negedge WTSEL[0], 0, ttesth, notify_testpin);
    $setuphold (posedge CLK &&& check_noidle, posedge WTSEL[1], ttests, 0, notify_testpin); 
    $setuphold (posedge CLK &&& check_noidle, negedge WTSEL[1], ttests, 0, notify_testpin);
    $setuphold (posedge CLK &&& check_idle, posedge WTSEL[1], 0, ttesth, notify_testpin); 
    $setuphold (posedge CLK &&& check_idle, negedge WTSEL[1], 0, ttesth, notify_testpin);



endspecify
`endif    //end `ifdef TSMC_CM_UNIT_DELAY

initial begin
    read_flag = 0;
    write_flag = 0;
    idle_flag = 1;
    slp_mode = 0;
    dslp_mode = 0;
    sd_mode = 0;
    awt_mode = 0;
    awt_counter  = 0;
    wk_counter  = 0;
    invalid_slp = 1'b0;
    invalid_dslp = 1'b0;
    invalid_sd_dslp = 1'b0;
`ifdef TSMC_STUCKAT_FAULT
    #(0.001);
    for (i = 0; i < numStuckAt; i = i + 1) begin
        stuckAt0Addr[i] = {numWordAddr{1'bx}};
        stuckAt1Addr[i] = {numWordAddr{1'bx}};
        stuckAt0Bit[i] = {numBit{1'bx}};
        stuckAt1Bit[i] = {numBit{1'bx}};
    end
`endif
end

`ifdef TSMC_INITIALIZE_MEM_USING_DEFAULT_TASKS
initial begin
    #(INITIAL_MEM_DELAY) ;
`ifdef TSMC_MEM_LOAD_0
    zeroMemoryAll;
`else
 `ifdef TSMC_MEM_LOAD_1
    oneMemoryAll;
 `else
  `ifdef TSMC_MEM_LOAD_RANDOM
    randomMemoryAll;
  `else
    xMemoryAll;
  `endif
 `endif
`endif    
end
`endif //`ifdef TSMC_INITIALIZE_MEM_USING_DEFAULT_TASKS

 `ifdef TSMC_INITIALIZE_MEM
initial begin 
    #(INITIAL_MEM_DELAY) ;
    preloadData(cdeFileInit) ;
end
`endif //  `ifdef TSMC_INITIALIZE_MEM
   
`ifdef TSMC_INITIALIZE_FAULT
initial begin
`ifdef TSMC_INITIALIZE_FORMAT_BINARY
     #(INITIAL_FAULT_DELAY) $readmemb(cdeFileFault, PRELOAD2, 0, numWord-1);
`else
     #(INITIAL_FAULT_DELAY) $readmemh(cdeFileFault, PRELOAD2, 0, numWord-1);
`endif
    for (i = 0; i < numWord; i = i + 1) begin
        {row_tmp, col_tmp} = i;
        MEMORY_FAULT[row_tmp][col_tmp] = PRELOAD2[i];
    end
end
`endif //  `ifdef TSMC_INITIALIZE_FAULT


always @(RTSEL_i) begin
    if(SLP_i === 1'b0 && DSLP_i === 1'b0 && SD_i === 1'b0) begin
    if(($realtime > 0) && idle_flag === 1'b0) begin
`ifdef TSMC_CM_NO_WARNING
`else
        $display("\tWarning %m : input RTSEL should not be toggled when CEB is low at simulation time %t\n", $realtime);
`endif
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin    
`ifdef TSMC_CM_UNIT_DELAY
        #(SRAM_DELAY);
`endif
        Q_d = {numIOBit{1'bx}};        
        xMemoryAll;
    end
    end
    end
end
always @(WTSEL_i) begin
    if(SLP_i === 1'b0 && DSLP_i === 1'b0 && SD_i === 1'b0) begin
    if(($realtime > 0) && idle_flag === 1'b0) begin
`ifdef TSMC_CM_NO_WARNING
`else
        $display("\tWarning %m : input WTSEL should not be toggled when CEB is low at simulation time %t\n", $realtime);
`endif
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin    
`ifdef TSMC_CM_UNIT_DELAY
        #(SRAM_DELAY);
`endif
        Q_d = {numIOBit{1'bx}};        
        xMemoryAll;
    end
    end
    end
end

`ifdef TSMC_NO_TESTPINS_DEFAULT_VALUE_CHECK
`else
always @(CLK_i or RTSEL_i) begin
    if(SLP_i === 1'b0 && DSLP_i === 1'b0 && SD_i === 1'b0) begin
    if((RTSEL_i !== 2'b01) && ($realtime > 0)) begin
        $display("\tError %m : input RTSEL should be set to 2'b01 at simulation time %t\n", $realtime);
        $display("\tError %m : Please refer the datasheet for the RTSEL setting in the different segment and mux configuration\n");
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
`ifdef TSMC_CM_UNIT_DELAY
        #(SRAM_DELAY);
`endif
        Q_d = {numIOBit{1'bx}};
        xMemoryAll;
    end
    end
    end
end
always @(CLK_i or WTSEL_i) begin
    if(SLP_i === 1'b0 && DSLP_i === 1'b0 && SD_i === 1'b0) begin
    if((WTSEL_i !== 2'b00) && ($realtime > 0)) begin
        $display("\tError %m : input WTSEL should be set to 2'b00 at simulation time %t\n", $realtime);
        $display("\tError %m : Please refer the datasheet for the WTSEL setting in the different segment and mux configuration\n");
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
`ifdef TSMC_CM_UNIT_DELAY
        #(SRAM_DELAY);
`endif
        Q_d = {numIOBit{1'bx}};
        xMemoryAll;
    end
    end
    end
end
`endif




always @(CLK_i) begin : CLK_OPERATION
    if(SLP_i === 1'b0 && DSLP_i === 1'b0 && SD_i === 1'b0 && bDFTBYP === 1'b0 && bSE === 1'b0) begin
    if (CLK_i === 1'b1) begin
        read_flag=0;
        idle_flag=1;
        write_flag=0;
    end
    if (slp_mode === 1'b0 && dslp_mode === 1'b0 && sd_mode === 1'b0) begin
        if (CLK_i === 1'bx) begin
`ifdef TSMC_CM_NO_WARNING
`else
            $display("\tWarning %m : input CLK unknown/high-Z at simulation time %t\n", $realtime);
`endif
`ifdef TSMC_CM_UNIT_DELAY
            #(SRAM_DELAY);
`endif
            Q_d = {numIOBit{1'bx}};
            xMemoryAll;
        end
        else if ((CLK_i===1) && (clk_latch===0)) begin    //posedge
            iRowAddr = iA[numWordAddr-1:numCMAddr];
            iColAddr = iA[numCMAddr-1:0];
            if (iCEB === 1'b0) begin
                idle_flag = 0;
                if (iWEB === 1'b1) begin        // read
                        read_flag = 1;
                        if ( ^iA === 1'bx ) begin
`ifdef TSMC_CM_NO_WARNING
`else
  `ifndef TSMC_CM_NO_XADDR_WARNING
                            $display("\tWarning %m : input A unknown/high-Z in read cycle at simulation time %t\n", $realtime);
  `endif
`endif
`ifdef TSMC_CM_UNIT_DELAY
                            #(SRAM_DELAY);
`endif
                            Q_d = {numIOBit{1'bx}};
                            //xMemoryAll;
                        end 
                        else if (iA >= numWord) begin
`ifdef TSMC_CM_NO_WARNING
`else
                            $display("\tWarning %m : address exceed word depth in read cycle at simulation time %t\n", $realtime);
`endif
`ifdef TSMC_CM_UNIT_DELAY
                            #(SRAM_DELAY);
`endif
                            Q_d = {numIOBit{1'bx}};
                        end
                        else begin
`ifdef TSMC_CM_UNIT_DELAY
                            #(SRAM_DELAY);
    `ifdef TSMC_INITIALIZE_FAULT
                            Q_d = (MEMORY[iRowAddr][iColAddr] ^ MEMORY_FAULT[iRowAddr][iColAddr]);
    `else
                            Q_d =  MEMORY[iRowAddr][iColAddr];
    `endif
`else
                            Q_d = {numBit{1'bx}};    //transition to x first
  `ifdef TSMC_INITIALIZE_FAULT
                            #0.001 Q_d = (MEMORY[iRowAddr][iColAddr] ^ MEMORY_FAULT[iRowAddr][iColAddr]);
  `else
                            #0.001 Q_d =  MEMORY[iRowAddr][iColAddr];
  `endif
`endif
                        end // else: !if(iA >= numWord)
                end // if (iWEB === 1'b1)
                else if (iWEB === 1'b0) begin    // write
                    if ( ^iA === 1'bx ) begin
`ifdef TSMC_CM_NO_WARNING
`else
                        $display("\tWarning %m : input A unknown/high-Z in write cycle at simulation time %t\n", $realtime);
`endif
                        xMemoryAll;
                    end 
                    else if (iA >= numWord) begin
`ifdef TSMC_CM_NO_WARNING
`else
                        $display("\tWarning %m : address exceed word depth in write cycle at simulation time %t\n", $realtime);
`endif
                    end 
                    else begin
                        if ( ^iBWEB === 1'bx ) begin
`ifdef TSMC_CM_NO_WARNING
`else
                            $display("\tWarning %m : input BWEB unknown/high-Z in write cycle at simulation time %t\n", $realtime);
`endif
                        end
                        write_flag = 1;
                        begin
                            DIN_tmp = MEMORY[iRowAddr][iColAddr];
                            for (i = 0; i < numBit; i = i + 1) begin
                                DIN_tmp[i] = ((iBWEB[i] === 1'b0) ? iD[i] : ((iBWEB[i] === 1'bx) ? 1'bx : DIN_tmp[i])) ;
                            end
`ifdef TSMC_STUCKAT_FAULT
                            if ( isStuckAt0(iA) || isStuckAt1(iA) ) begin
                                combineErrors(iA, ERR_tmp);
                                for (j = 0; j < numBit; j = j + 1) begin
                                    DIN_tmp[j] = (ERR_tmp[j] !== 1'bx) ? ERR_tmp[j] : DIN_tmp[j] ;
                                end
                            end
`endif                            
                            MEMORY[iRowAddr][iColAddr] = DIN_tmp;
                        end
                    end //end of if ( ^iA === 1'bx ) begin
                end 
                else begin
`ifdef TSMC_CM_NO_WARNING
`else
                    $display("\tWarning %m : input WEB unknown/high-Z at simulation time %t\n", $realtime);
`endif
`ifdef TSMC_CM_UNIT_DELAY
                    #(SRAM_DELAY);
`endif
                    Q_d = {numIOBit{1'bx}};
                    xMemoryAll;
                end // else: !if(iWEB === 1'b0)
            end // if (iCEB === 1'b0)
            else if (iCEB === 1'b1) begin
                idle_flag = 1;
            end
            else begin    //CEB is 'x / 'Z
                idle_flag = 1'bx;                
`ifdef TSMC_CM_NO_WARNING
`else
                $display("\tWarning %m : input CEB unknown/high-Z at simulation time %t\n", $realtime);
`endif
`ifdef TSMC_CM_UNIT_DELAY
                #(SRAM_DELAY);
`endif
                Q_d = {numIOBit{1'bx}};
                xMemoryAll;
            end // else: !if(iCEB === 1'b1)
        end // if ((CLK_i===1) &&(clk_latch===0))
    end
    end
    clk_latch=CLK_i;    //latch CLK_i
end // always @(CLK_i)



always @(posedge CLK_i) begin
    if(SLP_i === 1'b0 && DSLP_i === 1'b0 && SD_i === 1'b0) begin
    if (CLK_i === 1'b1) begin
        CEBL = iCEB;
        WEBL = iWEB;
    end
    end
end



always @(SD_i or DSLP_i or SLP_i) begin
    idle_flag  = 1'b1;
    write_flag = 1'b0;
    read_flag  = 1'b0;
    if (SD_i === 1'bx && $realtime !=0) begin
`ifdef TSMC_CM_NO_WARNING
`else
        $display("\tWarning %m : input SD unknown/high-Z at simulation time %t\n", $realtime);
`endif
        slp_mode = 1'b0;
        dslp_mode = 1'b0;
        sd_mode = 1'b0;
`ifdef TSMC_CM_UNIT_DELAY
        #(SRAM_DELAY);
`endif
        Q_d={numIOBit{1'bx}};
        xMemoryAll;
    end
    else if (SD_i === 1'b0 && DSLP_i !== 1'b0 && sd_mode === 1'b1 && $realtime !=0) begin
`ifdef TSMC_CM_NO_WARNING
`else
        $display("\tWarning %m : Invalid Wake Up Sequence. DSLP must be low before wake up from shut down mode at simulation time %t", $realtime);
`endif
`ifdef TSMC_CM_UNIT_DELAY
        #(SRAM_DELAY);
`endif
        Q_d={numIOBit{1'bx}};
        xMemoryAll;
        invalid_sd_dslp = 1'b1;
    end        
    else if (SD_i === 1'b0 && sd_mode === 1'b1) begin
        sd_mode = 1'b0;
        slp_mode = SLP_i;
        dslp_mode = DSLP_i;
        if(slp_mode !== 1 && dslp_mode !== 1'b1) begin
`ifdef TSMC_MEM_LOAD_0
            Q_d={numIOBit{1'b0}};
`else
 `ifdef TSMC_MEM_LOAD_1
            Q_d={numIOBit{1'b1}};
 `else
  `ifdef TSMC_MEM_LOAD_RANDOM
            Q_d=$random;
  `else
            Q_d={numIOBit{1'bx}};
  `endif
 `endif
`endif

        end
    end
    else if (SD_i === 1'b1 && sd_mode === 1'b0) begin
`ifdef TSMC_MEM_LOAD_0
        zeroMemoryAll;
`else
 `ifdef TSMC_MEM_LOAD_1
        oneMemoryAll;
 `else
  `ifdef TSMC_MEM_LOAD_RANDOM
        randomMemoryAll;
  `else
        xMemoryAll;
  `endif
 `endif
`endif    
        sd_mode = 1'b1;
        dslp_mode = DSLP_i;
        slp_mode = SLP_i;
        if(|Q_d !== 1'b0 || dslp_mode !== 1'b1 || slp_mode !== 1'b1) begin
            Q_d={numIOBit{1'bx}};
`ifdef TSMC_CM_UNIT_DELAY
            #(SRAM_DELAY);
`else        
            #0.001;
`endif            
        end
        Q_d=0;
    end
    else if (SD_i === 1'b0 && sd_mode === 1'bx) begin
        sd_mode = 1'b0;
    end
    else if (SD_i === 1'b1 && sd_mode === 1'bx) begin
        sd_mode = 1'b1;
    end
    else if (DSLP_i === 1'bx && SLP_i === 1'b0 && SD_i === 1'b0 && $realtime !=0) begin
`ifdef TSMC_CM_NO_WARNING
`else
        $display("\tWarning %m : input DSLP unknown/high-Z at simulation time %t\n", $realtime);
`endif
        slp_mode = 1'b0;
        dslp_mode = 1'b0;
        sd_mode = 1'b0;
`ifdef TSMC_CM_UNIT_DELAY
        #(SRAM_DELAY);
`endif
        Q_d={numIOBit{1'bx}};
        xMemoryAll;
    end    
    else if (SD_i === 1'b0 && DSLP_i === 1'b1 && SLP_i === 1'b0 && iCEB !== 1'b1 && dslp_mode === 1'b0) begin
`ifdef TSMC_CM_NO_WARNING
`else
        $display("\tWarning %m : Invalid Deep Sleep Mode Sequence. Input CEB 0/unknown/high-Z while entering deep sleep mode at simulation time %t", $realtime);
`endif
        slp_mode = 1'b0;
        dslp_mode = 1'b0;
        sd_mode = 1'b0;
        Q_d={numIOBit{1'bx}};
        xMemoryAll;
    end
    else if (SD_i === 1'b0 && DSLP_i === 1'b0 && SLP_i === 1'b0 && iCEB !== 1'b1 && dslp_mode === 1'b1) begin
`ifdef TSMC_CM_NO_WARNING
`else
        $display("\tWarning %m : Invalid Wake Up Sequence. Input CEB is 0/unknown/high-Z while exiting sleep mode at simulation time %t", $realtime);
`endif
        slp_mode = 1'b0;
        dslp_mode = 1'b0;
        sd_mode = 1'b0;
`ifdef TSMC_CM_UNIT_DELAY
        #(SRAM_DELAY);
`endif
        Q_d={numIOBit{1'bx}};
        xMemoryAll;
    end
    else if (DSLP_i === 1'b1 && (iCEB === 1'b1 || $realtime == 0) && dslp_mode === 1'b0) begin
        dslp_mode = 1'b1;
        if(|Q_d !== 1'b0 || (sd_mode !== 1'b1 && slp_mode !== 1'b1) ) begin
            Q_d={numIOBit{1'bx}};
`ifdef TSMC_CM_UNIT_DELAY
            #(SRAM_DELAY);
`else        
            #0.001;
`endif            
        end
        Q_d=0;
    end
    else if (DSLP_i === 1'b0 && iCEB === 1'b1 && dslp_mode === 1'b1) begin
        dslp_mode = 1'b0;
        if(sd_mode !== 1'b1 && slp_mode !== 1'b1) begin
            Q_d={numIOBit{1'bx}};
        end
    end
    else if (DSLP_i === 1'b0 && dslp_mode === 1'bx) begin  //power on
        dslp_mode = 1'b0;
    end
    else if (DSLP_i===1'b1 && dslp_mode === 1'bx) begin //power on
        dslp_mode = 1'b1;
    end
    if (SD_i === 1) begin
`ifdef TSMC_MEM_LOAD_0
        zeroMemoryAll;
`else
 `ifdef TSMC_MEM_LOAD_1
        oneMemoryAll;
 `else
  `ifdef TSMC_MEM_LOAD_RANDOM
        randomMemoryAll;
  `else
        xMemoryAll;
  `endif
 `endif
`endif
    end
    else if (SLP_i === 1'bx && DSLP_i === 1'b0 && SD_i === 1'b0 && $realtime !=0) begin
`ifdef TSMC_CM_NO_WARNING
`else
        $display("\tWarning %m : input SLP unknown/high-Z at simulation time %t\n", $realtime);
`endif
        slp_mode = 1'b0;
        dslp_mode = 1'b0;
        sd_mode = 1'b0;
`ifdef TSMC_CM_UNIT_DELAY
        #(SRAM_DELAY);
`endif
        Q_d={numIOBit{1'bx}};
        xMemoryAll;
    end    
    else if (SD_i === 1'b0 && DSLP_i === 1'b0 && SLP_i === 1'b1 && iCEB !== 1'b1 && slp_mode === 1'b0) begin
`ifdef TSMC_CM_NO_WARNING
`else
        $display("\tWarning %m : Invalid Sleep Mode Sequence. Input CEB 0/unknown/high-Z while entering sleep mode at simulation time %t", $realtime);
`endif
        slp_mode = 1'b0;
        dslp_mode = 1'b0;
        sd_mode = 1'b0;
        Q_d={numIOBit{1'bx}};
        xMemoryAll;
    end
    else if (SD_i === 1'b0 && DSLP_i === 1'b0 && SLP_i === 1'b0 && iCEB !== 1'b1 && slp_mode === 1'b1) begin
`ifdef TSMC_CM_NO_WARNING
`else
        $display("\tWarning %m : Invalid Wake Up Sequence. Input CEB is 0/unknown/high-Z while exiting sleep mode at simulation time %t", $realtime);
`endif
        slp_mode = 1'b0;
        dslp_mode = 1'b0;
        sd_mode = 1'b0;
`ifdef TSMC_CM_UNIT_DELAY
        #(SRAM_DELAY);
`endif
        Q_d={numIOBit{1'bx}};
        xMemoryAll;
    end
    else if (SLP_i === 1'b1 && (iCEB === 1'b1 || $realtime == 0) && slp_mode === 1'b0) begin
        slp_mode = 1'b1;
        if(|Q_d !== 1'b0 || (sd_mode !== 1'b1 && dslp_mode !== 1'b1) ) begin
            Q_d={numIOBit{1'bx}};
`ifdef TSMC_CM_UNIT_DELAY
            #(SRAM_DELAY);
`else        
            #0.001;
`endif            
        end
        Q_d=0;
    end
    else if (SLP_i === 1'b0 && iCEB === 1'b1 && slp_mode === 1'b1) begin
        slp_mode = 1'b0;
        if(sd_mode !== 1'b1 && dslp_mode !== 1'b1) begin
            Q_d={numIOBit{1'bx}};
        end
    end
    else if (SLP_i === 1'b0 && slp_mode === 1'bx) begin  //power on
        slp_mode = 1'b0;
    end
    else if (SLP_i===1'b1 && slp_mode === 1'bx) begin //power on
        slp_mode = 1'b1;
    end
    if (SD_i === 1) begin
`ifdef TSMC_MEM_LOAD_0
        zeroMemoryAll;
`else
 `ifdef TSMC_MEM_LOAD_1
        oneMemoryAll;
 `else
  `ifdef TSMC_MEM_LOAD_RANDOM
        randomMemoryAll;
  `else
        xMemoryAll;
  `endif
 `endif
`endif
    end
end




`ifdef TSMC_CM_UNIT_DELAY
`else
always @(notify_testpin) begin
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
      Q_d = {numIOBit{1'bx}};
      xMemoryAll;
    end
    else if(bDFTBYP === 1'b0) begin
      Q_d = {numIOBit{1'bx}};
    end
end


always @(notify_clk) begin
    disable CLK_OPERATION;
    if (bDFTBYP === 1'b0 && bSE === 1'b0) begin
        Q_d = {numIOBit{1'bx}};
        xMemoryAll;
    end
    else if(bDFTBYP === 1'b0) begin 
        Q_d = {numIOBit{1'bx}};
    end
end
always @(notify_bist) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
      Q_d = {numIOBit{1'bx}};
      xMemoryAll;
    end
    else if(bDFTBYP === 1'b0) begin
      Q_d = {numIOBit{1'bx}};
    end
end
always @(notify_ceb) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        Q_d = {numIOBit{1'bx}};
        xMemoryAll;
        read_flag = 0;
        write_flag = 0;
    end
    else if(bDFTBYP === 1'b0) begin
      Q_d = {numIOBit{1'bx}};
    end
end
always @(notify_web) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        Q_d = {numIOBit{1'bx}};
        xMemoryAll;
        read_flag = 0;
        write_flag = 0;
    end
end
always @(notify_addr) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if (iWEB === 1'b1) begin
            Q_d = {numIOBit{1'bx}};           
        end
        else if (iWEB === 1'b0) begin
        end
        else begin
            Q_d = {numIOBit{1'bx}};
        end        
        xMemoryAll;
        read_flag = 0;
        write_flag = 0;
    end
    else if(bDFTBYP === 1'b0) begin
        Q_d = {numIOBit{1'bx}};        
    end
end
always @(notify_d0) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 0);
        end
        write_flag = 0;
    end
end

always @(notify_bweb0) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 0);
        end
        write_flag = 0;
    end
end
always @(notify_d1) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 1);
        end
        write_flag = 0;
    end
end

always @(notify_bweb1) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 1);
        end
        write_flag = 0;
    end
end
always @(notify_d2) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 2);
        end
        write_flag = 0;
    end
end

always @(notify_bweb2) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 2);
        end
        write_flag = 0;
    end
end
always @(notify_d3) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 3);
        end
        write_flag = 0;
    end
end

always @(notify_bweb3) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 3);
        end
        write_flag = 0;
    end
end
always @(notify_d4) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 4);
        end
        write_flag = 0;
    end
end

always @(notify_bweb4) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 4);
        end
        write_flag = 0;
    end
end
always @(notify_d5) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 5);
        end
        write_flag = 0;
    end
end

always @(notify_bweb5) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 5);
        end
        write_flag = 0;
    end
end
always @(notify_d6) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 6);
        end
        write_flag = 0;
    end
end

always @(notify_bweb6) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 6);
        end
        write_flag = 0;
    end
end
always @(notify_d7) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 7);
        end
        write_flag = 0;
    end
end

always @(notify_bweb7) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 7);
        end
        write_flag = 0;
    end
end
always @(notify_d8) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 8);
        end
        write_flag = 0;
    end
end

always @(notify_bweb8) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 8);
        end
        write_flag = 0;
    end
end
always @(notify_d9) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 9);
        end
        write_flag = 0;
    end
end

always @(notify_bweb9) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 9);
        end
        write_flag = 0;
    end
end
always @(notify_d10) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 10);
        end
        write_flag = 0;
    end
end

always @(notify_bweb10) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 10);
        end
        write_flag = 0;
    end
end
always @(notify_d11) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 11);
        end
        write_flag = 0;
    end
end

always @(notify_bweb11) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 11);
        end
        write_flag = 0;
    end
end
always @(notify_d12) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 12);
        end
        write_flag = 0;
    end
end

always @(notify_bweb12) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 12);
        end
        write_flag = 0;
    end
end
always @(notify_d13) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 13);
        end
        write_flag = 0;
    end
end

always @(notify_bweb13) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 13);
        end
        write_flag = 0;
    end
end
always @(notify_d14) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 14);
        end
        write_flag = 0;
    end
end

always @(notify_bweb14) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 14);
        end
        write_flag = 0;
    end
end
always @(notify_d15) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 15);
        end
        write_flag = 0;
    end
end

always @(notify_bweb15) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 15);
        end
        write_flag = 0;
    end
end
always @(notify_d16) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 16);
        end
        write_flag = 0;
    end
end

always @(notify_bweb16) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 16);
        end
        write_flag = 0;
    end
end
always @(notify_d17) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 17);
        end
        write_flag = 0;
    end
end

always @(notify_bweb17) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 17);
        end
        write_flag = 0;
    end
end
always @(notify_d18) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 18);
        end
        write_flag = 0;
    end
end

always @(notify_bweb18) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 18);
        end
        write_flag = 0;
    end
end
always @(notify_d19) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 19);
        end
        write_flag = 0;
    end
end

always @(notify_bweb19) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 19);
        end
        write_flag = 0;
    end
end
always @(notify_d20) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 20);
        end
        write_flag = 0;
    end
end

always @(notify_bweb20) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 20);
        end
        write_flag = 0;
    end
end
always @(notify_d21) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 21);
        end
        write_flag = 0;
    end
end

always @(notify_bweb21) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 21);
        end
        write_flag = 0;
    end
end
always @(notify_d22) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 22);
        end
        write_flag = 0;
    end
end

always @(notify_bweb22) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 22);
        end
        write_flag = 0;
    end
end
always @(notify_d23) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 23);
        end
        write_flag = 0;
    end
end

always @(notify_bweb23) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 23);
        end
        write_flag = 0;
    end
end
always @(notify_d24) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 24);
        end
        write_flag = 0;
    end
end

always @(notify_bweb24) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 24);
        end
        write_flag = 0;
    end
end
always @(notify_d25) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 25);
        end
        write_flag = 0;
    end
end

always @(notify_bweb25) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 25);
        end
        write_flag = 0;
    end
end
always @(notify_d26) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 26);
        end
        write_flag = 0;
    end
end

always @(notify_bweb26) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 26);
        end
        write_flag = 0;
    end
end
always @(notify_d27) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 27);
        end
        write_flag = 0;
    end
end

always @(notify_bweb27) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 27);
        end
        write_flag = 0;
    end
end
always @(notify_d28) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 28);
        end
        write_flag = 0;
    end
end

always @(notify_bweb28) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 28);
        end
        write_flag = 0;
    end
end
always @(notify_d29) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 29);
        end
        write_flag = 0;
    end
end

always @(notify_bweb29) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 29);
        end
        write_flag = 0;
    end
end
always @(notify_d30) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 30);
        end
        write_flag = 0;
    end
end

always @(notify_bweb30) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 30);
        end
        write_flag = 0;
    end
end
always @(notify_d31) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 31);
        end
        write_flag = 0;
    end
end

always @(notify_bweb31) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 31);
        end
        write_flag = 0;
    end
end
always @(notify_d32) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 32);
        end
        write_flag = 0;
    end
end

always @(notify_bweb32) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 32);
        end
        write_flag = 0;
    end
end
always @(notify_d33) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 33);
        end
        write_flag = 0;
    end
end

always @(notify_bweb33) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 33);
        end
        write_flag = 0;
    end
end
always @(notify_d34) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 34);
        end
        write_flag = 0;
    end
end

always @(notify_bweb34) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 34);
        end
        write_flag = 0;
    end
end
always @(notify_d35) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 35);
        end
        write_flag = 0;
    end
end

always @(notify_bweb35) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 35);
        end
        write_flag = 0;
    end
end
always @(notify_d36) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 36);
        end
        write_flag = 0;
    end
end

always @(notify_bweb36) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 36);
        end
        write_flag = 0;
    end
end
always @(notify_d37) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 37);
        end
        write_flag = 0;
    end
end

always @(notify_bweb37) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 37);
        end
        write_flag = 0;
    end
end
always @(notify_d38) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 38);
        end
        write_flag = 0;
    end
end

always @(notify_bweb38) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 38);
        end
        write_flag = 0;
    end
end
always @(notify_d39) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 39);
        end
        write_flag = 0;
    end
end

always @(notify_bweb39) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 39);
        end
        write_flag = 0;
    end
end
always @(notify_d40) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 40);
        end
        write_flag = 0;
    end
end

always @(notify_bweb40) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 40);
        end
        write_flag = 0;
    end
end
always @(notify_d41) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 41);
        end
        write_flag = 0;
    end
end

always @(notify_bweb41) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 41);
        end
        write_flag = 0;
    end
end
always @(notify_d42) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 42);
        end
        write_flag = 0;
    end
end

always @(notify_bweb42) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 42);
        end
        write_flag = 0;
    end
end
always @(notify_d43) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 43);
        end
        write_flag = 0;
    end
end

always @(notify_bweb43) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 43);
        end
        write_flag = 0;
    end
end
always @(notify_d44) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 44);
        end
        write_flag = 0;
    end
end

always @(notify_bweb44) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 44);
        end
        write_flag = 0;
    end
end
always @(notify_d45) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 45);
        end
        write_flag = 0;
    end
end

always @(notify_bweb45) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 45);
        end
        write_flag = 0;
    end
end
always @(notify_d46) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 46);
        end
        write_flag = 0;
    end
end

always @(notify_bweb46) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 46);
        end
        write_flag = 0;
    end
end
always @(notify_d47) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 47);
        end
        write_flag = 0;
    end
end

always @(notify_bweb47) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 47);
        end
        write_flag = 0;
    end
end
always @(notify_d48) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 48);
        end
        write_flag = 0;
    end
end

always @(notify_bweb48) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 48);
        end
        write_flag = 0;
    end
end
always @(notify_d49) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 49);
        end
        write_flag = 0;
    end
end

always @(notify_bweb49) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 49);
        end
        write_flag = 0;
    end
end
always @(notify_d50) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 50);
        end
        write_flag = 0;
    end
end

always @(notify_bweb50) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 50);
        end
        write_flag = 0;
    end
end
always @(notify_d51) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 51);
        end
        write_flag = 0;
    end
end

always @(notify_bweb51) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 51);
        end
        write_flag = 0;
    end
end
always @(notify_d52) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 52);
        end
        write_flag = 0;
    end
end

always @(notify_bweb52) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 52);
        end
        write_flag = 0;
    end
end
always @(notify_d53) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 53);
        end
        write_flag = 0;
    end
end

always @(notify_bweb53) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 53);
        end
        write_flag = 0;
    end
end
always @(notify_d54) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 54);
        end
        write_flag = 0;
    end
end

always @(notify_bweb54) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 54);
        end
        write_flag = 0;
    end
end
always @(notify_d55) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 55);
        end
        write_flag = 0;
    end
end

always @(notify_bweb55) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 55);
        end
        write_flag = 0;
    end
end
always @(notify_d56) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 56);
        end
        write_flag = 0;
    end
end

always @(notify_bweb56) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 56);
        end
        write_flag = 0;
    end
end
always @(notify_d57) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 57);
        end
        write_flag = 0;
    end
end

always @(notify_bweb57) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 57);
        end
        write_flag = 0;
    end
end
always @(notify_d58) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 58);
        end
        write_flag = 0;
    end
end

always @(notify_bweb58) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 58);
        end
        write_flag = 0;
    end
end
always @(notify_d59) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 59);
        end
        write_flag = 0;
    end
end

always @(notify_bweb59) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 59);
        end
        write_flag = 0;
    end
end
always @(notify_d60) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 60);
        end
        write_flag = 0;
    end
end

always @(notify_bweb60) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 60);
        end
        write_flag = 0;
    end
end
always @(notify_d61) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 61);
        end
        write_flag = 0;
    end
end

always @(notify_bweb61) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 61);
        end
        write_flag = 0;
    end
end
always @(notify_d62) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 62);
        end
        write_flag = 0;
    end
end

always @(notify_bweb62) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 62);
        end
        write_flag = 0;
    end
end
always @(notify_d63) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 63);
        end
        write_flag = 0;
    end
end

always @(notify_bweb63) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 63);
        end
        write_flag = 0;
    end
end
always @(notify_d64) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 64);
        end
        write_flag = 0;
    end
end

always @(notify_bweb64) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 64);
        end
        write_flag = 0;
    end
end
always @(notify_d65) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 65);
        end
        write_flag = 0;
    end
end

always @(notify_bweb65) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 65);
        end
        write_flag = 0;
    end
end
always @(notify_d66) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 66);
        end
        write_flag = 0;
    end
end

always @(notify_bweb66) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 66);
        end
        write_flag = 0;
    end
end
always @(notify_d67) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 67);
        end
        write_flag = 0;
    end
end

always @(notify_bweb67) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 67);
        end
        write_flag = 0;
    end
end
always @(notify_d68) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 68);
        end
        write_flag = 0;
    end
end

always @(notify_bweb68) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 68);
        end
        write_flag = 0;
    end
end
always @(notify_d69) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 69);
        end
        write_flag = 0;
    end
end

always @(notify_bweb69) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 69);
        end
        write_flag = 0;
    end
end
always @(notify_d70) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 70);
        end
        write_flag = 0;
    end
end

always @(notify_bweb70) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 70);
        end
        write_flag = 0;
    end
end
always @(notify_d71) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 71);
        end
        write_flag = 0;
    end
end

always @(notify_bweb71) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 71);
        end
        write_flag = 0;
    end
end
always @(notify_d72) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 72);
        end
        write_flag = 0;
    end
end

always @(notify_bweb72) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 72);
        end
        write_flag = 0;
    end
end
always @(notify_d73) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 73);
        end
        write_flag = 0;
    end
end

always @(notify_bweb73) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 73);
        end
        write_flag = 0;
    end
end
always @(notify_d74) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 74);
        end
        write_flag = 0;
    end
end

always @(notify_bweb74) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 74);
        end
        write_flag = 0;
    end
end
always @(notify_d75) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 75);
        end
        write_flag = 0;
    end
end

always @(notify_bweb75) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 75);
        end
        write_flag = 0;
    end
end
always @(notify_d76) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 76);
        end
        write_flag = 0;
    end
end

always @(notify_bweb76) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 76);
        end
        write_flag = 0;
    end
end
always @(notify_d77) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 77);
        end
        write_flag = 0;
    end
end

always @(notify_bweb77) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 77);
        end
        write_flag = 0;
    end
end
always @(notify_d78) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 78);
        end
        write_flag = 0;
    end
end

always @(notify_bweb78) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 78);
        end
        write_flag = 0;
    end
end
always @(notify_d79) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 79);
        end
        write_flag = 0;
    end
end

always @(notify_bweb79) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 79);
        end
        write_flag = 0;
    end
end
always @(notify_d80) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 80);
        end
        write_flag = 0;
    end
end

always @(notify_bweb80) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 80);
        end
        write_flag = 0;
    end
end
always @(notify_d81) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 81);
        end
        write_flag = 0;
    end
end

always @(notify_bweb81) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 81);
        end
        write_flag = 0;
    end
end
always @(notify_d82) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 82);
        end
        write_flag = 0;
    end
end

always @(notify_bweb82) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 82);
        end
        write_flag = 0;
    end
end
always @(notify_d83) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 83);
        end
        write_flag = 0;
    end
end

always @(notify_bweb83) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 83);
        end
        write_flag = 0;
    end
end
always @(notify_d84) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 84);
        end
        write_flag = 0;
    end
end

always @(notify_bweb84) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 84);
        end
        write_flag = 0;
    end
end
always @(notify_d85) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 85);
        end
        write_flag = 0;
    end
end

always @(notify_bweb85) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 85);
        end
        write_flag = 0;
    end
end
always @(notify_d86) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 86);
        end
        write_flag = 0;
    end
end

always @(notify_bweb86) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 86);
        end
        write_flag = 0;
    end
end
always @(notify_d87) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 87);
        end
        write_flag = 0;
    end
end

always @(notify_bweb87) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 87);
        end
        write_flag = 0;
    end
end
always @(notify_d88) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 88);
        end
        write_flag = 0;
    end
end

always @(notify_bweb88) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 88);
        end
        write_flag = 0;
    end
end
always @(notify_d89) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 89);
        end
        write_flag = 0;
    end
end

always @(notify_bweb89) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 89);
        end
        write_flag = 0;
    end
end
always @(notify_d90) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 90);
        end
        write_flag = 0;
    end
end

always @(notify_bweb90) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 90);
        end
        write_flag = 0;
    end
end
always @(notify_d91) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 91);
        end
        write_flag = 0;
    end
end

always @(notify_bweb91) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 91);
        end
        write_flag = 0;
    end
end
always @(notify_d92) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 92);
        end
        write_flag = 0;
    end
end

always @(notify_bweb92) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 92);
        end
        write_flag = 0;
    end
end
always @(notify_d93) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 93);
        end
        write_flag = 0;
    end
end

always @(notify_bweb93) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 93);
        end
        write_flag = 0;
    end
end
always @(notify_d94) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 94);
        end
        write_flag = 0;
    end
end

always @(notify_bweb94) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 94);
        end
        write_flag = 0;
    end
end
always @(notify_d95) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 95);
        end
        write_flag = 0;
    end
end

always @(notify_bweb95) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 95);
        end
        write_flag = 0;
    end
end
always @(notify_d96) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 96);
        end
        write_flag = 0;
    end
end

always @(notify_bweb96) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 96);
        end
        write_flag = 0;
    end
end
always @(notify_d97) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 97);
        end
        write_flag = 0;
    end
end

always @(notify_bweb97) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 97);
        end
        write_flag = 0;
    end
end
always @(notify_d98) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 98);
        end
        write_flag = 0;
    end
end

always @(notify_bweb98) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 98);
        end
        write_flag = 0;
    end
end
always @(notify_d99) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 99);
        end
        write_flag = 0;
    end
end

always @(notify_bweb99) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 99);
        end
        write_flag = 0;
    end
end
always @(notify_d100) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 100);
        end
        write_flag = 0;
    end
end

always @(notify_bweb100) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 100);
        end
        write_flag = 0;
    end
end
always @(notify_d101) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 101);
        end
        write_flag = 0;
    end
end

always @(notify_bweb101) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 101);
        end
        write_flag = 0;
    end
end
always @(notify_d102) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 102);
        end
        write_flag = 0;
    end
end

always @(notify_bweb102) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 102);
        end
        write_flag = 0;
    end
end
always @(notify_d103) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 103);
        end
        write_flag = 0;
    end
end

always @(notify_bweb103) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 103);
        end
        write_flag = 0;
    end
end
always @(notify_d104) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 104);
        end
        write_flag = 0;
    end
end

always @(notify_bweb104) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 104);
        end
        write_flag = 0;
    end
end
always @(notify_d105) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 105);
        end
        write_flag = 0;
    end
end

always @(notify_bweb105) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 105);
        end
        write_flag = 0;
    end
end
always @(notify_d106) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 106);
        end
        write_flag = 0;
    end
end

always @(notify_bweb106) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 106);
        end
        write_flag = 0;
    end
end
always @(notify_d107) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 107);
        end
        write_flag = 0;
    end
end

always @(notify_bweb107) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 107);
        end
        write_flag = 0;
    end
end
always @(notify_d108) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 108);
        end
        write_flag = 0;
    end
end

always @(notify_bweb108) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 108);
        end
        write_flag = 0;
    end
end
always @(notify_d109) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 109);
        end
        write_flag = 0;
    end
end

always @(notify_bweb109) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 109);
        end
        write_flag = 0;
    end
end
always @(notify_d110) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 110);
        end
        write_flag = 0;
    end
end

always @(notify_bweb110) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 110);
        end
        write_flag = 0;
    end
end
always @(notify_d111) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 111);
        end
        write_flag = 0;
    end
end

always @(notify_bweb111) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 111);
        end
        write_flag = 0;
    end
end
always @(notify_d112) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 112);
        end
        write_flag = 0;
    end
end

always @(notify_bweb112) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 112);
        end
        write_flag = 0;
    end
end
always @(notify_d113) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 113);
        end
        write_flag = 0;
    end
end

always @(notify_bweb113) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 113);
        end
        write_flag = 0;
    end
end
always @(notify_d114) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 114);
        end
        write_flag = 0;
    end
end

always @(notify_bweb114) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 114);
        end
        write_flag = 0;
    end
end
always @(notify_d115) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 115);
        end
        write_flag = 0;
    end
end

always @(notify_bweb115) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 115);
        end
        write_flag = 0;
    end
end
always @(notify_d116) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 116);
        end
        write_flag = 0;
    end
end

always @(notify_bweb116) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 116);
        end
        write_flag = 0;
    end
end
always @(notify_d117) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 117);
        end
        write_flag = 0;
    end
end

always @(notify_bweb117) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 117);
        end
        write_flag = 0;
    end
end
always @(notify_d118) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 118);
        end
        write_flag = 0;
    end
end

always @(notify_bweb118) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 118);
        end
        write_flag = 0;
    end
end
always @(notify_d119) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 119);
        end
        write_flag = 0;
    end
end

always @(notify_bweb119) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 119);
        end
        write_flag = 0;
    end
end
always @(notify_d120) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 120);
        end
        write_flag = 0;
    end
end

always @(notify_bweb120) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 120);
        end
        write_flag = 0;
    end
end
always @(notify_d121) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 121);
        end
        write_flag = 0;
    end
end

always @(notify_bweb121) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 121);
        end
        write_flag = 0;
    end
end
always @(notify_d122) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 122);
        end
        write_flag = 0;
    end
end

always @(notify_bweb122) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 122);
        end
        write_flag = 0;
    end
end
always @(notify_d123) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 123);
        end
        write_flag = 0;
    end
end

always @(notify_bweb123) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 123);
        end
        write_flag = 0;
    end
end
always @(notify_d124) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 124);
        end
        write_flag = 0;
    end
end

always @(notify_bweb124) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 124);
        end
        write_flag = 0;
    end
end
always @(notify_d125) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 125);
        end
        write_flag = 0;
    end
end

always @(notify_bweb125) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 125);
        end
        write_flag = 0;
    end
end
always @(notify_d126) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 126);
        end
        write_flag = 0;
    end
end

always @(notify_bweb126) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 126);
        end
        write_flag = 0;
    end
end
always @(notify_d127) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 127);
        end
        write_flag = 0;
    end
end

always @(notify_bweb127) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 127);
        end
        write_flag = 0;
    end
end
always @(notify_d128) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 128);
        end
        write_flag = 0;
    end
end

always @(notify_bweb128) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 128);
        end
        write_flag = 0;
    end
end
always @(notify_d129) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 129);
        end
        write_flag = 0;
    end
end

always @(notify_bweb129) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 129);
        end
        write_flag = 0;
    end
end
always @(notify_d130) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 130);
        end
        write_flag = 0;
    end
end

always @(notify_bweb130) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 130);
        end
        write_flag = 0;
    end
end
always @(notify_d131) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 131);
        end
        write_flag = 0;
    end
end

always @(notify_bweb131) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 131);
        end
        write_flag = 0;
    end
end
always @(notify_d132) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 132);
        end
        write_flag = 0;
    end
end

always @(notify_bweb132) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 132);
        end
        write_flag = 0;
    end
end
always @(notify_d133) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 133);
        end
        write_flag = 0;
    end
end

always @(notify_bweb133) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 133);
        end
        write_flag = 0;
    end
end
always @(notify_d134) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 134);
        end
        write_flag = 0;
    end
end

always @(notify_bweb134) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 134);
        end
        write_flag = 0;
    end
end
always @(notify_d135) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 135);
        end
        write_flag = 0;
    end
end

always @(notify_bweb135) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 135);
        end
        write_flag = 0;
    end
end
always @(notify_d136) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 136);
        end
        write_flag = 0;
    end
end

always @(notify_bweb136) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 136);
        end
        write_flag = 0;
    end
end
always @(notify_d137) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 137);
        end
        write_flag = 0;
    end
end

always @(notify_bweb137) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 137);
        end
        write_flag = 0;
    end
end
always @(notify_d138) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 138);
        end
        write_flag = 0;
    end
end

always @(notify_bweb138) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 138);
        end
        write_flag = 0;
    end
end
always @(notify_d139) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 139);
        end
        write_flag = 0;
    end
end

always @(notify_bweb139) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 139);
        end
        write_flag = 0;
    end
end
always @(notify_d140) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 140);
        end
        write_flag = 0;
    end
end

always @(notify_bweb140) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 140);
        end
        write_flag = 0;
    end
end
always @(notify_d141) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 141);
        end
        write_flag = 0;
    end
end

always @(notify_bweb141) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 141);
        end
        write_flag = 0;
    end
end
always @(notify_d142) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 142);
        end
        write_flag = 0;
    end
end

always @(notify_bweb142) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 142);
        end
        write_flag = 0;
    end
end
always @(notify_d143) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin 
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 143);
        end
        write_flag = 0;
    end
end

always @(notify_bweb143) begin
    disable CLK_OPERATION;
    if(bDFTBYP === 1'b0 && bSE === 1'b0) begin
        if ( ^iA === 1'bx ) begin
            xMemoryAll;
        end
        else begin
            xMemoryBit(iA, 143);
        end
        write_flag = 0;
    end
end

`endif    //end `ifdef TSMC_CM_UNIT_DELAY


task xMemoryAll;
integer row;
integer col;
integer row_index;
integer col_index;
begin
    for (row_index = 0; row_index <= numRow-1; row_index = row_index + 1) begin
        for (col_index = 0; col_index <= numCM-1; col_index = col_index + 1) begin
            row=row_index;
            col=col_index;
            MEMORY[row][col] = {numBit{1'bx}};
        end
    end
    if( MES_ALL=="ON" && $realtime != 0) $display("\nInfo : Set Memory Content to all x at %t.>>", $realtime);
end
endtask

task zeroMemoryAll;
integer row;
integer col;
integer row_index;
integer col_index;
begin
    for (row_index = 0; row_index <= numRow-1; row_index = row_index + 1) begin
        for (col_index = 0; col_index <= numCM-1; col_index = col_index + 1) begin
            row=row_index;
            col=col_index;
            MEMORY[row][col] = {numBit{1'b0}};
        end
    end
    if( MES_ALL=="ON" && $realtime != 0) $display("\nInfo : Set Memory Content to all 0 at %t.>>", $realtime);
end
endtask

task oneMemoryAll;
integer row;
integer col;
integer row_index;
integer col_index;
begin
    for (row_index = 0; row_index <= numRow-1; row_index = row_index + 1) begin
        for (col_index = 0; col_index <= numCM-1; col_index = col_index + 1) begin
            row=row_index;
            col=col_index;
            MEMORY[row][col] = {numBit{1'b1}};
        end
    end
    if( MES_ALL=="ON" && $realtime != 0) $display("\nInfo : Set Memory Content to all 1 at %t.>>", $realtime);
end
endtask

task randomMemoryAll;
integer row;
integer col;
integer row_index;
integer col_index;
begin
    for (row_index = 0; row_index <= numRow-1; row_index = row_index + 1) begin
        for (col_index = 0; col_index <= numCM-1; col_index = col_index + 1) begin
            row=row_index;
            col=col_index;
            MEMORY[row][col] = $random;
        end
    end
    if( MES_ALL=="ON" && $realtime != 0) $display("\nInfo : Set Memory Content to random patterns at %t.>>", $realtime);
end
endtask

task xMemoryWord;
input [numWordAddr-1:0] addr;
reg [numRowAddr-1:0] row;
reg [numCMAddr-1:0] col;
begin
    {row, col} = addr;
    MEMORY[row][col] = {numBit{1'bx}};
end
endtask

task xMemoryBit;
input [numWordAddr-1:0] addr;
input integer abit;
reg [numRowAddr-1:0] row;
reg [numCMAddr-1:0] col;
begin
    {row, col} = addr;
    MEMORY[row][col][abit] = 1'bx;
end
endtask

task preloadData;
input [256*8:1] infile;  // Max 256 character File Name
reg [numWordAddr:0] w;
reg [numWordAddr-numCMAddr-1:0] row;
reg [numCMAddr-1:0] col;
begin
`ifdef TSMC_CM_NO_WARNING
`else
    $display("Preloading data from file %s", infile);
`endif
`ifdef TSMC_INITIALIZE_FORMAT_BINARY
        $readmemb(infile, PRELOAD);
`else
        $readmemh(infile, PRELOAD);
`endif
    for (w = 0; w < numWord; w = w + 1) begin
        {row, col} = w;
        MEMORY[row][col] = PRELOAD[w];
    end
end
endtask

/*
 * task injectSA - to inject a stuck-at error, please use hierarchical reference to call the injectSA task from the wrapper module
 *      input addr - the address location where the defect is to be introduced
 *      input bit - the bit location of the specified address where the defect is to occur
 *      input type - specify whether it's a s-a-0 (type = 0) or a s-a-1 (type = 1) fault
 *
 *      Multiple faults can be injected at the same address, regardless of the type.  This means that an address location can have 
 *      certain bits having stuck-at-0 faults while other bits have the stuck-at-1 defect.
 *
 * Examples:
 *      injectSA(0, 0, 0);  - injects a s-a-0 fault at address 0, bit 0
 *      injectSA(1, 0, 1);  - injects a s-a-1 fault at address 1, bit 0
 *      injectSA(1, 1, 0);  - injects a s-a-0 fault at address 1, bit 1
 *      injectSA(1, 2, 1);  - injects a s-a-1 fault at address 1, bit 2
 *      injectSA(1, 3, 1);  - injects a s-a-1 fault at address 1, bit 3
 *      injectSA(2, 2, 1);  - injects a s-a-1 fault at address 2, bit 2
 *      injectSA(14, 2, 0); - injects a s-a-0 fault at address 14, bit 2
 *
 */
`ifdef TSMC_STUCKAT_FAULT
task injectSA;
input [numWordAddr-1:0] addr;
input integer bitn;
input typen;
reg [numStuckAt:0] i;
reg [numBit-1:0] btmp;
begin
    j=bitn;
    if ( typen === 0 ) begin
        for (i = 0; i < numStuckAt; i = i + 1) begin
            if ( ^stuckAt0Addr[i] === 1'bx ) begin
                stuckAt0Addr[i] = addr;
                btmp = {numBit{1'bx}};
                btmp[j] = 1'b0;
                stuckAt0Bit[i] = btmp;
                i = numStuckAt;
`ifdef TSMC_CM_NO_WARNING
`else
                $display("First s-a-0 error injected at address location %d = %b", addr, btmp);
`endif
                i = numStuckAt;
            end
            else if ( stuckAt0Addr[i] === addr ) begin
                btmp = stuckAt0Bit[i];
                btmp[j] = 1'b0;
                stuckAt0Bit[i] = btmp;
`ifdef TSMC_CM_NO_WARNING
`else
                $display("More s-a-0 Error injected at address location %d = %b", addr, btmp);
`endif
                i = numStuckAt;
            end        
        end
    end
    else if (typen === 1) begin
        for (i = 0; i < numStuckAt; i = i + 1) begin
            if ( ^stuckAt1Addr[i] === 1'bx ) begin
                stuckAt1Addr[i] = addr;
                btmp = {numBit{1'bx}};
                btmp[j] = 1'b1;
                stuckAt1Bit[i] = btmp;
                i = numStuckAt;
`ifdef TSMC_CM_NO_WARNING
`else
                $display("First s-a-1 error injected at address location %d = %b", addr, btmp);
`endif
                i = numStuckAt;
            end
            else if ( stuckAt1Addr[i] === addr ) begin
                btmp = stuckAt1Bit[i];
                btmp[j] = 1'b1;
                stuckAt1Bit[i] = btmp;
`ifdef TSMC_CM_NO_WARNING
`else
                $display("More s-a-1 Error injected at address location %d = %b", addr, btmp);
`endif
                i = numStuckAt;
            end        
        end
    end
end
endtask

task combineErrors;
input [numWordAddr-1:0] addr;
output [numBit-1:0] errors;
integer j;
reg [numBit-1:0] btmp;
begin
    errors = {numBit{1'bx}};
    if ( isStuckAt0(addr) ) begin
        btmp = stuckAt0Bit[getStuckAt0Index(addr)];
        for ( j = 0; j < numBit; j = j + 1 ) begin
            if ( btmp[j] === 1'b0 ) begin
                errors[j] = 1'b0;
            end
        end
    end
    if ( isStuckAt1(addr) ) begin
        btmp = stuckAt1Bit[getStuckAt1Index(addr)];
        for ( j = 0; j < numBit; j = j + 1 ) begin
            if ( btmp[j] === 1'b1 ) begin
                errors[j] = 1'b1;
            end
        end
    end
end
endtask

function [numStuckAt-1:0] getStuckAt0Index;
input [numWordAddr-1:0] addr;
reg [numStuckAt:0] i;
begin
    for (i = 0; i < numStuckAt; i = i + 1) begin
        if (stuckAt0Addr[i] === addr) begin
            getStuckAt0Index = i;
        end
    end
end
endfunction

function [numStuckAt-1:0] getStuckAt1Index;
input [numWordAddr-1:0] addr;
reg [numStuckAt:0] i;
begin
    for (i = 0; i < numStuckAt; i = i + 1) begin
        if (stuckAt1Addr[i] === addr) begin
            getStuckAt1Index = i;
        end
    end
end
endfunction

function isStuckAt0;
input [numWordAddr-1:0] addr;
reg [numStuckAt:0] i;
reg flag;
begin
    flag = 0;
    for (i = 0; i < numStuckAt; i = i + 1) begin
        if (stuckAt0Addr[i] === addr) begin
            flag = 1;
            i = numStuckAt;
        end
    end
    isStuckAt0 = flag;
end
endfunction

function isStuckAt1;
input [numWordAddr-1:0] addr;
reg [numStuckAt:0] i;
reg flag;
begin
    flag = 0;
    for (i = 0; i < numStuckAt; i = i + 1) begin
        if (stuckAt1Addr[i] === addr) begin
            flag = 1;
            i = numStuckAt;
        end
    end
    isStuckAt1 = flag;
end
endfunction
`endif

task printMemory;
reg [numRowAddr-1:0] row;
reg [numCMAddr-1:0] col;
reg [numRowAddr:0] row_index;
reg [numCMAddr:0] col_index;
begin
    $display("\n\nDumping memory content at %t...\n", $realtime);
    for (row_index = 0; row_index <= numRow-1; row_index = row_index + 1) begin
        for (col_index = 0; col_index <= numCM-1; col_index = col_index + 1) begin
            row=row_index;
            col=col_index;
            $display("[%d] = %b", {row, col}, MEMORY[row][col]);
        end
    end    
    $display("\n\n");
end
endtask

task printMemoryFromTo;
input [numWordAddr-1:0] addr1;
input [numWordAddr-1:0] addr2;
reg [numWordAddr:0] addr;
reg [numRowAddr-1:0] row;
reg [numCMAddr-1:0] col;
begin
    $display("\n\nDumping memory content at %t...\n", $realtime);
    for (addr = addr1; addr < addr2; addr = addr + 1) begin
        {row, col} = addr;
        $display("[%d] = %b", addr, MEMORY[row][col]);
    end    
    $display("\n\n");
end
endtask




endmodule
`endcelldefine

