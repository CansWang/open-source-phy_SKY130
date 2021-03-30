//#*********************************************************************************************************************/
//
//# Technology     : TSMC 16nm CMOS Logic FinFet Compact (FFC) Low Leakage HKMG  						*/
//# Memory Type    : TSMC 16nm FFC High Density Single Port Single-Bank SRAM Compiler with d0734 bit cell	 				*/
//# Library Name   : ts1n16ffcllsblvtc1024x144m4sw (user specify : ts1n16ffcllsblvtc1024x144m4sw)			*/
//# Library Version: 130a												*/
//# Generated Time : 2020/05/11, 12:57:39										*/
//#*********************************************************************************************************************/
//#															*/
//# STATEMENT OF USE													*/
//#															*/
//# This information contains confidential and proprietary information of TSMC.					*/
//# No part of this information may be reproduced, transmitted, transcribed,						*/
//# stored in a retrieval system, or translated into any human or computer						*/
//# language, in any form or by any means, electronic, mechanical, magnetic,						*/
//# optical, chemical, manual, or otherwise, without the prior written permission					*/
//# of TSMC. This information was prepared for informational purpose and is for					*/
//# use by TSMC's customers only. TSMC reserves the right to make changes in the					*/
//# information at any time and without notice.									*/
//#															*/
//#*********************************************************************************************************************/
//* Template Version : S_05_52401                                               */
//****************************************************************************** */

`resetall

`timescale 1ns/1ps

//-------- Top module --------//

`enable_portfaults
`suppress_faults

module TS1N16FFCLLSBLVTC1024X144M4SW (
  CLK,
  CEB,
  WEB,
  A,
  D,
  Q,
  BWEB,
  RTSEL,
  WTSEL
);

//-------- IO Ports --------//
input CLK;
input CEB;
input WEB;
input [9:0] A;
input [143:0] D;
output [143:0] Q;
input [143:0] BWEB;
input [1:0] RTSEL;
input [1:0] WTSEL;

//-------- Declare reg & wire --------//
wire b_CLK;
wire b_CEB;
wire b_WEB;
wire [9:0] b_A;
wire [143:0] b_D;
wire [143:0] b_Q;
wire [143:0] b_BWEB;

//-------- input buffering --------//
buf ub_CLK (b_CLK, CLK);
buf ub_CEB (b_CEB, CEB);
buf ub_WEB (b_WEB, WEB);
buf ub_A0 (b_A[0], A[0]);
buf ub_A1 (b_A[1], A[1]);
buf ub_A2 (b_A[2], A[2]);
buf ub_A3 (b_A[3], A[3]);
buf ub_A4 (b_A[4], A[4]);
buf ub_A5 (b_A[5], A[5]);
buf ub_A6 (b_A[6], A[6]);
buf ub_A7 (b_A[7], A[7]);
buf ub_A8 (b_A[8], A[8]);
buf ub_A9 (b_A[9], A[9]);
buf ub_D0 (b_D[0], D[0]);
buf ub_D1 (b_D[1], D[1]);
buf ub_D2 (b_D[2], D[2]);
buf ub_D3 (b_D[3], D[3]);
buf ub_D4 (b_D[4], D[4]);
buf ub_D5 (b_D[5], D[5]);
buf ub_D6 (b_D[6], D[6]);
buf ub_D7 (b_D[7], D[7]);
buf ub_D8 (b_D[8], D[8]);
buf ub_D9 (b_D[9], D[9]);
buf ub_D10 (b_D[10], D[10]);
buf ub_D11 (b_D[11], D[11]);
buf ub_D12 (b_D[12], D[12]);
buf ub_D13 (b_D[13], D[13]);
buf ub_D14 (b_D[14], D[14]);
buf ub_D15 (b_D[15], D[15]);
buf ub_D16 (b_D[16], D[16]);
buf ub_D17 (b_D[17], D[17]);
buf ub_D18 (b_D[18], D[18]);
buf ub_D19 (b_D[19], D[19]);
buf ub_D20 (b_D[20], D[20]);
buf ub_D21 (b_D[21], D[21]);
buf ub_D22 (b_D[22], D[22]);
buf ub_D23 (b_D[23], D[23]);
buf ub_D24 (b_D[24], D[24]);
buf ub_D25 (b_D[25], D[25]);
buf ub_D26 (b_D[26], D[26]);
buf ub_D27 (b_D[27], D[27]);
buf ub_D28 (b_D[28], D[28]);
buf ub_D29 (b_D[29], D[29]);
buf ub_D30 (b_D[30], D[30]);
buf ub_D31 (b_D[31], D[31]);
buf ub_D32 (b_D[32], D[32]);
buf ub_D33 (b_D[33], D[33]);
buf ub_D34 (b_D[34], D[34]);
buf ub_D35 (b_D[35], D[35]);
buf ub_D36 (b_D[36], D[36]);
buf ub_D37 (b_D[37], D[37]);
buf ub_D38 (b_D[38], D[38]);
buf ub_D39 (b_D[39], D[39]);
buf ub_D40 (b_D[40], D[40]);
buf ub_D41 (b_D[41], D[41]);
buf ub_D42 (b_D[42], D[42]);
buf ub_D43 (b_D[43], D[43]);
buf ub_D44 (b_D[44], D[44]);
buf ub_D45 (b_D[45], D[45]);
buf ub_D46 (b_D[46], D[46]);
buf ub_D47 (b_D[47], D[47]);
buf ub_D48 (b_D[48], D[48]);
buf ub_D49 (b_D[49], D[49]);
buf ub_D50 (b_D[50], D[50]);
buf ub_D51 (b_D[51], D[51]);
buf ub_D52 (b_D[52], D[52]);
buf ub_D53 (b_D[53], D[53]);
buf ub_D54 (b_D[54], D[54]);
buf ub_D55 (b_D[55], D[55]);
buf ub_D56 (b_D[56], D[56]);
buf ub_D57 (b_D[57], D[57]);
buf ub_D58 (b_D[58], D[58]);
buf ub_D59 (b_D[59], D[59]);
buf ub_D60 (b_D[60], D[60]);
buf ub_D61 (b_D[61], D[61]);
buf ub_D62 (b_D[62], D[62]);
buf ub_D63 (b_D[63], D[63]);
buf ub_D64 (b_D[64], D[64]);
buf ub_D65 (b_D[65], D[65]);
buf ub_D66 (b_D[66], D[66]);
buf ub_D67 (b_D[67], D[67]);
buf ub_D68 (b_D[68], D[68]);
buf ub_D69 (b_D[69], D[69]);
buf ub_D70 (b_D[70], D[70]);
buf ub_D71 (b_D[71], D[71]);
buf ub_D72 (b_D[72], D[72]);
buf ub_D73 (b_D[73], D[73]);
buf ub_D74 (b_D[74], D[74]);
buf ub_D75 (b_D[75], D[75]);
buf ub_D76 (b_D[76], D[76]);
buf ub_D77 (b_D[77], D[77]);
buf ub_D78 (b_D[78], D[78]);
buf ub_D79 (b_D[79], D[79]);
buf ub_D80 (b_D[80], D[80]);
buf ub_D81 (b_D[81], D[81]);
buf ub_D82 (b_D[82], D[82]);
buf ub_D83 (b_D[83], D[83]);
buf ub_D84 (b_D[84], D[84]);
buf ub_D85 (b_D[85], D[85]);
buf ub_D86 (b_D[86], D[86]);
buf ub_D87 (b_D[87], D[87]);
buf ub_D88 (b_D[88], D[88]);
buf ub_D89 (b_D[89], D[89]);
buf ub_D90 (b_D[90], D[90]);
buf ub_D91 (b_D[91], D[91]);
buf ub_D92 (b_D[92], D[92]);
buf ub_D93 (b_D[93], D[93]);
buf ub_D94 (b_D[94], D[94]);
buf ub_D95 (b_D[95], D[95]);
buf ub_D96 (b_D[96], D[96]);
buf ub_D97 (b_D[97], D[97]);
buf ub_D98 (b_D[98], D[98]);
buf ub_D99 (b_D[99], D[99]);
buf ub_D100 (b_D[100], D[100]);
buf ub_D101 (b_D[101], D[101]);
buf ub_D102 (b_D[102], D[102]);
buf ub_D103 (b_D[103], D[103]);
buf ub_D104 (b_D[104], D[104]);
buf ub_D105 (b_D[105], D[105]);
buf ub_D106 (b_D[106], D[106]);
buf ub_D107 (b_D[107], D[107]);
buf ub_D108 (b_D[108], D[108]);
buf ub_D109 (b_D[109], D[109]);
buf ub_D110 (b_D[110], D[110]);
buf ub_D111 (b_D[111], D[111]);
buf ub_D112 (b_D[112], D[112]);
buf ub_D113 (b_D[113], D[113]);
buf ub_D114 (b_D[114], D[114]);
buf ub_D115 (b_D[115], D[115]);
buf ub_D116 (b_D[116], D[116]);
buf ub_D117 (b_D[117], D[117]);
buf ub_D118 (b_D[118], D[118]);
buf ub_D119 (b_D[119], D[119]);
buf ub_D120 (b_D[120], D[120]);
buf ub_D121 (b_D[121], D[121]);
buf ub_D122 (b_D[122], D[122]);
buf ub_D123 (b_D[123], D[123]);
buf ub_D124 (b_D[124], D[124]);
buf ub_D125 (b_D[125], D[125]);
buf ub_D126 (b_D[126], D[126]);
buf ub_D127 (b_D[127], D[127]);
buf ub_D128 (b_D[128], D[128]);
buf ub_D129 (b_D[129], D[129]);
buf ub_D130 (b_D[130], D[130]);
buf ub_D131 (b_D[131], D[131]);
buf ub_D132 (b_D[132], D[132]);
buf ub_D133 (b_D[133], D[133]);
buf ub_D134 (b_D[134], D[134]);
buf ub_D135 (b_D[135], D[135]);
buf ub_D136 (b_D[136], D[136]);
buf ub_D137 (b_D[137], D[137]);
buf ub_D138 (b_D[138], D[138]);
buf ub_D139 (b_D[139], D[139]);
buf ub_D140 (b_D[140], D[140]);
buf ub_D141 (b_D[141], D[141]);
buf ub_D142 (b_D[142], D[142]);
buf ub_D143 (b_D[143], D[143]);
buf ub_BWEB0 (b_BWEB[0], BWEB[0]);
buf ub_BWEB1 (b_BWEB[1], BWEB[1]);
buf ub_BWEB2 (b_BWEB[2], BWEB[2]);
buf ub_BWEB3 (b_BWEB[3], BWEB[3]);
buf ub_BWEB4 (b_BWEB[4], BWEB[4]);
buf ub_BWEB5 (b_BWEB[5], BWEB[5]);
buf ub_BWEB6 (b_BWEB[6], BWEB[6]);
buf ub_BWEB7 (b_BWEB[7], BWEB[7]);
buf ub_BWEB8 (b_BWEB[8], BWEB[8]);
buf ub_BWEB9 (b_BWEB[9], BWEB[9]);
buf ub_BWEB10 (b_BWEB[10], BWEB[10]);
buf ub_BWEB11 (b_BWEB[11], BWEB[11]);
buf ub_BWEB12 (b_BWEB[12], BWEB[12]);
buf ub_BWEB13 (b_BWEB[13], BWEB[13]);
buf ub_BWEB14 (b_BWEB[14], BWEB[14]);
buf ub_BWEB15 (b_BWEB[15], BWEB[15]);
buf ub_BWEB16 (b_BWEB[16], BWEB[16]);
buf ub_BWEB17 (b_BWEB[17], BWEB[17]);
buf ub_BWEB18 (b_BWEB[18], BWEB[18]);
buf ub_BWEB19 (b_BWEB[19], BWEB[19]);
buf ub_BWEB20 (b_BWEB[20], BWEB[20]);
buf ub_BWEB21 (b_BWEB[21], BWEB[21]);
buf ub_BWEB22 (b_BWEB[22], BWEB[22]);
buf ub_BWEB23 (b_BWEB[23], BWEB[23]);
buf ub_BWEB24 (b_BWEB[24], BWEB[24]);
buf ub_BWEB25 (b_BWEB[25], BWEB[25]);
buf ub_BWEB26 (b_BWEB[26], BWEB[26]);
buf ub_BWEB27 (b_BWEB[27], BWEB[27]);
buf ub_BWEB28 (b_BWEB[28], BWEB[28]);
buf ub_BWEB29 (b_BWEB[29], BWEB[29]);
buf ub_BWEB30 (b_BWEB[30], BWEB[30]);
buf ub_BWEB31 (b_BWEB[31], BWEB[31]);
buf ub_BWEB32 (b_BWEB[32], BWEB[32]);
buf ub_BWEB33 (b_BWEB[33], BWEB[33]);
buf ub_BWEB34 (b_BWEB[34], BWEB[34]);
buf ub_BWEB35 (b_BWEB[35], BWEB[35]);
buf ub_BWEB36 (b_BWEB[36], BWEB[36]);
buf ub_BWEB37 (b_BWEB[37], BWEB[37]);
buf ub_BWEB38 (b_BWEB[38], BWEB[38]);
buf ub_BWEB39 (b_BWEB[39], BWEB[39]);
buf ub_BWEB40 (b_BWEB[40], BWEB[40]);
buf ub_BWEB41 (b_BWEB[41], BWEB[41]);
buf ub_BWEB42 (b_BWEB[42], BWEB[42]);
buf ub_BWEB43 (b_BWEB[43], BWEB[43]);
buf ub_BWEB44 (b_BWEB[44], BWEB[44]);
buf ub_BWEB45 (b_BWEB[45], BWEB[45]);
buf ub_BWEB46 (b_BWEB[46], BWEB[46]);
buf ub_BWEB47 (b_BWEB[47], BWEB[47]);
buf ub_BWEB48 (b_BWEB[48], BWEB[48]);
buf ub_BWEB49 (b_BWEB[49], BWEB[49]);
buf ub_BWEB50 (b_BWEB[50], BWEB[50]);
buf ub_BWEB51 (b_BWEB[51], BWEB[51]);
buf ub_BWEB52 (b_BWEB[52], BWEB[52]);
buf ub_BWEB53 (b_BWEB[53], BWEB[53]);
buf ub_BWEB54 (b_BWEB[54], BWEB[54]);
buf ub_BWEB55 (b_BWEB[55], BWEB[55]);
buf ub_BWEB56 (b_BWEB[56], BWEB[56]);
buf ub_BWEB57 (b_BWEB[57], BWEB[57]);
buf ub_BWEB58 (b_BWEB[58], BWEB[58]);
buf ub_BWEB59 (b_BWEB[59], BWEB[59]);
buf ub_BWEB60 (b_BWEB[60], BWEB[60]);
buf ub_BWEB61 (b_BWEB[61], BWEB[61]);
buf ub_BWEB62 (b_BWEB[62], BWEB[62]);
buf ub_BWEB63 (b_BWEB[63], BWEB[63]);
buf ub_BWEB64 (b_BWEB[64], BWEB[64]);
buf ub_BWEB65 (b_BWEB[65], BWEB[65]);
buf ub_BWEB66 (b_BWEB[66], BWEB[66]);
buf ub_BWEB67 (b_BWEB[67], BWEB[67]);
buf ub_BWEB68 (b_BWEB[68], BWEB[68]);
buf ub_BWEB69 (b_BWEB[69], BWEB[69]);
buf ub_BWEB70 (b_BWEB[70], BWEB[70]);
buf ub_BWEB71 (b_BWEB[71], BWEB[71]);
buf ub_BWEB72 (b_BWEB[72], BWEB[72]);
buf ub_BWEB73 (b_BWEB[73], BWEB[73]);
buf ub_BWEB74 (b_BWEB[74], BWEB[74]);
buf ub_BWEB75 (b_BWEB[75], BWEB[75]);
buf ub_BWEB76 (b_BWEB[76], BWEB[76]);
buf ub_BWEB77 (b_BWEB[77], BWEB[77]);
buf ub_BWEB78 (b_BWEB[78], BWEB[78]);
buf ub_BWEB79 (b_BWEB[79], BWEB[79]);
buf ub_BWEB80 (b_BWEB[80], BWEB[80]);
buf ub_BWEB81 (b_BWEB[81], BWEB[81]);
buf ub_BWEB82 (b_BWEB[82], BWEB[82]);
buf ub_BWEB83 (b_BWEB[83], BWEB[83]);
buf ub_BWEB84 (b_BWEB[84], BWEB[84]);
buf ub_BWEB85 (b_BWEB[85], BWEB[85]);
buf ub_BWEB86 (b_BWEB[86], BWEB[86]);
buf ub_BWEB87 (b_BWEB[87], BWEB[87]);
buf ub_BWEB88 (b_BWEB[88], BWEB[88]);
buf ub_BWEB89 (b_BWEB[89], BWEB[89]);
buf ub_BWEB90 (b_BWEB[90], BWEB[90]);
buf ub_BWEB91 (b_BWEB[91], BWEB[91]);
buf ub_BWEB92 (b_BWEB[92], BWEB[92]);
buf ub_BWEB93 (b_BWEB[93], BWEB[93]);
buf ub_BWEB94 (b_BWEB[94], BWEB[94]);
buf ub_BWEB95 (b_BWEB[95], BWEB[95]);
buf ub_BWEB96 (b_BWEB[96], BWEB[96]);
buf ub_BWEB97 (b_BWEB[97], BWEB[97]);
buf ub_BWEB98 (b_BWEB[98], BWEB[98]);
buf ub_BWEB99 (b_BWEB[99], BWEB[99]);
buf ub_BWEB100 (b_BWEB[100], BWEB[100]);
buf ub_BWEB101 (b_BWEB[101], BWEB[101]);
buf ub_BWEB102 (b_BWEB[102], BWEB[102]);
buf ub_BWEB103 (b_BWEB[103], BWEB[103]);
buf ub_BWEB104 (b_BWEB[104], BWEB[104]);
buf ub_BWEB105 (b_BWEB[105], BWEB[105]);
buf ub_BWEB106 (b_BWEB[106], BWEB[106]);
buf ub_BWEB107 (b_BWEB[107], BWEB[107]);
buf ub_BWEB108 (b_BWEB[108], BWEB[108]);
buf ub_BWEB109 (b_BWEB[109], BWEB[109]);
buf ub_BWEB110 (b_BWEB[110], BWEB[110]);
buf ub_BWEB111 (b_BWEB[111], BWEB[111]);
buf ub_BWEB112 (b_BWEB[112], BWEB[112]);
buf ub_BWEB113 (b_BWEB[113], BWEB[113]);
buf ub_BWEB114 (b_BWEB[114], BWEB[114]);
buf ub_BWEB115 (b_BWEB[115], BWEB[115]);
buf ub_BWEB116 (b_BWEB[116], BWEB[116]);
buf ub_BWEB117 (b_BWEB[117], BWEB[117]);
buf ub_BWEB118 (b_BWEB[118], BWEB[118]);
buf ub_BWEB119 (b_BWEB[119], BWEB[119]);
buf ub_BWEB120 (b_BWEB[120], BWEB[120]);
buf ub_BWEB121 (b_BWEB[121], BWEB[121]);
buf ub_BWEB122 (b_BWEB[122], BWEB[122]);
buf ub_BWEB123 (b_BWEB[123], BWEB[123]);
buf ub_BWEB124 (b_BWEB[124], BWEB[124]);
buf ub_BWEB125 (b_BWEB[125], BWEB[125]);
buf ub_BWEB126 (b_BWEB[126], BWEB[126]);
buf ub_BWEB127 (b_BWEB[127], BWEB[127]);
buf ub_BWEB128 (b_BWEB[128], BWEB[128]);
buf ub_BWEB129 (b_BWEB[129], BWEB[129]);
buf ub_BWEB130 (b_BWEB[130], BWEB[130]);
buf ub_BWEB131 (b_BWEB[131], BWEB[131]);
buf ub_BWEB132 (b_BWEB[132], BWEB[132]);
buf ub_BWEB133 (b_BWEB[133], BWEB[133]);
buf ub_BWEB134 (b_BWEB[134], BWEB[134]);
buf ub_BWEB135 (b_BWEB[135], BWEB[135]);
buf ub_BWEB136 (b_BWEB[136], BWEB[136]);
buf ub_BWEB137 (b_BWEB[137], BWEB[137]);
buf ub_BWEB138 (b_BWEB[138], BWEB[138]);
buf ub_BWEB139 (b_BWEB[139], BWEB[139]);
buf ub_BWEB140 (b_BWEB[140], BWEB[140]);
buf ub_BWEB141 (b_BWEB[141], BWEB[141]);
buf ub_BWEB142 (b_BWEB[142], BWEB[142]);
buf ub_BWEB143 (b_BWEB[143], BWEB[143]);



//  internal SRAM IO signals
wire i_CEB;
wire i_WEB;
wire [9:0] i_A;
wire [143:0] i_D;
wire [143:0] i_BWEB;
wire [143:0] ram_bweb;

//  optional pins

//  power control pins
wire peri_off;

//  Internal Wires
wire mode_sram_op;
wire ram_clk;

//  output pins
wire [143:0] Q_RAM;

//---- existing wire assignment after buffering

//-------- BIST pin selection --------//

buf ub_iCEB (i_CEB, b_CEB);
buf ub_iWEB (i_WEB, b_WEB);
buf ub_iA0 (i_A[0], b_A[0]);
buf ub_iA1 (i_A[1], b_A[1]);
buf ub_iA2 (i_A[2], b_A[2]);
buf ub_iA3 (i_A[3], b_A[3]);
buf ub_iA4 (i_A[4], b_A[4]);
buf ub_iA5 (i_A[5], b_A[5]);
buf ub_iA6 (i_A[6], b_A[6]);
buf ub_iA7 (i_A[7], b_A[7]);
buf ub_iA8 (i_A[8], b_A[8]);
buf ub_iA9 (i_A[9], b_A[9]);
buf ub_iD0  (i_D[0], b_D[0]);
buf ub_iD1  (i_D[1], b_D[1]);
buf ub_iD2  (i_D[2], b_D[2]);
buf ub_iD3  (i_D[3], b_D[3]);
buf ub_iD4  (i_D[4], b_D[4]);
buf ub_iD5  (i_D[5], b_D[5]);
buf ub_iD6  (i_D[6], b_D[6]);
buf ub_iD7  (i_D[7], b_D[7]);
buf ub_iD8  (i_D[8], b_D[8]);
buf ub_iD9  (i_D[9], b_D[9]);
buf ub_iD10  (i_D[10], b_D[10]);
buf ub_iD11  (i_D[11], b_D[11]);
buf ub_iD12  (i_D[12], b_D[12]);
buf ub_iD13  (i_D[13], b_D[13]);
buf ub_iD14  (i_D[14], b_D[14]);
buf ub_iD15  (i_D[15], b_D[15]);
buf ub_iD16  (i_D[16], b_D[16]);
buf ub_iD17  (i_D[17], b_D[17]);
buf ub_iD18  (i_D[18], b_D[18]);
buf ub_iD19  (i_D[19], b_D[19]);
buf ub_iD20  (i_D[20], b_D[20]);
buf ub_iD21  (i_D[21], b_D[21]);
buf ub_iD22  (i_D[22], b_D[22]);
buf ub_iD23  (i_D[23], b_D[23]);
buf ub_iD24  (i_D[24], b_D[24]);
buf ub_iD25  (i_D[25], b_D[25]);
buf ub_iD26  (i_D[26], b_D[26]);
buf ub_iD27  (i_D[27], b_D[27]);
buf ub_iD28  (i_D[28], b_D[28]);
buf ub_iD29  (i_D[29], b_D[29]);
buf ub_iD30  (i_D[30], b_D[30]);
buf ub_iD31  (i_D[31], b_D[31]);
buf ub_iD32  (i_D[32], b_D[32]);
buf ub_iD33  (i_D[33], b_D[33]);
buf ub_iD34  (i_D[34], b_D[34]);
buf ub_iD35  (i_D[35], b_D[35]);
buf ub_iD36  (i_D[36], b_D[36]);
buf ub_iD37  (i_D[37], b_D[37]);
buf ub_iD38  (i_D[38], b_D[38]);
buf ub_iD39  (i_D[39], b_D[39]);
buf ub_iD40  (i_D[40], b_D[40]);
buf ub_iD41  (i_D[41], b_D[41]);
buf ub_iD42  (i_D[42], b_D[42]);
buf ub_iD43  (i_D[43], b_D[43]);
buf ub_iD44  (i_D[44], b_D[44]);
buf ub_iD45  (i_D[45], b_D[45]);
buf ub_iD46  (i_D[46], b_D[46]);
buf ub_iD47  (i_D[47], b_D[47]);
buf ub_iD48  (i_D[48], b_D[48]);
buf ub_iD49  (i_D[49], b_D[49]);
buf ub_iD50  (i_D[50], b_D[50]);
buf ub_iD51  (i_D[51], b_D[51]);
buf ub_iD52  (i_D[52], b_D[52]);
buf ub_iD53  (i_D[53], b_D[53]);
buf ub_iD54  (i_D[54], b_D[54]);
buf ub_iD55  (i_D[55], b_D[55]);
buf ub_iD56  (i_D[56], b_D[56]);
buf ub_iD57  (i_D[57], b_D[57]);
buf ub_iD58  (i_D[58], b_D[58]);
buf ub_iD59  (i_D[59], b_D[59]);
buf ub_iD60  (i_D[60], b_D[60]);
buf ub_iD61  (i_D[61], b_D[61]);
buf ub_iD62  (i_D[62], b_D[62]);
buf ub_iD63  (i_D[63], b_D[63]);
buf ub_iD64  (i_D[64], b_D[64]);
buf ub_iD65  (i_D[65], b_D[65]);
buf ub_iD66  (i_D[66], b_D[66]);
buf ub_iD67  (i_D[67], b_D[67]);
buf ub_iD68  (i_D[68], b_D[68]);
buf ub_iD69  (i_D[69], b_D[69]);
buf ub_iD70  (i_D[70], b_D[70]);
buf ub_iD71  (i_D[71], b_D[71]);
buf ub_iD72  (i_D[72], b_D[72]);
buf ub_iD73  (i_D[73], b_D[73]);
buf ub_iD74  (i_D[74], b_D[74]);
buf ub_iD75  (i_D[75], b_D[75]);
buf ub_iD76  (i_D[76], b_D[76]);
buf ub_iD77  (i_D[77], b_D[77]);
buf ub_iD78  (i_D[78], b_D[78]);
buf ub_iD79  (i_D[79], b_D[79]);
buf ub_iD80  (i_D[80], b_D[80]);
buf ub_iD81  (i_D[81], b_D[81]);
buf ub_iD82  (i_D[82], b_D[82]);
buf ub_iD83  (i_D[83], b_D[83]);
buf ub_iD84  (i_D[84], b_D[84]);
buf ub_iD85  (i_D[85], b_D[85]);
buf ub_iD86  (i_D[86], b_D[86]);
buf ub_iD87  (i_D[87], b_D[87]);
buf ub_iD88  (i_D[88], b_D[88]);
buf ub_iD89  (i_D[89], b_D[89]);
buf ub_iD90  (i_D[90], b_D[90]);
buf ub_iD91  (i_D[91], b_D[91]);
buf ub_iD92  (i_D[92], b_D[92]);
buf ub_iD93  (i_D[93], b_D[93]);
buf ub_iD94  (i_D[94], b_D[94]);
buf ub_iD95  (i_D[95], b_D[95]);
buf ub_iD96  (i_D[96], b_D[96]);
buf ub_iD97  (i_D[97], b_D[97]);
buf ub_iD98  (i_D[98], b_D[98]);
buf ub_iD99  (i_D[99], b_D[99]);
buf ub_iD100  (i_D[100], b_D[100]);
buf ub_iD101  (i_D[101], b_D[101]);
buf ub_iD102  (i_D[102], b_D[102]);
buf ub_iD103  (i_D[103], b_D[103]);
buf ub_iD104  (i_D[104], b_D[104]);
buf ub_iD105  (i_D[105], b_D[105]);
buf ub_iD106  (i_D[106], b_D[106]);
buf ub_iD107  (i_D[107], b_D[107]);
buf ub_iD108  (i_D[108], b_D[108]);
buf ub_iD109  (i_D[109], b_D[109]);
buf ub_iD110  (i_D[110], b_D[110]);
buf ub_iD111  (i_D[111], b_D[111]);
buf ub_iD112  (i_D[112], b_D[112]);
buf ub_iD113  (i_D[113], b_D[113]);
buf ub_iD114  (i_D[114], b_D[114]);
buf ub_iD115  (i_D[115], b_D[115]);
buf ub_iD116  (i_D[116], b_D[116]);
buf ub_iD117  (i_D[117], b_D[117]);
buf ub_iD118  (i_D[118], b_D[118]);
buf ub_iD119  (i_D[119], b_D[119]);
buf ub_iD120  (i_D[120], b_D[120]);
buf ub_iD121  (i_D[121], b_D[121]);
buf ub_iD122  (i_D[122], b_D[122]);
buf ub_iD123  (i_D[123], b_D[123]);
buf ub_iD124  (i_D[124], b_D[124]);
buf ub_iD125  (i_D[125], b_D[125]);
buf ub_iD126  (i_D[126], b_D[126]);
buf ub_iD127  (i_D[127], b_D[127]);
buf ub_iD128  (i_D[128], b_D[128]);
buf ub_iD129  (i_D[129], b_D[129]);
buf ub_iD130  (i_D[130], b_D[130]);
buf ub_iD131  (i_D[131], b_D[131]);
buf ub_iD132  (i_D[132], b_D[132]);
buf ub_iD133  (i_D[133], b_D[133]);
buf ub_iD134  (i_D[134], b_D[134]);
buf ub_iD135  (i_D[135], b_D[135]);
buf ub_iD136  (i_D[136], b_D[136]);
buf ub_iD137  (i_D[137], b_D[137]);
buf ub_iD138  (i_D[138], b_D[138]);
buf ub_iD139  (i_D[139], b_D[139]);
buf ub_iD140  (i_D[140], b_D[140]);
buf ub_iD141  (i_D[141], b_D[141]);
buf ub_iD142  (i_D[142], b_D[142]);
buf ub_iD143  (i_D[143], b_D[143]);
buf ub_iBWEB0  (i_BWEB[0], b_BWEB[0]);
buf ub_iBWEB1  (i_BWEB[1], b_BWEB[1]);
buf ub_iBWEB2  (i_BWEB[2], b_BWEB[2]);
buf ub_iBWEB3  (i_BWEB[3], b_BWEB[3]);
buf ub_iBWEB4  (i_BWEB[4], b_BWEB[4]);
buf ub_iBWEB5  (i_BWEB[5], b_BWEB[5]);
buf ub_iBWEB6  (i_BWEB[6], b_BWEB[6]);
buf ub_iBWEB7  (i_BWEB[7], b_BWEB[7]);
buf ub_iBWEB8  (i_BWEB[8], b_BWEB[8]);
buf ub_iBWEB9  (i_BWEB[9], b_BWEB[9]);
buf ub_iBWEB10  (i_BWEB[10], b_BWEB[10]);
buf ub_iBWEB11  (i_BWEB[11], b_BWEB[11]);
buf ub_iBWEB12  (i_BWEB[12], b_BWEB[12]);
buf ub_iBWEB13  (i_BWEB[13], b_BWEB[13]);
buf ub_iBWEB14  (i_BWEB[14], b_BWEB[14]);
buf ub_iBWEB15  (i_BWEB[15], b_BWEB[15]);
buf ub_iBWEB16  (i_BWEB[16], b_BWEB[16]);
buf ub_iBWEB17  (i_BWEB[17], b_BWEB[17]);
buf ub_iBWEB18  (i_BWEB[18], b_BWEB[18]);
buf ub_iBWEB19  (i_BWEB[19], b_BWEB[19]);
buf ub_iBWEB20  (i_BWEB[20], b_BWEB[20]);
buf ub_iBWEB21  (i_BWEB[21], b_BWEB[21]);
buf ub_iBWEB22  (i_BWEB[22], b_BWEB[22]);
buf ub_iBWEB23  (i_BWEB[23], b_BWEB[23]);
buf ub_iBWEB24  (i_BWEB[24], b_BWEB[24]);
buf ub_iBWEB25  (i_BWEB[25], b_BWEB[25]);
buf ub_iBWEB26  (i_BWEB[26], b_BWEB[26]);
buf ub_iBWEB27  (i_BWEB[27], b_BWEB[27]);
buf ub_iBWEB28  (i_BWEB[28], b_BWEB[28]);
buf ub_iBWEB29  (i_BWEB[29], b_BWEB[29]);
buf ub_iBWEB30  (i_BWEB[30], b_BWEB[30]);
buf ub_iBWEB31  (i_BWEB[31], b_BWEB[31]);
buf ub_iBWEB32  (i_BWEB[32], b_BWEB[32]);
buf ub_iBWEB33  (i_BWEB[33], b_BWEB[33]);
buf ub_iBWEB34  (i_BWEB[34], b_BWEB[34]);
buf ub_iBWEB35  (i_BWEB[35], b_BWEB[35]);
buf ub_iBWEB36  (i_BWEB[36], b_BWEB[36]);
buf ub_iBWEB37  (i_BWEB[37], b_BWEB[37]);
buf ub_iBWEB38  (i_BWEB[38], b_BWEB[38]);
buf ub_iBWEB39  (i_BWEB[39], b_BWEB[39]);
buf ub_iBWEB40  (i_BWEB[40], b_BWEB[40]);
buf ub_iBWEB41  (i_BWEB[41], b_BWEB[41]);
buf ub_iBWEB42  (i_BWEB[42], b_BWEB[42]);
buf ub_iBWEB43  (i_BWEB[43], b_BWEB[43]);
buf ub_iBWEB44  (i_BWEB[44], b_BWEB[44]);
buf ub_iBWEB45  (i_BWEB[45], b_BWEB[45]);
buf ub_iBWEB46  (i_BWEB[46], b_BWEB[46]);
buf ub_iBWEB47  (i_BWEB[47], b_BWEB[47]);
buf ub_iBWEB48  (i_BWEB[48], b_BWEB[48]);
buf ub_iBWEB49  (i_BWEB[49], b_BWEB[49]);
buf ub_iBWEB50  (i_BWEB[50], b_BWEB[50]);
buf ub_iBWEB51  (i_BWEB[51], b_BWEB[51]);
buf ub_iBWEB52  (i_BWEB[52], b_BWEB[52]);
buf ub_iBWEB53  (i_BWEB[53], b_BWEB[53]);
buf ub_iBWEB54  (i_BWEB[54], b_BWEB[54]);
buf ub_iBWEB55  (i_BWEB[55], b_BWEB[55]);
buf ub_iBWEB56  (i_BWEB[56], b_BWEB[56]);
buf ub_iBWEB57  (i_BWEB[57], b_BWEB[57]);
buf ub_iBWEB58  (i_BWEB[58], b_BWEB[58]);
buf ub_iBWEB59  (i_BWEB[59], b_BWEB[59]);
buf ub_iBWEB60  (i_BWEB[60], b_BWEB[60]);
buf ub_iBWEB61  (i_BWEB[61], b_BWEB[61]);
buf ub_iBWEB62  (i_BWEB[62], b_BWEB[62]);
buf ub_iBWEB63  (i_BWEB[63], b_BWEB[63]);
buf ub_iBWEB64  (i_BWEB[64], b_BWEB[64]);
buf ub_iBWEB65  (i_BWEB[65], b_BWEB[65]);
buf ub_iBWEB66  (i_BWEB[66], b_BWEB[66]);
buf ub_iBWEB67  (i_BWEB[67], b_BWEB[67]);
buf ub_iBWEB68  (i_BWEB[68], b_BWEB[68]);
buf ub_iBWEB69  (i_BWEB[69], b_BWEB[69]);
buf ub_iBWEB70  (i_BWEB[70], b_BWEB[70]);
buf ub_iBWEB71  (i_BWEB[71], b_BWEB[71]);
buf ub_iBWEB72  (i_BWEB[72], b_BWEB[72]);
buf ub_iBWEB73  (i_BWEB[73], b_BWEB[73]);
buf ub_iBWEB74  (i_BWEB[74], b_BWEB[74]);
buf ub_iBWEB75  (i_BWEB[75], b_BWEB[75]);
buf ub_iBWEB76  (i_BWEB[76], b_BWEB[76]);
buf ub_iBWEB77  (i_BWEB[77], b_BWEB[77]);
buf ub_iBWEB78  (i_BWEB[78], b_BWEB[78]);
buf ub_iBWEB79  (i_BWEB[79], b_BWEB[79]);
buf ub_iBWEB80  (i_BWEB[80], b_BWEB[80]);
buf ub_iBWEB81  (i_BWEB[81], b_BWEB[81]);
buf ub_iBWEB82  (i_BWEB[82], b_BWEB[82]);
buf ub_iBWEB83  (i_BWEB[83], b_BWEB[83]);
buf ub_iBWEB84  (i_BWEB[84], b_BWEB[84]);
buf ub_iBWEB85  (i_BWEB[85], b_BWEB[85]);
buf ub_iBWEB86  (i_BWEB[86], b_BWEB[86]);
buf ub_iBWEB87  (i_BWEB[87], b_BWEB[87]);
buf ub_iBWEB88  (i_BWEB[88], b_BWEB[88]);
buf ub_iBWEB89  (i_BWEB[89], b_BWEB[89]);
buf ub_iBWEB90  (i_BWEB[90], b_BWEB[90]);
buf ub_iBWEB91  (i_BWEB[91], b_BWEB[91]);
buf ub_iBWEB92  (i_BWEB[92], b_BWEB[92]);
buf ub_iBWEB93  (i_BWEB[93], b_BWEB[93]);
buf ub_iBWEB94  (i_BWEB[94], b_BWEB[94]);
buf ub_iBWEB95  (i_BWEB[95], b_BWEB[95]);
buf ub_iBWEB96  (i_BWEB[96], b_BWEB[96]);
buf ub_iBWEB97  (i_BWEB[97], b_BWEB[97]);
buf ub_iBWEB98  (i_BWEB[98], b_BWEB[98]);
buf ub_iBWEB99  (i_BWEB[99], b_BWEB[99]);
buf ub_iBWEB100  (i_BWEB[100], b_BWEB[100]);
buf ub_iBWEB101  (i_BWEB[101], b_BWEB[101]);
buf ub_iBWEB102  (i_BWEB[102], b_BWEB[102]);
buf ub_iBWEB103  (i_BWEB[103], b_BWEB[103]);
buf ub_iBWEB104  (i_BWEB[104], b_BWEB[104]);
buf ub_iBWEB105  (i_BWEB[105], b_BWEB[105]);
buf ub_iBWEB106  (i_BWEB[106], b_BWEB[106]);
buf ub_iBWEB107  (i_BWEB[107], b_BWEB[107]);
buf ub_iBWEB108  (i_BWEB[108], b_BWEB[108]);
buf ub_iBWEB109  (i_BWEB[109], b_BWEB[109]);
buf ub_iBWEB110  (i_BWEB[110], b_BWEB[110]);
buf ub_iBWEB111  (i_BWEB[111], b_BWEB[111]);
buf ub_iBWEB112  (i_BWEB[112], b_BWEB[112]);
buf ub_iBWEB113  (i_BWEB[113], b_BWEB[113]);
buf ub_iBWEB114  (i_BWEB[114], b_BWEB[114]);
buf ub_iBWEB115  (i_BWEB[115], b_BWEB[115]);
buf ub_iBWEB116  (i_BWEB[116], b_BWEB[116]);
buf ub_iBWEB117  (i_BWEB[117], b_BWEB[117]);
buf ub_iBWEB118  (i_BWEB[118], b_BWEB[118]);
buf ub_iBWEB119  (i_BWEB[119], b_BWEB[119]);
buf ub_iBWEB120  (i_BWEB[120], b_BWEB[120]);
buf ub_iBWEB121  (i_BWEB[121], b_BWEB[121]);
buf ub_iBWEB122  (i_BWEB[122], b_BWEB[122]);
buf ub_iBWEB123  (i_BWEB[123], b_BWEB[123]);
buf ub_iBWEB124  (i_BWEB[124], b_BWEB[124]);
buf ub_iBWEB125  (i_BWEB[125], b_BWEB[125]);
buf ub_iBWEB126  (i_BWEB[126], b_BWEB[126]);
buf ub_iBWEB127  (i_BWEB[127], b_BWEB[127]);
buf ub_iBWEB128  (i_BWEB[128], b_BWEB[128]);
buf ub_iBWEB129  (i_BWEB[129], b_BWEB[129]);
buf ub_iBWEB130  (i_BWEB[130], b_BWEB[130]);
buf ub_iBWEB131  (i_BWEB[131], b_BWEB[131]);
buf ub_iBWEB132  (i_BWEB[132], b_BWEB[132]);
buf ub_iBWEB133  (i_BWEB[133], b_BWEB[133]);
buf ub_iBWEB134  (i_BWEB[134], b_BWEB[134]);
buf ub_iBWEB135  (i_BWEB[135], b_BWEB[135]);
buf ub_iBWEB136  (i_BWEB[136], b_BWEB[136]);
buf ub_iBWEB137  (i_BWEB[137], b_BWEB[137]);
buf ub_iBWEB138  (i_BWEB[138], b_BWEB[138]);
buf ub_iBWEB139  (i_BWEB[139], b_BWEB[139]);
buf ub_iBWEB140  (i_BWEB[140], b_BWEB[140]);
buf ub_iBWEB141  (i_BWEB[141], b_BWEB[141]);
buf ub_iBWEB142  (i_BWEB[142], b_BWEB[142]);
buf ub_iBWEB143  (i_BWEB[143], b_BWEB[143]);
//  Internal ram bweb
buf ub_ram_bweb0 (ram_bweb[0], i_BWEB[0]);
buf ub_ram_bweb1 (ram_bweb[1], i_BWEB[1]);
buf ub_ram_bweb2 (ram_bweb[2], i_BWEB[2]);
buf ub_ram_bweb3 (ram_bweb[3], i_BWEB[3]);
buf ub_ram_bweb4 (ram_bweb[4], i_BWEB[4]);
buf ub_ram_bweb5 (ram_bweb[5], i_BWEB[5]);
buf ub_ram_bweb6 (ram_bweb[6], i_BWEB[6]);
buf ub_ram_bweb7 (ram_bweb[7], i_BWEB[7]);
buf ub_ram_bweb8 (ram_bweb[8], i_BWEB[8]);
buf ub_ram_bweb9 (ram_bweb[9], i_BWEB[9]);
buf ub_ram_bweb10 (ram_bweb[10], i_BWEB[10]);
buf ub_ram_bweb11 (ram_bweb[11], i_BWEB[11]);
buf ub_ram_bweb12 (ram_bweb[12], i_BWEB[12]);
buf ub_ram_bweb13 (ram_bweb[13], i_BWEB[13]);
buf ub_ram_bweb14 (ram_bweb[14], i_BWEB[14]);
buf ub_ram_bweb15 (ram_bweb[15], i_BWEB[15]);
buf ub_ram_bweb16 (ram_bweb[16], i_BWEB[16]);
buf ub_ram_bweb17 (ram_bweb[17], i_BWEB[17]);
buf ub_ram_bweb18 (ram_bweb[18], i_BWEB[18]);
buf ub_ram_bweb19 (ram_bweb[19], i_BWEB[19]);
buf ub_ram_bweb20 (ram_bweb[20], i_BWEB[20]);
buf ub_ram_bweb21 (ram_bweb[21], i_BWEB[21]);
buf ub_ram_bweb22 (ram_bweb[22], i_BWEB[22]);
buf ub_ram_bweb23 (ram_bweb[23], i_BWEB[23]);
buf ub_ram_bweb24 (ram_bweb[24], i_BWEB[24]);
buf ub_ram_bweb25 (ram_bweb[25], i_BWEB[25]);
buf ub_ram_bweb26 (ram_bweb[26], i_BWEB[26]);
buf ub_ram_bweb27 (ram_bweb[27], i_BWEB[27]);
buf ub_ram_bweb28 (ram_bweb[28], i_BWEB[28]);
buf ub_ram_bweb29 (ram_bweb[29], i_BWEB[29]);
buf ub_ram_bweb30 (ram_bweb[30], i_BWEB[30]);
buf ub_ram_bweb31 (ram_bweb[31], i_BWEB[31]);
buf ub_ram_bweb32 (ram_bweb[32], i_BWEB[32]);
buf ub_ram_bweb33 (ram_bweb[33], i_BWEB[33]);
buf ub_ram_bweb34 (ram_bweb[34], i_BWEB[34]);
buf ub_ram_bweb35 (ram_bweb[35], i_BWEB[35]);
buf ub_ram_bweb36 (ram_bweb[36], i_BWEB[36]);
buf ub_ram_bweb37 (ram_bweb[37], i_BWEB[37]);
buf ub_ram_bweb38 (ram_bweb[38], i_BWEB[38]);
buf ub_ram_bweb39 (ram_bweb[39], i_BWEB[39]);
buf ub_ram_bweb40 (ram_bweb[40], i_BWEB[40]);
buf ub_ram_bweb41 (ram_bweb[41], i_BWEB[41]);
buf ub_ram_bweb42 (ram_bweb[42], i_BWEB[42]);
buf ub_ram_bweb43 (ram_bweb[43], i_BWEB[43]);
buf ub_ram_bweb44 (ram_bweb[44], i_BWEB[44]);
buf ub_ram_bweb45 (ram_bweb[45], i_BWEB[45]);
buf ub_ram_bweb46 (ram_bweb[46], i_BWEB[46]);
buf ub_ram_bweb47 (ram_bweb[47], i_BWEB[47]);
buf ub_ram_bweb48 (ram_bweb[48], i_BWEB[48]);
buf ub_ram_bweb49 (ram_bweb[49], i_BWEB[49]);
buf ub_ram_bweb50 (ram_bweb[50], i_BWEB[50]);
buf ub_ram_bweb51 (ram_bweb[51], i_BWEB[51]);
buf ub_ram_bweb52 (ram_bweb[52], i_BWEB[52]);
buf ub_ram_bweb53 (ram_bweb[53], i_BWEB[53]);
buf ub_ram_bweb54 (ram_bweb[54], i_BWEB[54]);
buf ub_ram_bweb55 (ram_bweb[55], i_BWEB[55]);
buf ub_ram_bweb56 (ram_bweb[56], i_BWEB[56]);
buf ub_ram_bweb57 (ram_bweb[57], i_BWEB[57]);
buf ub_ram_bweb58 (ram_bweb[58], i_BWEB[58]);
buf ub_ram_bweb59 (ram_bweb[59], i_BWEB[59]);
buf ub_ram_bweb60 (ram_bweb[60], i_BWEB[60]);
buf ub_ram_bweb61 (ram_bweb[61], i_BWEB[61]);
buf ub_ram_bweb62 (ram_bweb[62], i_BWEB[62]);
buf ub_ram_bweb63 (ram_bweb[63], i_BWEB[63]);
buf ub_ram_bweb64 (ram_bweb[64], i_BWEB[64]);
buf ub_ram_bweb65 (ram_bweb[65], i_BWEB[65]);
buf ub_ram_bweb66 (ram_bweb[66], i_BWEB[66]);
buf ub_ram_bweb67 (ram_bweb[67], i_BWEB[67]);
buf ub_ram_bweb68 (ram_bweb[68], i_BWEB[68]);
buf ub_ram_bweb69 (ram_bweb[69], i_BWEB[69]);
buf ub_ram_bweb70 (ram_bweb[70], i_BWEB[70]);
buf ub_ram_bweb71 (ram_bweb[71], i_BWEB[71]);
buf ub_ram_bweb72 (ram_bweb[72], i_BWEB[72]);
buf ub_ram_bweb73 (ram_bweb[73], i_BWEB[73]);
buf ub_ram_bweb74 (ram_bweb[74], i_BWEB[74]);
buf ub_ram_bweb75 (ram_bweb[75], i_BWEB[75]);
buf ub_ram_bweb76 (ram_bweb[76], i_BWEB[76]);
buf ub_ram_bweb77 (ram_bweb[77], i_BWEB[77]);
buf ub_ram_bweb78 (ram_bweb[78], i_BWEB[78]);
buf ub_ram_bweb79 (ram_bweb[79], i_BWEB[79]);
buf ub_ram_bweb80 (ram_bweb[80], i_BWEB[80]);
buf ub_ram_bweb81 (ram_bweb[81], i_BWEB[81]);
buf ub_ram_bweb82 (ram_bweb[82], i_BWEB[82]);
buf ub_ram_bweb83 (ram_bweb[83], i_BWEB[83]);
buf ub_ram_bweb84 (ram_bweb[84], i_BWEB[84]);
buf ub_ram_bweb85 (ram_bweb[85], i_BWEB[85]);
buf ub_ram_bweb86 (ram_bweb[86], i_BWEB[86]);
buf ub_ram_bweb87 (ram_bweb[87], i_BWEB[87]);
buf ub_ram_bweb88 (ram_bweb[88], i_BWEB[88]);
buf ub_ram_bweb89 (ram_bweb[89], i_BWEB[89]);
buf ub_ram_bweb90 (ram_bweb[90], i_BWEB[90]);
buf ub_ram_bweb91 (ram_bweb[91], i_BWEB[91]);
buf ub_ram_bweb92 (ram_bweb[92], i_BWEB[92]);
buf ub_ram_bweb93 (ram_bweb[93], i_BWEB[93]);
buf ub_ram_bweb94 (ram_bweb[94], i_BWEB[94]);
buf ub_ram_bweb95 (ram_bweb[95], i_BWEB[95]);
buf ub_ram_bweb96 (ram_bweb[96], i_BWEB[96]);
buf ub_ram_bweb97 (ram_bweb[97], i_BWEB[97]);
buf ub_ram_bweb98 (ram_bweb[98], i_BWEB[98]);
buf ub_ram_bweb99 (ram_bweb[99], i_BWEB[99]);
buf ub_ram_bweb100 (ram_bweb[100], i_BWEB[100]);
buf ub_ram_bweb101 (ram_bweb[101], i_BWEB[101]);
buf ub_ram_bweb102 (ram_bweb[102], i_BWEB[102]);
buf ub_ram_bweb103 (ram_bweb[103], i_BWEB[103]);
buf ub_ram_bweb104 (ram_bweb[104], i_BWEB[104]);
buf ub_ram_bweb105 (ram_bweb[105], i_BWEB[105]);
buf ub_ram_bweb106 (ram_bweb[106], i_BWEB[106]);
buf ub_ram_bweb107 (ram_bweb[107], i_BWEB[107]);
buf ub_ram_bweb108 (ram_bweb[108], i_BWEB[108]);
buf ub_ram_bweb109 (ram_bweb[109], i_BWEB[109]);
buf ub_ram_bweb110 (ram_bweb[110], i_BWEB[110]);
buf ub_ram_bweb111 (ram_bweb[111], i_BWEB[111]);
buf ub_ram_bweb112 (ram_bweb[112], i_BWEB[112]);
buf ub_ram_bweb113 (ram_bweb[113], i_BWEB[113]);
buf ub_ram_bweb114 (ram_bweb[114], i_BWEB[114]);
buf ub_ram_bweb115 (ram_bweb[115], i_BWEB[115]);
buf ub_ram_bweb116 (ram_bweb[116], i_BWEB[116]);
buf ub_ram_bweb117 (ram_bweb[117], i_BWEB[117]);
buf ub_ram_bweb118 (ram_bweb[118], i_BWEB[118]);
buf ub_ram_bweb119 (ram_bweb[119], i_BWEB[119]);
buf ub_ram_bweb120 (ram_bweb[120], i_BWEB[120]);
buf ub_ram_bweb121 (ram_bweb[121], i_BWEB[121]);
buf ub_ram_bweb122 (ram_bweb[122], i_BWEB[122]);
buf ub_ram_bweb123 (ram_bweb[123], i_BWEB[123]);
buf ub_ram_bweb124 (ram_bweb[124], i_BWEB[124]);
buf ub_ram_bweb125 (ram_bweb[125], i_BWEB[125]);
buf ub_ram_bweb126 (ram_bweb[126], i_BWEB[126]);
buf ub_ram_bweb127 (ram_bweb[127], i_BWEB[127]);
buf ub_ram_bweb128 (ram_bweb[128], i_BWEB[128]);
buf ub_ram_bweb129 (ram_bweb[129], i_BWEB[129]);
buf ub_ram_bweb130 (ram_bweb[130], i_BWEB[130]);
buf ub_ram_bweb131 (ram_bweb[131], i_BWEB[131]);
buf ub_ram_bweb132 (ram_bweb[132], i_BWEB[132]);
buf ub_ram_bweb133 (ram_bweb[133], i_BWEB[133]);
buf ub_ram_bweb134 (ram_bweb[134], i_BWEB[134]);
buf ub_ram_bweb135 (ram_bweb[135], i_BWEB[135]);
buf ub_ram_bweb136 (ram_bweb[136], i_BWEB[136]);
buf ub_ram_bweb137 (ram_bweb[137], i_BWEB[137]);
buf ub_ram_bweb138 (ram_bweb[138], i_BWEB[138]);
buf ub_ram_bweb139 (ram_bweb[139], i_BWEB[139]);
buf ub_ram_bweb140 (ram_bweb[140], i_BWEB[140]);
buf ub_ram_bweb141 (ram_bweb[141], i_BWEB[141]);
buf ub_ram_bweb142 (ram_bweb[142], i_BWEB[142]);
buf ub_ram_bweb143 (ram_bweb[143], i_BWEB[143]);

//-------- Combinational Network --------//
buf  u_peri_off (peri_off, 1'b0);

//-------- Functional Module Instantiation --------//
//---- Mode Decision
_INV u_mode_sram_op (peri_off, mode_sram_op);

//---- Clock Gating
buf ub_ram_clk (ram_clk, b_CLK);

//---- RAM Enable
TS1N16FFCLLSBLVTC1024X144M4SW_RAM_Enable_handle u_RAM_Enable_handle (
  .MODE_SRAM_OP ( mode_sram_op),
  .RAM_WEB      ( i_WEB),
  .RAM_CEB      ( i_CEB),
  .RAM_WRITE    ( i_WRITE),
  .RAM_READ     ( i_READ)
);

//---- RAM Core
TS1N16FFCLLSBLVTC1024X144M4SW_RAM_Core u_RAM_Core (
  //---- clock
  .RAM_CLK      ( ram_clk),
  //---- RAM IO
  .RAM_D        ( i_D),
  .RAM_A        ( i_A),
  .RAM_WRITE    ( i_WRITE),
  .RAM_READ     ( i_READ),
  .RAM_BWEB     ( ram_bweb),
  //---- output
  .RAM_Q        ( Q_RAM)
);

//---- Q Buffering
buf ub_QRAM0 (b_Q[0], Q_RAM[0]);
buf ub_QRAM1 (b_Q[1], Q_RAM[1]);
buf ub_QRAM2 (b_Q[2], Q_RAM[2]);
buf ub_QRAM3 (b_Q[3], Q_RAM[3]);
buf ub_QRAM4 (b_Q[4], Q_RAM[4]);
buf ub_QRAM5 (b_Q[5], Q_RAM[5]);
buf ub_QRAM6 (b_Q[6], Q_RAM[6]);
buf ub_QRAM7 (b_Q[7], Q_RAM[7]);
buf ub_QRAM8 (b_Q[8], Q_RAM[8]);
buf ub_QRAM9 (b_Q[9], Q_RAM[9]);
buf ub_QRAM10 (b_Q[10], Q_RAM[10]);
buf ub_QRAM11 (b_Q[11], Q_RAM[11]);
buf ub_QRAM12 (b_Q[12], Q_RAM[12]);
buf ub_QRAM13 (b_Q[13], Q_RAM[13]);
buf ub_QRAM14 (b_Q[14], Q_RAM[14]);
buf ub_QRAM15 (b_Q[15], Q_RAM[15]);
buf ub_QRAM16 (b_Q[16], Q_RAM[16]);
buf ub_QRAM17 (b_Q[17], Q_RAM[17]);
buf ub_QRAM18 (b_Q[18], Q_RAM[18]);
buf ub_QRAM19 (b_Q[19], Q_RAM[19]);
buf ub_QRAM20 (b_Q[20], Q_RAM[20]);
buf ub_QRAM21 (b_Q[21], Q_RAM[21]);
buf ub_QRAM22 (b_Q[22], Q_RAM[22]);
buf ub_QRAM23 (b_Q[23], Q_RAM[23]);
buf ub_QRAM24 (b_Q[24], Q_RAM[24]);
buf ub_QRAM25 (b_Q[25], Q_RAM[25]);
buf ub_QRAM26 (b_Q[26], Q_RAM[26]);
buf ub_QRAM27 (b_Q[27], Q_RAM[27]);
buf ub_QRAM28 (b_Q[28], Q_RAM[28]);
buf ub_QRAM29 (b_Q[29], Q_RAM[29]);
buf ub_QRAM30 (b_Q[30], Q_RAM[30]);
buf ub_QRAM31 (b_Q[31], Q_RAM[31]);
buf ub_QRAM32 (b_Q[32], Q_RAM[32]);
buf ub_QRAM33 (b_Q[33], Q_RAM[33]);
buf ub_QRAM34 (b_Q[34], Q_RAM[34]);
buf ub_QRAM35 (b_Q[35], Q_RAM[35]);
buf ub_QRAM36 (b_Q[36], Q_RAM[36]);
buf ub_QRAM37 (b_Q[37], Q_RAM[37]);
buf ub_QRAM38 (b_Q[38], Q_RAM[38]);
buf ub_QRAM39 (b_Q[39], Q_RAM[39]);
buf ub_QRAM40 (b_Q[40], Q_RAM[40]);
buf ub_QRAM41 (b_Q[41], Q_RAM[41]);
buf ub_QRAM42 (b_Q[42], Q_RAM[42]);
buf ub_QRAM43 (b_Q[43], Q_RAM[43]);
buf ub_QRAM44 (b_Q[44], Q_RAM[44]);
buf ub_QRAM45 (b_Q[45], Q_RAM[45]);
buf ub_QRAM46 (b_Q[46], Q_RAM[46]);
buf ub_QRAM47 (b_Q[47], Q_RAM[47]);
buf ub_QRAM48 (b_Q[48], Q_RAM[48]);
buf ub_QRAM49 (b_Q[49], Q_RAM[49]);
buf ub_QRAM50 (b_Q[50], Q_RAM[50]);
buf ub_QRAM51 (b_Q[51], Q_RAM[51]);
buf ub_QRAM52 (b_Q[52], Q_RAM[52]);
buf ub_QRAM53 (b_Q[53], Q_RAM[53]);
buf ub_QRAM54 (b_Q[54], Q_RAM[54]);
buf ub_QRAM55 (b_Q[55], Q_RAM[55]);
buf ub_QRAM56 (b_Q[56], Q_RAM[56]);
buf ub_QRAM57 (b_Q[57], Q_RAM[57]);
buf ub_QRAM58 (b_Q[58], Q_RAM[58]);
buf ub_QRAM59 (b_Q[59], Q_RAM[59]);
buf ub_QRAM60 (b_Q[60], Q_RAM[60]);
buf ub_QRAM61 (b_Q[61], Q_RAM[61]);
buf ub_QRAM62 (b_Q[62], Q_RAM[62]);
buf ub_QRAM63 (b_Q[63], Q_RAM[63]);
buf ub_QRAM64 (b_Q[64], Q_RAM[64]);
buf ub_QRAM65 (b_Q[65], Q_RAM[65]);
buf ub_QRAM66 (b_Q[66], Q_RAM[66]);
buf ub_QRAM67 (b_Q[67], Q_RAM[67]);
buf ub_QRAM68 (b_Q[68], Q_RAM[68]);
buf ub_QRAM69 (b_Q[69], Q_RAM[69]);
buf ub_QRAM70 (b_Q[70], Q_RAM[70]);
buf ub_QRAM71 (b_Q[71], Q_RAM[71]);
buf ub_QRAM72 (b_Q[72], Q_RAM[72]);
buf ub_QRAM73 (b_Q[73], Q_RAM[73]);
buf ub_QRAM74 (b_Q[74], Q_RAM[74]);
buf ub_QRAM75 (b_Q[75], Q_RAM[75]);
buf ub_QRAM76 (b_Q[76], Q_RAM[76]);
buf ub_QRAM77 (b_Q[77], Q_RAM[77]);
buf ub_QRAM78 (b_Q[78], Q_RAM[78]);
buf ub_QRAM79 (b_Q[79], Q_RAM[79]);
buf ub_QRAM80 (b_Q[80], Q_RAM[80]);
buf ub_QRAM81 (b_Q[81], Q_RAM[81]);
buf ub_QRAM82 (b_Q[82], Q_RAM[82]);
buf ub_QRAM83 (b_Q[83], Q_RAM[83]);
buf ub_QRAM84 (b_Q[84], Q_RAM[84]);
buf ub_QRAM85 (b_Q[85], Q_RAM[85]);
buf ub_QRAM86 (b_Q[86], Q_RAM[86]);
buf ub_QRAM87 (b_Q[87], Q_RAM[87]);
buf ub_QRAM88 (b_Q[88], Q_RAM[88]);
buf ub_QRAM89 (b_Q[89], Q_RAM[89]);
buf ub_QRAM90 (b_Q[90], Q_RAM[90]);
buf ub_QRAM91 (b_Q[91], Q_RAM[91]);
buf ub_QRAM92 (b_Q[92], Q_RAM[92]);
buf ub_QRAM93 (b_Q[93], Q_RAM[93]);
buf ub_QRAM94 (b_Q[94], Q_RAM[94]);
buf ub_QRAM95 (b_Q[95], Q_RAM[95]);
buf ub_QRAM96 (b_Q[96], Q_RAM[96]);
buf ub_QRAM97 (b_Q[97], Q_RAM[97]);
buf ub_QRAM98 (b_Q[98], Q_RAM[98]);
buf ub_QRAM99 (b_Q[99], Q_RAM[99]);
buf ub_QRAM100 (b_Q[100], Q_RAM[100]);
buf ub_QRAM101 (b_Q[101], Q_RAM[101]);
buf ub_QRAM102 (b_Q[102], Q_RAM[102]);
buf ub_QRAM103 (b_Q[103], Q_RAM[103]);
buf ub_QRAM104 (b_Q[104], Q_RAM[104]);
buf ub_QRAM105 (b_Q[105], Q_RAM[105]);
buf ub_QRAM106 (b_Q[106], Q_RAM[106]);
buf ub_QRAM107 (b_Q[107], Q_RAM[107]);
buf ub_QRAM108 (b_Q[108], Q_RAM[108]);
buf ub_QRAM109 (b_Q[109], Q_RAM[109]);
buf ub_QRAM110 (b_Q[110], Q_RAM[110]);
buf ub_QRAM111 (b_Q[111], Q_RAM[111]);
buf ub_QRAM112 (b_Q[112], Q_RAM[112]);
buf ub_QRAM113 (b_Q[113], Q_RAM[113]);
buf ub_QRAM114 (b_Q[114], Q_RAM[114]);
buf ub_QRAM115 (b_Q[115], Q_RAM[115]);
buf ub_QRAM116 (b_Q[116], Q_RAM[116]);
buf ub_QRAM117 (b_Q[117], Q_RAM[117]);
buf ub_QRAM118 (b_Q[118], Q_RAM[118]);
buf ub_QRAM119 (b_Q[119], Q_RAM[119]);
buf ub_QRAM120 (b_Q[120], Q_RAM[120]);
buf ub_QRAM121 (b_Q[121], Q_RAM[121]);
buf ub_QRAM122 (b_Q[122], Q_RAM[122]);
buf ub_QRAM123 (b_Q[123], Q_RAM[123]);
buf ub_QRAM124 (b_Q[124], Q_RAM[124]);
buf ub_QRAM125 (b_Q[125], Q_RAM[125]);
buf ub_QRAM126 (b_Q[126], Q_RAM[126]);
buf ub_QRAM127 (b_Q[127], Q_RAM[127]);
buf ub_QRAM128 (b_Q[128], Q_RAM[128]);
buf ub_QRAM129 (b_Q[129], Q_RAM[129]);
buf ub_QRAM130 (b_Q[130], Q_RAM[130]);
buf ub_QRAM131 (b_Q[131], Q_RAM[131]);
buf ub_QRAM132 (b_Q[132], Q_RAM[132]);
buf ub_QRAM133 (b_Q[133], Q_RAM[133]);
buf ub_QRAM134 (b_Q[134], Q_RAM[134]);
buf ub_QRAM135 (b_Q[135], Q_RAM[135]);
buf ub_QRAM136 (b_Q[136], Q_RAM[136]);
buf ub_QRAM137 (b_Q[137], Q_RAM[137]);
buf ub_QRAM138 (b_Q[138], Q_RAM[138]);
buf ub_QRAM139 (b_Q[139], Q_RAM[139]);
buf ub_QRAM140 (b_Q[140], Q_RAM[140]);
buf ub_QRAM141 (b_Q[141], Q_RAM[141]);
buf ub_QRAM142 (b_Q[142], Q_RAM[142]);
buf ub_QRAM143 (b_Q[143], Q_RAM[143]);


//---- Q assignment
_MUX um_Q0 (peri_off, b_Q[0], 1'bx, Q[0]);
_MUX um_Q1 (peri_off, b_Q[1], 1'bx, Q[1]);
_MUX um_Q2 (peri_off, b_Q[2], 1'bx, Q[2]);
_MUX um_Q3 (peri_off, b_Q[3], 1'bx, Q[3]);
_MUX um_Q4 (peri_off, b_Q[4], 1'bx, Q[4]);
_MUX um_Q5 (peri_off, b_Q[5], 1'bx, Q[5]);
_MUX um_Q6 (peri_off, b_Q[6], 1'bx, Q[6]);
_MUX um_Q7 (peri_off, b_Q[7], 1'bx, Q[7]);
_MUX um_Q8 (peri_off, b_Q[8], 1'bx, Q[8]);
_MUX um_Q9 (peri_off, b_Q[9], 1'bx, Q[9]);
_MUX um_Q10 (peri_off, b_Q[10], 1'bx, Q[10]);
_MUX um_Q11 (peri_off, b_Q[11], 1'bx, Q[11]);
_MUX um_Q12 (peri_off, b_Q[12], 1'bx, Q[12]);
_MUX um_Q13 (peri_off, b_Q[13], 1'bx, Q[13]);
_MUX um_Q14 (peri_off, b_Q[14], 1'bx, Q[14]);
_MUX um_Q15 (peri_off, b_Q[15], 1'bx, Q[15]);
_MUX um_Q16 (peri_off, b_Q[16], 1'bx, Q[16]);
_MUX um_Q17 (peri_off, b_Q[17], 1'bx, Q[17]);
_MUX um_Q18 (peri_off, b_Q[18], 1'bx, Q[18]);
_MUX um_Q19 (peri_off, b_Q[19], 1'bx, Q[19]);
_MUX um_Q20 (peri_off, b_Q[20], 1'bx, Q[20]);
_MUX um_Q21 (peri_off, b_Q[21], 1'bx, Q[21]);
_MUX um_Q22 (peri_off, b_Q[22], 1'bx, Q[22]);
_MUX um_Q23 (peri_off, b_Q[23], 1'bx, Q[23]);
_MUX um_Q24 (peri_off, b_Q[24], 1'bx, Q[24]);
_MUX um_Q25 (peri_off, b_Q[25], 1'bx, Q[25]);
_MUX um_Q26 (peri_off, b_Q[26], 1'bx, Q[26]);
_MUX um_Q27 (peri_off, b_Q[27], 1'bx, Q[27]);
_MUX um_Q28 (peri_off, b_Q[28], 1'bx, Q[28]);
_MUX um_Q29 (peri_off, b_Q[29], 1'bx, Q[29]);
_MUX um_Q30 (peri_off, b_Q[30], 1'bx, Q[30]);
_MUX um_Q31 (peri_off, b_Q[31], 1'bx, Q[31]);
_MUX um_Q32 (peri_off, b_Q[32], 1'bx, Q[32]);
_MUX um_Q33 (peri_off, b_Q[33], 1'bx, Q[33]);
_MUX um_Q34 (peri_off, b_Q[34], 1'bx, Q[34]);
_MUX um_Q35 (peri_off, b_Q[35], 1'bx, Q[35]);
_MUX um_Q36 (peri_off, b_Q[36], 1'bx, Q[36]);
_MUX um_Q37 (peri_off, b_Q[37], 1'bx, Q[37]);
_MUX um_Q38 (peri_off, b_Q[38], 1'bx, Q[38]);
_MUX um_Q39 (peri_off, b_Q[39], 1'bx, Q[39]);
_MUX um_Q40 (peri_off, b_Q[40], 1'bx, Q[40]);
_MUX um_Q41 (peri_off, b_Q[41], 1'bx, Q[41]);
_MUX um_Q42 (peri_off, b_Q[42], 1'bx, Q[42]);
_MUX um_Q43 (peri_off, b_Q[43], 1'bx, Q[43]);
_MUX um_Q44 (peri_off, b_Q[44], 1'bx, Q[44]);
_MUX um_Q45 (peri_off, b_Q[45], 1'bx, Q[45]);
_MUX um_Q46 (peri_off, b_Q[46], 1'bx, Q[46]);
_MUX um_Q47 (peri_off, b_Q[47], 1'bx, Q[47]);
_MUX um_Q48 (peri_off, b_Q[48], 1'bx, Q[48]);
_MUX um_Q49 (peri_off, b_Q[49], 1'bx, Q[49]);
_MUX um_Q50 (peri_off, b_Q[50], 1'bx, Q[50]);
_MUX um_Q51 (peri_off, b_Q[51], 1'bx, Q[51]);
_MUX um_Q52 (peri_off, b_Q[52], 1'bx, Q[52]);
_MUX um_Q53 (peri_off, b_Q[53], 1'bx, Q[53]);
_MUX um_Q54 (peri_off, b_Q[54], 1'bx, Q[54]);
_MUX um_Q55 (peri_off, b_Q[55], 1'bx, Q[55]);
_MUX um_Q56 (peri_off, b_Q[56], 1'bx, Q[56]);
_MUX um_Q57 (peri_off, b_Q[57], 1'bx, Q[57]);
_MUX um_Q58 (peri_off, b_Q[58], 1'bx, Q[58]);
_MUX um_Q59 (peri_off, b_Q[59], 1'bx, Q[59]);
_MUX um_Q60 (peri_off, b_Q[60], 1'bx, Q[60]);
_MUX um_Q61 (peri_off, b_Q[61], 1'bx, Q[61]);
_MUX um_Q62 (peri_off, b_Q[62], 1'bx, Q[62]);
_MUX um_Q63 (peri_off, b_Q[63], 1'bx, Q[63]);
_MUX um_Q64 (peri_off, b_Q[64], 1'bx, Q[64]);
_MUX um_Q65 (peri_off, b_Q[65], 1'bx, Q[65]);
_MUX um_Q66 (peri_off, b_Q[66], 1'bx, Q[66]);
_MUX um_Q67 (peri_off, b_Q[67], 1'bx, Q[67]);
_MUX um_Q68 (peri_off, b_Q[68], 1'bx, Q[68]);
_MUX um_Q69 (peri_off, b_Q[69], 1'bx, Q[69]);
_MUX um_Q70 (peri_off, b_Q[70], 1'bx, Q[70]);
_MUX um_Q71 (peri_off, b_Q[71], 1'bx, Q[71]);
_MUX um_Q72 (peri_off, b_Q[72], 1'bx, Q[72]);
_MUX um_Q73 (peri_off, b_Q[73], 1'bx, Q[73]);
_MUX um_Q74 (peri_off, b_Q[74], 1'bx, Q[74]);
_MUX um_Q75 (peri_off, b_Q[75], 1'bx, Q[75]);
_MUX um_Q76 (peri_off, b_Q[76], 1'bx, Q[76]);
_MUX um_Q77 (peri_off, b_Q[77], 1'bx, Q[77]);
_MUX um_Q78 (peri_off, b_Q[78], 1'bx, Q[78]);
_MUX um_Q79 (peri_off, b_Q[79], 1'bx, Q[79]);
_MUX um_Q80 (peri_off, b_Q[80], 1'bx, Q[80]);
_MUX um_Q81 (peri_off, b_Q[81], 1'bx, Q[81]);
_MUX um_Q82 (peri_off, b_Q[82], 1'bx, Q[82]);
_MUX um_Q83 (peri_off, b_Q[83], 1'bx, Q[83]);
_MUX um_Q84 (peri_off, b_Q[84], 1'bx, Q[84]);
_MUX um_Q85 (peri_off, b_Q[85], 1'bx, Q[85]);
_MUX um_Q86 (peri_off, b_Q[86], 1'bx, Q[86]);
_MUX um_Q87 (peri_off, b_Q[87], 1'bx, Q[87]);
_MUX um_Q88 (peri_off, b_Q[88], 1'bx, Q[88]);
_MUX um_Q89 (peri_off, b_Q[89], 1'bx, Q[89]);
_MUX um_Q90 (peri_off, b_Q[90], 1'bx, Q[90]);
_MUX um_Q91 (peri_off, b_Q[91], 1'bx, Q[91]);
_MUX um_Q92 (peri_off, b_Q[92], 1'bx, Q[92]);
_MUX um_Q93 (peri_off, b_Q[93], 1'bx, Q[93]);
_MUX um_Q94 (peri_off, b_Q[94], 1'bx, Q[94]);
_MUX um_Q95 (peri_off, b_Q[95], 1'bx, Q[95]);
_MUX um_Q96 (peri_off, b_Q[96], 1'bx, Q[96]);
_MUX um_Q97 (peri_off, b_Q[97], 1'bx, Q[97]);
_MUX um_Q98 (peri_off, b_Q[98], 1'bx, Q[98]);
_MUX um_Q99 (peri_off, b_Q[99], 1'bx, Q[99]);
_MUX um_Q100 (peri_off, b_Q[100], 1'bx, Q[100]);
_MUX um_Q101 (peri_off, b_Q[101], 1'bx, Q[101]);
_MUX um_Q102 (peri_off, b_Q[102], 1'bx, Q[102]);
_MUX um_Q103 (peri_off, b_Q[103], 1'bx, Q[103]);
_MUX um_Q104 (peri_off, b_Q[104], 1'bx, Q[104]);
_MUX um_Q105 (peri_off, b_Q[105], 1'bx, Q[105]);
_MUX um_Q106 (peri_off, b_Q[106], 1'bx, Q[106]);
_MUX um_Q107 (peri_off, b_Q[107], 1'bx, Q[107]);
_MUX um_Q108 (peri_off, b_Q[108], 1'bx, Q[108]);
_MUX um_Q109 (peri_off, b_Q[109], 1'bx, Q[109]);
_MUX um_Q110 (peri_off, b_Q[110], 1'bx, Q[110]);
_MUX um_Q111 (peri_off, b_Q[111], 1'bx, Q[111]);
_MUX um_Q112 (peri_off, b_Q[112], 1'bx, Q[112]);
_MUX um_Q113 (peri_off, b_Q[113], 1'bx, Q[113]);
_MUX um_Q114 (peri_off, b_Q[114], 1'bx, Q[114]);
_MUX um_Q115 (peri_off, b_Q[115], 1'bx, Q[115]);
_MUX um_Q116 (peri_off, b_Q[116], 1'bx, Q[116]);
_MUX um_Q117 (peri_off, b_Q[117], 1'bx, Q[117]);
_MUX um_Q118 (peri_off, b_Q[118], 1'bx, Q[118]);
_MUX um_Q119 (peri_off, b_Q[119], 1'bx, Q[119]);
_MUX um_Q120 (peri_off, b_Q[120], 1'bx, Q[120]);
_MUX um_Q121 (peri_off, b_Q[121], 1'bx, Q[121]);
_MUX um_Q122 (peri_off, b_Q[122], 1'bx, Q[122]);
_MUX um_Q123 (peri_off, b_Q[123], 1'bx, Q[123]);
_MUX um_Q124 (peri_off, b_Q[124], 1'bx, Q[124]);
_MUX um_Q125 (peri_off, b_Q[125], 1'bx, Q[125]);
_MUX um_Q126 (peri_off, b_Q[126], 1'bx, Q[126]);
_MUX um_Q127 (peri_off, b_Q[127], 1'bx, Q[127]);
_MUX um_Q128 (peri_off, b_Q[128], 1'bx, Q[128]);
_MUX um_Q129 (peri_off, b_Q[129], 1'bx, Q[129]);
_MUX um_Q130 (peri_off, b_Q[130], 1'bx, Q[130]);
_MUX um_Q131 (peri_off, b_Q[131], 1'bx, Q[131]);
_MUX um_Q132 (peri_off, b_Q[132], 1'bx, Q[132]);
_MUX um_Q133 (peri_off, b_Q[133], 1'bx, Q[133]);
_MUX um_Q134 (peri_off, b_Q[134], 1'bx, Q[134]);
_MUX um_Q135 (peri_off, b_Q[135], 1'bx, Q[135]);
_MUX um_Q136 (peri_off, b_Q[136], 1'bx, Q[136]);
_MUX um_Q137 (peri_off, b_Q[137], 1'bx, Q[137]);
_MUX um_Q138 (peri_off, b_Q[138], 1'bx, Q[138]);
_MUX um_Q139 (peri_off, b_Q[139], 1'bx, Q[139]);
_MUX um_Q140 (peri_off, b_Q[140], 1'bx, Q[140]);
_MUX um_Q141 (peri_off, b_Q[141], 1'bx, Q[141]);
_MUX um_Q142 (peri_off, b_Q[142], 1'bx, Q[142]);
_MUX um_Q143 (peri_off, b_Q[143], 1'bx, Q[143]);

endmodule
`nosuppress_faults
`disable_portfaults


//-------- Functional Module Definition --------//
`celldefine
//-------- Memory Core Data Handling --------//
module TS1N16FFCLLSBLVTC1024X144M4SW_RAM_D_handle ( MEM, D, BWEB, Z );

//-------- Declare IO --------//
input [143:0] MEM;
input [143:0] D;
input [143:0] BWEB;

output [143:0] Z;

//-------- BWEB handling -------//
_MUX m_0 (BWEB[0], D[0], MEM[0], Z[0]);
_MUX m_1 (BWEB[1], D[1], MEM[1], Z[1]);
_MUX m_2 (BWEB[2], D[2], MEM[2], Z[2]);
_MUX m_3 (BWEB[3], D[3], MEM[3], Z[3]);
_MUX m_4 (BWEB[4], D[4], MEM[4], Z[4]);
_MUX m_5 (BWEB[5], D[5], MEM[5], Z[5]);
_MUX m_6 (BWEB[6], D[6], MEM[6], Z[6]);
_MUX m_7 (BWEB[7], D[7], MEM[7], Z[7]);
_MUX m_8 (BWEB[8], D[8], MEM[8], Z[8]);
_MUX m_9 (BWEB[9], D[9], MEM[9], Z[9]);
_MUX m_10 (BWEB[10], D[10], MEM[10], Z[10]);
_MUX m_11 (BWEB[11], D[11], MEM[11], Z[11]);
_MUX m_12 (BWEB[12], D[12], MEM[12], Z[12]);
_MUX m_13 (BWEB[13], D[13], MEM[13], Z[13]);
_MUX m_14 (BWEB[14], D[14], MEM[14], Z[14]);
_MUX m_15 (BWEB[15], D[15], MEM[15], Z[15]);
_MUX m_16 (BWEB[16], D[16], MEM[16], Z[16]);
_MUX m_17 (BWEB[17], D[17], MEM[17], Z[17]);
_MUX m_18 (BWEB[18], D[18], MEM[18], Z[18]);
_MUX m_19 (BWEB[19], D[19], MEM[19], Z[19]);
_MUX m_20 (BWEB[20], D[20], MEM[20], Z[20]);
_MUX m_21 (BWEB[21], D[21], MEM[21], Z[21]);
_MUX m_22 (BWEB[22], D[22], MEM[22], Z[22]);
_MUX m_23 (BWEB[23], D[23], MEM[23], Z[23]);
_MUX m_24 (BWEB[24], D[24], MEM[24], Z[24]);
_MUX m_25 (BWEB[25], D[25], MEM[25], Z[25]);
_MUX m_26 (BWEB[26], D[26], MEM[26], Z[26]);
_MUX m_27 (BWEB[27], D[27], MEM[27], Z[27]);
_MUX m_28 (BWEB[28], D[28], MEM[28], Z[28]);
_MUX m_29 (BWEB[29], D[29], MEM[29], Z[29]);
_MUX m_30 (BWEB[30], D[30], MEM[30], Z[30]);
_MUX m_31 (BWEB[31], D[31], MEM[31], Z[31]);
_MUX m_32 (BWEB[32], D[32], MEM[32], Z[32]);
_MUX m_33 (BWEB[33], D[33], MEM[33], Z[33]);
_MUX m_34 (BWEB[34], D[34], MEM[34], Z[34]);
_MUX m_35 (BWEB[35], D[35], MEM[35], Z[35]);
_MUX m_36 (BWEB[36], D[36], MEM[36], Z[36]);
_MUX m_37 (BWEB[37], D[37], MEM[37], Z[37]);
_MUX m_38 (BWEB[38], D[38], MEM[38], Z[38]);
_MUX m_39 (BWEB[39], D[39], MEM[39], Z[39]);
_MUX m_40 (BWEB[40], D[40], MEM[40], Z[40]);
_MUX m_41 (BWEB[41], D[41], MEM[41], Z[41]);
_MUX m_42 (BWEB[42], D[42], MEM[42], Z[42]);
_MUX m_43 (BWEB[43], D[43], MEM[43], Z[43]);
_MUX m_44 (BWEB[44], D[44], MEM[44], Z[44]);
_MUX m_45 (BWEB[45], D[45], MEM[45], Z[45]);
_MUX m_46 (BWEB[46], D[46], MEM[46], Z[46]);
_MUX m_47 (BWEB[47], D[47], MEM[47], Z[47]);
_MUX m_48 (BWEB[48], D[48], MEM[48], Z[48]);
_MUX m_49 (BWEB[49], D[49], MEM[49], Z[49]);
_MUX m_50 (BWEB[50], D[50], MEM[50], Z[50]);
_MUX m_51 (BWEB[51], D[51], MEM[51], Z[51]);
_MUX m_52 (BWEB[52], D[52], MEM[52], Z[52]);
_MUX m_53 (BWEB[53], D[53], MEM[53], Z[53]);
_MUX m_54 (BWEB[54], D[54], MEM[54], Z[54]);
_MUX m_55 (BWEB[55], D[55], MEM[55], Z[55]);
_MUX m_56 (BWEB[56], D[56], MEM[56], Z[56]);
_MUX m_57 (BWEB[57], D[57], MEM[57], Z[57]);
_MUX m_58 (BWEB[58], D[58], MEM[58], Z[58]);
_MUX m_59 (BWEB[59], D[59], MEM[59], Z[59]);
_MUX m_60 (BWEB[60], D[60], MEM[60], Z[60]);
_MUX m_61 (BWEB[61], D[61], MEM[61], Z[61]);
_MUX m_62 (BWEB[62], D[62], MEM[62], Z[62]);
_MUX m_63 (BWEB[63], D[63], MEM[63], Z[63]);
_MUX m_64 (BWEB[64], D[64], MEM[64], Z[64]);
_MUX m_65 (BWEB[65], D[65], MEM[65], Z[65]);
_MUX m_66 (BWEB[66], D[66], MEM[66], Z[66]);
_MUX m_67 (BWEB[67], D[67], MEM[67], Z[67]);
_MUX m_68 (BWEB[68], D[68], MEM[68], Z[68]);
_MUX m_69 (BWEB[69], D[69], MEM[69], Z[69]);
_MUX m_70 (BWEB[70], D[70], MEM[70], Z[70]);
_MUX m_71 (BWEB[71], D[71], MEM[71], Z[71]);
_MUX m_72 (BWEB[72], D[72], MEM[72], Z[72]);
_MUX m_73 (BWEB[73], D[73], MEM[73], Z[73]);
_MUX m_74 (BWEB[74], D[74], MEM[74], Z[74]);
_MUX m_75 (BWEB[75], D[75], MEM[75], Z[75]);
_MUX m_76 (BWEB[76], D[76], MEM[76], Z[76]);
_MUX m_77 (BWEB[77], D[77], MEM[77], Z[77]);
_MUX m_78 (BWEB[78], D[78], MEM[78], Z[78]);
_MUX m_79 (BWEB[79], D[79], MEM[79], Z[79]);
_MUX m_80 (BWEB[80], D[80], MEM[80], Z[80]);
_MUX m_81 (BWEB[81], D[81], MEM[81], Z[81]);
_MUX m_82 (BWEB[82], D[82], MEM[82], Z[82]);
_MUX m_83 (BWEB[83], D[83], MEM[83], Z[83]);
_MUX m_84 (BWEB[84], D[84], MEM[84], Z[84]);
_MUX m_85 (BWEB[85], D[85], MEM[85], Z[85]);
_MUX m_86 (BWEB[86], D[86], MEM[86], Z[86]);
_MUX m_87 (BWEB[87], D[87], MEM[87], Z[87]);
_MUX m_88 (BWEB[88], D[88], MEM[88], Z[88]);
_MUX m_89 (BWEB[89], D[89], MEM[89], Z[89]);
_MUX m_90 (BWEB[90], D[90], MEM[90], Z[90]);
_MUX m_91 (BWEB[91], D[91], MEM[91], Z[91]);
_MUX m_92 (BWEB[92], D[92], MEM[92], Z[92]);
_MUX m_93 (BWEB[93], D[93], MEM[93], Z[93]);
_MUX m_94 (BWEB[94], D[94], MEM[94], Z[94]);
_MUX m_95 (BWEB[95], D[95], MEM[95], Z[95]);
_MUX m_96 (BWEB[96], D[96], MEM[96], Z[96]);
_MUX m_97 (BWEB[97], D[97], MEM[97], Z[97]);
_MUX m_98 (BWEB[98], D[98], MEM[98], Z[98]);
_MUX m_99 (BWEB[99], D[99], MEM[99], Z[99]);
_MUX m_100 (BWEB[100], D[100], MEM[100], Z[100]);
_MUX m_101 (BWEB[101], D[101], MEM[101], Z[101]);
_MUX m_102 (BWEB[102], D[102], MEM[102], Z[102]);
_MUX m_103 (BWEB[103], D[103], MEM[103], Z[103]);
_MUX m_104 (BWEB[104], D[104], MEM[104], Z[104]);
_MUX m_105 (BWEB[105], D[105], MEM[105], Z[105]);
_MUX m_106 (BWEB[106], D[106], MEM[106], Z[106]);
_MUX m_107 (BWEB[107], D[107], MEM[107], Z[107]);
_MUX m_108 (BWEB[108], D[108], MEM[108], Z[108]);
_MUX m_109 (BWEB[109], D[109], MEM[109], Z[109]);
_MUX m_110 (BWEB[110], D[110], MEM[110], Z[110]);
_MUX m_111 (BWEB[111], D[111], MEM[111], Z[111]);
_MUX m_112 (BWEB[112], D[112], MEM[112], Z[112]);
_MUX m_113 (BWEB[113], D[113], MEM[113], Z[113]);
_MUX m_114 (BWEB[114], D[114], MEM[114], Z[114]);
_MUX m_115 (BWEB[115], D[115], MEM[115], Z[115]);
_MUX m_116 (BWEB[116], D[116], MEM[116], Z[116]);
_MUX m_117 (BWEB[117], D[117], MEM[117], Z[117]);
_MUX m_118 (BWEB[118], D[118], MEM[118], Z[118]);
_MUX m_119 (BWEB[119], D[119], MEM[119], Z[119]);
_MUX m_120 (BWEB[120], D[120], MEM[120], Z[120]);
_MUX m_121 (BWEB[121], D[121], MEM[121], Z[121]);
_MUX m_122 (BWEB[122], D[122], MEM[122], Z[122]);
_MUX m_123 (BWEB[123], D[123], MEM[123], Z[123]);
_MUX m_124 (BWEB[124], D[124], MEM[124], Z[124]);
_MUX m_125 (BWEB[125], D[125], MEM[125], Z[125]);
_MUX m_126 (BWEB[126], D[126], MEM[126], Z[126]);
_MUX m_127 (BWEB[127], D[127], MEM[127], Z[127]);
_MUX m_128 (BWEB[128], D[128], MEM[128], Z[128]);
_MUX m_129 (BWEB[129], D[129], MEM[129], Z[129]);
_MUX m_130 (BWEB[130], D[130], MEM[130], Z[130]);
_MUX m_131 (BWEB[131], D[131], MEM[131], Z[131]);
_MUX m_132 (BWEB[132], D[132], MEM[132], Z[132]);
_MUX m_133 (BWEB[133], D[133], MEM[133], Z[133]);
_MUX m_134 (BWEB[134], D[134], MEM[134], Z[134]);
_MUX m_135 (BWEB[135], D[135], MEM[135], Z[135]);
_MUX m_136 (BWEB[136], D[136], MEM[136], Z[136]);
_MUX m_137 (BWEB[137], D[137], MEM[137], Z[137]);
_MUX m_138 (BWEB[138], D[138], MEM[138], Z[138]);
_MUX m_139 (BWEB[139], D[139], MEM[139], Z[139]);
_MUX m_140 (BWEB[140], D[140], MEM[140], Z[140]);
_MUX m_141 (BWEB[141], D[141], MEM[141], Z[141]);
_MUX m_142 (BWEB[142], D[142], MEM[142], Z[142]);
_MUX m_143 (BWEB[143], D[143], MEM[143], Z[143]);

endmodule
//-------- Memory Write/Read-En Function --------//
module TS1N16FFCLLSBLVTC1024X144M4SW_RAM_Enable_handle (
  MODE_SRAM_OP,
  RAM_WEB,
  RAM_CEB,
  RAM_WRITE,
  RAM_READ
);

//-------- Declare IO --------//
input MODE_SRAM_OP;
input RAM_WEB;
input RAM_CEB;

output RAM_WRITE;
output RAM_READ;

//---- function ----//
and u_write (RAM_WRITE, MODE_SRAM_OP, !RAM_CEB, !RAM_WEB);
and u_read  (RAM_READ,  MODE_SRAM_OP, !RAM_CEB, RAM_WEB);

endmodule

//-------- Memory Core Function --------//
module TS1N16FFCLLSBLVTC1024X144M4SW_RAM_Core (
  //---- clock
  RAM_CLK,
  //---- RAM IO
  RAM_D,
  RAM_A,
  RAM_WRITE,
  RAM_READ,
  RAM_BWEB,
  //---- output
  RAM_Q
);

//-------- Declare IO --------//
input RAM_CLK;
input RAM_WRITE;
input RAM_READ;
input [143:0] RAM_D;
input [143:0] RAM_BWEB;
input [9:0] RAM_A;

output [143:0] RAM_Q;

//-------- Declare reg & wire --------//
//---- memory
reg [143:0] MEMORY[1023:0];
reg [143:0] RAM_Q;

//---- Data
wire [143:0] data_in;
reg  [143:0] data_mem;
event write_OP;

//-------- Combinational Network --------//
//---- input data handling
TS1N16FFCLLSBLVTC1024X144M4SW_RAM_D_handle u_RDH0 (.MEM(data_mem), .D(RAM_D), .BWEB(RAM_BWEB), .Z(data_in));

//-------- RAM Core Operation --------//

//---- Write
always @(posedge RAM_CLK)
  if (RAM_WRITE) begin
    MEMORY[RAM_A] = data_in;
    #0; -> write_OP;
  end

//---- Read original data for write operation
always @(RAM_WRITE or RAM_A or RAM_CLK or write_OP)
  if (RAM_WRITE) begin
    data_mem = MEMORY[RAM_A];
  end

//---- Read

always @(posedge RAM_CLK)
  if (RAM_READ) begin
    RAM_Q = MEMORY[RAM_A];
  end

endmodule


`endcelldefine
