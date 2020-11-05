/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr  2 10:09:01 2020
/////////////////////////////////////////////////////////////


module ahb_lite_slave ( clk, n_rst, modwait, err, hsel, hsize, hwrite, 
        coefficient_num, htrans, haddr, fir_out, hwdata, data_ready, 
        new_coefficient_set, hresp, sample_data, fir_coefficient, hrdata );
  input [1:0] coefficient_num;
  input [1:0] htrans;
  input [3:0] haddr;
  input [15:0] fir_out;
  input [15:0] hwdata;
  output [15:0] sample_data;
  output [15:0] fir_coefficient;
  output [15:0] hrdata;
  input clk, n_rst, modwait, err, hsel, hsize, hwrite;
  output data_ready, new_coefficient_set, hresp;
  wire   N92, N169, N170, N171, N172, N173, N175, N176, N177, N179, N180, N181,
         \mapping[15][7] , \mapping[15][6] , \mapping[15][5] ,
         \mapping[15][4] , \mapping[15][3] , \mapping[15][2] ,
         \mapping[15][1] , \mapping[15][0] , \mapping[14][7] ,
         \mapping[14][6] , \mapping[14][5] , \mapping[14][4] ,
         \mapping[14][3] , \mapping[14][2] , \mapping[14][1] ,
         \mapping[13][7] , \mapping[13][6] , \mapping[13][5] ,
         \mapping[13][4] , \mapping[13][3] , \mapping[13][2] ,
         \mapping[13][1] , \mapping[13][0] , \mapping[12][7] ,
         \mapping[12][6] , \mapping[12][5] , \mapping[12][4] ,
         \mapping[12][3] , \mapping[12][2] , \mapping[12][1] ,
         \mapping[12][0] , \mapping[11][7] , \mapping[11][6] ,
         \mapping[11][5] , \mapping[11][4] , \mapping[11][3] ,
         \mapping[11][2] , \mapping[11][1] , \mapping[11][0] ,
         \mapping[10][7] , \mapping[10][6] , \mapping[10][5] ,
         \mapping[10][4] , \mapping[10][3] , \mapping[10][2] ,
         \mapping[10][1] , \mapping[10][0] , \mapping[9][7] , \mapping[9][6] ,
         \mapping[9][5] , \mapping[9][4] , \mapping[9][3] , \mapping[9][2] ,
         \mapping[9][1] , \mapping[9][0] , \mapping[8][7] , \mapping[8][6] ,
         \mapping[8][5] , \mapping[8][4] , \mapping[8][3] , \mapping[8][2] ,
         \mapping[8][1] , \mapping[8][0] , \mapping[7][7] , \mapping[7][6] ,
         \mapping[7][5] , \mapping[7][4] , \mapping[7][3] , \mapping[7][2] ,
         \mapping[7][1] , \mapping[7][0] , \mapping[6][7] , \mapping[6][6] ,
         \mapping[6][5] , \mapping[6][4] , \mapping[6][3] , \mapping[6][2] ,
         \mapping[6][1] , \mapping[6][0] , \mapping[3][7] , \mapping[3][6] ,
         \mapping[3][5] , \mapping[3][4] , \mapping[3][3] , \mapping[3][2] ,
         \mapping[3][1] , \mapping[3][0] , \mapping[2][7] , \mapping[2][6] ,
         \mapping[2][5] , \mapping[2][4] , \mapping[2][3] , \mapping[2][2] ,
         \mapping[2][1] , \mapping[2][0] , \mapping[1][7] , \mapping[1][6] ,
         \mapping[1][5] , \mapping[1][4] , \mapping[1][3] , \mapping[1][2] ,
         \mapping[1][1] , \mapping[1][0] , \mapping[0][7] , \mapping[0][6] ,
         \mapping[0][5] , \mapping[0][4] , \mapping[0][3] , \mapping[0][2] ,
         \mapping[0][1] , \mapping[0][0] , nxt_hsize, \nxt_mapping[15][7] ,
         \nxt_mapping[15][6] , \nxt_mapping[15][5] , \nxt_mapping[15][4] ,
         \nxt_mapping[15][3] , \nxt_mapping[15][2] , \nxt_mapping[15][1] ,
         \nxt_mapping[15][0] , \nxt_mapping[14][7] , \nxt_mapping[14][6] ,
         \nxt_mapping[14][5] , \nxt_mapping[14][4] , \nxt_mapping[14][3] ,
         \nxt_mapping[14][2] , \nxt_mapping[14][1] , \nxt_mapping[14][0] ,
         \nxt_mapping[3][7] , \nxt_mapping[3][6] , \nxt_mapping[3][5] ,
         \nxt_mapping[3][4] , \nxt_mapping[3][3] , \nxt_mapping[3][2] ,
         \nxt_mapping[3][1] , \nxt_mapping[3][0] , \nxt_mapping[2][7] ,
         \nxt_mapping[2][6] , \nxt_mapping[2][5] , \nxt_mapping[2][4] ,
         \nxt_mapping[2][3] , \nxt_mapping[2][2] , \nxt_mapping[2][1] ,
         \nxt_mapping[2][0] , \nxt_mapping[1][7] , \nxt_mapping[1][6] ,
         \nxt_mapping[1][5] , \nxt_mapping[1][4] , \nxt_mapping[1][3] ,
         \nxt_mapping[1][2] , \nxt_mapping[1][1] , \nxt_mapping[1][0] ,
         \nxt_mapping[0][7] , \nxt_mapping[0][6] , \nxt_mapping[0][5] ,
         \nxt_mapping[0][4] , \nxt_mapping[0][3] , \nxt_mapping[0][2] ,
         \nxt_mapping[0][1] , \nxt_mapping[0][0] , nxt_data_ready, N183, N1629,
         N1630, N1631, N1632, N1633, N1634, N1635, N1636, N1638, N1639, N1640,
         N1641, N1642, N1643, N1644, N1645, N1650, N1651, N1652, N1653, N1654,
         N1655, N1656, N1657, n459, n462, n1008, n1009, n1010, n1011, n1012,
         n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022,
         n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032,
         n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042,
         n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052,
         n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062,
         n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072,
         n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082,
         n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1, n2, n3,
         n4, n5, n6, n7, n8, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n460, n461,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, n517,
         n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782, n783, n784, n785, n786, n787, n788, n789, n790, n791, n792,
         n793, n794, n795, n796, n797, n798, n799, n800, n801, n802, n803,
         n804, n805, n806, n807, n808, n809, n810, n811, n812, n813, n814,
         n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, n825,
         n826, n827, n828, n829, n830, n831, n832, n833, n834, n835, n836,
         n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847,
         n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n864, n865, n866, n867, n868, n869,
         n870, n871, n872, n873, n874, n875, n876, n877, n878, n879, n880,
         n881, n882, n883, n884, n885, n886, n887, n888, n889, n890, n891,
         n892, n893, n894, n895, n896, n897, n898, n899, n900, n901, n902,
         n903, n904, n905, n906, n907, n908, n909, n910, n911, n912, n913,
         n914, n915, n916, n917, n918, n919, n920, n921, n922, n923, n924,
         n925, n926, n927, n928, n929, n930, n931, n932, n933, n934, n935,
         n936, n937, n938, n939, n940, n941, n942, n943, n944, n945, n946,
         n947, n948, n949, n950, n951, n952, n953, n954, n955, n956, n957,
         n958, n959, n960, n961, n962, n963, n964, n965, n966, n967, n968,
         n969, n970, n971, n972, n973, n974, n975, n976, n977, n978, n979,
         n980, n981, n982, n983, n984, n985, n986, n987, n988, n989, n990,
         n991, n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001,
         n1002, n1003, n1004, n1005, n1006, n1007, n1091, n1092, n1093, n1094,
         n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104,
         n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114,
         n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124,
         n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134,
         n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144,
         n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154,
         n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164,
         n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174,
         n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184,
         n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194,
         n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204,
         n1205, n1206, n1207, n1208, n1209;
  wire   [1:0] state;
  wire   [1:0] nxtstate;
  assign hresp = N183;

  DFFSR \state_reg[0]  ( .D(nxtstate[0]), .CLK(clk), .R(n761), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nxtstate[1]), .CLK(clk), .R(n761), .S(1'b1), .Q(
        state[1]) );
  DFFSR nxt_hsize_reg ( .D(hsize), .CLK(clk), .R(n761), .S(1'b1), .Q(nxt_hsize) );
  DFFSR \nxt_haddr_reg[3]  ( .D(haddr[3]), .CLK(clk), .R(n761), .S(1'b1), .Q(
        N173) );
  DFFSR \nxt_haddr_reg[2]  ( .D(haddr[2]), .CLK(clk), .R(n760), .S(1'b1), .Q(
        N172) );
  DFFSR \nxt_haddr_reg[1]  ( .D(haddr[1]), .CLK(clk), .R(n760), .S(1'b1), .Q(
        N171) );
  DFFSR data_ready_reg ( .D(nxt_data_ready), .CLK(clk), .R(n760), .S(1'b1), 
        .Q(data_ready) );
  DFFSR \nxt_haddr_reg[0]  ( .D(haddr[0]), .CLK(clk), .R(n760), .S(1'b1), .Q(
        N92) );
  DFFSR \mapping_reg[0][7]  ( .D(\nxt_mapping[0][7] ), .CLK(clk), .R(n760), 
        .S(1'b1), .Q(\mapping[0][7] ) );
  DFFSR \mapping_reg[0][6]  ( .D(\nxt_mapping[0][6] ), .CLK(clk), .R(n760), 
        .S(1'b1), .Q(\mapping[0][6] ) );
  DFFSR \mapping_reg[0][5]  ( .D(\nxt_mapping[0][5] ), .CLK(clk), .R(n760), 
        .S(1'b1), .Q(\mapping[0][5] ) );
  DFFSR \mapping_reg[0][4]  ( .D(\nxt_mapping[0][4] ), .CLK(clk), .R(n760), 
        .S(1'b1), .Q(\mapping[0][4] ) );
  DFFSR \mapping_reg[0][3]  ( .D(\nxt_mapping[0][3] ), .CLK(clk), .R(n760), 
        .S(1'b1), .Q(\mapping[0][3] ) );
  DFFSR \mapping_reg[0][2]  ( .D(\nxt_mapping[0][2] ), .CLK(clk), .R(n760), 
        .S(1'b1), .Q(\mapping[0][2] ) );
  DFFSR \mapping_reg[0][1]  ( .D(\nxt_mapping[0][1] ), .CLK(clk), .R(n760), 
        .S(1'b1), .Q(\mapping[0][1] ) );
  DFFSR \mapping_reg[15][7]  ( .D(\nxt_mapping[15][7] ), .CLK(clk), .R(n760), 
        .S(1'b1), .Q(\mapping[15][7] ) );
  DFFSR \mapping_reg[15][6]  ( .D(\nxt_mapping[15][6] ), .CLK(clk), .R(n759), 
        .S(1'b1), .Q(\mapping[15][6] ) );
  DFFSR \mapping_reg[15][5]  ( .D(\nxt_mapping[15][5] ), .CLK(clk), .R(n759), 
        .S(1'b1), .Q(\mapping[15][5] ) );
  DFFSR \mapping_reg[15][4]  ( .D(\nxt_mapping[15][4] ), .CLK(clk), .R(n759), 
        .S(1'b1), .Q(\mapping[15][4] ) );
  DFFSR \mapping_reg[15][3]  ( .D(\nxt_mapping[15][3] ), .CLK(clk), .R(n759), 
        .S(1'b1), .Q(\mapping[15][3] ) );
  DFFSR \mapping_reg[15][2]  ( .D(\nxt_mapping[15][2] ), .CLK(clk), .R(n759), 
        .S(1'b1), .Q(\mapping[15][2] ) );
  DFFSR \mapping_reg[15][1]  ( .D(\nxt_mapping[15][1] ), .CLK(clk), .R(n759), 
        .S(1'b1), .Q(\mapping[15][1] ) );
  DFFSR \mapping_reg[15][0]  ( .D(\nxt_mapping[15][0] ), .CLK(clk), .R(n759), 
        .S(1'b1), .Q(\mapping[15][0] ) );
  DFFSR \mapping_reg[14][0]  ( .D(\nxt_mapping[14][0] ), .CLK(clk), .R(n759), 
        .S(1'b1), .Q(new_coefficient_set) );
  DFFSR \mapping_reg[0][0]  ( .D(\nxt_mapping[0][0] ), .CLK(clk), .R(n759), 
        .S(1'b1), .Q(\mapping[0][0] ) );
  DFFSR \mapping_reg[2][0]  ( .D(\nxt_mapping[2][0] ), .CLK(clk), .R(n759), 
        .S(1'b1), .Q(\mapping[2][0] ) );
  DFFSR \mapping_reg[12][0]  ( .D(n1026), .CLK(clk), .R(n759), .S(1'b1), .Q(
        \mapping[12][0] ) );
  DFFSR \mapping_reg[10][0]  ( .D(n1042), .CLK(clk), .R(n759), .S(1'b1), .Q(
        \mapping[10][0] ) );
  DFFSR \mapping_reg[8][0]  ( .D(n1058), .CLK(clk), .R(n758), .S(1'b1), .Q(
        \mapping[8][0] ) );
  DFFSR \mapping_reg[6][0]  ( .D(n1074), .CLK(clk), .R(n758), .S(1'b1), .Q(
        \mapping[6][0] ) );
  DFFSR \mapping_reg[4][0]  ( .D(n1090), .CLK(clk), .R(n758), .S(1'b1), .Q(
        sample_data[0]) );
  DFFSR \mapping_reg[2][1]  ( .D(\nxt_mapping[2][1] ), .CLK(clk), .R(n758), 
        .S(1'b1), .Q(\mapping[2][1] ) );
  DFFSR \mapping_reg[14][1]  ( .D(\nxt_mapping[14][1] ), .CLK(clk), .R(n758), 
        .S(1'b1), .Q(\mapping[14][1] ) );
  DFFSR \mapping_reg[12][1]  ( .D(n1025), .CLK(clk), .R(n758), .S(1'b1), .Q(
        \mapping[12][1] ) );
  DFFSR \mapping_reg[10][1]  ( .D(n1041), .CLK(clk), .R(n758), .S(1'b1), .Q(
        \mapping[10][1] ) );
  DFFSR \mapping_reg[8][1]  ( .D(n1057), .CLK(clk), .R(n758), .S(1'b1), .Q(
        \mapping[8][1] ) );
  DFFSR \mapping_reg[6][1]  ( .D(n1073), .CLK(clk), .R(n758), .S(1'b1), .Q(
        \mapping[6][1] ) );
  DFFSR \mapping_reg[4][1]  ( .D(n1089), .CLK(clk), .R(n758), .S(1'b1), .Q(
        sample_data[1]) );
  DFFSR \mapping_reg[2][2]  ( .D(\nxt_mapping[2][2] ), .CLK(clk), .R(n758), 
        .S(1'b1), .Q(\mapping[2][2] ) );
  DFFSR \mapping_reg[14][2]  ( .D(\nxt_mapping[14][2] ), .CLK(clk), .R(n758), 
        .S(1'b1), .Q(\mapping[14][2] ) );
  DFFSR \mapping_reg[12][2]  ( .D(n1024), .CLK(clk), .R(n757), .S(1'b1), .Q(
        \mapping[12][2] ) );
  DFFSR \mapping_reg[10][2]  ( .D(n1040), .CLK(clk), .R(n757), .S(1'b1), .Q(
        \mapping[10][2] ) );
  DFFSR \mapping_reg[8][2]  ( .D(n1056), .CLK(clk), .R(n757), .S(1'b1), .Q(
        \mapping[8][2] ) );
  DFFSR \mapping_reg[6][2]  ( .D(n1072), .CLK(clk), .R(n757), .S(1'b1), .Q(
        \mapping[6][2] ) );
  DFFSR \mapping_reg[4][2]  ( .D(n1088), .CLK(clk), .R(n757), .S(1'b1), .Q(
        sample_data[2]) );
  DFFSR \mapping_reg[2][3]  ( .D(\nxt_mapping[2][3] ), .CLK(clk), .R(n757), 
        .S(1'b1), .Q(\mapping[2][3] ) );
  DFFSR \mapping_reg[14][3]  ( .D(\nxt_mapping[14][3] ), .CLK(clk), .R(n757), 
        .S(1'b1), .Q(\mapping[14][3] ) );
  DFFSR \mapping_reg[12][3]  ( .D(n1023), .CLK(clk), .R(n757), .S(1'b1), .Q(
        \mapping[12][3] ) );
  DFFSR \mapping_reg[10][3]  ( .D(n1039), .CLK(clk), .R(n757), .S(1'b1), .Q(
        \mapping[10][3] ) );
  DFFSR \mapping_reg[8][3]  ( .D(n1055), .CLK(clk), .R(n757), .S(1'b1), .Q(
        \mapping[8][3] ) );
  DFFSR \mapping_reg[6][3]  ( .D(n1071), .CLK(clk), .R(n757), .S(1'b1), .Q(
        \mapping[6][3] ) );
  DFFSR \mapping_reg[4][3]  ( .D(n1087), .CLK(clk), .R(n757), .S(1'b1), .Q(
        sample_data[3]) );
  DFFSR \mapping_reg[2][4]  ( .D(\nxt_mapping[2][4] ), .CLK(clk), .R(n756), 
        .S(1'b1), .Q(\mapping[2][4] ) );
  DFFSR \mapping_reg[14][4]  ( .D(\nxt_mapping[14][4] ), .CLK(clk), .R(n756), 
        .S(1'b1), .Q(\mapping[14][4] ) );
  DFFSR \mapping_reg[12][4]  ( .D(n1022), .CLK(clk), .R(n756), .S(1'b1), .Q(
        \mapping[12][4] ) );
  DFFSR \mapping_reg[10][4]  ( .D(n1038), .CLK(clk), .R(n756), .S(1'b1), .Q(
        \mapping[10][4] ) );
  DFFSR \mapping_reg[8][4]  ( .D(n1054), .CLK(clk), .R(n756), .S(1'b1), .Q(
        \mapping[8][4] ) );
  DFFSR \mapping_reg[6][4]  ( .D(n1070), .CLK(clk), .R(n756), .S(1'b1), .Q(
        \mapping[6][4] ) );
  DFFSR \mapping_reg[4][4]  ( .D(n1086), .CLK(clk), .R(n756), .S(1'b1), .Q(
        sample_data[4]) );
  DFFSR \mapping_reg[2][5]  ( .D(\nxt_mapping[2][5] ), .CLK(clk), .R(n756), 
        .S(1'b1), .Q(\mapping[2][5] ) );
  DFFSR \mapping_reg[14][5]  ( .D(\nxt_mapping[14][5] ), .CLK(clk), .R(n756), 
        .S(1'b1), .Q(\mapping[14][5] ) );
  DFFSR \mapping_reg[12][5]  ( .D(n1021), .CLK(clk), .R(n756), .S(1'b1), .Q(
        \mapping[12][5] ) );
  DFFSR \mapping_reg[10][5]  ( .D(n1037), .CLK(clk), .R(n756), .S(1'b1), .Q(
        \mapping[10][5] ) );
  DFFSR \mapping_reg[8][5]  ( .D(n1053), .CLK(clk), .R(n756), .S(1'b1), .Q(
        \mapping[8][5] ) );
  DFFSR \mapping_reg[6][5]  ( .D(n1069), .CLK(clk), .R(n755), .S(1'b1), .Q(
        \mapping[6][5] ) );
  DFFSR \mapping_reg[4][5]  ( .D(n1085), .CLK(clk), .R(n755), .S(1'b1), .Q(
        sample_data[5]) );
  DFFSR \mapping_reg[2][6]  ( .D(\nxt_mapping[2][6] ), .CLK(clk), .R(n755), 
        .S(1'b1), .Q(\mapping[2][6] ) );
  DFFSR \mapping_reg[14][6]  ( .D(\nxt_mapping[14][6] ), .CLK(clk), .R(n755), 
        .S(1'b1), .Q(\mapping[14][6] ) );
  DFFSR \mapping_reg[12][6]  ( .D(n1020), .CLK(clk), .R(n755), .S(1'b1), .Q(
        \mapping[12][6] ) );
  DFFSR \mapping_reg[10][6]  ( .D(n1036), .CLK(clk), .R(n755), .S(1'b1), .Q(
        \mapping[10][6] ) );
  DFFSR \mapping_reg[8][6]  ( .D(n1052), .CLK(clk), .R(n755), .S(1'b1), .Q(
        \mapping[8][6] ) );
  DFFSR \mapping_reg[6][6]  ( .D(n1068), .CLK(clk), .R(n755), .S(1'b1), .Q(
        \mapping[6][6] ) );
  DFFSR \mapping_reg[4][6]  ( .D(n1084), .CLK(clk), .R(n755), .S(1'b1), .Q(
        sample_data[6]) );
  DFFSR \mapping_reg[2][7]  ( .D(\nxt_mapping[2][7] ), .CLK(clk), .R(n755), 
        .S(1'b1), .Q(\mapping[2][7] ) );
  DFFSR \mapping_reg[14][7]  ( .D(\nxt_mapping[14][7] ), .CLK(clk), .R(n755), 
        .S(1'b1), .Q(\mapping[14][7] ) );
  DFFSR \mapping_reg[12][7]  ( .D(n1019), .CLK(clk), .R(n755), .S(1'b1), .Q(
        \mapping[12][7] ) );
  DFFSR \mapping_reg[10][7]  ( .D(n1035), .CLK(clk), .R(n754), .S(1'b1), .Q(
        \mapping[10][7] ) );
  DFFSR \mapping_reg[8][7]  ( .D(n1051), .CLK(clk), .R(n754), .S(1'b1), .Q(
        \mapping[8][7] ) );
  DFFSR \mapping_reg[6][7]  ( .D(n1067), .CLK(clk), .R(n754), .S(1'b1), .Q(
        \mapping[6][7] ) );
  DFFSR \mapping_reg[4][7]  ( .D(n1083), .CLK(clk), .R(n754), .S(1'b1), .Q(
        sample_data[7]) );
  DFFSR \mapping_reg[1][0]  ( .D(\nxt_mapping[1][0] ), .CLK(clk), .R(n754), 
        .S(1'b1), .Q(\mapping[1][0] ) );
  DFFSR \mapping_reg[1][7]  ( .D(\nxt_mapping[1][7] ), .CLK(clk), .R(n754), 
        .S(1'b1), .Q(\mapping[1][7] ) );
  DFFSR \mapping_reg[1][6]  ( .D(\nxt_mapping[1][6] ), .CLK(clk), .R(n754), 
        .S(1'b1), .Q(\mapping[1][6] ) );
  DFFSR \mapping_reg[1][5]  ( .D(\nxt_mapping[1][5] ), .CLK(clk), .R(n754), 
        .S(1'b1), .Q(\mapping[1][5] ) );
  DFFSR \mapping_reg[1][4]  ( .D(\nxt_mapping[1][4] ), .CLK(clk), .R(n754), 
        .S(1'b1), .Q(\mapping[1][4] ) );
  DFFSR \mapping_reg[1][3]  ( .D(\nxt_mapping[1][3] ), .CLK(clk), .R(n754), 
        .S(1'b1), .Q(\mapping[1][3] ) );
  DFFSR \mapping_reg[1][2]  ( .D(\nxt_mapping[1][2] ), .CLK(clk), .R(n754), 
        .S(1'b1), .Q(\mapping[1][2] ) );
  DFFSR \mapping_reg[1][1]  ( .D(\nxt_mapping[1][1] ), .CLK(clk), .R(n754), 
        .S(1'b1), .Q(\mapping[1][1] ) );
  DFFSR \mapping_reg[13][0]  ( .D(n1018), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[13][0] ) );
  DFFSR \mapping_reg[13][1]  ( .D(n1017), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[13][1] ) );
  DFFSR \mapping_reg[13][2]  ( .D(n1016), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[13][2] ) );
  DFFSR \mapping_reg[13][3]  ( .D(n1015), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[13][3] ) );
  DFFSR \mapping_reg[13][4]  ( .D(n1014), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[13][4] ) );
  DFFSR \mapping_reg[13][5]  ( .D(n1013), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[13][5] ) );
  DFFSR \mapping_reg[13][6]  ( .D(n1012), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[13][6] ) );
  DFFSR \mapping_reg[13][7]  ( .D(n1011), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[13][7] ) );
  DFFSR \mapping_reg[9][0]  ( .D(n1050), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[9][0] ) );
  DFFSR \mapping_reg[9][1]  ( .D(n1049), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[9][1] ) );
  DFFSR \mapping_reg[9][2]  ( .D(n1048), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[9][2] ) );
  DFFSR \mapping_reg[9][3]  ( .D(n1047), .CLK(clk), .R(n753), .S(1'b1), .Q(
        \mapping[9][3] ) );
  DFFSR \mapping_reg[9][4]  ( .D(n1046), .CLK(clk), .R(n752), .S(1'b1), .Q(
        \mapping[9][4] ) );
  DFFSR \mapping_reg[9][5]  ( .D(n1045), .CLK(clk), .R(n752), .S(1'b1), .Q(
        \mapping[9][5] ) );
  DFFSR \mapping_reg[9][6]  ( .D(n1044), .CLK(clk), .R(n752), .S(1'b1), .Q(
        \mapping[9][6] ) );
  DFFSR \mapping_reg[9][7]  ( .D(n1043), .CLK(clk), .R(n752), .S(1'b1), .Q(
        \mapping[9][7] ) );
  DFFSR \mapping_reg[5][0]  ( .D(n1082), .CLK(clk), .R(n752), .S(1'b1), .Q(
        sample_data[8]) );
  DFFSR \mapping_reg[5][1]  ( .D(n1081), .CLK(clk), .R(n752), .S(1'b1), .Q(
        sample_data[9]) );
  DFFSR \mapping_reg[5][2]  ( .D(n1080), .CLK(clk), .R(n752), .S(1'b1), .Q(
        sample_data[10]) );
  DFFSR \mapping_reg[5][3]  ( .D(n1079), .CLK(clk), .R(n752), .S(1'b1), .Q(
        sample_data[11]) );
  DFFSR \mapping_reg[5][4]  ( .D(n1078), .CLK(clk), .R(n752), .S(1'b1), .Q(
        sample_data[12]) );
  DFFSR \mapping_reg[5][5]  ( .D(n1077), .CLK(clk), .R(n752), .S(1'b1), .Q(
        sample_data[13]) );
  DFFSR \mapping_reg[5][6]  ( .D(n1076), .CLK(clk), .R(n752), .S(1'b1), .Q(
        sample_data[14]) );
  DFFSR \mapping_reg[5][7]  ( .D(n1075), .CLK(clk), .R(n752), .S(1'b1), .Q(
        sample_data[15]) );
  DFFSR \mapping_reg[3][7]  ( .D(\nxt_mapping[3][7] ), .CLK(clk), .R(n751), 
        .S(1'b1), .Q(\mapping[3][7] ) );
  DFFSR \mapping_reg[3][6]  ( .D(\nxt_mapping[3][6] ), .CLK(clk), .R(n751), 
        .S(1'b1), .Q(\mapping[3][6] ) );
  DFFSR \mapping_reg[3][5]  ( .D(\nxt_mapping[3][5] ), .CLK(clk), .R(n751), 
        .S(1'b1), .Q(\mapping[3][5] ) );
  DFFSR \mapping_reg[3][4]  ( .D(\nxt_mapping[3][4] ), .CLK(clk), .R(n751), 
        .S(1'b1), .Q(\mapping[3][4] ) );
  DFFSR \mapping_reg[3][3]  ( .D(\nxt_mapping[3][3] ), .CLK(clk), .R(n751), 
        .S(1'b1), .Q(\mapping[3][3] ) );
  DFFSR \mapping_reg[3][2]  ( .D(\nxt_mapping[3][2] ), .CLK(clk), .R(n751), 
        .S(1'b1), .Q(\mapping[3][2] ) );
  DFFSR \mapping_reg[3][1]  ( .D(\nxt_mapping[3][1] ), .CLK(clk), .R(n751), 
        .S(1'b1), .Q(\mapping[3][1] ) );
  DFFSR \mapping_reg[3][0]  ( .D(\nxt_mapping[3][0] ), .CLK(clk), .R(n751), 
        .S(1'b1), .Q(\mapping[3][0] ) );
  DFFSR \mapping_reg[11][0]  ( .D(n1034), .CLK(clk), .R(n751), .S(1'b1), .Q(
        \mapping[11][0] ) );
  DFFSR \mapping_reg[11][1]  ( .D(n1033), .CLK(clk), .R(n751), .S(1'b1), .Q(
        \mapping[11][1] ) );
  DFFSR \mapping_reg[11][2]  ( .D(n1032), .CLK(clk), .R(n751), .S(1'b1), .Q(
        \mapping[11][2] ) );
  DFFSR \mapping_reg[11][3]  ( .D(n1031), .CLK(clk), .R(n751), .S(1'b1), .Q(
        \mapping[11][3] ) );
  DFFSR \mapping_reg[11][4]  ( .D(n1030), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[11][4] ) );
  DFFSR \mapping_reg[11][5]  ( .D(n1029), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[11][5] ) );
  DFFSR \mapping_reg[11][6]  ( .D(n1028), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[11][6] ) );
  DFFSR \mapping_reg[11][7]  ( .D(n1027), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[11][7] ) );
  DFFSR \mapping_reg[7][0]  ( .D(n1066), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[7][0] ) );
  DFFSR \mapping_reg[7][1]  ( .D(n1065), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[7][1] ) );
  DFFSR \mapping_reg[7][2]  ( .D(n1064), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[7][2] ) );
  DFFSR \mapping_reg[7][3]  ( .D(n1063), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[7][3] ) );
  DFFSR \mapping_reg[7][4]  ( .D(n1062), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[7][4] ) );
  DFFSR \mapping_reg[7][5]  ( .D(n1061), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[7][5] ) );
  DFFSR \mapping_reg[7][6]  ( .D(n1060), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[7][6] ) );
  DFFSR \mapping_reg[7][7]  ( .D(n1059), .CLK(clk), .R(n750), .S(1'b1), .Q(
        \mapping[7][7] ) );
  NAND2X1 U481 ( .A(n462), .B(n1207), .Y(n459) );
  OR2X1 U485 ( .A(htrans[0]), .B(htrans[1]), .Y(n462) );
  AOI21X1 U1148 ( .A(n1008), .B(n1009), .C(n1206), .Y(N183) );
  NAND3X1 U1149 ( .A(haddr[1]), .B(haddr[0]), .C(n1010), .Y(n1009) );
  NOR2X1 U1150 ( .A(n1209), .B(n1208), .Y(n1010) );
  NAND3X1 U1151 ( .A(n1209), .B(n1208), .C(hwrite), .Y(n1008) );
  AND2X2 U6 ( .A(n598), .B(n582), .Y(n1) );
  AND2X2 U7 ( .A(N173), .B(n430), .Y(n2) );
  AND2X2 U141 ( .A(N173), .B(N172), .Y(n3) );
  INVX1 U142 ( .A(modwait), .Y(n906) );
  AND2X2 U143 ( .A(n299), .B(n428), .Y(n4) );
  AND2X2 U144 ( .A(n443), .B(n582), .Y(n5) );
  AND2X2 U145 ( .A(n1187), .B(n183), .Y(n6) );
  INVX1 U146 ( .A(n1204), .Y(n582) );
  INVX1 U147 ( .A(N173), .Y(n825) );
  INVX1 U148 ( .A(N173), .Y(n431) );
  AND2X1 U149 ( .A(n864), .B(n863), .Y(n148) );
  AND2X1 U150 ( .A(n1204), .B(n601), .Y(n149) );
  AND2X1 U151 ( .A(n1204), .B(n446), .Y(n150) );
  AND2X1 U152 ( .A(n749), .B(n1096), .Y(n175) );
  INVX2 U153 ( .A(N92), .Y(n747) );
  INVX4 U154 ( .A(nxt_hsize), .Y(n1096) );
  AND2X1 U155 ( .A(state[1]), .B(n1172), .Y(n183) );
  INVX2 U156 ( .A(n7), .Y(n745) );
  INVX2 U157 ( .A(n8), .Y(n593) );
  AND2X2 U158 ( .A(n601), .B(n582), .Y(n7) );
  AND2X2 U159 ( .A(n446), .B(n582), .Y(n8) );
  INVX2 U160 ( .A(n149), .Y(n741) );
  INVX2 U161 ( .A(n150), .Y(n589) );
  INVX2 U162 ( .A(n151), .Y(n742) );
  INVX2 U163 ( .A(n153), .Y(n740) );
  INVX2 U164 ( .A(n154), .Y(n590) );
  INVX2 U165 ( .A(n156), .Y(n588) );
  INVX2 U166 ( .A(n152), .Y(n739) );
  INVX2 U167 ( .A(n155), .Y(n587) );
  INVX2 U168 ( .A(n157), .Y(n746) );
  INVX2 U169 ( .A(n158), .Y(n594) );
  INVX2 U170 ( .A(n159), .Y(n743) );
  INVX2 U171 ( .A(n160), .Y(n591) );
  AND2X2 U172 ( .A(n943), .B(n1094), .Y(n145) );
  AND2X2 U173 ( .A(n1119), .B(n1118), .Y(n146) );
  AND2X2 U174 ( .A(n866), .B(n1118), .Y(n147) );
  AND2X2 U175 ( .A(n602), .B(n1204), .Y(n151) );
  AND2X2 U176 ( .A(n597), .B(n1204), .Y(n152) );
  AND2X2 U177 ( .A(n598), .B(n1204), .Y(n153) );
  AND2X2 U178 ( .A(n447), .B(n1204), .Y(n154) );
  AND2X2 U179 ( .A(n442), .B(n1204), .Y(n155) );
  AND2X2 U180 ( .A(n443), .B(n1204), .Y(n156) );
  AND2X2 U181 ( .A(n602), .B(n582), .Y(n157) );
  AND2X2 U182 ( .A(n447), .B(n582), .Y(n158) );
  AND2X2 U183 ( .A(n597), .B(n582), .Y(n159) );
  AND2X2 U184 ( .A(n442), .B(n582), .Y(n160) );
  INVX2 U185 ( .A(n1), .Y(n744) );
  INVX2 U186 ( .A(n5), .Y(n592) );
  INVX2 U187 ( .A(n172), .Y(n438) );
  INVX2 U188 ( .A(n173), .Y(n434) );
  AND2X2 U189 ( .A(N170), .B(n292), .Y(n161) );
  AND2X2 U190 ( .A(N180), .B(n1007), .Y(n162) );
  INVX2 U191 ( .A(n960), .Y(n971) );
  AND2X2 U192 ( .A(n1174), .B(n1204), .Y(n163) );
  AND2X2 U193 ( .A(N176), .B(n806), .Y(n164) );
  INVX2 U194 ( .A(n1171), .Y(n1106) );
  INVX2 U195 ( .A(n827), .Y(n840) );
  AND2X2 U196 ( .A(n1118), .B(n1120), .Y(n165) );
  AND2X2 U197 ( .A(n1118), .B(n1123), .Y(n166) );
  AND2X2 U198 ( .A(n1118), .B(n1126), .Y(n167) );
  AND2X2 U199 ( .A(n1118), .B(n1129), .Y(n168) );
  AND2X2 U200 ( .A(n1118), .B(n1132), .Y(n169) );
  AND2X2 U201 ( .A(n1118), .B(n1135), .Y(n170) );
  AND2X2 U202 ( .A(n1118), .B(n1138), .Y(n171) );
  AND2X2 U203 ( .A(n302), .B(n428), .Y(n172) );
  AND2X2 U204 ( .A(n748), .B(n302), .Y(n173) );
  INVX2 U205 ( .A(n178), .Y(n433) );
  INVX2 U206 ( .A(n177), .Y(n432) );
  INVX2 U207 ( .A(n179), .Y(n435) );
  INVX2 U208 ( .A(n180), .Y(n439) );
  INVX2 U209 ( .A(n176), .Y(n436) );
  AND2X2 U210 ( .A(n825), .B(n430), .Y(n174) );
  INVX2 U211 ( .A(n747), .Y(n749) );
  INVX2 U212 ( .A(n829), .Y(n1174) );
  INVX2 U213 ( .A(n747), .Y(n748) );
  AND2X2 U214 ( .A(n298), .B(n428), .Y(n176) );
  AND2X2 U215 ( .A(n298), .B(n748), .Y(n177) );
  AND2X2 U216 ( .A(n299), .B(n748), .Y(n178) );
  AND2X2 U217 ( .A(n303), .B(n748), .Y(n179) );
  AND2X2 U218 ( .A(n303), .B(n428), .Y(n180) );
  INVX2 U219 ( .A(n4), .Y(n437) );
  INVX2 U220 ( .A(n738), .Y(n737) );
  INVX1 U221 ( .A(N181), .Y(n738) );
  AND2X2 U222 ( .A(N172), .B(n825), .Y(n181) );
  AND2X2 U223 ( .A(nxt_hsize), .B(n1201), .Y(n182) );
  BUFX2 U224 ( .A(n_rst), .Y(n750) );
  BUFX2 U225 ( .A(n_rst), .Y(n751) );
  BUFX2 U226 ( .A(n_rst), .Y(n752) );
  BUFX2 U227 ( .A(n_rst), .Y(n753) );
  BUFX2 U228 ( .A(n_rst), .Y(n754) );
  BUFX2 U229 ( .A(n_rst), .Y(n755) );
  BUFX2 U230 ( .A(n_rst), .Y(n756) );
  BUFX2 U231 ( .A(n_rst), .Y(n757) );
  BUFX2 U232 ( .A(n_rst), .Y(n758) );
  BUFX2 U233 ( .A(n_rst), .Y(n759) );
  BUFX2 U234 ( .A(n_rst), .Y(n760) );
  BUFX2 U235 ( .A(n_rst), .Y(n761) );
  MUX2X1 U236 ( .B(n184), .A(n185), .S(n1205), .Y(fir_coefficient[8]) );
  AND2X2 U237 ( .A(n186), .B(n187), .Y(n185) );
  AOI22X1 U238 ( .A(\mapping[15][0] ), .B(n188), .C(\mapping[11][0] ), .D(n161), .Y(n187) );
  AOI22X1 U239 ( .A(\mapping[7][0] ), .B(n189), .C(\mapping[3][0] ), .D(n190), 
        .Y(n186) );
  AND2X2 U240 ( .A(n191), .B(n192), .Y(n184) );
  AOI22X1 U241 ( .A(\mapping[13][0] ), .B(n188), .C(\mapping[9][0] ), .D(n161), 
        .Y(n192) );
  AOI22X1 U242 ( .A(sample_data[8]), .B(n189), .C(\mapping[1][0] ), .D(n190), 
        .Y(n191) );
  MUX2X1 U243 ( .B(n193), .A(n194), .S(n1205), .Y(fir_coefficient[9]) );
  AND2X2 U244 ( .A(n195), .B(n196), .Y(n194) );
  AOI22X1 U245 ( .A(\mapping[15][1] ), .B(n188), .C(\mapping[11][1] ), .D(n161), .Y(n196) );
  AOI22X1 U246 ( .A(\mapping[7][1] ), .B(n189), .C(\mapping[3][1] ), .D(n190), 
        .Y(n195) );
  AND2X2 U247 ( .A(n197), .B(n198), .Y(n193) );
  AOI22X1 U248 ( .A(\mapping[13][1] ), .B(n188), .C(\mapping[9][1] ), .D(n161), 
        .Y(n198) );
  AOI22X1 U249 ( .A(sample_data[9]), .B(n189), .C(\mapping[1][1] ), .D(n190), 
        .Y(n197) );
  MUX2X1 U250 ( .B(n199), .A(n200), .S(n1205), .Y(fir_coefficient[10]) );
  AND2X2 U251 ( .A(n201), .B(n202), .Y(n200) );
  AOI22X1 U252 ( .A(\mapping[15][2] ), .B(n188), .C(\mapping[11][2] ), .D(n161), .Y(n202) );
  AOI22X1 U253 ( .A(\mapping[7][2] ), .B(n189), .C(\mapping[3][2] ), .D(n190), 
        .Y(n201) );
  AND2X2 U254 ( .A(n203), .B(n204), .Y(n199) );
  AOI22X1 U255 ( .A(\mapping[13][2] ), .B(n188), .C(\mapping[9][2] ), .D(n161), 
        .Y(n204) );
  AOI22X1 U256 ( .A(sample_data[10]), .B(n189), .C(\mapping[1][2] ), .D(n190), 
        .Y(n203) );
  MUX2X1 U257 ( .B(n205), .A(n206), .S(n1205), .Y(fir_coefficient[11]) );
  AND2X2 U258 ( .A(n207), .B(n208), .Y(n206) );
  AOI22X1 U259 ( .A(\mapping[15][3] ), .B(n188), .C(\mapping[11][3] ), .D(n161), .Y(n208) );
  AOI22X1 U260 ( .A(\mapping[7][3] ), .B(n189), .C(\mapping[3][3] ), .D(n190), 
        .Y(n207) );
  AND2X2 U261 ( .A(n209), .B(n210), .Y(n205) );
  AOI22X1 U262 ( .A(\mapping[13][3] ), .B(n188), .C(\mapping[9][3] ), .D(n161), 
        .Y(n210) );
  AOI22X1 U263 ( .A(sample_data[11]), .B(n189), .C(\mapping[1][3] ), .D(n190), 
        .Y(n209) );
  MUX2X1 U264 ( .B(n211), .A(n212), .S(n1205), .Y(fir_coefficient[12]) );
  AND2X2 U265 ( .A(n213), .B(n214), .Y(n212) );
  AOI22X1 U266 ( .A(\mapping[15][4] ), .B(n188), .C(\mapping[11][4] ), .D(n161), .Y(n214) );
  AOI22X1 U267 ( .A(\mapping[7][4] ), .B(n189), .C(\mapping[3][4] ), .D(n190), 
        .Y(n213) );
  AND2X2 U268 ( .A(n215), .B(n216), .Y(n211) );
  AOI22X1 U269 ( .A(\mapping[13][4] ), .B(n188), .C(\mapping[9][4] ), .D(n161), 
        .Y(n216) );
  AOI22X1 U270 ( .A(sample_data[12]), .B(n189), .C(\mapping[1][4] ), .D(n190), 
        .Y(n215) );
  MUX2X1 U271 ( .B(n217), .A(n218), .S(n1205), .Y(fir_coefficient[13]) );
  AND2X2 U272 ( .A(n219), .B(n220), .Y(n218) );
  AOI22X1 U273 ( .A(\mapping[15][5] ), .B(n188), .C(\mapping[11][5] ), .D(n161), .Y(n220) );
  AOI22X1 U274 ( .A(\mapping[7][5] ), .B(n189), .C(\mapping[3][5] ), .D(n190), 
        .Y(n219) );
  AND2X2 U275 ( .A(n221), .B(n222), .Y(n217) );
  AOI22X1 U276 ( .A(\mapping[13][5] ), .B(n188), .C(\mapping[9][5] ), .D(n161), 
        .Y(n222) );
  AOI22X1 U277 ( .A(sample_data[13]), .B(n189), .C(\mapping[1][5] ), .D(n190), 
        .Y(n221) );
  MUX2X1 U278 ( .B(n223), .A(n224), .S(n1205), .Y(fir_coefficient[14]) );
  AND2X2 U279 ( .A(n225), .B(n226), .Y(n224) );
  AOI22X1 U280 ( .A(\mapping[15][6] ), .B(n188), .C(\mapping[11][6] ), .D(n161), .Y(n226) );
  AOI22X1 U281 ( .A(\mapping[7][6] ), .B(n189), .C(\mapping[3][6] ), .D(n190), 
        .Y(n225) );
  AND2X2 U282 ( .A(n227), .B(n228), .Y(n223) );
  AOI22X1 U283 ( .A(\mapping[13][6] ), .B(n188), .C(\mapping[9][6] ), .D(n161), 
        .Y(n228) );
  AOI22X1 U284 ( .A(sample_data[14]), .B(n189), .C(\mapping[1][6] ), .D(n190), 
        .Y(n227) );
  MUX2X1 U285 ( .B(n229), .A(n230), .S(n1205), .Y(fir_coefficient[15]) );
  AND2X2 U286 ( .A(n231), .B(n232), .Y(n230) );
  AOI22X1 U287 ( .A(\mapping[15][7] ), .B(n188), .C(\mapping[11][7] ), .D(n161), .Y(n232) );
  AOI22X1 U288 ( .A(\mapping[7][7] ), .B(n189), .C(\mapping[3][7] ), .D(n190), 
        .Y(n231) );
  AND2X2 U289 ( .A(n233), .B(n234), .Y(n229) );
  AOI22X1 U290 ( .A(\mapping[13][7] ), .B(n188), .C(\mapping[9][7] ), .D(n161), 
        .Y(n234) );
  NAND2X1 U291 ( .A(N170), .B(N169), .Y(n235) );
  AOI22X1 U292 ( .A(sample_data[15]), .B(n189), .C(\mapping[1][7] ), .D(n190), 
        .Y(n233) );
  NAND2X1 U293 ( .A(n237), .B(n292), .Y(n236) );
  NAND2X1 U294 ( .A(N169), .B(n237), .Y(n238) );
  INVX2 U295 ( .A(N170), .Y(n237) );
  INVX4 U296 ( .A(n235), .Y(n188) );
  INVX4 U297 ( .A(n236), .Y(n190) );
  INVX4 U298 ( .A(n238), .Y(n189) );
  MUX2X1 U299 ( .B(n239), .A(n240), .S(n1205), .Y(fir_coefficient[0]) );
  AND2X2 U300 ( .A(n241), .B(n242), .Y(n240) );
  AOI22X1 U301 ( .A(new_coefficient_set), .B(n243), .C(\mapping[10][0] ), .D(
        n244), .Y(n242) );
  AOI22X1 U302 ( .A(\mapping[6][0] ), .B(n245), .C(\mapping[2][0] ), .D(n246), 
        .Y(n241) );
  AND2X2 U303 ( .A(n247), .B(n248), .Y(n239) );
  AOI22X1 U304 ( .A(\mapping[12][0] ), .B(n243), .C(\mapping[8][0] ), .D(n244), 
        .Y(n248) );
  AOI22X1 U305 ( .A(sample_data[0]), .B(n245), .C(\mapping[0][0] ), .D(n246), 
        .Y(n247) );
  MUX2X1 U306 ( .B(n249), .A(n250), .S(n1205), .Y(fir_coefficient[1]) );
  AND2X2 U307 ( .A(n251), .B(n252), .Y(n250) );
  AOI22X1 U308 ( .A(\mapping[14][1] ), .B(n243), .C(\mapping[10][1] ), .D(n244), .Y(n252) );
  AOI22X1 U309 ( .A(\mapping[6][1] ), .B(n245), .C(\mapping[2][1] ), .D(n246), 
        .Y(n251) );
  AND2X2 U310 ( .A(n253), .B(n254), .Y(n249) );
  AOI22X1 U311 ( .A(\mapping[12][1] ), .B(n243), .C(\mapping[8][1] ), .D(n244), 
        .Y(n254) );
  AOI22X1 U312 ( .A(sample_data[1]), .B(n245), .C(\mapping[0][1] ), .D(n246), 
        .Y(n253) );
  MUX2X1 U313 ( .B(n255), .A(n256), .S(n1205), .Y(fir_coefficient[2]) );
  AND2X2 U314 ( .A(n257), .B(n258), .Y(n256) );
  AOI22X1 U315 ( .A(\mapping[14][2] ), .B(n243), .C(\mapping[10][2] ), .D(n244), .Y(n258) );
  AOI22X1 U316 ( .A(\mapping[6][2] ), .B(n245), .C(\mapping[2][2] ), .D(n246), 
        .Y(n257) );
  AND2X2 U317 ( .A(n259), .B(n260), .Y(n255) );
  AOI22X1 U318 ( .A(\mapping[12][2] ), .B(n243), .C(\mapping[8][2] ), .D(n244), 
        .Y(n260) );
  AOI22X1 U319 ( .A(sample_data[2]), .B(n245), .C(\mapping[0][2] ), .D(n246), 
        .Y(n259) );
  MUX2X1 U320 ( .B(n261), .A(n262), .S(n1205), .Y(fir_coefficient[3]) );
  AND2X2 U321 ( .A(n263), .B(n264), .Y(n262) );
  AOI22X1 U322 ( .A(\mapping[14][3] ), .B(n243), .C(\mapping[10][3] ), .D(n244), .Y(n264) );
  AOI22X1 U323 ( .A(\mapping[6][3] ), .B(n245), .C(\mapping[2][3] ), .D(n246), 
        .Y(n263) );
  AND2X2 U324 ( .A(n265), .B(n266), .Y(n261) );
  AOI22X1 U325 ( .A(\mapping[12][3] ), .B(n243), .C(\mapping[8][3] ), .D(n244), 
        .Y(n266) );
  AOI22X1 U326 ( .A(sample_data[3]), .B(n245), .C(\mapping[0][3] ), .D(n246), 
        .Y(n265) );
  MUX2X1 U327 ( .B(n267), .A(n268), .S(n1205), .Y(fir_coefficient[4]) );
  AND2X2 U328 ( .A(n269), .B(n270), .Y(n268) );
  AOI22X1 U329 ( .A(\mapping[14][4] ), .B(n243), .C(\mapping[10][4] ), .D(n244), .Y(n270) );
  AOI22X1 U330 ( .A(\mapping[6][4] ), .B(n245), .C(\mapping[2][4] ), .D(n246), 
        .Y(n269) );
  AND2X2 U331 ( .A(n271), .B(n272), .Y(n267) );
  AOI22X1 U332 ( .A(\mapping[12][4] ), .B(n243), .C(\mapping[8][4] ), .D(n244), 
        .Y(n272) );
  AOI22X1 U333 ( .A(sample_data[4]), .B(n245), .C(\mapping[0][4] ), .D(n246), 
        .Y(n271) );
  MUX2X1 U334 ( .B(n273), .A(n274), .S(n1205), .Y(fir_coefficient[5]) );
  AND2X2 U335 ( .A(n275), .B(n276), .Y(n274) );
  AOI22X1 U336 ( .A(\mapping[14][5] ), .B(n243), .C(\mapping[10][5] ), .D(n244), .Y(n276) );
  AOI22X1 U337 ( .A(\mapping[6][5] ), .B(n245), .C(\mapping[2][5] ), .D(n246), 
        .Y(n275) );
  AND2X2 U338 ( .A(n277), .B(n278), .Y(n273) );
  AOI22X1 U339 ( .A(\mapping[12][5] ), .B(n243), .C(\mapping[8][5] ), .D(n244), 
        .Y(n278) );
  AOI22X1 U340 ( .A(sample_data[5]), .B(n245), .C(\mapping[0][5] ), .D(n246), 
        .Y(n277) );
  MUX2X1 U341 ( .B(n279), .A(n280), .S(n1205), .Y(fir_coefficient[6]) );
  AND2X2 U342 ( .A(n281), .B(n282), .Y(n280) );
  AOI22X1 U343 ( .A(\mapping[14][6] ), .B(n243), .C(\mapping[10][6] ), .D(n244), .Y(n282) );
  AOI22X1 U344 ( .A(\mapping[6][6] ), .B(n245), .C(\mapping[2][6] ), .D(n246), 
        .Y(n281) );
  AND2X2 U345 ( .A(n283), .B(n284), .Y(n279) );
  AOI22X1 U346 ( .A(\mapping[12][6] ), .B(n243), .C(\mapping[8][6] ), .D(n244), 
        .Y(n284) );
  AOI22X1 U347 ( .A(sample_data[6]), .B(n245), .C(\mapping[0][6] ), .D(n246), 
        .Y(n283) );
  MUX2X1 U348 ( .B(n285), .A(n286), .S(n1205), .Y(fir_coefficient[7]) );
  AND2X2 U349 ( .A(n287), .B(n288), .Y(n286) );
  AOI22X1 U350 ( .A(\mapping[14][7] ), .B(n243), .C(\mapping[10][7] ), .D(n244), .Y(n288) );
  AOI22X1 U351 ( .A(\mapping[6][7] ), .B(n245), .C(\mapping[2][7] ), .D(n246), 
        .Y(n287) );
  AND2X2 U352 ( .A(n289), .B(n290), .Y(n285) );
  AOI22X1 U353 ( .A(\mapping[12][7] ), .B(n243), .C(\mapping[8][7] ), .D(n244), 
        .Y(n290) );
  NAND2X1 U354 ( .A(N170), .B(n292), .Y(n291) );
  NAND2X1 U355 ( .A(N170), .B(N169), .Y(n293) );
  AOI22X1 U356 ( .A(sample_data[7]), .B(n245), .C(\mapping[0][7] ), .D(n246), 
        .Y(n289) );
  NAND2X1 U357 ( .A(n237), .B(n292), .Y(n294) );
  INVX2 U358 ( .A(N169), .Y(n292) );
  NAND2X1 U359 ( .A(N169), .B(n237), .Y(n295) );
  INVX4 U360 ( .A(n291), .Y(n244) );
  INVX4 U361 ( .A(n293), .Y(n243) );
  INVX4 U362 ( .A(n294), .Y(n246) );
  INVX4 U363 ( .A(n295), .Y(n245) );
  NOR2X1 U364 ( .A(n767), .B(N172), .Y(n298) );
  NOR2X1 U365 ( .A(N171), .B(N172), .Y(n299) );
  OAI22X1 U366 ( .A(\mapping[11][0] ), .B(n432), .C(\mapping[9][0] ), .D(n433), 
        .Y(n297) );
  NOR2X1 U367 ( .A(n430), .B(n767), .Y(n302) );
  NOR2X1 U368 ( .A(n430), .B(N171), .Y(n303) );
  OAI22X1 U369 ( .A(\mapping[15][0] ), .B(n434), .C(\mapping[13][0] ), .D(n435), .Y(n296) );
  NOR2X1 U370 ( .A(n297), .B(n296), .Y(n315) );
  NOR2X1 U371 ( .A(\mapping[8][0] ), .B(n437), .Y(n300) );
  NOR2X1 U372 ( .A(n431), .B(n300), .Y(n301) );
  OAI21X1 U373 ( .A(\mapping[10][0] ), .B(n436), .C(n301), .Y(n305) );
  OAI22X1 U374 ( .A(new_coefficient_set), .B(n438), .C(\mapping[12][0] ), .D(
        n439), .Y(n304) );
  NOR2X1 U375 ( .A(n305), .B(n304), .Y(n314) );
  OAI22X1 U376 ( .A(\mapping[3][0] ), .B(n432), .C(\mapping[1][0] ), .D(n433), 
        .Y(n307) );
  OAI22X1 U377 ( .A(\mapping[7][0] ), .B(n434), .C(sample_data[8]), .D(n435), 
        .Y(n306) );
  NOR2X1 U378 ( .A(n307), .B(n306), .Y(n313) );
  NOR2X1 U379 ( .A(\mapping[0][0] ), .B(n437), .Y(n308) );
  NOR2X1 U380 ( .A(N173), .B(n308), .Y(n309) );
  OAI21X1 U381 ( .A(\mapping[2][0] ), .B(n436), .C(n309), .Y(n311) );
  OAI22X1 U382 ( .A(\mapping[6][0] ), .B(n438), .C(sample_data[0]), .D(n439), 
        .Y(n310) );
  NOR2X1 U383 ( .A(n311), .B(n310), .Y(n312) );
  AOI22X1 U384 ( .A(n315), .B(n314), .C(n313), .D(n312), .Y(N1645) );
  OAI22X1 U385 ( .A(\mapping[11][1] ), .B(n432), .C(\mapping[9][1] ), .D(n433), 
        .Y(n317) );
  OAI22X1 U386 ( .A(\mapping[15][1] ), .B(n434), .C(\mapping[13][1] ), .D(n435), .Y(n316) );
  NOR2X1 U387 ( .A(n317), .B(n316), .Y(n331) );
  NOR2X1 U388 ( .A(\mapping[8][1] ), .B(n437), .Y(n318) );
  NOR2X1 U389 ( .A(n431), .B(n318), .Y(n319) );
  OAI21X1 U390 ( .A(\mapping[10][1] ), .B(n436), .C(n319), .Y(n321) );
  OAI22X1 U391 ( .A(\mapping[14][1] ), .B(n438), .C(\mapping[12][1] ), .D(n439), .Y(n320) );
  NOR2X1 U392 ( .A(n321), .B(n320), .Y(n330) );
  OAI22X1 U393 ( .A(\mapping[3][1] ), .B(n432), .C(\mapping[1][1] ), .D(n433), 
        .Y(n323) );
  OAI22X1 U394 ( .A(\mapping[7][1] ), .B(n434), .C(sample_data[9]), .D(n435), 
        .Y(n322) );
  NOR2X1 U395 ( .A(n323), .B(n322), .Y(n329) );
  NOR2X1 U396 ( .A(\mapping[0][1] ), .B(n437), .Y(n324) );
  NOR2X1 U397 ( .A(N173), .B(n324), .Y(n325) );
  OAI21X1 U398 ( .A(\mapping[2][1] ), .B(n436), .C(n325), .Y(n327) );
  OAI22X1 U399 ( .A(\mapping[6][1] ), .B(n438), .C(sample_data[1]), .D(n439), 
        .Y(n326) );
  NOR2X1 U400 ( .A(n327), .B(n326), .Y(n328) );
  AOI22X1 U401 ( .A(n331), .B(n330), .C(n329), .D(n328), .Y(N1644) );
  OAI22X1 U402 ( .A(\mapping[11][2] ), .B(n432), .C(\mapping[9][2] ), .D(n433), 
        .Y(n333) );
  OAI22X1 U403 ( .A(\mapping[15][2] ), .B(n434), .C(\mapping[13][2] ), .D(n435), .Y(n332) );
  NOR2X1 U404 ( .A(n333), .B(n332), .Y(n347) );
  NOR2X1 U405 ( .A(\mapping[8][2] ), .B(n437), .Y(n334) );
  NOR2X1 U406 ( .A(n431), .B(n334), .Y(n335) );
  OAI21X1 U407 ( .A(\mapping[10][2] ), .B(n436), .C(n335), .Y(n337) );
  OAI22X1 U408 ( .A(\mapping[14][2] ), .B(n438), .C(\mapping[12][2] ), .D(n439), .Y(n336) );
  NOR2X1 U409 ( .A(n337), .B(n336), .Y(n346) );
  OAI22X1 U410 ( .A(\mapping[3][2] ), .B(n432), .C(\mapping[1][2] ), .D(n433), 
        .Y(n339) );
  OAI22X1 U411 ( .A(\mapping[7][2] ), .B(n434), .C(sample_data[10]), .D(n435), 
        .Y(n338) );
  NOR2X1 U412 ( .A(n339), .B(n338), .Y(n345) );
  NOR2X1 U413 ( .A(\mapping[0][2] ), .B(n437), .Y(n340) );
  NOR2X1 U414 ( .A(N173), .B(n340), .Y(n341) );
  OAI21X1 U415 ( .A(\mapping[2][2] ), .B(n436), .C(n341), .Y(n343) );
  OAI22X1 U416 ( .A(\mapping[6][2] ), .B(n438), .C(sample_data[2]), .D(n439), 
        .Y(n342) );
  NOR2X1 U417 ( .A(n343), .B(n342), .Y(n344) );
  AOI22X1 U418 ( .A(n347), .B(n346), .C(n345), .D(n344), .Y(N1643) );
  OAI22X1 U419 ( .A(\mapping[11][3] ), .B(n432), .C(\mapping[9][3] ), .D(n433), 
        .Y(n349) );
  OAI22X1 U420 ( .A(\mapping[15][3] ), .B(n434), .C(\mapping[13][3] ), .D(n435), .Y(n348) );
  NOR2X1 U421 ( .A(n349), .B(n348), .Y(n363) );
  NOR2X1 U422 ( .A(\mapping[8][3] ), .B(n437), .Y(n350) );
  NOR2X1 U423 ( .A(n431), .B(n350), .Y(n351) );
  OAI21X1 U424 ( .A(\mapping[10][3] ), .B(n436), .C(n351), .Y(n353) );
  OAI22X1 U425 ( .A(\mapping[14][3] ), .B(n438), .C(\mapping[12][3] ), .D(n439), .Y(n352) );
  NOR2X1 U426 ( .A(n353), .B(n352), .Y(n362) );
  OAI22X1 U427 ( .A(\mapping[3][3] ), .B(n432), .C(\mapping[1][3] ), .D(n433), 
        .Y(n355) );
  OAI22X1 U428 ( .A(\mapping[7][3] ), .B(n434), .C(sample_data[11]), .D(n435), 
        .Y(n354) );
  NOR2X1 U429 ( .A(n355), .B(n354), .Y(n361) );
  NOR2X1 U430 ( .A(\mapping[0][3] ), .B(n437), .Y(n356) );
  NOR2X1 U431 ( .A(N173), .B(n356), .Y(n357) );
  OAI21X1 U432 ( .A(\mapping[2][3] ), .B(n436), .C(n357), .Y(n359) );
  OAI22X1 U433 ( .A(\mapping[6][3] ), .B(n438), .C(sample_data[3]), .D(n439), 
        .Y(n358) );
  NOR2X1 U434 ( .A(n359), .B(n358), .Y(n360) );
  AOI22X1 U435 ( .A(n363), .B(n362), .C(n361), .D(n360), .Y(N1642) );
  OAI22X1 U436 ( .A(\mapping[11][4] ), .B(n432), .C(\mapping[9][4] ), .D(n433), 
        .Y(n365) );
  OAI22X1 U437 ( .A(\mapping[15][4] ), .B(n434), .C(\mapping[13][4] ), .D(n435), .Y(n364) );
  NOR2X1 U438 ( .A(n365), .B(n364), .Y(n379) );
  NOR2X1 U439 ( .A(\mapping[8][4] ), .B(n437), .Y(n366) );
  NOR2X1 U440 ( .A(n431), .B(n366), .Y(n367) );
  OAI21X1 U441 ( .A(\mapping[10][4] ), .B(n436), .C(n367), .Y(n369) );
  OAI22X1 U442 ( .A(\mapping[14][4] ), .B(n438), .C(\mapping[12][4] ), .D(n439), .Y(n368) );
  NOR2X1 U443 ( .A(n369), .B(n368), .Y(n378) );
  OAI22X1 U444 ( .A(\mapping[3][4] ), .B(n432), .C(\mapping[1][4] ), .D(n433), 
        .Y(n371) );
  OAI22X1 U445 ( .A(\mapping[7][4] ), .B(n434), .C(sample_data[12]), .D(n435), 
        .Y(n370) );
  NOR2X1 U446 ( .A(n371), .B(n370), .Y(n377) );
  NOR2X1 U447 ( .A(\mapping[0][4] ), .B(n437), .Y(n372) );
  NOR2X1 U448 ( .A(N173), .B(n372), .Y(n373) );
  OAI21X1 U449 ( .A(\mapping[2][4] ), .B(n436), .C(n373), .Y(n375) );
  OAI22X1 U450 ( .A(\mapping[6][4] ), .B(n438), .C(sample_data[4]), .D(n439), 
        .Y(n374) );
  NOR2X1 U451 ( .A(n375), .B(n374), .Y(n376) );
  AOI22X1 U452 ( .A(n379), .B(n378), .C(n377), .D(n376), .Y(N1641) );
  OAI22X1 U453 ( .A(\mapping[11][5] ), .B(n432), .C(\mapping[9][5] ), .D(n433), 
        .Y(n381) );
  OAI22X1 U454 ( .A(\mapping[15][5] ), .B(n434), .C(\mapping[13][5] ), .D(n435), .Y(n380) );
  NOR2X1 U455 ( .A(n381), .B(n380), .Y(n395) );
  NOR2X1 U456 ( .A(\mapping[8][5] ), .B(n437), .Y(n382) );
  NOR2X1 U457 ( .A(n431), .B(n382), .Y(n383) );
  OAI21X1 U458 ( .A(\mapping[10][5] ), .B(n436), .C(n383), .Y(n385) );
  OAI22X1 U459 ( .A(\mapping[14][5] ), .B(n438), .C(\mapping[12][5] ), .D(n439), .Y(n384) );
  NOR2X1 U460 ( .A(n385), .B(n384), .Y(n394) );
  OAI22X1 U461 ( .A(\mapping[3][5] ), .B(n432), .C(\mapping[1][5] ), .D(n433), 
        .Y(n387) );
  OAI22X1 U462 ( .A(\mapping[7][5] ), .B(n434), .C(sample_data[13]), .D(n435), 
        .Y(n386) );
  NOR2X1 U463 ( .A(n387), .B(n386), .Y(n393) );
  NOR2X1 U464 ( .A(\mapping[0][5] ), .B(n437), .Y(n388) );
  NOR2X1 U465 ( .A(N173), .B(n388), .Y(n389) );
  OAI21X1 U466 ( .A(\mapping[2][5] ), .B(n436), .C(n389), .Y(n391) );
  OAI22X1 U467 ( .A(\mapping[6][5] ), .B(n438), .C(sample_data[5]), .D(n439), 
        .Y(n390) );
  NOR2X1 U468 ( .A(n391), .B(n390), .Y(n392) );
  AOI22X1 U469 ( .A(n395), .B(n394), .C(n393), .D(n392), .Y(N1640) );
  OAI22X1 U470 ( .A(\mapping[11][6] ), .B(n432), .C(\mapping[9][6] ), .D(n433), 
        .Y(n397) );
  OAI22X1 U471 ( .A(\mapping[15][6] ), .B(n434), .C(\mapping[13][6] ), .D(n435), .Y(n396) );
  NOR2X1 U472 ( .A(n397), .B(n396), .Y(n411) );
  NOR2X1 U473 ( .A(\mapping[8][6] ), .B(n437), .Y(n398) );
  NOR2X1 U474 ( .A(n431), .B(n398), .Y(n399) );
  OAI21X1 U475 ( .A(\mapping[10][6] ), .B(n436), .C(n399), .Y(n401) );
  OAI22X1 U476 ( .A(\mapping[14][6] ), .B(n438), .C(\mapping[12][6] ), .D(n439), .Y(n400) );
  NOR2X1 U477 ( .A(n401), .B(n400), .Y(n410) );
  OAI22X1 U478 ( .A(\mapping[3][6] ), .B(n432), .C(\mapping[1][6] ), .D(n433), 
        .Y(n403) );
  OAI22X1 U479 ( .A(\mapping[7][6] ), .B(n434), .C(sample_data[14]), .D(n435), 
        .Y(n402) );
  NOR2X1 U480 ( .A(n403), .B(n402), .Y(n409) );
  NOR2X1 U482 ( .A(\mapping[0][6] ), .B(n437), .Y(n404) );
  NOR2X1 U483 ( .A(N173), .B(n404), .Y(n405) );
  OAI21X1 U484 ( .A(\mapping[2][6] ), .B(n436), .C(n405), .Y(n407) );
  OAI22X1 U486 ( .A(\mapping[6][6] ), .B(n438), .C(sample_data[6]), .D(n439), 
        .Y(n406) );
  NOR2X1 U487 ( .A(n407), .B(n406), .Y(n408) );
  AOI22X1 U488 ( .A(n411), .B(n410), .C(n409), .D(n408), .Y(N1639) );
  OAI22X1 U489 ( .A(\mapping[13][7] ), .B(n435), .C(\mapping[11][7] ), .D(n432), .Y(n413) );
  OAI21X1 U490 ( .A(\mapping[15][7] ), .B(n434), .C(N173), .Y(n412) );
  NOR2X1 U491 ( .A(n413), .B(n412), .Y(n427) );
  OR2X1 U492 ( .A(\mapping[8][7] ), .B(n437), .Y(n414) );
  OAI21X1 U493 ( .A(n436), .B(\mapping[10][7] ), .C(n414), .Y(n415) );
  OAI21X1 U494 ( .A(\mapping[12][7] ), .B(n439), .C(n429), .Y(n417) );
  OAI22X1 U495 ( .A(\mapping[9][7] ), .B(n433), .C(\mapping[14][7] ), .D(n438), 
        .Y(n416) );
  NOR2X1 U496 ( .A(n417), .B(n416), .Y(n426) );
  OAI22X1 U497 ( .A(\mapping[3][7] ), .B(n432), .C(\mapping[1][7] ), .D(n433), 
        .Y(n419) );
  OAI22X1 U498 ( .A(\mapping[7][7] ), .B(n434), .C(sample_data[15]), .D(n435), 
        .Y(n418) );
  NOR2X1 U499 ( .A(n419), .B(n418), .Y(n425) );
  NOR2X1 U500 ( .A(\mapping[0][7] ), .B(n437), .Y(n420) );
  NOR2X1 U501 ( .A(N173), .B(n420), .Y(n421) );
  OAI21X1 U502 ( .A(\mapping[2][7] ), .B(n436), .C(n421), .Y(n423) );
  OAI22X1 U503 ( .A(\mapping[6][7] ), .B(n438), .C(sample_data[7]), .D(n439), 
        .Y(n422) );
  NOR2X1 U504 ( .A(n423), .B(n422), .Y(n424) );
  AOI22X1 U505 ( .A(n427), .B(n426), .C(n425), .D(n424), .Y(N1638) );
  INVX2 U506 ( .A(n748), .Y(n428) );
  INVX2 U507 ( .A(n415), .Y(n429) );
  INVX2 U508 ( .A(N172), .Y(n430) );
  NOR2X1 U509 ( .A(n583), .B(N176), .Y(n442) );
  NOR2X1 U510 ( .A(N175), .B(N176), .Y(n443) );
  OAI22X1 U511 ( .A(\mapping[11][0] ), .B(n587), .C(\mapping[9][0] ), .D(n588), 
        .Y(n441) );
  NOR2X1 U512 ( .A(n585), .B(n583), .Y(n446) );
  NOR2X1 U513 ( .A(n585), .B(N175), .Y(n447) );
  OAI22X1 U514 ( .A(\mapping[15][0] ), .B(n589), .C(\mapping[13][0] ), .D(n590), .Y(n440) );
  NOR2X1 U515 ( .A(n441), .B(n440), .Y(n460) );
  NOR2X1 U516 ( .A(\mapping[8][0] ), .B(n592), .Y(n444) );
  NOR2X1 U517 ( .A(n586), .B(n444), .Y(n445) );
  OAI21X1 U518 ( .A(\mapping[10][0] ), .B(n591), .C(n445), .Y(n449) );
  OAI22X1 U519 ( .A(new_coefficient_set), .B(n593), .C(\mapping[12][0] ), .D(
        n594), .Y(n448) );
  NOR2X1 U520 ( .A(n449), .B(n448), .Y(n458) );
  OAI22X1 U521 ( .A(\mapping[3][0] ), .B(n587), .C(\mapping[1][0] ), .D(n588), 
        .Y(n451) );
  OAI22X1 U522 ( .A(\mapping[7][0] ), .B(n589), .C(sample_data[8]), .D(n590), 
        .Y(n450) );
  NOR2X1 U523 ( .A(n451), .B(n450), .Y(n457) );
  NOR2X1 U524 ( .A(\mapping[0][0] ), .B(n592), .Y(n452) );
  NOR2X1 U525 ( .A(N177), .B(n452), .Y(n453) );
  OAI21X1 U526 ( .A(\mapping[2][0] ), .B(n591), .C(n453), .Y(n455) );
  OAI22X1 U527 ( .A(\mapping[6][0] ), .B(n593), .C(sample_data[0]), .D(n594), 
        .Y(n454) );
  NOR2X1 U528 ( .A(n455), .B(n454), .Y(n456) );
  AOI22X1 U529 ( .A(n460), .B(n458), .C(n457), .D(n456), .Y(n461) );
  OAI22X1 U530 ( .A(\mapping[11][1] ), .B(n587), .C(\mapping[9][1] ), .D(n588), 
        .Y(n464) );
  OAI22X1 U531 ( .A(\mapping[15][1] ), .B(n589), .C(\mapping[13][1] ), .D(n590), .Y(n463) );
  NOR2X1 U532 ( .A(n464), .B(n463), .Y(n478) );
  NOR2X1 U533 ( .A(\mapping[8][1] ), .B(n592), .Y(n465) );
  NOR2X1 U534 ( .A(n586), .B(n465), .Y(n466) );
  OAI21X1 U535 ( .A(\mapping[10][1] ), .B(n591), .C(n466), .Y(n468) );
  OAI22X1 U536 ( .A(\mapping[14][1] ), .B(n593), .C(\mapping[12][1] ), .D(n594), .Y(n467) );
  NOR2X1 U537 ( .A(n468), .B(n467), .Y(n477) );
  OAI22X1 U538 ( .A(\mapping[3][1] ), .B(n587), .C(\mapping[1][1] ), .D(n588), 
        .Y(n470) );
  OAI22X1 U539 ( .A(\mapping[7][1] ), .B(n589), .C(sample_data[9]), .D(n590), 
        .Y(n469) );
  NOR2X1 U540 ( .A(n470), .B(n469), .Y(n476) );
  NOR2X1 U541 ( .A(\mapping[0][1] ), .B(n592), .Y(n471) );
  NOR2X1 U542 ( .A(N177), .B(n471), .Y(n472) );
  OAI21X1 U543 ( .A(\mapping[2][1] ), .B(n591), .C(n472), .Y(n474) );
  OAI22X1 U544 ( .A(\mapping[6][1] ), .B(n593), .C(sample_data[1]), .D(n594), 
        .Y(n473) );
  NOR2X1 U545 ( .A(n474), .B(n473), .Y(n475) );
  AOI22X1 U546 ( .A(n478), .B(n477), .C(n476), .D(n475), .Y(n479) );
  OAI22X1 U547 ( .A(\mapping[11][2] ), .B(n587), .C(\mapping[9][2] ), .D(n588), 
        .Y(n481) );
  OAI22X1 U548 ( .A(\mapping[15][2] ), .B(n589), .C(\mapping[13][2] ), .D(n590), .Y(n480) );
  NOR2X1 U549 ( .A(n481), .B(n480), .Y(n495) );
  NOR2X1 U550 ( .A(\mapping[8][2] ), .B(n592), .Y(n482) );
  NOR2X1 U551 ( .A(n586), .B(n482), .Y(n483) );
  OAI21X1 U552 ( .A(\mapping[10][2] ), .B(n591), .C(n483), .Y(n485) );
  OAI22X1 U553 ( .A(\mapping[14][2] ), .B(n593), .C(\mapping[12][2] ), .D(n594), .Y(n484) );
  NOR2X1 U554 ( .A(n485), .B(n484), .Y(n494) );
  OAI22X1 U555 ( .A(\mapping[3][2] ), .B(n587), .C(\mapping[1][2] ), .D(n588), 
        .Y(n487) );
  OAI22X1 U556 ( .A(\mapping[7][2] ), .B(n589), .C(sample_data[10]), .D(n590), 
        .Y(n486) );
  NOR2X1 U557 ( .A(n487), .B(n486), .Y(n493) );
  NOR2X1 U558 ( .A(\mapping[0][2] ), .B(n592), .Y(n488) );
  NOR2X1 U559 ( .A(N177), .B(n488), .Y(n489) );
  OAI21X1 U560 ( .A(\mapping[2][2] ), .B(n591), .C(n489), .Y(n491) );
  OAI22X1 U561 ( .A(\mapping[6][2] ), .B(n593), .C(sample_data[2]), .D(n594), 
        .Y(n490) );
  NOR2X1 U562 ( .A(n491), .B(n490), .Y(n492) );
  AOI22X1 U563 ( .A(n495), .B(n494), .C(n493), .D(n492), .Y(n496) );
  OAI22X1 U564 ( .A(\mapping[11][3] ), .B(n587), .C(\mapping[9][3] ), .D(n588), 
        .Y(n498) );
  OAI22X1 U565 ( .A(\mapping[15][3] ), .B(n589), .C(\mapping[13][3] ), .D(n590), .Y(n497) );
  NOR2X1 U566 ( .A(n498), .B(n497), .Y(n512) );
  NOR2X1 U567 ( .A(\mapping[8][3] ), .B(n592), .Y(n499) );
  NOR2X1 U568 ( .A(n586), .B(n499), .Y(n500) );
  OAI21X1 U569 ( .A(\mapping[10][3] ), .B(n591), .C(n500), .Y(n502) );
  OAI22X1 U570 ( .A(\mapping[14][3] ), .B(n593), .C(\mapping[12][3] ), .D(n594), .Y(n501) );
  NOR2X1 U571 ( .A(n502), .B(n501), .Y(n511) );
  OAI22X1 U572 ( .A(\mapping[3][3] ), .B(n587), .C(\mapping[1][3] ), .D(n588), 
        .Y(n504) );
  OAI22X1 U573 ( .A(\mapping[7][3] ), .B(n589), .C(sample_data[11]), .D(n590), 
        .Y(n503) );
  NOR2X1 U574 ( .A(n504), .B(n503), .Y(n510) );
  NOR2X1 U575 ( .A(\mapping[0][3] ), .B(n592), .Y(n505) );
  NOR2X1 U576 ( .A(N177), .B(n505), .Y(n506) );
  OAI21X1 U577 ( .A(\mapping[2][3] ), .B(n591), .C(n506), .Y(n508) );
  OAI22X1 U578 ( .A(\mapping[6][3] ), .B(n593), .C(sample_data[3]), .D(n594), 
        .Y(n507) );
  NOR2X1 U579 ( .A(n508), .B(n507), .Y(n509) );
  AOI22X1 U580 ( .A(n512), .B(n511), .C(n510), .D(n509), .Y(n513) );
  OAI22X1 U581 ( .A(\mapping[11][4] ), .B(n587), .C(\mapping[9][4] ), .D(n588), 
        .Y(n515) );
  OAI22X1 U582 ( .A(\mapping[15][4] ), .B(n589), .C(\mapping[13][4] ), .D(n590), .Y(n514) );
  NOR2X1 U583 ( .A(n515), .B(n514), .Y(n529) );
  NOR2X1 U584 ( .A(\mapping[8][4] ), .B(n592), .Y(n516) );
  NOR2X1 U585 ( .A(n586), .B(n516), .Y(n517) );
  OAI21X1 U586 ( .A(\mapping[10][4] ), .B(n591), .C(n517), .Y(n519) );
  OAI22X1 U587 ( .A(\mapping[14][4] ), .B(n593), .C(\mapping[12][4] ), .D(n594), .Y(n518) );
  NOR2X1 U588 ( .A(n519), .B(n518), .Y(n528) );
  OAI22X1 U589 ( .A(\mapping[3][4] ), .B(n587), .C(\mapping[1][4] ), .D(n588), 
        .Y(n521) );
  OAI22X1 U590 ( .A(\mapping[7][4] ), .B(n589), .C(sample_data[12]), .D(n590), 
        .Y(n520) );
  NOR2X1 U591 ( .A(n521), .B(n520), .Y(n527) );
  NOR2X1 U592 ( .A(\mapping[0][4] ), .B(n592), .Y(n522) );
  NOR2X1 U593 ( .A(N177), .B(n522), .Y(n523) );
  OAI21X1 U594 ( .A(\mapping[2][4] ), .B(n591), .C(n523), .Y(n525) );
  OAI22X1 U595 ( .A(\mapping[6][4] ), .B(n593), .C(sample_data[4]), .D(n594), 
        .Y(n524) );
  NOR2X1 U596 ( .A(n525), .B(n524), .Y(n526) );
  AOI22X1 U597 ( .A(n529), .B(n528), .C(n527), .D(n526), .Y(n530) );
  OAI22X1 U598 ( .A(\mapping[11][5] ), .B(n587), .C(\mapping[9][5] ), .D(n588), 
        .Y(n532) );
  OAI22X1 U599 ( .A(\mapping[15][5] ), .B(n589), .C(\mapping[13][5] ), .D(n590), .Y(n531) );
  NOR2X1 U600 ( .A(n532), .B(n531), .Y(n546) );
  NOR2X1 U601 ( .A(\mapping[8][5] ), .B(n592), .Y(n533) );
  NOR2X1 U602 ( .A(n586), .B(n533), .Y(n534) );
  OAI21X1 U603 ( .A(\mapping[10][5] ), .B(n591), .C(n534), .Y(n536) );
  OAI22X1 U604 ( .A(\mapping[14][5] ), .B(n593), .C(\mapping[12][5] ), .D(n594), .Y(n535) );
  NOR2X1 U605 ( .A(n536), .B(n535), .Y(n545) );
  OAI22X1 U606 ( .A(\mapping[3][5] ), .B(n587), .C(\mapping[1][5] ), .D(n588), 
        .Y(n538) );
  OAI22X1 U607 ( .A(\mapping[7][5] ), .B(n589), .C(sample_data[13]), .D(n590), 
        .Y(n537) );
  NOR2X1 U608 ( .A(n538), .B(n537), .Y(n544) );
  NOR2X1 U609 ( .A(\mapping[0][5] ), .B(n592), .Y(n539) );
  NOR2X1 U610 ( .A(N177), .B(n539), .Y(n540) );
  OAI21X1 U611 ( .A(\mapping[2][5] ), .B(n591), .C(n540), .Y(n542) );
  OAI22X1 U612 ( .A(\mapping[6][5] ), .B(n593), .C(sample_data[5]), .D(n594), 
        .Y(n541) );
  NOR2X1 U613 ( .A(n542), .B(n541), .Y(n543) );
  AOI22X1 U614 ( .A(n546), .B(n545), .C(n544), .D(n543), .Y(n547) );
  OAI22X1 U615 ( .A(\mapping[11][6] ), .B(n587), .C(\mapping[9][6] ), .D(n588), 
        .Y(n549) );
  OAI22X1 U616 ( .A(\mapping[15][6] ), .B(n589), .C(\mapping[13][6] ), .D(n590), .Y(n548) );
  NOR2X1 U617 ( .A(n549), .B(n548), .Y(n563) );
  NOR2X1 U618 ( .A(\mapping[8][6] ), .B(n592), .Y(n550) );
  NOR2X1 U619 ( .A(n586), .B(n550), .Y(n551) );
  OAI21X1 U620 ( .A(\mapping[10][6] ), .B(n591), .C(n551), .Y(n553) );
  OAI22X1 U621 ( .A(\mapping[14][6] ), .B(n593), .C(\mapping[12][6] ), .D(n594), .Y(n552) );
  NOR2X1 U622 ( .A(n553), .B(n552), .Y(n562) );
  OAI22X1 U623 ( .A(\mapping[3][6] ), .B(n587), .C(\mapping[1][6] ), .D(n588), 
        .Y(n555) );
  OAI22X1 U624 ( .A(\mapping[7][6] ), .B(n589), .C(sample_data[14]), .D(n590), 
        .Y(n554) );
  NOR2X1 U625 ( .A(n555), .B(n554), .Y(n561) );
  NOR2X1 U626 ( .A(\mapping[0][6] ), .B(n592), .Y(n556) );
  NOR2X1 U627 ( .A(N177), .B(n556), .Y(n557) );
  OAI21X1 U628 ( .A(\mapping[2][6] ), .B(n591), .C(n557), .Y(n559) );
  OAI22X1 U629 ( .A(\mapping[6][6] ), .B(n593), .C(sample_data[6]), .D(n594), 
        .Y(n558) );
  NOR2X1 U630 ( .A(n559), .B(n558), .Y(n560) );
  AOI22X1 U631 ( .A(n563), .B(n562), .C(n561), .D(n560), .Y(n564) );
  OAI22X1 U632 ( .A(\mapping[13][7] ), .B(n590), .C(\mapping[11][7] ), .D(n587), .Y(n566) );
  OAI21X1 U633 ( .A(\mapping[15][7] ), .B(n589), .C(N177), .Y(n565) );
  NOR2X1 U634 ( .A(n566), .B(n565), .Y(n580) );
  OR2X1 U635 ( .A(\mapping[8][7] ), .B(n592), .Y(n567) );
  OAI21X1 U636 ( .A(n591), .B(\mapping[10][7] ), .C(n567), .Y(n568) );
  OAI21X1 U637 ( .A(\mapping[12][7] ), .B(n594), .C(n584), .Y(n570) );
  OAI22X1 U638 ( .A(\mapping[9][7] ), .B(n588), .C(\mapping[14][7] ), .D(n593), 
        .Y(n569) );
  NOR2X1 U639 ( .A(n570), .B(n569), .Y(n579) );
  OAI22X1 U640 ( .A(\mapping[3][7] ), .B(n587), .C(\mapping[1][7] ), .D(n588), 
        .Y(n572) );
  OAI22X1 U641 ( .A(\mapping[7][7] ), .B(n589), .C(sample_data[15]), .D(n590), 
        .Y(n571) );
  NOR2X1 U642 ( .A(n572), .B(n571), .Y(n578) );
  NOR2X1 U643 ( .A(\mapping[0][7] ), .B(n592), .Y(n573) );
  NOR2X1 U644 ( .A(N177), .B(n573), .Y(n574) );
  OAI21X1 U645 ( .A(\mapping[2][7] ), .B(n591), .C(n574), .Y(n576) );
  OAI22X1 U646 ( .A(\mapping[6][7] ), .B(n593), .C(sample_data[7]), .D(n594), 
        .Y(n575) );
  NOR2X1 U647 ( .A(n576), .B(n575), .Y(n577) );
  AOI22X1 U648 ( .A(n580), .B(n579), .C(n578), .D(n577), .Y(n581) );
  INVX2 U649 ( .A(N175), .Y(n583) );
  INVX2 U650 ( .A(n568), .Y(n584) );
  INVX2 U651 ( .A(N176), .Y(n585) );
  INVX2 U652 ( .A(n581), .Y(N1629) );
  INVX2 U653 ( .A(N177), .Y(n586) );
  INVX2 U654 ( .A(n564), .Y(N1630) );
  INVX2 U655 ( .A(n547), .Y(N1631) );
  INVX2 U656 ( .A(n530), .Y(N1632) );
  INVX2 U657 ( .A(n513), .Y(N1633) );
  INVX2 U658 ( .A(n496), .Y(N1634) );
  INVX2 U659 ( .A(n479), .Y(N1635) );
  INVX2 U660 ( .A(n461), .Y(N1636) );
  NOR2X1 U661 ( .A(n1094), .B(N180), .Y(n597) );
  NOR2X1 U662 ( .A(N179), .B(N180), .Y(n598) );
  OAI22X1 U663 ( .A(\mapping[11][0] ), .B(n739), .C(\mapping[9][0] ), .D(n740), 
        .Y(n596) );
  NOR2X1 U664 ( .A(n736), .B(n1094), .Y(n601) );
  NOR2X1 U665 ( .A(n736), .B(N179), .Y(n602) );
  OAI22X1 U666 ( .A(\mapping[15][0] ), .B(n741), .C(\mapping[13][0] ), .D(n742), .Y(n595) );
  NOR2X1 U667 ( .A(n596), .B(n595), .Y(n614) );
  NOR2X1 U668 ( .A(\mapping[8][0] ), .B(n744), .Y(n599) );
  NOR2X1 U669 ( .A(n738), .B(n599), .Y(n600) );
  OAI21X1 U670 ( .A(\mapping[10][0] ), .B(n743), .C(n600), .Y(n604) );
  OAI22X1 U671 ( .A(new_coefficient_set), .B(n745), .C(\mapping[12][0] ), .D(
        n746), .Y(n603) );
  NOR2X1 U672 ( .A(n604), .B(n603), .Y(n613) );
  OAI22X1 U673 ( .A(\mapping[3][0] ), .B(n739), .C(\mapping[1][0] ), .D(n740), 
        .Y(n606) );
  OAI22X1 U674 ( .A(\mapping[7][0] ), .B(n741), .C(sample_data[8]), .D(n742), 
        .Y(n605) );
  NOR2X1 U675 ( .A(n606), .B(n605), .Y(n612) );
  NOR2X1 U676 ( .A(\mapping[0][0] ), .B(n744), .Y(n607) );
  NOR2X1 U677 ( .A(n737), .B(n607), .Y(n608) );
  OAI21X1 U678 ( .A(\mapping[2][0] ), .B(n743), .C(n608), .Y(n610) );
  OAI22X1 U679 ( .A(\mapping[6][0] ), .B(n745), .C(sample_data[0]), .D(n746), 
        .Y(n609) );
  NOR2X1 U680 ( .A(n610), .B(n609), .Y(n611) );
  AOI22X1 U681 ( .A(n614), .B(n613), .C(n612), .D(n611), .Y(n615) );
  OAI22X1 U682 ( .A(\mapping[11][1] ), .B(n739), .C(\mapping[9][1] ), .D(n740), 
        .Y(n617) );
  OAI22X1 U683 ( .A(\mapping[15][1] ), .B(n741), .C(\mapping[13][1] ), .D(n742), .Y(n616) );
  NOR2X1 U684 ( .A(n617), .B(n616), .Y(n631) );
  NOR2X1 U685 ( .A(\mapping[8][1] ), .B(n744), .Y(n618) );
  NOR2X1 U686 ( .A(n738), .B(n618), .Y(n619) );
  OAI21X1 U687 ( .A(\mapping[10][1] ), .B(n743), .C(n619), .Y(n621) );
  OAI22X1 U688 ( .A(\mapping[14][1] ), .B(n745), .C(\mapping[12][1] ), .D(n746), .Y(n620) );
  NOR2X1 U689 ( .A(n621), .B(n620), .Y(n630) );
  OAI22X1 U690 ( .A(\mapping[3][1] ), .B(n739), .C(\mapping[1][1] ), .D(n740), 
        .Y(n623) );
  OAI22X1 U691 ( .A(\mapping[7][1] ), .B(n741), .C(sample_data[9]), .D(n742), 
        .Y(n622) );
  NOR2X1 U692 ( .A(n623), .B(n622), .Y(n629) );
  NOR2X1 U693 ( .A(\mapping[0][1] ), .B(n744), .Y(n624) );
  NOR2X1 U694 ( .A(n737), .B(n624), .Y(n625) );
  OAI21X1 U695 ( .A(\mapping[2][1] ), .B(n743), .C(n625), .Y(n627) );
  OAI22X1 U696 ( .A(\mapping[6][1] ), .B(n745), .C(sample_data[1]), .D(n746), 
        .Y(n626) );
  NOR2X1 U697 ( .A(n627), .B(n626), .Y(n628) );
  AOI22X1 U698 ( .A(n631), .B(n630), .C(n629), .D(n628), .Y(n632) );
  OAI22X1 U699 ( .A(\mapping[11][2] ), .B(n739), .C(\mapping[9][2] ), .D(n740), 
        .Y(n634) );
  OAI22X1 U700 ( .A(\mapping[15][2] ), .B(n741), .C(\mapping[13][2] ), .D(n742), .Y(n633) );
  NOR2X1 U701 ( .A(n634), .B(n633), .Y(n648) );
  NOR2X1 U702 ( .A(\mapping[8][2] ), .B(n744), .Y(n635) );
  NOR2X1 U703 ( .A(n738), .B(n635), .Y(n636) );
  OAI21X1 U704 ( .A(\mapping[10][2] ), .B(n743), .C(n636), .Y(n638) );
  OAI22X1 U705 ( .A(\mapping[14][2] ), .B(n745), .C(\mapping[12][2] ), .D(n746), .Y(n637) );
  NOR2X1 U706 ( .A(n638), .B(n637), .Y(n647) );
  OAI22X1 U707 ( .A(\mapping[3][2] ), .B(n739), .C(\mapping[1][2] ), .D(n740), 
        .Y(n640) );
  OAI22X1 U708 ( .A(\mapping[7][2] ), .B(n741), .C(sample_data[10]), .D(n742), 
        .Y(n639) );
  NOR2X1 U709 ( .A(n640), .B(n639), .Y(n646) );
  NOR2X1 U710 ( .A(\mapping[0][2] ), .B(n744), .Y(n641) );
  NOR2X1 U711 ( .A(n737), .B(n641), .Y(n642) );
  OAI21X1 U712 ( .A(\mapping[2][2] ), .B(n743), .C(n642), .Y(n644) );
  OAI22X1 U713 ( .A(\mapping[6][2] ), .B(n745), .C(sample_data[2]), .D(n746), 
        .Y(n643) );
  NOR2X1 U714 ( .A(n644), .B(n643), .Y(n645) );
  AOI22X1 U715 ( .A(n648), .B(n647), .C(n646), .D(n645), .Y(n649) );
  OAI22X1 U716 ( .A(\mapping[11][3] ), .B(n739), .C(\mapping[9][3] ), .D(n740), 
        .Y(n651) );
  OAI22X1 U717 ( .A(\mapping[15][3] ), .B(n741), .C(\mapping[13][3] ), .D(n742), .Y(n650) );
  NOR2X1 U718 ( .A(n651), .B(n650), .Y(n665) );
  NOR2X1 U719 ( .A(\mapping[8][3] ), .B(n744), .Y(n652) );
  NOR2X1 U720 ( .A(n738), .B(n652), .Y(n653) );
  OAI21X1 U721 ( .A(\mapping[10][3] ), .B(n743), .C(n653), .Y(n655) );
  OAI22X1 U722 ( .A(\mapping[14][3] ), .B(n745), .C(\mapping[12][3] ), .D(n746), .Y(n654) );
  NOR2X1 U723 ( .A(n655), .B(n654), .Y(n664) );
  OAI22X1 U724 ( .A(\mapping[3][3] ), .B(n739), .C(\mapping[1][3] ), .D(n740), 
        .Y(n657) );
  OAI22X1 U725 ( .A(\mapping[7][3] ), .B(n741), .C(sample_data[11]), .D(n742), 
        .Y(n656) );
  NOR2X1 U726 ( .A(n657), .B(n656), .Y(n663) );
  NOR2X1 U727 ( .A(\mapping[0][3] ), .B(n744), .Y(n658) );
  NOR2X1 U728 ( .A(n737), .B(n658), .Y(n659) );
  OAI21X1 U729 ( .A(\mapping[2][3] ), .B(n743), .C(n659), .Y(n661) );
  OAI22X1 U730 ( .A(\mapping[6][3] ), .B(n745), .C(sample_data[3]), .D(n746), 
        .Y(n660) );
  NOR2X1 U731 ( .A(n661), .B(n660), .Y(n662) );
  AOI22X1 U732 ( .A(n665), .B(n664), .C(n663), .D(n662), .Y(n666) );
  OAI22X1 U733 ( .A(\mapping[11][4] ), .B(n739), .C(\mapping[9][4] ), .D(n740), 
        .Y(n668) );
  OAI22X1 U734 ( .A(\mapping[15][4] ), .B(n741), .C(\mapping[13][4] ), .D(n742), .Y(n667) );
  NOR2X1 U735 ( .A(n668), .B(n667), .Y(n682) );
  NOR2X1 U736 ( .A(\mapping[8][4] ), .B(n744), .Y(n669) );
  NOR2X1 U737 ( .A(n738), .B(n669), .Y(n670) );
  OAI21X1 U738 ( .A(\mapping[10][4] ), .B(n743), .C(n670), .Y(n672) );
  OAI22X1 U739 ( .A(\mapping[14][4] ), .B(n745), .C(\mapping[12][4] ), .D(n746), .Y(n671) );
  NOR2X1 U740 ( .A(n672), .B(n671), .Y(n681) );
  OAI22X1 U741 ( .A(\mapping[3][4] ), .B(n739), .C(\mapping[1][4] ), .D(n740), 
        .Y(n674) );
  OAI22X1 U742 ( .A(\mapping[7][4] ), .B(n741), .C(sample_data[12]), .D(n742), 
        .Y(n673) );
  NOR2X1 U743 ( .A(n674), .B(n673), .Y(n680) );
  NOR2X1 U744 ( .A(\mapping[0][4] ), .B(n744), .Y(n675) );
  NOR2X1 U745 ( .A(n737), .B(n675), .Y(n676) );
  OAI21X1 U746 ( .A(\mapping[2][4] ), .B(n743), .C(n676), .Y(n678) );
  OAI22X1 U747 ( .A(\mapping[6][4] ), .B(n745), .C(sample_data[4]), .D(n746), 
        .Y(n677) );
  NOR2X1 U748 ( .A(n678), .B(n677), .Y(n679) );
  AOI22X1 U749 ( .A(n682), .B(n681), .C(n680), .D(n679), .Y(n683) );
  OAI22X1 U750 ( .A(\mapping[11][5] ), .B(n739), .C(\mapping[9][5] ), .D(n740), 
        .Y(n685) );
  OAI22X1 U751 ( .A(\mapping[15][5] ), .B(n741), .C(\mapping[13][5] ), .D(n742), .Y(n684) );
  NOR2X1 U752 ( .A(n685), .B(n684), .Y(n699) );
  NOR2X1 U753 ( .A(\mapping[8][5] ), .B(n744), .Y(n686) );
  NOR2X1 U754 ( .A(n738), .B(n686), .Y(n687) );
  OAI21X1 U755 ( .A(\mapping[10][5] ), .B(n743), .C(n687), .Y(n689) );
  OAI22X1 U756 ( .A(\mapping[14][5] ), .B(n745), .C(\mapping[12][5] ), .D(n746), .Y(n688) );
  NOR2X1 U757 ( .A(n689), .B(n688), .Y(n698) );
  OAI22X1 U758 ( .A(\mapping[3][5] ), .B(n739), .C(\mapping[1][5] ), .D(n740), 
        .Y(n691) );
  OAI22X1 U759 ( .A(\mapping[7][5] ), .B(n741), .C(sample_data[13]), .D(n742), 
        .Y(n690) );
  NOR2X1 U760 ( .A(n691), .B(n690), .Y(n697) );
  NOR2X1 U761 ( .A(\mapping[0][5] ), .B(n744), .Y(n692) );
  NOR2X1 U762 ( .A(n737), .B(n692), .Y(n693) );
  OAI21X1 U763 ( .A(\mapping[2][5] ), .B(n743), .C(n693), .Y(n695) );
  OAI22X1 U764 ( .A(\mapping[6][5] ), .B(n745), .C(sample_data[5]), .D(n746), 
        .Y(n694) );
  NOR2X1 U765 ( .A(n695), .B(n694), .Y(n696) );
  AOI22X1 U766 ( .A(n699), .B(n698), .C(n697), .D(n696), .Y(n700) );
  OAI22X1 U767 ( .A(\mapping[11][6] ), .B(n739), .C(\mapping[9][6] ), .D(n740), 
        .Y(n702) );
  OAI22X1 U768 ( .A(\mapping[15][6] ), .B(n741), .C(\mapping[13][6] ), .D(n742), .Y(n701) );
  NOR2X1 U769 ( .A(n702), .B(n701), .Y(n716) );
  NOR2X1 U770 ( .A(\mapping[8][6] ), .B(n744), .Y(n703) );
  NOR2X1 U771 ( .A(n738), .B(n703), .Y(n704) );
  OAI21X1 U772 ( .A(\mapping[10][6] ), .B(n743), .C(n704), .Y(n706) );
  OAI22X1 U773 ( .A(\mapping[14][6] ), .B(n745), .C(\mapping[12][6] ), .D(n746), .Y(n705) );
  NOR2X1 U774 ( .A(n706), .B(n705), .Y(n715) );
  OAI22X1 U775 ( .A(\mapping[3][6] ), .B(n739), .C(\mapping[1][6] ), .D(n740), 
        .Y(n708) );
  OAI22X1 U776 ( .A(\mapping[7][6] ), .B(n741), .C(sample_data[14]), .D(n742), 
        .Y(n707) );
  NOR2X1 U777 ( .A(n708), .B(n707), .Y(n714) );
  NOR2X1 U778 ( .A(\mapping[0][6] ), .B(n744), .Y(n709) );
  NOR2X1 U779 ( .A(n737), .B(n709), .Y(n710) );
  OAI21X1 U780 ( .A(\mapping[2][6] ), .B(n743), .C(n710), .Y(n712) );
  OAI22X1 U781 ( .A(\mapping[6][6] ), .B(n745), .C(sample_data[6]), .D(n746), 
        .Y(n711) );
  NOR2X1 U782 ( .A(n712), .B(n711), .Y(n713) );
  AOI22X1 U783 ( .A(n716), .B(n715), .C(n714), .D(n713), .Y(n717) );
  OAI22X1 U784 ( .A(\mapping[13][7] ), .B(n742), .C(\mapping[11][7] ), .D(n739), .Y(n719) );
  OAI21X1 U785 ( .A(\mapping[15][7] ), .B(n741), .C(n737), .Y(n718) );
  NOR2X1 U786 ( .A(n719), .B(n718), .Y(n733) );
  OR2X1 U787 ( .A(\mapping[8][7] ), .B(n744), .Y(n720) );
  OAI21X1 U788 ( .A(n743), .B(\mapping[10][7] ), .C(n720), .Y(n721) );
  OAI21X1 U789 ( .A(\mapping[12][7] ), .B(n746), .C(n735), .Y(n723) );
  OAI22X1 U790 ( .A(\mapping[9][7] ), .B(n740), .C(\mapping[14][7] ), .D(n745), 
        .Y(n722) );
  NOR2X1 U791 ( .A(n723), .B(n722), .Y(n732) );
  OAI22X1 U792 ( .A(\mapping[3][7] ), .B(n739), .C(\mapping[1][7] ), .D(n740), 
        .Y(n725) );
  OAI22X1 U793 ( .A(\mapping[7][7] ), .B(n741), .C(sample_data[15]), .D(n742), 
        .Y(n724) );
  NOR2X1 U794 ( .A(n725), .B(n724), .Y(n731) );
  NOR2X1 U795 ( .A(\mapping[0][7] ), .B(n744), .Y(n726) );
  NOR2X1 U796 ( .A(n737), .B(n726), .Y(n727) );
  OAI21X1 U797 ( .A(\mapping[2][7] ), .B(n743), .C(n727), .Y(n729) );
  OAI22X1 U798 ( .A(\mapping[6][7] ), .B(n745), .C(sample_data[7]), .D(n746), 
        .Y(n728) );
  NOR2X1 U799 ( .A(n729), .B(n728), .Y(n730) );
  AOI22X1 U800 ( .A(n733), .B(n732), .C(n731), .D(n730), .Y(n734) );
  INVX2 U801 ( .A(n721), .Y(n735) );
  INVX2 U802 ( .A(N180), .Y(n736) );
  INVX2 U803 ( .A(n734), .Y(N1650) );
  INVX2 U804 ( .A(n717), .Y(N1651) );
  INVX2 U805 ( .A(n700), .Y(N1652) );
  INVX2 U806 ( .A(n683), .Y(N1653) );
  INVX2 U807 ( .A(n666), .Y(N1654) );
  INVX2 U808 ( .A(n649), .Y(N1655) );
  INVX2 U809 ( .A(n632), .Y(N1656) );
  INVX2 U810 ( .A(n615), .Y(N1657) );
  INVX4 U811 ( .A(n1162), .Y(n1201) );
  INVX4 U812 ( .A(n1160), .Y(n1118) );
  NAND2X1 U813 ( .A(state[1]), .B(state[0]), .Y(n763) );
  NAND2X1 U814 ( .A(hsel), .B(n763), .Y(n762) );
  NOR2X1 U815 ( .A(n459), .B(n762), .Y(nxtstate[1]) );
  NAND2X1 U816 ( .A(hwrite), .B(n763), .Y(n765) );
  NAND2X1 U817 ( .A(hsel), .B(n462), .Y(n764) );
  NOR2X1 U818 ( .A(n765), .B(n764), .Y(nxtstate[0]) );
  INVX2 U819 ( .A(N171), .Y(n767) );
  INVX2 U820 ( .A(n749), .Y(n1204) );
  NAND2X1 U821 ( .A(n767), .B(n1204), .Y(n941) );
  OAI21X1 U822 ( .A(N172), .B(n941), .C(N173), .Y(n766) );
  INVX2 U823 ( .A(n941), .Y(n1091) );
  NAND2X1 U824 ( .A(n1091), .B(n174), .Y(n1170) );
  NAND2X1 U825 ( .A(n766), .B(n1170), .Y(N181) );
  NAND2X1 U826 ( .A(N171), .B(n749), .Y(n771) );
  NAND2X1 U827 ( .A(n771), .B(n941), .Y(N179) );
  NAND2X1 U828 ( .A(n749), .B(n767), .Y(n773) );
  NAND2X1 U829 ( .A(N171), .B(n1204), .Y(n958) );
  NAND2X1 U830 ( .A(n773), .B(n958), .Y(N175) );
  INVX2 U831 ( .A(hwdata[15]), .Y(n888) );
  NAND2X1 U832 ( .A(N171), .B(n3), .Y(n829) );
  INVX2 U833 ( .A(state[1]), .Y(n768) );
  NAND2X1 U834 ( .A(state[0]), .B(n768), .Y(n1162) );
  NAND3X1 U835 ( .A(n175), .B(n1174), .C(n1201), .Y(n769) );
  NOR2X1 U836 ( .A(n888), .B(n769), .Y(\nxt_mapping[15][7] ) );
  INVX2 U837 ( .A(hwdata[14]), .Y(n889) );
  NOR2X1 U838 ( .A(n889), .B(n769), .Y(\nxt_mapping[15][6] ) );
  INVX2 U839 ( .A(hwdata[13]), .Y(n890) );
  NOR2X1 U840 ( .A(n890), .B(n769), .Y(\nxt_mapping[15][5] ) );
  INVX2 U841 ( .A(hwdata[12]), .Y(n891) );
  NOR2X1 U842 ( .A(n891), .B(n769), .Y(\nxt_mapping[15][4] ) );
  INVX2 U843 ( .A(hwdata[11]), .Y(n892) );
  NOR2X1 U844 ( .A(n892), .B(n769), .Y(\nxt_mapping[15][3] ) );
  INVX2 U845 ( .A(hwdata[10]), .Y(n893) );
  NOR2X1 U846 ( .A(n893), .B(n769), .Y(\nxt_mapping[15][2] ) );
  INVX2 U847 ( .A(hwdata[9]), .Y(n894) );
  NOR2X1 U848 ( .A(n894), .B(n769), .Y(\nxt_mapping[15][1] ) );
  INVX2 U849 ( .A(hwdata[8]), .Y(n770) );
  NOR2X1 U850 ( .A(n770), .B(n769), .Y(\nxt_mapping[15][0] ) );
  XOR2X1 U851 ( .A(n771), .B(N172), .Y(n807) );
  INVX2 U852 ( .A(n807), .Y(N176) );
  INVX2 U853 ( .A(N175), .Y(n806) );
  NAND2X1 U854 ( .A(N176), .B(n806), .Y(n845) );
  INVX2 U855 ( .A(n771), .Y(n862) );
  NAND2X1 U856 ( .A(n862), .B(N172), .Y(n772) );
  XOR2X1 U857 ( .A(n772), .B(N173), .Y(n844) );
  INVX2 U858 ( .A(n844), .Y(N177) );
  NAND2X1 U859 ( .A(N177), .B(n1204), .Y(n808) );
  INVX2 U860 ( .A(n773), .Y(n883) );
  NAND2X1 U861 ( .A(n883), .B(n3), .Y(n777) );
  OAI21X1 U862 ( .A(n845), .B(n808), .C(n777), .Y(n774) );
  INVX2 U863 ( .A(n774), .Y(n789) );
  NAND2X1 U864 ( .A(hwdata[15]), .B(n182), .Y(n868) );
  INVX2 U865 ( .A(n808), .Y(n810) );
  NAND2X1 U866 ( .A(n810), .B(n164), .Y(n775) );
  OAI21X1 U867 ( .A(n1096), .B(n775), .C(n777), .Y(n776) );
  NAND2X1 U868 ( .A(n1201), .B(n776), .Y(n787) );
  INVX2 U869 ( .A(n777), .Y(n786) );
  NAND2X1 U870 ( .A(n1201), .B(n1096), .Y(n1160) );
  MUX2X1 U871 ( .B(hwdata[7]), .A(hwdata[15]), .S(n748), .Y(n920) );
  INVX2 U872 ( .A(n920), .Y(n1120) );
  AOI22X1 U873 ( .A(\mapping[13][7] ), .B(n787), .C(n786), .D(n165), .Y(n778)
         );
  OAI21X1 U874 ( .A(n789), .B(n868), .C(n778), .Y(n1011) );
  NAND2X1 U875 ( .A(hwdata[14]), .B(n182), .Y(n870) );
  MUX2X1 U876 ( .B(hwdata[6]), .A(hwdata[14]), .S(n748), .Y(n923) );
  INVX2 U877 ( .A(n923), .Y(n1123) );
  AOI22X1 U878 ( .A(\mapping[13][6] ), .B(n787), .C(n786), .D(n166), .Y(n779)
         );
  OAI21X1 U879 ( .A(n789), .B(n870), .C(n779), .Y(n1012) );
  NAND2X1 U880 ( .A(hwdata[13]), .B(n182), .Y(n872) );
  MUX2X1 U881 ( .B(hwdata[5]), .A(hwdata[13]), .S(n748), .Y(n926) );
  INVX2 U882 ( .A(n926), .Y(n1126) );
  AOI22X1 U883 ( .A(\mapping[13][5] ), .B(n787), .C(n786), .D(n167), .Y(n780)
         );
  OAI21X1 U884 ( .A(n789), .B(n872), .C(n780), .Y(n1013) );
  NAND2X1 U885 ( .A(hwdata[12]), .B(n182), .Y(n874) );
  MUX2X1 U886 ( .B(hwdata[4]), .A(hwdata[12]), .S(n748), .Y(n929) );
  INVX2 U887 ( .A(n929), .Y(n1129) );
  AOI22X1 U888 ( .A(\mapping[13][4] ), .B(n787), .C(n786), .D(n168), .Y(n781)
         );
  OAI21X1 U889 ( .A(n789), .B(n874), .C(n781), .Y(n1014) );
  NAND2X1 U890 ( .A(hwdata[11]), .B(n182), .Y(n876) );
  MUX2X1 U891 ( .B(hwdata[3]), .A(hwdata[11]), .S(n748), .Y(n932) );
  INVX2 U892 ( .A(n932), .Y(n1132) );
  AOI22X1 U893 ( .A(\mapping[13][3] ), .B(n787), .C(n786), .D(n169), .Y(n782)
         );
  OAI21X1 U894 ( .A(n789), .B(n876), .C(n782), .Y(n1015) );
  NAND2X1 U895 ( .A(hwdata[10]), .B(n182), .Y(n878) );
  MUX2X1 U896 ( .B(hwdata[2]), .A(hwdata[10]), .S(n749), .Y(n935) );
  INVX2 U897 ( .A(n935), .Y(n1135) );
  AOI22X1 U898 ( .A(\mapping[13][2] ), .B(n787), .C(n786), .D(n170), .Y(n783)
         );
  OAI21X1 U899 ( .A(n789), .B(n878), .C(n783), .Y(n1016) );
  NAND2X1 U900 ( .A(hwdata[9]), .B(n182), .Y(n880) );
  MUX2X1 U901 ( .B(hwdata[1]), .A(hwdata[9]), .S(n749), .Y(n940) );
  INVX2 U902 ( .A(n940), .Y(n1138) );
  AOI22X1 U903 ( .A(\mapping[13][1] ), .B(n787), .C(n786), .D(n171), .Y(n784)
         );
  OAI21X1 U904 ( .A(n789), .B(n880), .C(n784), .Y(n1017) );
  NAND2X1 U905 ( .A(hwdata[8]), .B(n182), .Y(n901) );
  MUX2X1 U906 ( .B(hwdata[0]), .A(hwdata[8]), .S(n749), .Y(n785) );
  INVX2 U907 ( .A(n785), .Y(n1141) );
  NAND2X1 U908 ( .A(n1118), .B(n1141), .Y(n1171) );
  AOI22X1 U909 ( .A(\mapping[13][0] ), .B(n787), .C(n786), .D(n1106), .Y(n788)
         );
  OAI21X1 U910 ( .A(n789), .B(n901), .C(n788), .Y(n1018) );
  NAND2X1 U911 ( .A(N175), .B(n807), .Y(n791) );
  NAND2X1 U912 ( .A(n2), .B(n862), .Y(n794) );
  OAI21X1 U913 ( .A(n791), .B(n808), .C(n794), .Y(n790) );
  INVX2 U914 ( .A(n790), .Y(n805) );
  INVX2 U915 ( .A(n791), .Y(n861) );
  NAND2X1 U916 ( .A(n810), .B(n861), .Y(n792) );
  OAI21X1 U917 ( .A(n1096), .B(n792), .C(n794), .Y(n793) );
  NAND2X1 U918 ( .A(n1201), .B(n793), .Y(n803) );
  INVX2 U919 ( .A(n794), .Y(n802) );
  AOI22X1 U920 ( .A(\mapping[11][7] ), .B(n803), .C(n802), .D(n165), .Y(n795)
         );
  OAI21X1 U921 ( .A(n805), .B(n868), .C(n795), .Y(n1027) );
  AOI22X1 U922 ( .A(\mapping[11][6] ), .B(n803), .C(n802), .D(n166), .Y(n796)
         );
  OAI21X1 U923 ( .A(n805), .B(n870), .C(n796), .Y(n1028) );
  AOI22X1 U924 ( .A(\mapping[11][5] ), .B(n803), .C(n802), .D(n167), .Y(n797)
         );
  OAI21X1 U925 ( .A(n805), .B(n872), .C(n797), .Y(n1029) );
  AOI22X1 U926 ( .A(\mapping[11][4] ), .B(n803), .C(n802), .D(n168), .Y(n798)
         );
  OAI21X1 U927 ( .A(n805), .B(n874), .C(n798), .Y(n1030) );
  AOI22X1 U928 ( .A(\mapping[11][3] ), .B(n803), .C(n802), .D(n169), .Y(n799)
         );
  OAI21X1 U929 ( .A(n805), .B(n876), .C(n799), .Y(n1031) );
  AOI22X1 U930 ( .A(\mapping[11][2] ), .B(n803), .C(n802), .D(n170), .Y(n800)
         );
  OAI21X1 U931 ( .A(n805), .B(n878), .C(n800), .Y(n1032) );
  AOI22X1 U932 ( .A(\mapping[11][1] ), .B(n803), .C(n802), .D(n171), .Y(n801)
         );
  OAI21X1 U933 ( .A(n805), .B(n880), .C(n801), .Y(n1033) );
  AOI22X1 U934 ( .A(\mapping[11][0] ), .B(n803), .C(n802), .D(n1106), .Y(n804)
         );
  OAI21X1 U935 ( .A(n805), .B(n901), .C(n804), .Y(n1034) );
  NAND2X1 U936 ( .A(n807), .B(n806), .Y(n884) );
  NAND2X1 U937 ( .A(n883), .B(n2), .Y(n813) );
  OAI21X1 U938 ( .A(n884), .B(n808), .C(n813), .Y(n809) );
  INVX2 U939 ( .A(n809), .Y(n824) );
  INVX2 U940 ( .A(n884), .Y(n903) );
  NAND2X1 U941 ( .A(n810), .B(n903), .Y(n811) );
  OAI21X1 U942 ( .A(n1096), .B(n811), .C(n813), .Y(n812) );
  NAND2X1 U943 ( .A(n1201), .B(n812), .Y(n822) );
  INVX2 U944 ( .A(n813), .Y(n821) );
  AOI22X1 U945 ( .A(\mapping[9][7] ), .B(n822), .C(n821), .D(n165), .Y(n814)
         );
  OAI21X1 U946 ( .A(n824), .B(n868), .C(n814), .Y(n1043) );
  AOI22X1 U947 ( .A(\mapping[9][6] ), .B(n822), .C(n821), .D(n166), .Y(n815)
         );
  OAI21X1 U948 ( .A(n824), .B(n870), .C(n815), .Y(n1044) );
  AOI22X1 U949 ( .A(\mapping[9][5] ), .B(n822), .C(n821), .D(n167), .Y(n816)
         );
  OAI21X1 U950 ( .A(n824), .B(n872), .C(n816), .Y(n1045) );
  AOI22X1 U951 ( .A(\mapping[9][4] ), .B(n822), .C(n821), .D(n168), .Y(n817)
         );
  OAI21X1 U952 ( .A(n824), .B(n874), .C(n817), .Y(n1046) );
  AOI22X1 U953 ( .A(\mapping[9][3] ), .B(n822), .C(n821), .D(n169), .Y(n818)
         );
  OAI21X1 U954 ( .A(n824), .B(n876), .C(n818), .Y(n1047) );
  AOI22X1 U955 ( .A(\mapping[9][2] ), .B(n822), .C(n821), .D(n170), .Y(n819)
         );
  OAI21X1 U956 ( .A(n824), .B(n878), .C(n819), .Y(n1048) );
  AOI22X1 U957 ( .A(\mapping[9][1] ), .B(n822), .C(n821), .D(n171), .Y(n820)
         );
  OAI21X1 U958 ( .A(n824), .B(n880), .C(n820), .Y(n1049) );
  AOI22X1 U959 ( .A(\mapping[9][0] ), .B(n822), .C(n821), .D(n1106), .Y(n823)
         );
  OAI21X1 U960 ( .A(n824), .B(n901), .C(n823), .Y(n1050) );
  NAND2X1 U961 ( .A(n829), .B(n1204), .Y(n1188) );
  NAND2X1 U962 ( .A(N176), .B(N175), .Y(n828) );
  NAND2X1 U963 ( .A(n862), .B(n181), .Y(n827) );
  OAI21X1 U964 ( .A(n1188), .B(n828), .C(n827), .Y(n826) );
  INVX2 U965 ( .A(n826), .Y(n843) );
  NAND2X1 U966 ( .A(n829), .B(n749), .Y(n896) );
  INVX2 U967 ( .A(n896), .Y(n1146) );
  OAI21X1 U968 ( .A(n1146), .B(n828), .C(n827), .Y(n830) );
  NAND2X1 U969 ( .A(n830), .B(n829), .Y(n831) );
  NOR2X1 U970 ( .A(n1162), .B(n831), .Y(n832) );
  OAI21X1 U971 ( .A(nxt_hsize), .B(n840), .C(n832), .Y(n841) );
  AOI22X1 U972 ( .A(\mapping[7][7] ), .B(n841), .C(n840), .D(n165), .Y(n833)
         );
  OAI21X1 U973 ( .A(n843), .B(n868), .C(n833), .Y(n1059) );
  AOI22X1 U974 ( .A(\mapping[7][6] ), .B(n841), .C(n840), .D(n166), .Y(n834)
         );
  OAI21X1 U975 ( .A(n843), .B(n870), .C(n834), .Y(n1060) );
  AOI22X1 U976 ( .A(\mapping[7][5] ), .B(n841), .C(n840), .D(n167), .Y(n835)
         );
  OAI21X1 U977 ( .A(n843), .B(n872), .C(n835), .Y(n1061) );
  AOI22X1 U978 ( .A(\mapping[7][4] ), .B(n841), .C(n840), .D(n168), .Y(n836)
         );
  OAI21X1 U979 ( .A(n843), .B(n874), .C(n836), .Y(n1062) );
  AOI22X1 U980 ( .A(\mapping[7][3] ), .B(n841), .C(n840), .D(n169), .Y(n837)
         );
  OAI21X1 U981 ( .A(n843), .B(n876), .C(n837), .Y(n1063) );
  AOI22X1 U982 ( .A(\mapping[7][2] ), .B(n841), .C(n840), .D(n170), .Y(n838)
         );
  OAI21X1 U983 ( .A(n843), .B(n878), .C(n838), .Y(n1064) );
  AOI22X1 U984 ( .A(\mapping[7][1] ), .B(n841), .C(n840), .D(n171), .Y(n839)
         );
  OAI21X1 U985 ( .A(n843), .B(n880), .C(n839), .Y(n1065) );
  AOI22X1 U986 ( .A(\mapping[7][0] ), .B(n841), .C(n840), .D(n1106), .Y(n842)
         );
  OAI21X1 U987 ( .A(n843), .B(n901), .C(n842), .Y(n1066) );
  NAND2X1 U988 ( .A(n844), .B(n1204), .Y(n885) );
  NAND2X1 U989 ( .A(n883), .B(n181), .Y(n849) );
  OAI21X1 U990 ( .A(n885), .B(n845), .C(n849), .Y(n846) );
  INVX2 U991 ( .A(n846), .Y(n860) );
  INVX2 U992 ( .A(n885), .Y(n902) );
  NAND2X1 U993 ( .A(n164), .B(n902), .Y(n847) );
  OAI21X1 U994 ( .A(n1096), .B(n847), .C(n849), .Y(n848) );
  NAND2X1 U995 ( .A(n1201), .B(n848), .Y(n858) );
  INVX2 U996 ( .A(n849), .Y(n857) );
  AOI22X1 U997 ( .A(sample_data[15]), .B(n858), .C(n857), .D(n165), .Y(n850)
         );
  OAI21X1 U998 ( .A(n860), .B(n868), .C(n850), .Y(n1075) );
  AOI22X1 U999 ( .A(sample_data[14]), .B(n858), .C(n857), .D(n166), .Y(n851)
         );
  OAI21X1 U1000 ( .A(n860), .B(n870), .C(n851), .Y(n1076) );
  AOI22X1 U1001 ( .A(sample_data[13]), .B(n858), .C(n857), .D(n167), .Y(n852)
         );
  OAI21X1 U1002 ( .A(n860), .B(n872), .C(n852), .Y(n1077) );
  AOI22X1 U1003 ( .A(sample_data[12]), .B(n858), .C(n857), .D(n168), .Y(n853)
         );
  OAI21X1 U1004 ( .A(n860), .B(n874), .C(n853), .Y(n1078) );
  AOI22X1 U1005 ( .A(sample_data[11]), .B(n858), .C(n857), .D(n169), .Y(n854)
         );
  OAI21X1 U1006 ( .A(n860), .B(n876), .C(n854), .Y(n1079) );
  AOI22X1 U1007 ( .A(sample_data[10]), .B(n858), .C(n857), .D(n170), .Y(n855)
         );
  OAI21X1 U1008 ( .A(n860), .B(n878), .C(n855), .Y(n1080) );
  AOI22X1 U1009 ( .A(sample_data[9]), .B(n858), .C(n857), .D(n171), .Y(n856)
         );
  OAI21X1 U1010 ( .A(n860), .B(n880), .C(n856), .Y(n1081) );
  AOI22X1 U1011 ( .A(sample_data[8]), .B(n858), .C(n857), .D(n1106), .Y(n859)
         );
  OAI21X1 U1012 ( .A(n860), .B(n901), .C(n859), .Y(n1082) );
  NAND2X1 U1013 ( .A(n861), .B(n902), .Y(n864) );
  NAND2X1 U1014 ( .A(n174), .B(n862), .Y(n863) );
  INVX2 U1015 ( .A(n863), .Y(n866) );
  AOI21X1 U1016 ( .A(n864), .B(n863), .C(n1162), .Y(n865) );
  OAI21X1 U1017 ( .A(n866), .B(n1160), .C(n865), .Y(n881) );
  AOI22X1 U1018 ( .A(n147), .B(n1120), .C(fir_out[15]), .D(n881), .Y(n867) );
  OAI21X1 U1019 ( .A(n148), .B(n868), .C(n867), .Y(\nxt_mapping[3][7] ) );
  AOI22X1 U1020 ( .A(fir_out[14]), .B(n881), .C(n147), .D(n1123), .Y(n869) );
  OAI21X1 U1021 ( .A(n148), .B(n870), .C(n869), .Y(\nxt_mapping[3][6] ) );
  AOI22X1 U1022 ( .A(fir_out[13]), .B(n881), .C(n147), .D(n1126), .Y(n871) );
  OAI21X1 U1023 ( .A(n148), .B(n872), .C(n871), .Y(\nxt_mapping[3][5] ) );
  AOI22X1 U1024 ( .A(fir_out[12]), .B(n881), .C(n147), .D(n1129), .Y(n873) );
  OAI21X1 U1025 ( .A(n148), .B(n874), .C(n873), .Y(\nxt_mapping[3][4] ) );
  AOI22X1 U1026 ( .A(fir_out[11]), .B(n881), .C(n147), .D(n1132), .Y(n875) );
  OAI21X1 U1027 ( .A(n148), .B(n876), .C(n875), .Y(\nxt_mapping[3][3] ) );
  AOI22X1 U1028 ( .A(fir_out[10]), .B(n881), .C(n147), .D(n1135), .Y(n877) );
  OAI21X1 U1029 ( .A(n148), .B(n878), .C(n877), .Y(\nxt_mapping[3][2] ) );
  AOI22X1 U1030 ( .A(fir_out[9]), .B(n881), .C(n147), .D(n1138), .Y(n879) );
  OAI21X1 U1031 ( .A(n148), .B(n880), .C(n879), .Y(\nxt_mapping[3][1] ) );
  AOI22X1 U1032 ( .A(fir_out[8]), .B(n881), .C(n147), .D(n1141), .Y(n882) );
  OAI21X1 U1033 ( .A(n148), .B(n901), .C(n882), .Y(\nxt_mapping[3][0] ) );
  NAND2X1 U1034 ( .A(n883), .B(n174), .Y(n914) );
  OAI21X1 U1035 ( .A(n885), .B(n884), .C(n914), .Y(n911) );
  INVX2 U1036 ( .A(n911), .Y(n886) );
  OAI21X1 U1037 ( .A(n886), .B(n1096), .C(n914), .Y(n887) );
  NAND2X1 U1038 ( .A(n1201), .B(n887), .Y(n895) );
  NOR2X1 U1039 ( .A(n895), .B(n888), .Y(\nxt_mapping[1][7] ) );
  NOR2X1 U1040 ( .A(n895), .B(n889), .Y(\nxt_mapping[1][6] ) );
  NOR2X1 U1041 ( .A(n895), .B(n890), .Y(\nxt_mapping[1][5] ) );
  NOR2X1 U1042 ( .A(n895), .B(n891), .Y(\nxt_mapping[1][4] ) );
  NOR2X1 U1043 ( .A(n895), .B(n892), .Y(\nxt_mapping[1][3] ) );
  NOR2X1 U1044 ( .A(n895), .B(n893), .Y(\nxt_mapping[1][2] ) );
  NOR2X1 U1045 ( .A(n895), .B(n894), .Y(\nxt_mapping[1][1] ) );
  INVX2 U1046 ( .A(new_coefficient_set), .Y(n905) );
  NAND2X1 U1047 ( .A(n896), .B(n1188), .Y(n898) );
  OAI21X1 U1048 ( .A(n163), .B(n1160), .C(n1201), .Y(n897) );
  NAND2X1 U1049 ( .A(coefficient_num[1]), .B(coefficient_num[0]), .Y(n916) );
  OAI21X1 U1050 ( .A(n898), .B(n897), .C(n916), .Y(n917) );
  NAND2X1 U1051 ( .A(hwdata[0]), .B(n182), .Y(n1144) );
  INVX2 U1052 ( .A(n1144), .Y(n1164) );
  NAND2X1 U1053 ( .A(n163), .B(n1118), .Y(n939) );
  INVX2 U1054 ( .A(n939), .Y(n899) );
  AOI22X1 U1055 ( .A(n1164), .B(n1174), .C(n899), .D(n1141), .Y(n900) );
  OAI21X1 U1056 ( .A(n905), .B(n917), .C(n900), .Y(\nxt_mapping[14][0] ) );
  INVX2 U1057 ( .A(n901), .Y(n912) );
  NAND2X1 U1058 ( .A(n903), .B(n902), .Y(n904) );
  OAI21X1 U1059 ( .A(n1118), .B(n904), .C(n914), .Y(n909) );
  NAND2X1 U1060 ( .A(n906), .B(n905), .Y(n1161) );
  INVX2 U1061 ( .A(n1161), .Y(n907) );
  NAND2X1 U1062 ( .A(err), .B(n907), .Y(n908) );
  AOI21X1 U1063 ( .A(n1201), .B(n909), .C(n908), .Y(n910) );
  AOI21X1 U1064 ( .A(n912), .B(n911), .C(n910), .Y(n913) );
  OAI21X1 U1065 ( .A(n1171), .B(n914), .C(n913), .Y(\nxt_mapping[1][0] ) );
  INVX2 U1066 ( .A(coefficient_num[0]), .Y(n1205) );
  INVX2 U1067 ( .A(coefficient_num[1]), .Y(n915) );
  NAND2X1 U1068 ( .A(n1205), .B(n915), .Y(N170) );
  OAI21X1 U1069 ( .A(coefficient_num[0]), .B(coefficient_num[1]), .C(n916), 
        .Y(N169) );
  INVX2 U1070 ( .A(n917), .Y(n937) );
  NAND2X1 U1071 ( .A(hwdata[7]), .B(n182), .Y(n1122) );
  INVX2 U1072 ( .A(n1122), .Y(n918) );
  AOI22X1 U1073 ( .A(n937), .B(\mapping[14][7] ), .C(n918), .D(n1174), .Y(n919) );
  OAI21X1 U1074 ( .A(n920), .B(n939), .C(n919), .Y(\nxt_mapping[14][7] ) );
  NAND2X1 U1075 ( .A(hwdata[6]), .B(n182), .Y(n1125) );
  INVX2 U1076 ( .A(n1125), .Y(n921) );
  AOI22X1 U1077 ( .A(n937), .B(\mapping[14][6] ), .C(n921), .D(n1174), .Y(n922) );
  OAI21X1 U1078 ( .A(n923), .B(n939), .C(n922), .Y(\nxt_mapping[14][6] ) );
  NAND2X1 U1079 ( .A(hwdata[5]), .B(n182), .Y(n1128) );
  INVX2 U1080 ( .A(n1128), .Y(n924) );
  AOI22X1 U1081 ( .A(n937), .B(\mapping[14][5] ), .C(n924), .D(n1174), .Y(n925) );
  OAI21X1 U1082 ( .A(n926), .B(n939), .C(n925), .Y(\nxt_mapping[14][5] ) );
  NAND2X1 U1083 ( .A(hwdata[4]), .B(n182), .Y(n1131) );
  INVX2 U1084 ( .A(n1131), .Y(n927) );
  AOI22X1 U1085 ( .A(n937), .B(\mapping[14][4] ), .C(n927), .D(n1174), .Y(n928) );
  OAI21X1 U1086 ( .A(n929), .B(n939), .C(n928), .Y(\nxt_mapping[14][4] ) );
  NAND2X1 U1087 ( .A(hwdata[3]), .B(n182), .Y(n1134) );
  INVX2 U1088 ( .A(n1134), .Y(n930) );
  AOI22X1 U1089 ( .A(n937), .B(\mapping[14][3] ), .C(n930), .D(n1174), .Y(n931) );
  OAI21X1 U1090 ( .A(n932), .B(n939), .C(n931), .Y(\nxt_mapping[14][3] ) );
  NAND2X1 U1091 ( .A(hwdata[2]), .B(n182), .Y(n1137) );
  INVX2 U1092 ( .A(n1137), .Y(n933) );
  AOI22X1 U1093 ( .A(n937), .B(\mapping[14][2] ), .C(n933), .D(n1174), .Y(n934) );
  OAI21X1 U1094 ( .A(n935), .B(n939), .C(n934), .Y(\nxt_mapping[14][2] ) );
  NAND2X1 U1095 ( .A(hwdata[1]), .B(n182), .Y(n1140) );
  INVX2 U1096 ( .A(n1140), .Y(n936) );
  AOI22X1 U1097 ( .A(n937), .B(\mapping[14][1] ), .C(n936), .D(n1174), .Y(n938) );
  OAI21X1 U1098 ( .A(n940), .B(n939), .C(n938), .Y(\nxt_mapping[14][1] ) );
  XOR2X1 U1099 ( .A(n941), .B(N172), .Y(n1148) );
  INVX2 U1100 ( .A(n1148), .Y(N180) );
  NAND2X1 U1101 ( .A(N180), .B(n1146), .Y(n1092) );
  NAND2X1 U1102 ( .A(N181), .B(n749), .Y(n961) );
  INVX2 U1103 ( .A(n961), .Y(n943) );
  INVX2 U1104 ( .A(N179), .Y(n1094) );
  NAND2X1 U1105 ( .A(n943), .B(n1094), .Y(n975) );
  NAND2X1 U1106 ( .A(n1091), .B(n3), .Y(n946) );
  OAI21X1 U1107 ( .A(n1092), .B(n975), .C(n946), .Y(n942) );
  INVX2 U1108 ( .A(n942), .Y(n957) );
  NAND2X1 U1109 ( .A(n145), .B(N180), .Y(n944) );
  OAI21X1 U1110 ( .A(n1096), .B(n944), .C(n946), .Y(n945) );
  NAND2X1 U1111 ( .A(n1201), .B(n945), .Y(n955) );
  INVX2 U1112 ( .A(n946), .Y(n954) );
  AOI22X1 U1113 ( .A(\mapping[12][7] ), .B(n955), .C(n954), .D(n165), .Y(n947)
         );
  OAI21X1 U1114 ( .A(n957), .B(n1122), .C(n947), .Y(n1019) );
  AOI22X1 U1115 ( .A(\mapping[12][6] ), .B(n955), .C(n954), .D(n166), .Y(n948)
         );
  OAI21X1 U1116 ( .A(n957), .B(n1125), .C(n948), .Y(n1020) );
  AOI22X1 U1117 ( .A(\mapping[12][5] ), .B(n955), .C(n954), .D(n167), .Y(n949)
         );
  OAI21X1 U1118 ( .A(n957), .B(n1128), .C(n949), .Y(n1021) );
  AOI22X1 U1119 ( .A(\mapping[12][4] ), .B(n955), .C(n954), .D(n168), .Y(n950)
         );
  OAI21X1 U1120 ( .A(n957), .B(n1131), .C(n950), .Y(n1022) );
  AOI22X1 U1121 ( .A(\mapping[12][3] ), .B(n955), .C(n954), .D(n169), .Y(n951)
         );
  OAI21X1 U1122 ( .A(n957), .B(n1134), .C(n951), .Y(n1023) );
  AOI22X1 U1123 ( .A(\mapping[12][2] ), .B(n955), .C(n954), .D(n170), .Y(n952)
         );
  OAI21X1 U1124 ( .A(n957), .B(n1137), .C(n952), .Y(n1024) );
  AOI22X1 U1125 ( .A(\mapping[12][1] ), .B(n955), .C(n954), .D(n171), .Y(n953)
         );
  OAI21X1 U1126 ( .A(n957), .B(n1140), .C(n953), .Y(n1025) );
  AOI22X1 U1127 ( .A(\mapping[12][0] ), .B(n955), .C(n954), .D(n1106), .Y(n956) );
  OAI21X1 U1128 ( .A(n957), .B(n1144), .C(n956), .Y(n1026) );
  NAND2X1 U1129 ( .A(N179), .B(n1148), .Y(n1114) );
  INVX2 U1130 ( .A(n958), .Y(n1111) );
  NAND2X1 U1131 ( .A(n2), .B(n1111), .Y(n960) );
  OAI21X1 U1132 ( .A(n1114), .B(n961), .C(n960), .Y(n959) );
  INVX2 U1133 ( .A(n959), .Y(n974) );
  OAI21X1 U1134 ( .A(n1114), .B(n961), .C(n960), .Y(n962) );
  AND2X2 U1135 ( .A(n1201), .B(n962), .Y(n963) );
  OAI21X1 U1136 ( .A(nxt_hsize), .B(n971), .C(n963), .Y(n972) );
  AOI22X1 U1137 ( .A(\mapping[10][7] ), .B(n972), .C(n971), .D(n165), .Y(n964)
         );
  OAI21X1 U1138 ( .A(n974), .B(n1122), .C(n964), .Y(n1035) );
  AOI22X1 U1139 ( .A(\mapping[10][6] ), .B(n972), .C(n971), .D(n166), .Y(n965)
         );
  OAI21X1 U1140 ( .A(n974), .B(n1125), .C(n965), .Y(n1036) );
  AOI22X1 U1141 ( .A(\mapping[10][5] ), .B(n972), .C(n971), .D(n167), .Y(n966)
         );
  OAI21X1 U1142 ( .A(n974), .B(n1128), .C(n966), .Y(n1037) );
  AOI22X1 U1143 ( .A(\mapping[10][4] ), .B(n972), .C(n971), .D(n168), .Y(n967)
         );
  OAI21X1 U1144 ( .A(n974), .B(n1131), .C(n967), .Y(n1038) );
  AOI22X1 U1145 ( .A(\mapping[10][3] ), .B(n972), .C(n971), .D(n169), .Y(n968)
         );
  OAI21X1 U1146 ( .A(n974), .B(n1134), .C(n968), .Y(n1039) );
  AOI22X1 U1147 ( .A(\mapping[10][2] ), .B(n972), .C(n971), .D(n170), .Y(n969)
         );
  OAI21X1 U1152 ( .A(n974), .B(n1137), .C(n969), .Y(n1040) );
  AOI22X1 U1153 ( .A(\mapping[10][1] ), .B(n972), .C(n971), .D(n171), .Y(n970)
         );
  OAI21X1 U1154 ( .A(n974), .B(n1140), .C(n970), .Y(n1041) );
  AOI22X1 U1155 ( .A(\mapping[10][0] ), .B(n972), .C(n971), .D(n1106), .Y(n973) );
  OAI21X1 U1156 ( .A(n974), .B(n1144), .C(n973), .Y(n1042) );
  NAND2X1 U1157 ( .A(n2), .B(n1091), .Y(n979) );
  OAI21X1 U1158 ( .A(N180), .B(n975), .C(n979), .Y(n976) );
  INVX2 U1159 ( .A(n976), .Y(n990) );
  NAND2X1 U1160 ( .A(n145), .B(n1092), .Y(n977) );
  OAI21X1 U1161 ( .A(n1096), .B(n977), .C(n979), .Y(n978) );
  NAND2X1 U1162 ( .A(n1201), .B(n978), .Y(n988) );
  INVX2 U1163 ( .A(n979), .Y(n987) );
  AOI22X1 U1164 ( .A(\mapping[8][7] ), .B(n988), .C(n987), .D(n165), .Y(n980)
         );
  OAI21X1 U1165 ( .A(n990), .B(n1122), .C(n980), .Y(n1051) );
  AOI22X1 U1166 ( .A(\mapping[8][6] ), .B(n988), .C(n987), .D(n166), .Y(n981)
         );
  OAI21X1 U1167 ( .A(n990), .B(n1125), .C(n981), .Y(n1052) );
  AOI22X1 U1168 ( .A(\mapping[8][5] ), .B(n988), .C(n987), .D(n167), .Y(n982)
         );
  OAI21X1 U1169 ( .A(n990), .B(n1128), .C(n982), .Y(n1053) );
  AOI22X1 U1170 ( .A(\mapping[8][4] ), .B(n988), .C(n987), .D(n168), .Y(n983)
         );
  OAI21X1 U1171 ( .A(n990), .B(n1131), .C(n983), .Y(n1054) );
  AOI22X1 U1172 ( .A(\mapping[8][3] ), .B(n988), .C(n987), .D(n169), .Y(n984)
         );
  OAI21X1 U1173 ( .A(n990), .B(n1134), .C(n984), .Y(n1055) );
  AOI22X1 U1174 ( .A(\mapping[8][2] ), .B(n988), .C(n987), .D(n170), .Y(n985)
         );
  OAI21X1 U1175 ( .A(n990), .B(n1137), .C(n985), .Y(n1056) );
  AOI22X1 U1176 ( .A(\mapping[8][1] ), .B(n988), .C(n987), .D(n171), .Y(n986)
         );
  OAI21X1 U1177 ( .A(n990), .B(n1140), .C(n986), .Y(n1057) );
  AOI22X1 U1178 ( .A(\mapping[8][0] ), .B(n988), .C(n987), .D(n1106), .Y(n989)
         );
  OAI21X1 U1179 ( .A(n990), .B(n1144), .C(n989), .Y(n1058) );
  NAND2X1 U1180 ( .A(n1111), .B(n181), .Y(n995) );
  OAI21X1 U1181 ( .A(n1094), .B(n1092), .C(n995), .Y(n991) );
  INVX2 U1182 ( .A(n991), .Y(n1006) );
  INVX2 U1183 ( .A(N181), .Y(n992) );
  NAND2X1 U1184 ( .A(n992), .B(n749), .Y(n1115) );
  INVX2 U1185 ( .A(n1115), .Y(n1007) );
  NAND2X1 U1186 ( .A(n162), .B(N179), .Y(n993) );
  OAI21X1 U1187 ( .A(n1096), .B(n993), .C(n995), .Y(n994) );
  NAND2X1 U1188 ( .A(n1201), .B(n994), .Y(n1004) );
  INVX2 U1189 ( .A(n995), .Y(n1003) );
  AOI22X1 U1190 ( .A(\mapping[6][7] ), .B(n1004), .C(n1003), .D(n165), .Y(n996) );
  OAI21X1 U1191 ( .A(n1006), .B(n1122), .C(n996), .Y(n1067) );
  AOI22X1 U1192 ( .A(\mapping[6][6] ), .B(n1004), .C(n1003), .D(n166), .Y(n997) );
  OAI21X1 U1193 ( .A(n1006), .B(n1125), .C(n997), .Y(n1068) );
  AOI22X1 U1194 ( .A(\mapping[6][5] ), .B(n1004), .C(n1003), .D(n167), .Y(n998) );
  OAI21X1 U1195 ( .A(n1006), .B(n1128), .C(n998), .Y(n1069) );
  AOI22X1 U1196 ( .A(\mapping[6][4] ), .B(n1004), .C(n1003), .D(n168), .Y(n999) );
  OAI21X1 U1197 ( .A(n1006), .B(n1131), .C(n999), .Y(n1070) );
  AOI22X1 U1198 ( .A(\mapping[6][3] ), .B(n1004), .C(n1003), .D(n169), .Y(
        n1000) );
  OAI21X1 U1199 ( .A(n1006), .B(n1134), .C(n1000), .Y(n1071) );
  AOI22X1 U1200 ( .A(\mapping[6][2] ), .B(n1004), .C(n1003), .D(n170), .Y(
        n1001) );
  OAI21X1 U1201 ( .A(n1006), .B(n1137), .C(n1001), .Y(n1072) );
  AOI22X1 U1202 ( .A(\mapping[6][1] ), .B(n1004), .C(n1003), .D(n171), .Y(
        n1002) );
  OAI21X1 U1203 ( .A(n1006), .B(n1140), .C(n1002), .Y(n1073) );
  AOI22X1 U1204 ( .A(\mapping[6][0] ), .B(n1004), .C(n1003), .D(n1106), .Y(
        n1005) );
  OAI21X1 U1205 ( .A(n1006), .B(n1144), .C(n1005), .Y(n1074) );
  NAND2X1 U1206 ( .A(n1007), .B(n1094), .Y(n1147) );
  NAND2X1 U1207 ( .A(n1091), .B(n181), .Y(n1098) );
  OAI21X1 U1208 ( .A(n1147), .B(n1092), .C(n1098), .Y(n1093) );
  INVX2 U1209 ( .A(n1093), .Y(n1110) );
  NAND2X1 U1210 ( .A(n162), .B(n1094), .Y(n1095) );
  OAI21X1 U1211 ( .A(n1096), .B(n1095), .C(n1098), .Y(n1097) );
  NAND2X1 U1212 ( .A(n1201), .B(n1097), .Y(n1108) );
  INVX2 U1213 ( .A(n1098), .Y(n1107) );
  AOI22X1 U1214 ( .A(sample_data[7]), .B(n1108), .C(n165), .D(n1107), .Y(n1099) );
  OAI21X1 U1215 ( .A(n1110), .B(n1122), .C(n1099), .Y(n1083) );
  AOI22X1 U1216 ( .A(sample_data[6]), .B(n1108), .C(n166), .D(n1107), .Y(n1100) );
  OAI21X1 U1217 ( .A(n1110), .B(n1125), .C(n1100), .Y(n1084) );
  AOI22X1 U1218 ( .A(sample_data[5]), .B(n1108), .C(n167), .D(n1107), .Y(n1101) );
  OAI21X1 U1219 ( .A(n1110), .B(n1128), .C(n1101), .Y(n1085) );
  AOI22X1 U1220 ( .A(sample_data[4]), .B(n1108), .C(n168), .D(n1107), .Y(n1102) );
  OAI21X1 U1221 ( .A(n1110), .B(n1131), .C(n1102), .Y(n1086) );
  AOI22X1 U1222 ( .A(sample_data[3]), .B(n1108), .C(n169), .D(n1107), .Y(n1103) );
  OAI21X1 U1223 ( .A(n1110), .B(n1134), .C(n1103), .Y(n1087) );
  AOI22X1 U1224 ( .A(sample_data[2]), .B(n1108), .C(n170), .D(n1107), .Y(n1104) );
  OAI21X1 U1225 ( .A(n1110), .B(n1137), .C(n1104), .Y(n1088) );
  AOI22X1 U1226 ( .A(sample_data[1]), .B(n1108), .C(n171), .D(n1107), .Y(n1105) );
  OAI21X1 U1227 ( .A(n1110), .B(n1140), .C(n1105), .Y(n1089) );
  AOI22X1 U1228 ( .A(sample_data[0]), .B(n1108), .C(n1107), .D(n1106), .Y(
        n1109) );
  OAI21X1 U1229 ( .A(n1110), .B(n1144), .C(n1109), .Y(n1090) );
  NAND2X1 U1230 ( .A(n1111), .B(n174), .Y(n1113) );
  OAI21X1 U1231 ( .A(n1115), .B(n1114), .C(n1113), .Y(n1112) );
  INVX2 U1232 ( .A(n1112), .Y(n1145) );
  INVX2 U1233 ( .A(n1113), .Y(n1119) );
  OAI21X1 U1234 ( .A(n1115), .B(n1114), .C(n1113), .Y(n1116) );
  AND2X2 U1235 ( .A(n1201), .B(n1116), .Y(n1117) );
  OAI21X1 U1236 ( .A(n1119), .B(n1160), .C(n1117), .Y(n1142) );
  AOI22X1 U1237 ( .A(fir_out[7]), .B(n1142), .C(n146), .D(n1120), .Y(n1121) );
  OAI21X1 U1238 ( .A(n1145), .B(n1122), .C(n1121), .Y(\nxt_mapping[2][7] ) );
  AOI22X1 U1239 ( .A(fir_out[6]), .B(n1142), .C(n146), .D(n1123), .Y(n1124) );
  OAI21X1 U1240 ( .A(n1145), .B(n1125), .C(n1124), .Y(\nxt_mapping[2][6] ) );
  AOI22X1 U1241 ( .A(fir_out[5]), .B(n1142), .C(n146), .D(n1126), .Y(n1127) );
  OAI21X1 U1242 ( .A(n1145), .B(n1128), .C(n1127), .Y(\nxt_mapping[2][5] ) );
  AOI22X1 U1243 ( .A(fir_out[4]), .B(n1142), .C(n146), .D(n1129), .Y(n1130) );
  OAI21X1 U1244 ( .A(n1145), .B(n1131), .C(n1130), .Y(\nxt_mapping[2][4] ) );
  AOI22X1 U1245 ( .A(fir_out[3]), .B(n1142), .C(n146), .D(n1132), .Y(n1133) );
  OAI21X1 U1246 ( .A(n1145), .B(n1134), .C(n1133), .Y(\nxt_mapping[2][3] ) );
  AOI22X1 U1247 ( .A(fir_out[2]), .B(n1142), .C(n146), .D(n1135), .Y(n1136) );
  OAI21X1 U1248 ( .A(n1145), .B(n1137), .C(n1136), .Y(\nxt_mapping[2][2] ) );
  AOI22X1 U1249 ( .A(fir_out[1]), .B(n1142), .C(n146), .D(n1138), .Y(n1139) );
  OAI21X1 U1250 ( .A(n1145), .B(n1140), .C(n1139), .Y(\nxt_mapping[2][1] ) );
  AOI22X1 U1251 ( .A(fir_out[0]), .B(n1142), .C(n146), .D(n1141), .Y(n1143) );
  OAI21X1 U1252 ( .A(n1145), .B(n1144), .C(n1143), .Y(\nxt_mapping[2][0] ) );
  NAND2X1 U1253 ( .A(n1146), .B(nxt_hsize), .Y(n1176) );
  INVX2 U1254 ( .A(n1147), .Y(n1149) );
  NAND2X1 U1255 ( .A(n1149), .B(n1148), .Y(n1159) );
  OAI21X1 U1256 ( .A(n1176), .B(n1159), .C(n1170), .Y(n1150) );
  NAND2X1 U1257 ( .A(n1201), .B(n1150), .Y(n1158) );
  INVX2 U1258 ( .A(hwdata[7]), .Y(n1151) );
  NOR2X1 U1259 ( .A(n1158), .B(n1151), .Y(\nxt_mapping[0][7] ) );
  INVX2 U1260 ( .A(hwdata[6]), .Y(n1152) );
  NOR2X1 U1261 ( .A(n1158), .B(n1152), .Y(\nxt_mapping[0][6] ) );
  INVX2 U1262 ( .A(hwdata[5]), .Y(n1153) );
  NOR2X1 U1263 ( .A(n1158), .B(n1153), .Y(\nxt_mapping[0][5] ) );
  INVX2 U1264 ( .A(hwdata[4]), .Y(n1154) );
  NOR2X1 U1265 ( .A(n1158), .B(n1154), .Y(\nxt_mapping[0][4] ) );
  INVX2 U1266 ( .A(hwdata[3]), .Y(n1155) );
  NOR2X1 U1267 ( .A(n1158), .B(n1155), .Y(\nxt_mapping[0][3] ) );
  INVX2 U1268 ( .A(hwdata[2]), .Y(n1156) );
  NOR2X1 U1269 ( .A(n1158), .B(n1156), .Y(\nxt_mapping[0][2] ) );
  INVX2 U1270 ( .A(hwdata[1]), .Y(n1157) );
  NOR2X1 U1271 ( .A(n1158), .B(n1157), .Y(\nxt_mapping[0][1] ) );
  INVX2 U1272 ( .A(n1159), .Y(n1165) );
  INVX2 U1273 ( .A(n1170), .Y(n1166) );
  AOI21X1 U1274 ( .A(n1165), .B(n1160), .C(n1166), .Y(n1163) );
  OAI21X1 U1275 ( .A(n1163), .B(n1162), .C(n1161), .Y(n1168) );
  OAI21X1 U1276 ( .A(n1166), .B(n1165), .C(n1164), .Y(n1167) );
  AND2X2 U1277 ( .A(n1168), .B(n1167), .Y(n1169) );
  OAI21X1 U1278 ( .A(n1171), .B(n1170), .C(n1169), .Y(\nxt_mapping[0][0] ) );
  INVX2 U1279 ( .A(state[0]), .Y(n1172) );
  OAI21X1 U1280 ( .A(nxt_hsize), .B(n749), .C(n1188), .Y(n1173) );
  NAND2X1 U1281 ( .A(n183), .B(n1173), .Y(n1186) );
  NAND3X1 U1282 ( .A(n183), .B(nxt_hsize), .C(n1174), .Y(n1175) );
  INVX2 U1283 ( .A(n1175), .Y(n1184) );
  INVX2 U1284 ( .A(n1176), .Y(n1187) );
  AOI22X1 U1285 ( .A(new_coefficient_set), .B(n1184), .C(N1657), .D(n6), .Y(
        n1177) );
  OAI21X1 U1286 ( .A(N1645), .B(n1186), .C(n1177), .Y(hrdata[0]) );
  AOI22X1 U1287 ( .A(\mapping[14][1] ), .B(n1184), .C(N1656), .D(n6), .Y(n1178) );
  OAI21X1 U1288 ( .A(N1644), .B(n1186), .C(n1178), .Y(hrdata[1]) );
  AOI22X1 U1289 ( .A(\mapping[14][2] ), .B(n1184), .C(N1655), .D(n6), .Y(n1179) );
  OAI21X1 U1290 ( .A(N1643), .B(n1186), .C(n1179), .Y(hrdata[2]) );
  AOI22X1 U1291 ( .A(\mapping[14][3] ), .B(n1184), .C(N1654), .D(n6), .Y(n1180) );
  OAI21X1 U1292 ( .A(N1642), .B(n1186), .C(n1180), .Y(hrdata[3]) );
  AOI22X1 U1293 ( .A(\mapping[14][4] ), .B(n1184), .C(N1653), .D(n6), .Y(n1181) );
  OAI21X1 U1294 ( .A(N1641), .B(n1186), .C(n1181), .Y(hrdata[4]) );
  AOI22X1 U1295 ( .A(\mapping[14][5] ), .B(n1184), .C(N1652), .D(n6), .Y(n1182) );
  OAI21X1 U1296 ( .A(N1640), .B(n1186), .C(n1182), .Y(hrdata[5]) );
  AOI22X1 U1297 ( .A(\mapping[14][6] ), .B(n1184), .C(N1651), .D(n6), .Y(n1183) );
  OAI21X1 U1298 ( .A(N1639), .B(n1186), .C(n1183), .Y(hrdata[6]) );
  AOI22X1 U1299 ( .A(\mapping[14][7] ), .B(n1184), .C(N1650), .D(n6), .Y(n1185) );
  OAI21X1 U1300 ( .A(N1638), .B(n1186), .C(n1185), .Y(hrdata[7]) );
  OAI21X1 U1301 ( .A(n175), .B(n1187), .C(n183), .Y(n1200) );
  INVX2 U1302 ( .A(n1188), .Y(n1189) );
  NAND3X1 U1303 ( .A(nxt_hsize), .B(n1189), .C(n183), .Y(n1190) );
  INVX2 U1304 ( .A(n1190), .Y(n1198) );
  NAND2X1 U1305 ( .A(N1636), .B(n1198), .Y(n1191) );
  OAI21X1 U1306 ( .A(N1645), .B(n1200), .C(n1191), .Y(hrdata[8]) );
  NAND2X1 U1307 ( .A(N1635), .B(n1198), .Y(n1192) );
  OAI21X1 U1308 ( .A(N1644), .B(n1200), .C(n1192), .Y(hrdata[9]) );
  NAND2X1 U1309 ( .A(N1634), .B(n1198), .Y(n1193) );
  OAI21X1 U1310 ( .A(N1643), .B(n1200), .C(n1193), .Y(hrdata[10]) );
  NAND2X1 U1311 ( .A(N1633), .B(n1198), .Y(n1194) );
  OAI21X1 U1312 ( .A(N1642), .B(n1200), .C(n1194), .Y(hrdata[11]) );
  NAND2X1 U1313 ( .A(N1632), .B(n1198), .Y(n1195) );
  OAI21X1 U1314 ( .A(N1641), .B(n1200), .C(n1195), .Y(hrdata[12]) );
  NAND2X1 U1315 ( .A(N1631), .B(n1198), .Y(n1196) );
  OAI21X1 U1316 ( .A(N1640), .B(n1200), .C(n1196), .Y(hrdata[13]) );
  NAND2X1 U1317 ( .A(N1630), .B(n1198), .Y(n1197) );
  OAI21X1 U1318 ( .A(N1639), .B(n1200), .C(n1197), .Y(hrdata[14]) );
  NAND2X1 U1319 ( .A(N1629), .B(n1198), .Y(n1199) );
  OAI21X1 U1320 ( .A(N1638), .B(n1200), .C(n1199), .Y(hrdata[15]) );
  NAND2X1 U1321 ( .A(n1201), .B(n181), .Y(n1203) );
  NAND2X1 U1322 ( .A(n906), .B(data_ready), .Y(n1202) );
  OAI21X1 U1323 ( .A(N171), .B(n1203), .C(n1202), .Y(nxt_data_ready) );
  INVX2 U1324 ( .A(hsel), .Y(n1206) );
  INVX2 U1325 ( .A(hwrite), .Y(n1207) );
  INVX2 U1326 ( .A(haddr[3]), .Y(n1208) );
  INVX2 U1327 ( .A(haddr[2]), .Y(n1209) );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, err, 
        op, src1, src2, dest );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n128, n129, n130, n131, n132, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208;
  wire   [4:0] state;
  assign src1[3] = 1'b0;

  DFFSR \state_reg[0]  ( .D(n132), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(n128), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[4]  ( .D(n131), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  DFFSR \state_reg[2]  ( .D(n129), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(n130), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR modwait_reg ( .D(n208), .CLK(clk), .R(n_rst), .S(1'b1), .Q(modwait) );
  BUFX2 U9 ( .A(n72), .Y(n15) );
  INVX1 U10 ( .A(n35), .Y(n7) );
  BUFX2 U11 ( .A(n74), .Y(n8) );
  INVX4 U12 ( .A(n78), .Y(n173) );
  INVX1 U13 ( .A(overflow), .Y(n134) );
  INVX1 U14 ( .A(n76), .Y(n9) );
  BUFX4 U15 ( .A(n187), .Y(n32) );
  INVX2 U16 ( .A(n76), .Y(n77) );
  INVX2 U17 ( .A(n55), .Y(n10) );
  INVX1 U18 ( .A(n55), .Y(n72) );
  INVX1 U19 ( .A(n136), .Y(n46) );
  AND2X2 U20 ( .A(n39), .B(n108), .Y(n11) );
  AND2X2 U21 ( .A(n79), .B(n71), .Y(n12) );
  INVX2 U22 ( .A(n42), .Y(n26) );
  AND2X2 U23 ( .A(n138), .B(n139), .Y(n13) );
  INVX1 U24 ( .A(n111), .Y(n14) );
  OAI21X1 U25 ( .A(n183), .B(n182), .C(n181), .Y(n16) );
  BUFX2 U26 ( .A(n179), .Y(n17) );
  INVX1 U27 ( .A(n69), .Y(n18) );
  INVX1 U28 ( .A(n18), .Y(n19) );
  BUFX2 U29 ( .A(n154), .Y(n20) );
  INVX1 U30 ( .A(n33), .Y(n21) );
  INVX2 U31 ( .A(n79), .Y(n188) );
  BUFX2 U32 ( .A(n9), .Y(n22) );
  NOR2X1 U33 ( .A(n111), .B(n137), .Y(n64) );
  INVX1 U34 ( .A(n137), .Y(n89) );
  INVX1 U35 ( .A(n26), .Y(n23) );
  INVX4 U36 ( .A(n10), .Y(n118) );
  INVX2 U37 ( .A(n177), .Y(n86) );
  INVX1 U38 ( .A(n73), .Y(n42) );
  BUFX2 U39 ( .A(n45), .Y(n24) );
  AND2X2 U40 ( .A(n89), .B(n14), .Y(n25) );
  NAND2X1 U41 ( .A(n85), .B(n86), .Y(n27) );
  INVX1 U42 ( .A(n164), .Y(n130) );
  INVX1 U43 ( .A(n78), .Y(n28) );
  INVX1 U44 ( .A(n58), .Y(n35) );
  BUFX2 U45 ( .A(state[2]), .Y(n29) );
  INVX1 U46 ( .A(state[2]), .Y(n76) );
  AND2X2 U47 ( .A(n79), .B(n23), .Y(n30) );
  INVX1 U48 ( .A(n127), .Y(n31) );
  INVX1 U49 ( .A(n127), .Y(n87) );
  BUFX2 U50 ( .A(state[3]), .Y(n78) );
  INVX1 U51 ( .A(state[4]), .Y(n187) );
  INVX1 U52 ( .A(n58), .Y(n33) );
  INVX1 U53 ( .A(n71), .Y(n34) );
  BUFX2 U54 ( .A(n30), .Y(n36) );
  INVX2 U55 ( .A(state[1]), .Y(n58) );
  INVX4 U56 ( .A(n53), .Y(src2[2]) );
  INVX1 U57 ( .A(n65), .Y(n37) );
  INVX1 U58 ( .A(n37), .Y(n38) );
  BUFX2 U59 ( .A(state[4]), .Y(n73) );
  BUFX2 U60 ( .A(n198), .Y(n39) );
  INVX1 U61 ( .A(n29), .Y(n40) );
  INVX2 U62 ( .A(n29), .Y(n41) );
  INVX1 U63 ( .A(n29), .Y(n91) );
  INVX1 U64 ( .A(n45), .Y(n43) );
  INVX1 U65 ( .A(n90), .Y(n44) );
  INVX1 U66 ( .A(n180), .Y(n90) );
  INVX4 U67 ( .A(n51), .Y(src2[0]) );
  BUFX4 U68 ( .A(state[3]), .Y(n45) );
  OR2X1 U69 ( .A(n135), .B(n47), .Y(n131) );
  NAND2X1 U70 ( .A(n46), .B(n13), .Y(n47) );
  BUFX2 U71 ( .A(overflow), .Y(n48) );
  NAND2X1 U72 ( .A(n58), .B(n71), .Y(n49) );
  NAND2X1 U73 ( .A(n31), .B(n50), .Y(n198) );
  INVX2 U74 ( .A(n49), .Y(n50) );
  AND2X2 U75 ( .A(n60), .B(n27), .Y(n51) );
  INVX1 U76 ( .A(n87), .Y(n52) );
  NAND2X1 U77 ( .A(n87), .B(n12), .Y(n140) );
  AND2X2 U78 ( .A(n154), .B(n126), .Y(n53) );
  INVX1 U79 ( .A(n178), .Y(n85) );
  OR2X2 U80 ( .A(n174), .B(n175), .Y(n154) );
  INVX1 U81 ( .A(n89), .Y(n54) );
  INVX2 U82 ( .A(state[0]), .Y(n55) );
  INVX2 U83 ( .A(n55), .Y(n71) );
  OR2X2 U84 ( .A(n194), .B(n193), .Y(src1[2]) );
  BUFX2 U85 ( .A(n27), .Y(n57) );
  BUFX2 U86 ( .A(n25), .Y(n59) );
  AND2X1 U87 ( .A(n36), .B(n34), .Y(n67) );
  AND2X2 U88 ( .A(n9), .B(n23), .Y(n70) );
  AND2X2 U89 ( .A(n79), .B(n32), .Y(n68) );
  AND2X1 U90 ( .A(n60), .B(n108), .Y(n61) );
  INVX2 U91 ( .A(n194), .Y(n60) );
  OR2X2 U92 ( .A(n191), .B(n192), .Y(n171) );
  OR2X2 U93 ( .A(n182), .B(n183), .Y(n155) );
  AND2X1 U94 ( .A(n155), .B(n195), .Y(n66) );
  AND2X2 U95 ( .A(n166), .B(n165), .Y(n62) );
  INVX4 U96 ( .A(n75), .Y(src1[0]) );
  AND2X2 U97 ( .A(n77), .B(n72), .Y(n63) );
  AND2X2 U98 ( .A(n118), .B(n173), .Y(n65) );
  AND2X2 U99 ( .A(n73), .B(n91), .Y(n69) );
  BUFX4 U100 ( .A(state[1]), .Y(n79) );
  INVX1 U101 ( .A(n109), .Y(n110) );
  AND2X2 U102 ( .A(n77), .B(n73), .Y(n74) );
  INVX1 U103 ( .A(n140), .Y(n122) );
  NOR2X1 U104 ( .A(n176), .B(n184), .Y(n75) );
  OR2X2 U105 ( .A(n16), .B(n185), .Y(src1[1]) );
  NAND2X1 U106 ( .A(n118), .B(n79), .Y(n180) );
  NAND3X1 U107 ( .A(n32), .B(n40), .C(n45), .Y(n179) );
  NAND2X1 U108 ( .A(n70), .B(n7), .Y(n117) );
  INVX2 U109 ( .A(n117), .Y(n82) );
  NAND2X1 U110 ( .A(n118), .B(n45), .Y(n190) );
  INVX2 U111 ( .A(n190), .Y(n81) );
  NAND2X1 U112 ( .A(n82), .B(n81), .Y(n170) );
  OAI21X1 U113 ( .A(n44), .B(n17), .C(n170), .Y(n156) );
  INVX2 U114 ( .A(n156), .Y(n99) );
  NAND3X1 U115 ( .A(n23), .B(n7), .C(n40), .Y(n80) );
  INVX2 U116 ( .A(n80), .Y(n94) );
  NAND2X1 U117 ( .A(n81), .B(n94), .Y(n202) );
  NAND3X1 U118 ( .A(n43), .B(n15), .C(n94), .Y(n196) );
  INVX2 U119 ( .A(n196), .Y(n142) );
  NAND3X1 U120 ( .A(n82), .B(n15), .C(n43), .Y(n165) );
  INVX2 U121 ( .A(n165), .Y(n83) );
  NOR2X1 U122 ( .A(n142), .B(n83), .Y(n84) );
  NAND3X1 U123 ( .A(n99), .B(n202), .C(n84), .Y(dest[0]) );
  NAND3X1 U124 ( .A(n77), .B(n45), .C(n79), .Y(n174) );
  NAND2X1 U125 ( .A(n118), .B(n32), .Y(n175) );
  NAND3X1 U126 ( .A(n58), .B(n73), .C(n118), .Y(n177) );
  NAND2X1 U127 ( .A(n173), .B(n41), .Y(n178) );
  NAND2X1 U128 ( .A(n85), .B(n86), .Y(n126) );
  NAND3X1 U129 ( .A(n73), .B(n41), .C(n173), .Y(n127) );
  NAND3X1 U130 ( .A(n68), .B(n45), .C(n63), .Y(n109) );
  NAND3X1 U131 ( .A(n109), .B(n140), .C(n198), .Y(n137) );
  NOR2X1 U132 ( .A(n45), .B(n33), .Y(n88) );
  NAND3X1 U133 ( .A(n63), .B(n26), .C(n88), .Y(n197) );
  NAND3X1 U134 ( .A(n188), .B(n65), .C(n74), .Y(n186) );
  NAND3X1 U135 ( .A(n19), .B(n28), .C(n90), .Y(n108) );
  NAND2X1 U136 ( .A(n53), .B(n61), .Y(n167) );
  INVX2 U137 ( .A(n167), .Y(n204) );
  NAND3X1 U138 ( .A(n15), .B(n24), .C(n94), .Y(n207) );
  NAND3X1 U139 ( .A(n59), .B(n204), .C(n207), .Y(op[2]) );
  NAND3X1 U140 ( .A(n30), .B(n63), .C(n43), .Y(n166) );
  NAND3X1 U141 ( .A(n71), .B(n45), .C(n79), .Y(n182) );
  NAND2X1 U142 ( .A(n32), .B(n41), .Y(n183) );
  NOR2X1 U143 ( .A(n24), .B(n34), .Y(n93) );
  NOR2X1 U144 ( .A(n22), .B(n26), .Y(n92) );
  NAND3X1 U145 ( .A(n93), .B(n35), .C(n92), .Y(n195) );
  AND2X2 U146 ( .A(n166), .B(n66), .Y(n97) );
  NAND3X1 U147 ( .A(n45), .B(n77), .C(n71), .Y(n191) );
  NAND2X1 U148 ( .A(n32), .B(n58), .Y(n192) );
  NAND3X1 U149 ( .A(n8), .B(n38), .C(n35), .Y(n205) );
  NAND3X1 U150 ( .A(n94), .B(n43), .C(n34), .Y(n104) );
  NOR2X1 U151 ( .A(n15), .B(n24), .Y(n95) );
  OAI21X1 U152 ( .A(n70), .B(n30), .C(n95), .Y(n106) );
  NAND3X1 U153 ( .A(n205), .B(n104), .C(n106), .Y(n206) );
  NOR3X1 U154 ( .A(n206), .B(dest[0]), .C(op[2]), .Y(n96) );
  NAND3X1 U155 ( .A(n97), .B(n171), .C(n96), .Y(n160) );
  INVX2 U156 ( .A(lc), .Y(n98) );
  INVX2 U157 ( .A(n202), .Y(n115) );
  NAND2X1 U158 ( .A(dr), .B(n115), .Y(n153) );
  OAI21X1 U159 ( .A(n104), .B(n98), .C(n153), .Y(n101) );
  NAND2X1 U160 ( .A(n99), .B(n106), .Y(n100) );
  NOR2X1 U161 ( .A(n101), .B(n100), .Y(n102) );
  OAI21X1 U162 ( .A(n34), .B(n160), .C(n102), .Y(n103) );
  AOI21X1 U163 ( .A(n134), .B(n167), .C(n103), .Y(n107) );
  OAI21X1 U164 ( .A(lc), .B(n104), .C(n205), .Y(n158) );
  INVX2 U165 ( .A(n158), .Y(n105) );
  OAI22X1 U166 ( .A(lc), .B(n106), .C(dr), .D(n105), .Y(n119) );
  NOR2X1 U167 ( .A(n107), .B(n119), .Y(n132) );
  NAND2X1 U168 ( .A(n57), .B(n11), .Y(n113) );
  NAND2X1 U169 ( .A(overflow), .B(n110), .Y(n151) );
  INVX2 U170 ( .A(n197), .Y(n111) );
  NAND2X1 U171 ( .A(overflow), .B(n111), .Y(n148) );
  NAND2X1 U172 ( .A(n151), .B(n148), .Y(n112) );
  AOI21X1 U173 ( .A(n48), .B(n113), .C(n112), .Y(n125) );
  INVX2 U174 ( .A(dr), .Y(n114) );
  NAND2X1 U175 ( .A(n115), .B(n114), .Y(n133) );
  NAND3X1 U176 ( .A(n133), .B(n171), .C(n165), .Y(n116) );
  INVX2 U177 ( .A(n116), .Y(n145) );
  NAND3X1 U178 ( .A(n117), .B(n66), .C(n145), .Y(n123) );
  INVX2 U179 ( .A(n119), .Y(n161) );
  NAND2X1 U180 ( .A(n161), .B(n160), .Y(n141) );
  OAI21X1 U181 ( .A(n67), .B(n141), .C(n22), .Y(n120) );
  NAND2X1 U182 ( .A(n60), .B(n120), .Y(n121) );
  NOR3X1 U183 ( .A(n123), .B(n122), .C(n121), .Y(n124) );
  NAND2X1 U184 ( .A(n125), .B(n124), .Y(n129) );
  AND2X2 U185 ( .A(n133), .B(n52), .Y(n139) );
  OAI21X1 U186 ( .A(n161), .B(n23), .C(n160), .Y(n136) );
  OAI21X1 U187 ( .A(n134), .B(n20), .C(n148), .Y(n135) );
  NOR2X1 U188 ( .A(src2[0]), .B(n54), .Y(n138) );
  OAI21X1 U189 ( .A(src2[0]), .B(n122), .C(n48), .Y(n152) );
  INVX2 U190 ( .A(n141), .Y(n144) );
  NOR2X1 U191 ( .A(n142), .B(n67), .Y(n143) );
  OAI21X1 U192 ( .A(n144), .B(n21), .C(n143), .Y(n147) );
  NAND3X1 U193 ( .A(n145), .B(n11), .C(n207), .Y(n146) );
  NOR2X1 U194 ( .A(n147), .B(n146), .Y(n149) );
  AND2X2 U195 ( .A(n149), .B(n148), .Y(n150) );
  NAND3X1 U196 ( .A(n152), .B(n151), .C(n150), .Y(n128) );
  OAI21X1 U197 ( .A(n48), .B(n20), .C(n153), .Y(n163) );
  INVX2 U198 ( .A(n155), .Y(n168) );
  NOR2X1 U199 ( .A(n168), .B(n156), .Y(n157) );
  NAND3X1 U200 ( .A(n171), .B(n207), .C(n157), .Y(n199) );
  NOR2X1 U201 ( .A(n199), .B(n158), .Y(n159) );
  OAI21X1 U202 ( .A(n43), .B(n160), .C(n159), .Y(n162) );
  OAI21X1 U203 ( .A(n163), .B(n162), .C(n161), .Y(n164) );
  NOR2X1 U204 ( .A(n168), .B(n167), .Y(n169) );
  NAND3X1 U205 ( .A(n62), .B(n170), .C(n169), .Y(dest[1]) );
  NAND3X1 U206 ( .A(n171), .B(n202), .C(n62), .Y(dest[2]) );
  NAND3X1 U207 ( .A(n204), .B(n196), .C(n195), .Y(dest[3]) );
  NAND2X1 U208 ( .A(n53), .B(n64), .Y(src2[1]) );
  NAND2X1 U209 ( .A(n61), .B(n25), .Y(src2[3]) );
  NOR2X1 U210 ( .A(n71), .B(n58), .Y(n172) );
  NAND3X1 U211 ( .A(n28), .B(n172), .C(n69), .Y(n181) );
  OAI22X1 U212 ( .A(n174), .B(n175), .C(n192), .D(n191), .Y(n176) );
  OAI22X1 U213 ( .A(n180), .B(n179), .C(n178), .D(n177), .Y(n185) );
  OAI21X1 U214 ( .A(n182), .B(n183), .C(n181), .Y(n184) );
  INVX2 U215 ( .A(n186), .Y(n194) );
  NAND3X1 U216 ( .A(n42), .B(n9), .C(n188), .Y(n189) );
  OAI22X1 U217 ( .A(n192), .B(n191), .C(n190), .D(n189), .Y(n193) );
  NAND3X1 U218 ( .A(n62), .B(n196), .C(n195), .Y(clear) );
  INVX2 U219 ( .A(clear), .Y(n203) );
  AND2X2 U220 ( .A(n198), .B(n197), .Y(n201) );
  INVX2 U221 ( .A(n199), .Y(n200) );
  NAND3X1 U222 ( .A(n203), .B(n201), .C(n200), .Y(op[0]) );
  NAND3X1 U223 ( .A(n204), .B(n203), .C(n202), .Y(op[1]) );
  INVX2 U224 ( .A(n205), .Y(err) );
  INVX2 U225 ( .A(n206), .Y(n208) );
  INVX2 U226 ( .A(n207), .Y(cnt_up) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N30, N29, N28, N27,
         N26, N25, N24, N23, N22, N21, n1, n2, n3, n4, n5, n6, n7, n8, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69;
  wire   [9:0] next_count;

  DFFSR \count_out_reg[9]  ( .D(next_count[9]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(next_count[8]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(next_count[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(next_count[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(next_count[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(next_count[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR rollover_flag_reg ( .D(N16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_47_aco ( .A({N30, N29, N28, N27, 
        N26, N25, N24, N23, N22, N21}), .SUM({N15, N14, N13, N12, N11, N10, N9, 
        N8, N7, N6}) );
  AND2X1 U14 ( .A(n33), .B(n32), .Y(n1) );
  AND2X2 U15 ( .A(count_enable), .B(n33), .Y(n2) );
  INVX2 U16 ( .A(n1), .Y(n3) );
  XNOR2X1 U17 ( .A(rollover_val[7]), .B(next_count[7]), .Y(n66) );
  XNOR2X1 U18 ( .A(rollover_val[5]), .B(next_count[5]), .Y(n59) );
  INVX2 U19 ( .A(count_out[6]), .Y(n45) );
  XOR2X1 U20 ( .A(n45), .B(rollover_val[6]), .Y(n5) );
  INVX2 U21 ( .A(count_out[9]), .Y(n43) );
  XOR2X1 U22 ( .A(n43), .B(rollover_val[9]), .Y(n4) );
  NAND2X1 U23 ( .A(n5), .B(n4), .Y(n21) );
  INVX2 U24 ( .A(count_out[2]), .Y(n37) );
  XOR2X1 U25 ( .A(n37), .B(rollover_val[2]), .Y(n8) );
  INVX2 U26 ( .A(count_out[1]), .Y(n51) );
  XOR2X1 U27 ( .A(n51), .B(rollover_val[1]), .Y(n7) );
  INVX2 U28 ( .A(count_out[0]), .Y(n53) );
  XOR2X1 U29 ( .A(n53), .B(rollover_val[0]), .Y(n6) );
  NAND3X1 U30 ( .A(n8), .B(n7), .C(n6), .Y(n20) );
  NOR2X1 U31 ( .A(n21), .B(n20), .Y(n30) );
  INVX2 U32 ( .A(count_out[5]), .Y(n49) );
  XOR2X1 U33 ( .A(n49), .B(rollover_val[5]), .Y(n23) );
  INVX2 U34 ( .A(count_out[4]), .Y(n47) );
  XOR2X1 U35 ( .A(n47), .B(rollover_val[4]), .Y(n22) );
  NAND2X1 U36 ( .A(n23), .B(n22), .Y(n28) );
  INVX2 U37 ( .A(count_out[3]), .Y(n35) );
  XOR2X1 U38 ( .A(n35), .B(rollover_val[3]), .Y(n26) );
  INVX2 U39 ( .A(count_out[8]), .Y(n41) );
  XOR2X1 U40 ( .A(n41), .B(rollover_val[8]), .Y(n25) );
  INVX2 U41 ( .A(count_out[7]), .Y(n39) );
  XOR2X1 U42 ( .A(n39), .B(rollover_val[7]), .Y(n24) );
  NAND3X1 U43 ( .A(n26), .B(n25), .C(n24), .Y(n27) );
  NOR2X1 U44 ( .A(n28), .B(n27), .Y(n29) );
  AND2X2 U45 ( .A(n30), .B(n29), .Y(n31) );
  NOR2X1 U46 ( .A(n31), .B(n43), .Y(N30) );
  NOR2X1 U47 ( .A(n31), .B(n41), .Y(N29) );
  NOR2X1 U48 ( .A(n31), .B(n39), .Y(N28) );
  NOR2X1 U49 ( .A(n31), .B(n45), .Y(N27) );
  NOR2X1 U50 ( .A(n31), .B(n49), .Y(N26) );
  NOR2X1 U51 ( .A(n31), .B(n47), .Y(N25) );
  NOR2X1 U52 ( .A(n31), .B(n35), .Y(N24) );
  NOR2X1 U53 ( .A(n31), .B(n37), .Y(N23) );
  NOR2X1 U54 ( .A(n31), .B(n51), .Y(N22) );
  NOR2X1 U55 ( .A(n31), .B(n53), .Y(N21) );
  INVX2 U56 ( .A(clear), .Y(n33) );
  INVX2 U57 ( .A(count_enable), .Y(n32) );
  NAND2X1 U58 ( .A(N9), .B(n2), .Y(n34) );
  OAI21X1 U59 ( .A(n3), .B(n35), .C(n34), .Y(next_count[3]) );
  NAND2X1 U60 ( .A(N8), .B(n2), .Y(n36) );
  OAI21X1 U61 ( .A(n3), .B(n37), .C(n36), .Y(next_count[2]) );
  NAND2X1 U62 ( .A(N13), .B(n2), .Y(n38) );
  OAI21X1 U63 ( .A(n3), .B(n39), .C(n38), .Y(next_count[7]) );
  NAND2X1 U64 ( .A(N14), .B(n2), .Y(n40) );
  OAI21X1 U65 ( .A(n3), .B(n41), .C(n40), .Y(next_count[8]) );
  NAND2X1 U66 ( .A(N15), .B(n2), .Y(n42) );
  OAI21X1 U67 ( .A(n3), .B(n43), .C(n42), .Y(next_count[9]) );
  NAND2X1 U68 ( .A(N12), .B(n2), .Y(n44) );
  OAI21X1 U69 ( .A(n3), .B(n45), .C(n44), .Y(next_count[6]) );
  NAND2X1 U70 ( .A(N10), .B(n2), .Y(n46) );
  OAI21X1 U71 ( .A(n3), .B(n47), .C(n46), .Y(next_count[4]) );
  NAND2X1 U72 ( .A(N11), .B(n2), .Y(n48) );
  OAI21X1 U73 ( .A(n3), .B(n49), .C(n48), .Y(next_count[5]) );
  NAND2X1 U74 ( .A(N7), .B(n2), .Y(n50) );
  OAI21X1 U75 ( .A(n3), .B(n51), .C(n50), .Y(next_count[1]) );
  NAND2X1 U76 ( .A(N6), .B(n2), .Y(n52) );
  OAI21X1 U77 ( .A(n3), .B(n53), .C(n52), .Y(next_count[0]) );
  XOR2X1 U78 ( .A(next_count[4]), .B(rollover_val[4]), .Y(n55) );
  XOR2X1 U79 ( .A(next_count[6]), .B(rollover_val[6]), .Y(n54) );
  NOR2X1 U80 ( .A(n55), .B(n54), .Y(n60) );
  XOR2X1 U81 ( .A(next_count[0]), .B(rollover_val[0]), .Y(n57) );
  XOR2X1 U82 ( .A(next_count[1]), .B(rollover_val[1]), .Y(n56) );
  NOR2X1 U83 ( .A(n57), .B(n56), .Y(n58) );
  NAND3X1 U84 ( .A(n60), .B(n59), .C(n58), .Y(n69) );
  XOR2X1 U85 ( .A(next_count[2]), .B(rollover_val[2]), .Y(n62) );
  XOR2X1 U86 ( .A(next_count[3]), .B(rollover_val[3]), .Y(n61) );
  NOR2X1 U87 ( .A(n62), .B(n61), .Y(n67) );
  XOR2X1 U88 ( .A(next_count[9]), .B(rollover_val[9]), .Y(n64) );
  XOR2X1 U89 ( .A(next_count[8]), .B(rollover_val[8]), .Y(n63) );
  NOR2X1 U90 ( .A(n64), .B(n63), .Y(n65) );
  NAND3X1 U91 ( .A(n67), .B(n66), .C(n65), .Y(n68) );
  NOR2X1 U92 ( .A(n69), .B(n68), .Y(N16) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 FC ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n1, n2, n3, n4, n5;

  INVX2 U3 ( .A(op[0]), .Y(n3) );
  NAND2X1 U4 ( .A(op[2]), .B(n3), .Y(n1) );
  INVX2 U5 ( .A(n1), .Y(alu_op[0]) );
  NAND2X1 U6 ( .A(op[2]), .B(op[0]), .Y(n2) );
  MUX2X1 U7 ( .B(n2), .A(n1), .S(op[1]), .Y(alu_op[1]) );
  INVX2 U8 ( .A(op[2]), .Y(n5) );
  NAND2X1 U9 ( .A(op[1]), .B(n5), .Y(w_data_sel[1]) );
  NOR2X1 U10 ( .A(w_data_sel[1]), .B(n3), .Y(w_data_sel[0]) );
  INVX2 U11 ( .A(op[1]), .Y(n4) );
  NAND3X1 U12 ( .A(n5), .B(n4), .C(n3), .Y(w_en) );
endmodule


module alu_DW_mult_uns_1 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n7, n12, n13, n18, n19, n25, n30, n31, n34, n37, n46, n49, n51,
         n52, n53, n61, n65, n67, n69, n70, n72, n73, n74, n75, n77, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n109, n111, n112, n113, n114, n115, n116, n120, n122, n123, n124,
         n125, n127, n128, n129, n130, n133, n134, n135, n136, n137, n140,
         n142, n144, n145, n146, n147, n148, n149, n151, n154, n155, n156,
         n159, n160, n162, n163, n164, n165, n166, n169, n170, n171, n172,
         n173, n174, n177, n178, n179, n181, n182, n183, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n197, n198, n199, n200,
         n201, n202, n205, n206, n207, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n258, n259, n260,
         n261, n262, n263, n264, n265, n273, n277, n281, n282, n283, n284,
         n285, n286, n287, n288, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n337, n338, n339, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n543, n546, n547,
         n549, n552, n553, n555, n556, n558, n559, n561, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n626, n627, n628, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n726, n727, n728, n729, n730, n732, n739, n740, n741,
         n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752,
         n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763,
         n764, n765, n766, n767, n768, n769, n770, n771, n772, n773, n774,
         n775, n776, n777, n778, n779, n780, n781, n782, n783, n784, n785,
         n786, n787, n788, n789, n790, n791, n792, n793, n794, n795, n796,
         n797, n798, n799, n800, n801, n802, n803, n804, n805, n806, n807,
         n808, n809, n810, n811, n812, n813, n814, n815, n816, n817, n818,
         n819, n820, n821, n822, n823, n824, n825, n826, n827, n828, n829,
         n830, n831, n832, n833, n834, n835, n836, n837, n838, n839, n840,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, n850, n851,
         n852, n853, n854, n855, n856, n857, n858, n859, n860, n861, n862,
         n863, n864, n865, n866, n867, n868, n869, n870, n871, n872, n873,
         n874, n875, n876, n877, n878, n879, n880, n881, n882, n883, n884,
         n885, n886, n887, n888, n889, n891, n892, n893, n894, n898, n915,
         n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003,
         n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013,
         n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023,
         n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033,
         n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043,
         n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053,
         n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063,
         n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073,
         n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083,
         n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093,
         n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103,
         n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113,
         n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123,
         n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133,
         n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143,
         n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153,
         n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163,
         n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173,
         n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183,
         n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193,
         n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233,
         n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243,
         n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273,
         n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283,
         n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293,
         n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303,
         n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313,
         n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323,
         n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333,
         n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343,
         n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353,
         n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363,
         n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373,
         n1374, n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383,
         n1384, n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393,
         n1394, n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403,
         n1404, n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413,
         n1414, n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423,
         n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433,
         n1434, n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443,
         n1444, n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453,
         n1454, n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463,
         n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473,
         n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483,
         n1484, n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493,
         n1494, n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503,
         n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513,
         n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523,
         n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533,
         n1534, n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543,
         n1544, n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553,
         n1554, n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563,
         n1564, n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573,
         n1574, n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583,
         n1584, n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592, n1593,
         n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603,
         n1604, n1605, n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613,
         n1614, n1615, n1616, n1617, n1618, n1619, n1620, n1621, n1622, n1623,
         n1624, n1625, n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633,
         n1634, n1635, n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643,
         n1644, n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653,
         n1654, n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663,
         n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673,
         n1674, n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683,
         n1684, n1685, n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693,
         n1694, n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703,
         n1704, n1705, n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713,
         n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723,
         n1724, n1725, n1726, n1727, n1728, n1729, n1730, n1731, n1732, n1733,
         n1734, n1735, n1736, n1737, n1738, n1739, n1740;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n539 = a[30];
  assign n875 = b[15];
  assign n876 = b[14];
  assign n877 = b[13];
  assign n878 = b[12];
  assign n879 = b[11];
  assign n880 = b[10];
  assign n881 = b[9];
  assign n882 = b[8];
  assign n883 = b[7];
  assign n884 = b[6];
  assign n885 = b[5];
  assign n886 = b[4];
  assign n887 = b[3];
  assign n888 = b[2];
  assign n889 = b[1];

  NAND2X1 U58 ( .A(n290), .B(n291), .Y(n72) );
  AOI21X1 U60 ( .A(n1701), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n53), .B(n1627), .Y(n74) );
  OAI21X1 U62 ( .A(n1098), .B(n1627), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n104), .B(n82), .Y(n80) );
  AOI21X1 U68 ( .A(n105), .B(n82), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n292), .B(n295), .Y(n84) );
  NAND2X1 U74 ( .A(n292), .B(n295), .Y(n85) );
  AOI21X1 U76 ( .A(n1701), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n53), .Y(n87) );
  OAI21X1 U78 ( .A(n52), .B(n1337), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n101), .B(n91), .C(n92), .Y(n90) );
  NOR2X1 U85 ( .A(n296), .B(n299), .Y(n93) );
  NAND2X1 U86 ( .A(n296), .B(n299), .Y(n94) );
  AOI21X1 U88 ( .A(n1701), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n1446), .B(n53), .Y(n96) );
  OAI21X1 U90 ( .A(n52), .B(n1446), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n1659), .B(n102), .Y(n100) );
  OAI21X1 U94 ( .A(n102), .B(n140), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n130), .B(n106), .Y(n104) );
  OAI21X1 U98 ( .A(n1338), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1633), .B(n1381), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1633), .C(n109), .Y(n107) );
  NAND2X1 U106 ( .A(n300), .B(n305), .Y(n111) );
  AOI21X1 U108 ( .A(n1701), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n53), .Y(n113) );
  OAI21X1 U110 ( .A(n52), .B(n115), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1382), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1382), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U120 ( .A(n306), .B(n311), .Y(n122) );
  AOI21X1 U122 ( .A(n1701), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n1096), .B(n53), .Y(n124) );
  OAI21X1 U124 ( .A(n1098), .B(n1096), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n1182), .B(n1659), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n1182), .C(n133), .Y(n129) );
  NOR2X1 U133 ( .A(n312), .B(n319), .Y(n130) );
  NAND2X1 U134 ( .A(n312), .B(n319), .Y(n133) );
  AOI21X1 U136 ( .A(n1701), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1659), .B(n53), .Y(n135) );
  OAI21X1 U138 ( .A(n1666), .B(n1659), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1632), .B(n1462), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1632), .C(n142), .Y(n140) );
  NAND2X1 U148 ( .A(n320), .B(n327), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1701), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n53), .Y(n146) );
  OAI21X1 U152 ( .A(n1666), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n1462), .Y(n61) );
  NAND2X1 U160 ( .A(n337), .B(n328), .Y(n149) );
  AOI21X1 U162 ( .A(n1701), .B(n155), .C(n156), .Y(n154) );
  AOI21X1 U166 ( .A(n172), .B(n1022), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n1419), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n169), .B(n1289), .C(n162), .Y(n160) );
  NAND2X1 U172 ( .A(n338), .B(n347), .Y(n162) );
  AOI21X1 U174 ( .A(n1701), .B(n164), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1431), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1431), .C(n1020), .Y(n165) );
  NOR2X1 U181 ( .A(n348), .B(n359), .Y(n166) );
  NAND2X1 U182 ( .A(n348), .B(n359), .Y(n169) );
  AOI21X1 U184 ( .A(n1701), .B(n1310), .C(n1162), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n1355), .B(n183), .C(n178), .Y(n172) );
  NOR2X1 U193 ( .A(n360), .B(n1236), .Y(n177) );
  NAND2X1 U194 ( .A(n371), .B(n360), .Y(n178) );
  XNOR2X1 U195 ( .A(n1491), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n1701), .B(n283), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n283), .Y(n65) );
  NOR2X1 U201 ( .A(n385), .B(n372), .Y(n182) );
  NAND2X1 U202 ( .A(n385), .B(n372), .Y(n183) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n199), .B(n187), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n194), .B(n189), .Y(n187) );
  OAI21X1 U208 ( .A(n1568), .B(n197), .C(n190), .Y(n188) );
  NOR2X1 U211 ( .A(n399), .B(n386), .Y(n189) );
  NAND2X1 U212 ( .A(n386), .B(n1294), .Y(n190) );
  AOI21X1 U214 ( .A(n192), .B(n1259), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1501), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1501), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n285), .Y(n67) );
  NOR2X1 U221 ( .A(n413), .B(n400), .Y(n194) );
  NAND2X1 U222 ( .A(n400), .B(n1037), .Y(n197) );
  AOI21X1 U224 ( .A(n1537), .B(n1259), .C(n1097), .Y(n198) );
  NOR2X1 U229 ( .A(n205), .B(n210), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NOR2X1 U233 ( .A(n427), .B(n414), .Y(n205) );
  NAND2X1 U234 ( .A(n1484), .B(n1461), .Y(n206) );
  XNOR2X1 U235 ( .A(n1259), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n287), .B(n1259), .C(n1495), .Y(n207) );
  NAND2X1 U239 ( .A(n1496), .B(n287), .Y(n69) );
  NOR2X1 U241 ( .A(n441), .B(n428), .Y(n210) );
  NAND2X1 U242 ( .A(n441), .B(n428), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n1435), .B(n219), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n288), .Y(n70) );
  NOR2X1 U250 ( .A(n455), .B(n442), .Y(n216) );
  NAND2X1 U251 ( .A(n442), .B(n455), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n1074), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n467), .B(n456), .Y(n219) );
  NAND2X1 U254 ( .A(n467), .B(n456), .Y(n220) );
  OAI21X1 U256 ( .A(n233), .B(n223), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1628), .B(n1630), .Y(n223) );
  AOI21X1 U258 ( .A(n1628), .B(n1629), .C(n1631), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n236), .B(n238), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n499), .B(n490), .Y(n236) );
  NAND2X1 U271 ( .A(n490), .B(n499), .Y(n237) );
  NOR2X1 U272 ( .A(n507), .B(n500), .Y(n238) );
  NAND2X1 U273 ( .A(n507), .B(n500), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n515), .B(n508), .Y(n241) );
  NAND2X1 U276 ( .A(n515), .B(n508), .Y(n242) );
  AOI21X1 U277 ( .A(n250), .B(n244), .C(n245), .Y(n243) );
  NOR2X1 U278 ( .A(n248), .B(n1069), .Y(n244) );
  OAI21X1 U279 ( .A(n246), .B(n249), .C(n247), .Y(n245) );
  NOR2X1 U280 ( .A(n521), .B(n516), .Y(n246) );
  NAND2X1 U281 ( .A(n521), .B(n516), .Y(n247) );
  NOR2X1 U282 ( .A(n527), .B(n522), .Y(n248) );
  NAND2X1 U283 ( .A(n527), .B(n522), .Y(n249) );
  OAI21X1 U284 ( .A(n253), .B(n251), .C(n252), .Y(n250) );
  NOR2X1 U285 ( .A(n531), .B(n528), .Y(n251) );
  NAND2X1 U286 ( .A(n531), .B(n528), .Y(n252) );
  AOI21X1 U287 ( .A(n1634), .B(n258), .C(n1635), .Y(n253) );
  OAI21X1 U292 ( .A(n259), .B(n261), .C(n260), .Y(n258) );
  NOR2X1 U293 ( .A(n537), .B(n536), .Y(n259) );
  NAND2X1 U294 ( .A(n537), .B(n536), .Y(n260) );
  OAI21X1 U296 ( .A(n265), .B(n263), .C(n264), .Y(n262) );
  NOR2X1 U297 ( .A(n721), .B(n538), .Y(n263) );
  NAND2X1 U298 ( .A(n721), .B(n538), .Y(n264) );
  AOI21X1 U299 ( .A(n1640), .B(n1637), .C(n1636), .Y(n265) );
  FAX1 U308 ( .A(n294), .B(n582), .C(n297), .YC(n291), .YS(n292) );
  FAX1 U310 ( .A(n599), .B(n298), .C(n301), .YC(n295), .YS(n296) );
  FAX1 U311 ( .A(n303), .B(n572), .C(n583), .YC(n297), .YS(n298) );
  FAX1 U312 ( .A(n309), .B(n302), .C(n307), .YC(n299), .YS(n300) );
  FAX1 U313 ( .A(n304), .B(n584), .C(n600), .YC(n301), .YS(n302) );
  FAX1 U319 ( .A(n618), .B(n325), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U320 ( .A(n318), .B(n586), .C(n602), .YC(n315), .YS(n316) );
  FAX1 U323 ( .A(n1421), .B(n333), .C(n324), .YC(n321), .YS(n322) );
  FAX1 U324 ( .A(n619), .B(n603), .C(n635), .YC(n323), .YS(n324) );
  FAX1 U325 ( .A(n335), .B(n574), .C(n587), .YC(n325), .YS(n326) );
  FAX1 U333 ( .A(n605), .B(n346), .C(n355), .YC(n341), .YS(n342) );
  FAX1 U340 ( .A(n358), .B(n590), .C(n606), .YC(n355), .YS(n356) );
  FAX1 U346 ( .A(n671), .B(n607), .C(n623), .YC(n367), .YS(n368) );
  FAX1 U353 ( .A(n608), .B(n384), .C(n592), .YC(n381), .YS(n382) );
  FAX1 U366 ( .A(n658), .B(n626), .C(n642), .YC(n407), .YS(n408) );
  FAX1 U371 ( .A(n435), .B(n424), .C(n422), .YC(n417), .YS(n418) );
  FAX1 U390 ( .A(n469), .B(n460), .C(n458), .YC(n455), .YS(n456) );
  FAX1 U395 ( .A(n598), .B(n710), .C(n694), .YC(n465), .YS(n466) );
  FAX1 U399 ( .A(n631), .B(n564), .C(n663), .YC(n473), .YS(n474) );
  FAX1 U400 ( .A(n647), .B(n695), .C(n679), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n484), .B(n491), .C(n482), .YC(n479), .YS(n480) );
  FAX1 U412 ( .A(n504), .B(n509), .C(n502), .YC(n499), .YS(n500) );
  FAX1 U416 ( .A(n512), .B(n517), .C(n510), .YC(n507), .YS(n508) );
  HAX1 U419 ( .A(n715), .B(n651), .YC(n513), .YS(n514) );
  FAX1 U423 ( .A(n526), .B(n529), .C(n524), .YC(n521), .YS(n522) );
  FAX1 U424 ( .A(n701), .B(n685), .C(n567), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n686), .B(n533), .C(n530), .YC(n527), .YS(n528) );
  FAX1 U427 ( .A(n718), .B(n702), .C(n670), .YC(n529), .YS(n530) );
  FAX1 U428 ( .A(n687), .B(n703), .C(n534), .YC(n531), .YS(n532) );
  HAX1 U429 ( .A(n719), .B(n568), .YC(n533), .YS(n534) );
  FAX1 U430 ( .A(n720), .B(n688), .C(n704), .YC(n535), .YS(n536) );
  HAX1 U431 ( .A(n569), .B(n705), .YC(n537), .YS(n538) );
  NOR2X1 U432 ( .A(n1668), .B(n724), .Y(n571) );
  NOR2X1 U433 ( .A(n1054), .B(n1668), .Y(n293) );
  NOR2X1 U434 ( .A(n1668), .B(n726), .Y(n572) );
  NOR2X1 U435 ( .A(n1668), .B(n727), .Y(n303) );
  NOR2X1 U436 ( .A(n1668), .B(n728), .Y(n573) );
  NOR2X1 U437 ( .A(n1668), .B(n729), .Y(n317) );
  NOR2X1 U438 ( .A(n1668), .B(n730), .Y(n574) );
  NOR2X1 U440 ( .A(n1668), .B(n732), .Y(n575) );
  NOR2X1 U443 ( .A(n1708), .B(n1740), .Y(n383) );
  NOR2X1 U444 ( .A(n1668), .B(n1706), .Y(n577) );
  AND2X1 U447 ( .A(n49), .B(n1657), .Y(n580) );
  OAI22X1 U464 ( .A(n755), .B(n1699), .C(n1668), .D(n1340), .Y(n563) );
  OAI22X1 U467 ( .A(n1668), .B(n1699), .C(n739), .D(n1341), .Y(n582) );
  OAI22X1 U468 ( .A(n1699), .B(n739), .C(n740), .D(n1057), .Y(n583) );
  OAI22X1 U469 ( .A(n1699), .B(n740), .C(n741), .D(n1057), .Y(n584) );
  OAI22X1 U471 ( .A(n742), .B(n1699), .C(n743), .D(n1341), .Y(n586) );
  OAI22X1 U472 ( .A(n1699), .B(n743), .C(n744), .D(n1341), .Y(n587) );
  OAI22X1 U473 ( .A(n1699), .B(n744), .C(n745), .D(n1340), .Y(n588) );
  OAI22X1 U474 ( .A(n745), .B(n1699), .C(n746), .D(n1340), .Y(n589) );
  OAI22X1 U475 ( .A(n746), .B(n1699), .C(n747), .D(n1341), .Y(n590) );
  OAI22X1 U476 ( .A(n1699), .B(n747), .C(n748), .D(n1340), .Y(n591) );
  OAI22X1 U477 ( .A(n1699), .B(n748), .C(n749), .D(n1057), .Y(n592) );
  OAI22X1 U478 ( .A(n1699), .B(n749), .C(n750), .D(n1340), .Y(n593) );
  OAI22X1 U479 ( .A(n1699), .B(n750), .C(n751), .D(n1341), .Y(n594) );
  OAI22X1 U480 ( .A(n1699), .B(n751), .C(n1341), .D(n752), .Y(n595) );
  OAI22X1 U481 ( .A(n753), .B(n1341), .C(n1699), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n1699), .B(n753), .C(n754), .D(n1340), .Y(n597) );
  XNOR2X1 U485 ( .A(n1728), .B(n1657), .Y(n739) );
  XNOR2X1 U486 ( .A(n1726), .B(n1657), .Y(n740) );
  XNOR2X1 U487 ( .A(n1724), .B(n1657), .Y(n741) );
  XNOR2X1 U488 ( .A(n1612), .B(n1739), .Y(n742) );
  XNOR2X1 U491 ( .A(n1587), .B(n1658), .Y(n745) );
  XNOR2X1 U492 ( .A(n1715), .B(n1658), .Y(n746) );
  XNOR2X1 U498 ( .A(n1705), .B(n1739), .Y(n752) );
  XNOR2X1 U500 ( .A(n49), .B(n1658), .Y(n754) );
  OAI22X1 U503 ( .A(n1696), .B(n772), .C(n1376), .D(n1502), .Y(n564) );
  OAI22X1 U506 ( .A(n1376), .B(n1696), .C(n756), .D(n1697), .Y(n600) );
  OAI22X1 U507 ( .A(n1696), .B(n756), .C(n757), .D(n1697), .Y(n601) );
  OAI22X1 U508 ( .A(n1696), .B(n757), .C(n758), .D(n1120), .Y(n602) );
  OAI22X1 U509 ( .A(n758), .B(n1671), .C(n759), .D(n1697), .Y(n603) );
  OAI22X1 U510 ( .A(n1696), .B(n759), .C(n760), .D(n1697), .Y(n604) );
  OAI22X1 U511 ( .A(n1696), .B(n760), .C(n761), .D(n1120), .Y(n605) );
  OAI22X1 U512 ( .A(n1671), .B(n761), .C(n762), .D(n1697), .Y(n606) );
  OAI22X1 U513 ( .A(n1671), .B(n762), .C(n763), .D(n1502), .Y(n607) );
  OAI22X1 U514 ( .A(n1671), .B(n763), .C(n764), .D(n1697), .Y(n608) );
  OAI22X1 U515 ( .A(n1671), .B(n764), .C(n1544), .D(n1697), .Y(n609) );
  OAI22X1 U516 ( .A(n765), .B(n1671), .C(n766), .D(n1502), .Y(n610) );
  OAI22X1 U517 ( .A(n766), .B(n1671), .C(n1205), .D(n1697), .Y(n611) );
  OAI22X1 U518 ( .A(n1671), .B(n767), .C(n768), .D(n1697), .Y(n612) );
  OAI22X1 U519 ( .A(n1696), .B(n768), .C(n1697), .D(n769), .Y(n613) );
  OAI22X1 U520 ( .A(n770), .B(n1697), .C(n1696), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n1696), .B(n770), .C(n771), .D(n1697), .Y(n615) );
  XNOR2X1 U524 ( .A(n1728), .B(n1648), .Y(n756) );
  XNOR2X1 U525 ( .A(n1726), .B(n1648), .Y(n757) );
  XNOR2X1 U526 ( .A(n1724), .B(n1648), .Y(n758) );
  XNOR2X1 U528 ( .A(n1611), .B(n1648), .Y(n760) );
  XNOR2X1 U529 ( .A(n1203), .B(n1648), .Y(n761) );
  XNOR2X1 U530 ( .A(n1717), .B(n1648), .Y(n762) );
  XNOR2X1 U531 ( .A(n1715), .B(n1648), .Y(n763) );
  XNOR2X1 U532 ( .A(n1713), .B(n1648), .Y(n764) );
  XNOR2X1 U536 ( .A(n1707), .B(n1648), .Y(n768) );
  XNOR2X1 U537 ( .A(n1705), .B(n1648), .Y(n769) );
  XNOR2X1 U538 ( .A(n1703), .B(n1648), .Y(n770) );
  OAI22X1 U542 ( .A(n1694), .B(n789), .C(n1364), .D(n1262), .Y(n565) );
  OAI22X1 U545 ( .A(n1364), .B(n1265), .C(n773), .D(n1328), .Y(n618) );
  OAI22X1 U546 ( .A(n1694), .B(n773), .C(n774), .D(n1261), .Y(n619) );
  OAI22X1 U547 ( .A(n774), .B(n1694), .C(n775), .D(n1262), .Y(n620) );
  OAI22X1 U548 ( .A(n1694), .B(n775), .C(n776), .D(n1262), .Y(n621) );
  OAI22X1 U549 ( .A(n1130), .B(n776), .C(n777), .D(n1131), .Y(n622) );
  OAI22X1 U550 ( .A(n1694), .B(n777), .C(n1131), .D(n778), .Y(n623) );
  OAI22X1 U551 ( .A(n1130), .B(n778), .C(n1262), .D(n1049), .Y(n624) );
  OAI22X1 U553 ( .A(n780), .B(n1694), .C(n781), .D(n1240), .Y(n626) );
  OAI22X1 U554 ( .A(n781), .B(n1694), .C(n782), .D(n1240), .Y(n627) );
  OAI22X1 U555 ( .A(n1694), .B(n782), .C(n1261), .D(n783), .Y(n628) );
  OAI22X1 U557 ( .A(n1694), .B(n784), .C(n785), .D(n1262), .Y(n630) );
  OAI22X1 U558 ( .A(n1130), .B(n785), .C(n1262), .D(n786), .Y(n631) );
  OAI22X1 U559 ( .A(n787), .B(n1328), .C(n1265), .D(n786), .Y(n632) );
  OAI22X1 U560 ( .A(n1694), .B(n787), .C(n788), .D(n1261), .Y(n633) );
  XNOR2X1 U563 ( .A(n1728), .B(n1192), .Y(n773) );
  XNOR2X1 U564 ( .A(n1726), .B(n1299), .Y(n774) );
  XNOR2X1 U565 ( .A(n1724), .B(n1299), .Y(n775) );
  XNOR2X1 U566 ( .A(n1612), .B(n1299), .Y(n776) );
  XNOR2X1 U567 ( .A(n1594), .B(n1662), .Y(n777) );
  XNOR2X1 U569 ( .A(n1717), .B(n1662), .Y(n779) );
  XNOR2X1 U575 ( .A(n1707), .B(n1662), .Y(n785) );
  XNOR2X1 U576 ( .A(n1705), .B(n1191), .Y(n786) );
  XNOR2X1 U577 ( .A(n1703), .B(n1191), .Y(n787) );
  XNOR2X1 U578 ( .A(n49), .B(n1662), .Y(n788) );
  OR2X1 U579 ( .A(n49), .B(n1364), .Y(n789) );
  OAI22X1 U581 ( .A(n1690), .B(n806), .C(n1339), .D(n1018), .Y(n566) );
  OAI22X1 U584 ( .A(n1339), .B(n1690), .C(n790), .D(n1121), .Y(n636) );
  OAI22X1 U585 ( .A(n1690), .B(n790), .C(n791), .D(n1121), .Y(n637) );
  OAI22X1 U586 ( .A(n1690), .B(n791), .C(n792), .D(n1121), .Y(n638) );
  OAI22X1 U587 ( .A(n1690), .B(n792), .C(n793), .D(n1018), .Y(n639) );
  OAI22X1 U588 ( .A(n1690), .B(n793), .C(n794), .D(n1026), .Y(n640) );
  OAI22X1 U589 ( .A(n794), .B(n1690), .C(n795), .D(n1018), .Y(n641) );
  OAI22X1 U590 ( .A(n1690), .B(n795), .C(n796), .D(n1692), .Y(n642) );
  OAI22X1 U591 ( .A(n1690), .B(n796), .C(n797), .D(n1121), .Y(n643) );
  OAI22X1 U592 ( .A(n1690), .B(n797), .C(n798), .D(n1121), .Y(n644) );
  OAI22X1 U593 ( .A(n1690), .B(n798), .C(n799), .D(n1018), .Y(n645) );
  OAI22X1 U594 ( .A(n1690), .B(n799), .C(n800), .D(n1018), .Y(n646) );
  OAI22X1 U595 ( .A(n800), .B(n1690), .C(n801), .D(n1121), .Y(n647) );
  OAI22X1 U596 ( .A(n801), .B(n1690), .C(n802), .D(n1121), .Y(n648) );
  OAI22X1 U597 ( .A(n1690), .B(n802), .C(n1018), .D(n803), .Y(n649) );
  OAI22X1 U598 ( .A(n804), .B(n1018), .C(n1690), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n1690), .B(n804), .C(n805), .D(n1121), .Y(n651) );
  AND2X1 U600 ( .A(n1264), .B(n1641), .Y(n652) );
  XNOR2X1 U602 ( .A(n1728), .B(n1017), .Y(n790) );
  XNOR2X1 U603 ( .A(n1726), .B(n1167), .Y(n791) );
  XNOR2X1 U604 ( .A(n1724), .B(n1167), .Y(n792) );
  XNOR2X1 U605 ( .A(n1612), .B(n1167), .Y(n793) );
  XNOR2X1 U606 ( .A(n1594), .B(n1017), .Y(n794) );
  XNOR2X1 U608 ( .A(n1717), .B(n998), .Y(n796) );
  XNOR2X1 U609 ( .A(n1715), .B(n1167), .Y(n797) );
  XNOR2X1 U610 ( .A(n1713), .B(n1167), .Y(n798) );
  XNOR2X1 U611 ( .A(n1132), .B(n1167), .Y(n799) );
  XNOR2X1 U614 ( .A(n1707), .B(n1017), .Y(n802) );
  XNOR2X1 U615 ( .A(n1705), .B(n1017), .Y(n803) );
  XNOR2X1 U616 ( .A(n1703), .B(n1167), .Y(n804) );
  XNOR2X1 U617 ( .A(n1729), .B(n1017), .Y(n805) );
  OAI22X1 U620 ( .A(n1525), .B(n823), .C(n1375), .D(n1649), .Y(n567) );
  OAI22X1 U623 ( .A(n1375), .B(n1689), .C(n807), .D(n1534), .Y(n654) );
  OAI22X1 U624 ( .A(n1689), .B(n807), .C(n808), .D(n1534), .Y(n655) );
  OAI22X1 U625 ( .A(n1525), .B(n808), .C(n809), .D(n1650), .Y(n656) );
  OAI22X1 U626 ( .A(n1689), .B(n809), .C(n1154), .D(n1650), .Y(n657) );
  OAI22X1 U627 ( .A(n810), .B(n1524), .C(n811), .D(n1189), .Y(n658) );
  OAI22X1 U628 ( .A(n1689), .B(n811), .C(n812), .D(n1650), .Y(n659) );
  OAI22X1 U630 ( .A(n1689), .B(n813), .C(n814), .D(n1650), .Y(n661) );
  OAI22X1 U631 ( .A(n814), .B(n1689), .C(n815), .D(n1650), .Y(n662) );
  OAI22X1 U632 ( .A(n1525), .B(n815), .C(n816), .D(n1649), .Y(n663) );
  OAI22X1 U633 ( .A(n1689), .B(n816), .C(n817), .D(n1650), .Y(n664) );
  OAI22X1 U634 ( .A(n817), .B(n1525), .C(n818), .D(n1534), .Y(n665) );
  OAI22X1 U635 ( .A(n1689), .B(n818), .C(n819), .D(n1649), .Y(n666) );
  OAI22X1 U636 ( .A(n1525), .B(n819), .C(n1534), .D(n820), .Y(n667) );
  OAI22X1 U637 ( .A(n821), .B(n1649), .C(n1525), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n1689), .B(n821), .C(n822), .D(n1649), .Y(n669) );
  AND2X1 U639 ( .A(n1264), .B(n553), .Y(n670) );
  XNOR2X1 U641 ( .A(n1728), .B(n1465), .Y(n807) );
  XNOR2X1 U642 ( .A(n1726), .B(n1465), .Y(n808) );
  XNOR2X1 U643 ( .A(n1724), .B(n1655), .Y(n809) );
  XNOR2X1 U644 ( .A(n1722), .B(n1656), .Y(n810) );
  XNOR2X1 U646 ( .A(n1203), .B(n1655), .Y(n812) );
  XNOR2X1 U647 ( .A(n1587), .B(n1465), .Y(n813) );
  XNOR2X1 U649 ( .A(n1713), .B(n1655), .Y(n815) );
  XNOR2X1 U650 ( .A(n1512), .B(n1655), .Y(n816) );
  XNOR2X1 U652 ( .A(n1379), .B(n1465), .Y(n818) );
  XNOR2X1 U653 ( .A(n1707), .B(n1465), .Y(n819) );
  XNOR2X1 U654 ( .A(n1705), .B(n1655), .Y(n820) );
  XNOR2X1 U655 ( .A(n1703), .B(n1655), .Y(n821) );
  XNOR2X1 U656 ( .A(n1264), .B(n1655), .Y(n822) );
  OR2X1 U657 ( .A(n1264), .B(n1375), .Y(n823) );
  OAI22X1 U659 ( .A(n1667), .B(n840), .C(n1545), .D(n1687), .Y(n568) );
  OAI22X1 U662 ( .A(n1545), .B(n1667), .C(n824), .D(n1686), .Y(n672) );
  OAI22X1 U663 ( .A(n824), .B(n1667), .C(n825), .D(n1526), .Y(n673) );
  OAI22X1 U664 ( .A(n825), .B(n1667), .C(n826), .D(n1151), .Y(n674) );
  OAI22X1 U665 ( .A(n826), .B(n1095), .C(n827), .D(n1686), .Y(n675) );
  OAI22X1 U666 ( .A(n1667), .B(n827), .C(n828), .D(n1686), .Y(n676) );
  OAI22X1 U667 ( .A(n1667), .B(n828), .C(n829), .D(n1526), .Y(n677) );
  OAI22X1 U668 ( .A(n1667), .B(n829), .C(n830), .D(n1686), .Y(n678) );
  OAI22X1 U669 ( .A(n1667), .B(n830), .C(n831), .D(n1687), .Y(n679) );
  OAI22X1 U670 ( .A(n1095), .B(n831), .C(n832), .D(n1687), .Y(n680) );
  OAI22X1 U671 ( .A(n1667), .B(n832), .C(n833), .D(n1686), .Y(n681) );
  OAI22X1 U672 ( .A(n1667), .B(n833), .C(n834), .D(n1686), .Y(n682) );
  OAI22X1 U673 ( .A(n1667), .B(n834), .C(n835), .D(n1687), .Y(n683) );
  OAI22X1 U674 ( .A(n1667), .B(n835), .C(n836), .D(n1687), .Y(n684) );
  OAI22X1 U675 ( .A(n1095), .B(n836), .C(n1687), .D(n837), .Y(n685) );
  OAI22X1 U676 ( .A(n838), .B(n1062), .C(n1667), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1667), .B(n838), .C(n839), .D(n1062), .Y(n687) );
  AND2X1 U678 ( .A(n1264), .B(n556), .Y(n688) );
  XNOR2X1 U680 ( .A(n1728), .B(n1380), .Y(n824) );
  XNOR2X1 U683 ( .A(n1356), .B(n1380), .Y(n827) );
  XNOR2X1 U686 ( .A(n1371), .B(n1663), .Y(n830) );
  XNOR2X1 U687 ( .A(n1715), .B(n1664), .Y(n831) );
  XNOR2X1 U688 ( .A(n1713), .B(n1664), .Y(n832) );
  XNOR2X1 U689 ( .A(n1512), .B(n1663), .Y(n833) );
  XNOR2X1 U691 ( .A(n1379), .B(n1664), .Y(n835) );
  XNOR2X1 U692 ( .A(n1707), .B(n1664), .Y(n836) );
  XNOR2X1 U693 ( .A(n1705), .B(n1664), .Y(n837) );
  XNOR2X1 U694 ( .A(n1609), .B(n1664), .Y(n838) );
  XNOR2X1 U695 ( .A(n1264), .B(n1664), .Y(n839) );
  OR2X1 U696 ( .A(n1264), .B(n1545), .Y(n840) );
  OAI22X1 U698 ( .A(n1680), .B(n857), .C(n1536), .D(n1683), .Y(n569) );
  OAI22X1 U701 ( .A(n1536), .B(n1680), .C(n841), .D(n1216), .Y(n690) );
  OAI22X1 U702 ( .A(n1680), .B(n841), .C(n842), .D(n1682), .Y(n691) );
  OAI22X1 U703 ( .A(n1680), .B(n842), .C(n843), .D(n1683), .Y(n692) );
  OAI22X1 U704 ( .A(n1680), .B(n843), .C(n844), .D(n1683), .Y(n693) );
  OAI22X1 U705 ( .A(n1680), .B(n844), .C(n845), .D(n1216), .Y(n694) );
  OAI22X1 U706 ( .A(n1680), .B(n845), .C(n846), .D(n1683), .Y(n695) );
  OAI22X1 U707 ( .A(n1680), .B(n846), .C(n847), .D(n1683), .Y(n696) );
  OAI22X1 U708 ( .A(n1680), .B(n847), .C(n848), .D(n1683), .Y(n697) );
  OAI22X1 U709 ( .A(n1680), .B(n848), .C(n849), .D(n1683), .Y(n698) );
  OAI22X1 U710 ( .A(n1680), .B(n849), .C(n850), .D(n1683), .Y(n699) );
  OAI22X1 U711 ( .A(n1680), .B(n850), .C(n851), .D(n1683), .Y(n700) );
  OAI22X1 U712 ( .A(n1680), .B(n851), .C(n852), .D(n1683), .Y(n701) );
  OAI22X1 U713 ( .A(n1680), .B(n852), .C(n853), .D(n1683), .Y(n702) );
  OAI22X1 U714 ( .A(n1680), .B(n853), .C(n1683), .D(n854), .Y(n703) );
  OAI22X1 U715 ( .A(n855), .B(n1683), .C(n1680), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1680), .B(n855), .C(n856), .D(n1683), .Y(n705) );
  AND2X1 U717 ( .A(n1264), .B(n559), .Y(n706) );
  XNOR2X1 U721 ( .A(n1724), .B(n1482), .Y(n843) );
  XNOR2X1 U722 ( .A(n1356), .B(n1482), .Y(n844) );
  XNOR2X1 U724 ( .A(n1203), .B(n1481), .Y(n846) );
  XNOR2X1 U725 ( .A(n1613), .B(n1482), .Y(n847) );
  XNOR2X1 U726 ( .A(n1715), .B(n1481), .Y(n848) );
  XNOR2X1 U727 ( .A(n1713), .B(n1482), .Y(n849) );
  XNOR2X1 U728 ( .A(n1132), .B(n1481), .Y(n850) );
  XNOR2X1 U729 ( .A(n1610), .B(n1482), .Y(n851) );
  XNOR2X1 U730 ( .A(n1379), .B(n1481), .Y(n852) );
  XNOR2X1 U731 ( .A(n1707), .B(n1482), .Y(n853) );
  XNOR2X1 U732 ( .A(n1705), .B(n1482), .Y(n854) );
  XNOR2X1 U733 ( .A(n1703), .B(n1481), .Y(n855) );
  XNOR2X1 U734 ( .A(n1264), .B(n1481), .Y(n856) );
  OAI22X1 U737 ( .A(n1625), .B(n874), .C(n1731), .D(n1679), .Y(n570) );
  OAI22X1 U740 ( .A(n1652), .B(n1731), .C(n858), .D(n1360), .Y(n708) );
  OAI22X1 U741 ( .A(n1652), .B(n858), .C(n859), .D(n1647), .Y(n709) );
  OAI22X1 U742 ( .A(n860), .B(n1679), .C(n1652), .D(n859), .Y(n710) );
  OAI22X1 U743 ( .A(n1652), .B(n860), .C(n861), .D(n1679), .Y(n711) );
  OAI22X1 U744 ( .A(n1652), .B(n861), .C(n862), .D(n1646), .Y(n712) );
  OAI22X1 U745 ( .A(n1652), .B(n862), .C(n863), .D(n1360), .Y(n713) );
  OAI22X1 U746 ( .A(n863), .B(n1652), .C(n864), .D(n1647), .Y(n714) );
  OAI22X1 U747 ( .A(n1652), .B(n864), .C(n865), .D(n1679), .Y(n715) );
  OAI22X1 U748 ( .A(n1652), .B(n865), .C(n866), .D(n1646), .Y(n716) );
  OAI22X1 U749 ( .A(n1652), .B(n866), .C(n867), .D(n1679), .Y(n717) );
  OAI22X1 U750 ( .A(n1652), .B(n867), .C(n868), .D(n1647), .Y(n718) );
  OAI22X1 U751 ( .A(n1625), .B(n868), .C(n869), .D(n1679), .Y(n719) );
  OAI22X1 U752 ( .A(n1625), .B(n869), .C(n870), .D(n1646), .Y(n720) );
  OAI22X1 U753 ( .A(n1625), .B(n870), .C(n1646), .D(n871), .Y(n721) );
  OAI22X1 U754 ( .A(n872), .B(n1647), .C(n1625), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1625), .B(n872), .C(n873), .D(n1679), .Y(n723) );
  XNOR2X1 U760 ( .A(n1720), .B(n1266), .Y(n862) );
  XNOR2X1 U761 ( .A(n1203), .B(n1661), .Y(n863) );
  XNOR2X1 U762 ( .A(n1613), .B(n1266), .Y(n864) );
  XNOR2X1 U763 ( .A(n1715), .B(n1266), .Y(n865) );
  XNOR2X1 U764 ( .A(n1713), .B(n1661), .Y(n866) );
  XNOR2X1 U765 ( .A(n1132), .B(n1661), .Y(n867) );
  XNOR2X1 U766 ( .A(n1710), .B(n1266), .Y(n868) );
  XNOR2X1 U767 ( .A(n1379), .B(n1661), .Y(n869) );
  XNOR2X1 U768 ( .A(n1707), .B(n1266), .Y(n870) );
  XNOR2X1 U769 ( .A(n1705), .B(n1266), .Y(n871) );
  XNOR2X1 U770 ( .A(n1609), .B(n1661), .Y(n872) );
  XNOR2X1 U771 ( .A(n1264), .B(n1661), .Y(n873) );
  XOR2X1 U800 ( .A(a[29]), .B(n539), .Y(n891) );
  XOR2X1 U806 ( .A(a[25]), .B(n1622), .Y(n893) );
  NAND2X1 U808 ( .A(n1369), .B(n894), .Y(n30) );
  XOR2X1 U809 ( .A(a[23]), .B(n1736), .Y(n894) );
  XOR2X1 U821 ( .A(a[15]), .B(n1), .Y(n898) );
  XOR2X1 U826 ( .A(n993), .B(n1118), .Y(n506) );
  XNOR2X1 U827 ( .A(n682), .B(n714), .Y(n993) );
  XOR2X1 U828 ( .A(n1610), .B(n994), .Y(n817) );
  INVX8 U829 ( .A(n1655), .Y(n994) );
  XNOR2X1 U830 ( .A(n995), .B(n712), .Y(n488) );
  XNOR2X1 U831 ( .A(n664), .B(n616), .Y(n995) );
  INVX2 U832 ( .A(n878), .Y(n1721) );
  OAI22X1 U833 ( .A(n825), .B(n1667), .C(n826), .D(n1151), .Y(n996) );
  XOR2X1 U834 ( .A(n1379), .B(n997), .Y(n801) );
  INVX8 U835 ( .A(n1017), .Y(n997) );
  INVX1 U836 ( .A(n673), .Y(n1089) );
  INVX1 U837 ( .A(n1724), .Y(n726) );
  XOR2X1 U838 ( .A(n1714), .B(n1153), .Y(n780) );
  INVX2 U839 ( .A(n1548), .Y(n1153) );
  INVX4 U840 ( .A(n1166), .Y(n998) );
  INVX8 U841 ( .A(n1736), .Y(n1166) );
  AND2X2 U842 ( .A(n1739), .B(n1705), .Y(n578) );
  INVX2 U843 ( .A(n1075), .Y(n1682) );
  XNOR2X1 U844 ( .A(n999), .B(n1045), .Y(n312) );
  INVX8 U845 ( .A(n1078), .Y(n999) );
  XNOR2X1 U846 ( .A(n1000), .B(n1113), .Y(n396) );
  XOR2X1 U847 ( .A(n689), .B(n1300), .Y(n1000) );
  NAND3X1 U848 ( .A(n1447), .B(n1449), .C(n1448), .Y(n1001) );
  BUFX2 U849 ( .A(n411), .Y(n1002) );
  XNOR2X1 U850 ( .A(n1708), .B(n1190), .Y(n784) );
  INVX2 U851 ( .A(n1190), .Y(n1191) );
  INVX1 U852 ( .A(n1089), .Y(n1003) );
  XNOR2X1 U853 ( .A(n1004), .B(n444), .Y(n442) );
  XNOR2X1 U854 ( .A(n446), .B(n457), .Y(n1004) );
  XNOR2X1 U855 ( .A(n1005), .B(n1134), .Y(n448) );
  XNOR2X1 U856 ( .A(n454), .B(n613), .Y(n1005) );
  NAND3X1 U857 ( .A(n1585), .B(n1584), .C(n1586), .Y(n1006) );
  AND2X2 U858 ( .A(n1658), .B(n1703), .Y(n1007) );
  INVX1 U859 ( .A(n690), .Y(n1008) );
  OAI22X1 U860 ( .A(n1699), .B(n753), .C(n754), .D(n1340), .Y(n1009) );
  OAI22X1 U861 ( .A(n765), .B(n1671), .C(n766), .D(n1502), .Y(n1010) );
  XOR2X1 U862 ( .A(n1011), .B(n1012), .Y(n406) );
  XNOR2X1 U863 ( .A(n423), .B(n425), .Y(n1011) );
  XOR2X1 U864 ( .A(n1032), .B(n1033), .Y(n1012) );
  INVX1 U865 ( .A(n1703), .Y(n1013) );
  INVX1 U866 ( .A(n657), .Y(n1014) );
  INVX1 U867 ( .A(n1014), .Y(n1015) );
  OAI22X1 U868 ( .A(n1667), .B(n829), .C(n830), .D(n1686), .Y(n1016) );
  INVX8 U869 ( .A(n1166), .Y(n1017) );
  INVX4 U870 ( .A(n1691), .Y(n1018) );
  INVX4 U871 ( .A(n1691), .Y(n1121) );
  INVX1 U872 ( .A(n1365), .Y(n1019) );
  BUFX2 U873 ( .A(n169), .Y(n1020) );
  NAND3X1 U874 ( .A(n1510), .B(n1509), .C(n1511), .Y(n1021) );
  NOR2X1 U875 ( .A(n1419), .B(n166), .Y(n1022) );
  NOR2X1 U876 ( .A(n348), .B(n359), .Y(n1023) );
  BUFX2 U877 ( .A(n418), .Y(n1024) );
  INVX4 U878 ( .A(n1721), .Y(n1025) );
  INVX2 U879 ( .A(n1721), .Y(n1722) );
  BUFX2 U880 ( .A(n1121), .Y(n1026) );
  XNOR2X1 U881 ( .A(n1725), .B(n1536), .Y(n842) );
  INVX1 U882 ( .A(n1714), .Y(n1084) );
  BUFX2 U883 ( .A(n662), .Y(n1027) );
  BUFX2 U884 ( .A(n588), .Y(n1028) );
  INVX1 U885 ( .A(n400), .Y(n1029) );
  INVX1 U886 ( .A(n1029), .Y(n1030) );
  XNOR2X1 U887 ( .A(n95), .B(n1031), .Y(product[44]) );
  AND2X1 U888 ( .A(n94), .B(n91), .Y(n1031) );
  XNOR2X1 U889 ( .A(n1032), .B(n1008), .Y(n412) );
  XOR2X1 U890 ( .A(n594), .B(n1503), .Y(n1032) );
  INVX1 U891 ( .A(n690), .Y(n1033) );
  BUFX2 U892 ( .A(n354), .Y(n1034) );
  BUFX2 U893 ( .A(n589), .Y(n1035) );
  NAND3X1 U894 ( .A(n1514), .B(n1515), .C(n1516), .Y(n1036) );
  NAND3X1 U895 ( .A(n1674), .B(n1672), .C(n1673), .Y(n1037) );
  XNOR2X1 U896 ( .A(n1038), .B(n1363), .Y(n416) );
  XNOR2X1 U897 ( .A(n420), .B(n433), .Y(n1038) );
  NAND3X1 U898 ( .A(n1292), .B(n1291), .C(n1293), .Y(n1039) );
  XOR2X1 U899 ( .A(n1040), .B(n1063), .Y(n452) );
  INVX1 U900 ( .A(n645), .Y(n1040) );
  XOR2X1 U901 ( .A(n1041), .B(n388), .Y(n386) );
  XNOR2X1 U902 ( .A(n401), .B(n1353), .Y(n1041) );
  INVX1 U903 ( .A(n657), .Y(n1042) );
  INVX1 U904 ( .A(n1042), .Y(n1043) );
  XNOR2X1 U905 ( .A(n163), .B(n1044), .Y(product[38]) );
  AND2X1 U906 ( .A(n162), .B(n1583), .Y(n1044) );
  XOR2X1 U907 ( .A(n1104), .B(n1658), .Y(n743) );
  INVX2 U908 ( .A(n1719), .Y(n1594) );
  INVX8 U909 ( .A(n1718), .Y(n1203) );
  XOR2X1 U910 ( .A(n321), .B(n316), .Y(n1045) );
  NAND2X1 U911 ( .A(n321), .B(n1078), .Y(n1046) );
  NAND2X1 U912 ( .A(n1078), .B(n316), .Y(n1047) );
  NAND2X1 U913 ( .A(n321), .B(n316), .Y(n1048) );
  NAND3X1 U914 ( .A(n1047), .B(n1046), .C(n1048), .Y(n311) );
  INVX2 U915 ( .A(n1203), .Y(n729) );
  XNOR2X1 U916 ( .A(n1723), .B(n1545), .Y(n826) );
  BUFX2 U917 ( .A(n779), .Y(n1049) );
  NAND3X1 U918 ( .A(n1618), .B(n1619), .C(n1620), .Y(n1050) );
  NAND2X1 U919 ( .A(n172), .B(n1107), .Y(n1051) );
  XNOR2X1 U920 ( .A(n1105), .B(n1656), .Y(n1052) );
  INVX2 U921 ( .A(n1052), .Y(n811) );
  INVX2 U922 ( .A(n1105), .Y(n1720) );
  BUFX2 U923 ( .A(n451), .Y(n1053) );
  INVX8 U924 ( .A(n727), .Y(n1612) );
  INVX1 U925 ( .A(n1726), .Y(n1054) );
  XNOR2X1 U926 ( .A(n1056), .B(n1055), .Y(n394) );
  INVX8 U927 ( .A(n1076), .Y(n1055) );
  XOR2X1 U928 ( .A(n657), .B(n673), .Y(n1056) );
  BUFX2 U929 ( .A(n31), .Y(n1662) );
  INVX4 U930 ( .A(n31), .Y(n1504) );
  INVX1 U931 ( .A(n1256), .Y(n1057) );
  XNOR2X1 U932 ( .A(n362), .B(n1058), .Y(n360) );
  XNOR2X1 U933 ( .A(n373), .B(n364), .Y(n1058) );
  INVX2 U934 ( .A(n1691), .Y(n1692) );
  INVX4 U935 ( .A(n1504), .Y(n1622) );
  INVX2 U936 ( .A(n1652), .Y(n1624) );
  INVX4 U937 ( .A(n1624), .Y(n1625) );
  BUFX4 U938 ( .A(n915), .Y(n1651) );
  BUFX2 U939 ( .A(n915), .Y(n1652) );
  BUFX4 U940 ( .A(n483), .Y(n1109) );
  XOR2X1 U941 ( .A(n191), .B(n1059), .Y(product[34]) );
  NAND2X1 U942 ( .A(n190), .B(n284), .Y(n1059) );
  XOR2X1 U943 ( .A(n207), .B(n1060), .Y(product[32]) );
  NAND2X1 U944 ( .A(n1352), .B(n286), .Y(n1060) );
  INVX2 U945 ( .A(n1687), .Y(n1061) );
  INVX2 U946 ( .A(n1061), .Y(n1062) );
  XNOR2X1 U947 ( .A(n1136), .B(n597), .Y(n1063) );
  BUFX2 U948 ( .A(n485), .Y(n1064) );
  XOR2X1 U949 ( .A(n1065), .B(n1066), .Y(n482) );
  XNOR2X1 U950 ( .A(n486), .B(n488), .Y(n1065) );
  INVX1 U951 ( .A(n493), .Y(n1066) );
  INVX8 U952 ( .A(n49), .Y(n1730) );
  NAND3X1 U953 ( .A(n1201), .B(n1200), .C(n1202), .Y(n1067) );
  XOR2X1 U954 ( .A(n1068), .B(n1106), .Y(n502) );
  XNOR2X1 U955 ( .A(n513), .B(n511), .Y(n1068) );
  NOR2X1 U956 ( .A(n521), .B(n516), .Y(n1069) );
  XOR2X1 U957 ( .A(n1172), .B(n1109), .Y(n1070) );
  XOR2X1 U958 ( .A(n134), .B(n1071), .Y(product[41]) );
  NAND2X1 U959 ( .A(n133), .B(n277), .Y(n1071) );
  NAND3X1 U960 ( .A(n1324), .B(n1323), .C(n1325), .Y(n1072) );
  NAND3X1 U961 ( .A(n1607), .B(n1606), .C(n1608), .Y(n1073) );
  BUFX2 U962 ( .A(n219), .Y(n1074) );
  INVX2 U963 ( .A(n12), .Y(n1075) );
  INVX2 U964 ( .A(n558), .Y(n689) );
  INVX2 U965 ( .A(n1503), .Y(n1076) );
  XNOR2X1 U966 ( .A(n1077), .B(n421), .Y(n404) );
  XNOR2X1 U967 ( .A(n408), .B(n410), .Y(n1077) );
  BUFX4 U968 ( .A(n314), .Y(n1078) );
  BUFX4 U969 ( .A(n475), .Y(n1079) );
  BUFX2 U970 ( .A(a[21]), .Y(n1080) );
  BUFX2 U971 ( .A(n408), .Y(n1081) );
  BUFX4 U972 ( .A(n1694), .Y(n1130) );
  XOR2X1 U973 ( .A(n1082), .B(n1210), .Y(n432) );
  XOR2X1 U974 ( .A(n1092), .B(n440), .Y(n1082) );
  BUFX4 U975 ( .A(n322), .Y(n1083) );
  XNOR2X1 U976 ( .A(n1085), .B(n396), .Y(n392) );
  XNOR2X1 U977 ( .A(n411), .B(n409), .Y(n1085) );
  BUFX2 U978 ( .A(n410), .Y(n1086) );
  XNOR2X1 U979 ( .A(a[19]), .B(n1733), .Y(n1087) );
  INVX2 U980 ( .A(n1709), .Y(n1710) );
  OR2X2 U981 ( .A(n1668), .B(n1426), .Y(n1088) );
  INVX8 U982 ( .A(n1740), .Y(n1739) );
  INVX2 U983 ( .A(n1), .Y(n1731) );
  INVX2 U984 ( .A(n555), .Y(n671) );
  INVX8 U985 ( .A(n707), .Y(n1503) );
  INVX1 U986 ( .A(n1089), .Y(n1090) );
  BUFX2 U987 ( .A(n1566), .Y(n1091) );
  INVX8 U988 ( .A(n1545), .Y(n1380) );
  INVX1 U989 ( .A(n438), .Y(n1092) );
  XNOR2X1 U990 ( .A(a[25]), .B(n25), .Y(n34) );
  INVX8 U991 ( .A(n1334), .Y(n1697) );
  INVX4 U992 ( .A(n1255), .Y(n1698) );
  BUFX2 U993 ( .A(n1591), .Y(n1093) );
  INVX2 U994 ( .A(n1684), .Y(n1094) );
  INVX4 U995 ( .A(n1094), .Y(n1095) );
  XOR2X1 U996 ( .A(a[17]), .B(n1414), .Y(n1677) );
  OR2X2 U997 ( .A(n1182), .B(n1659), .Y(n1096) );
  XOR2X1 U998 ( .A(n1706), .B(n1657), .Y(n751) );
  INVX2 U999 ( .A(n430), .Y(n1139) );
  INVX1 U1000 ( .A(n202), .Y(n1097) );
  INVX8 U1001 ( .A(n1676), .Y(n707) );
  AND2X2 U1002 ( .A(n1051), .B(n1164), .Y(n1098) );
  INVX2 U1003 ( .A(n1685), .Y(n1151) );
  INVX1 U1004 ( .A(n404), .Y(n1198) );
  INVX4 U1005 ( .A(n1732), .Y(n1480) );
  INVX2 U1006 ( .A(n634), .Y(n1118) );
  INVX2 U1007 ( .A(n1465), .Y(n1204) );
  AND2X2 U1008 ( .A(n563), .B(n661), .Y(n1099) );
  INVX1 U1009 ( .A(n19), .Y(n1375) );
  INVX1 U1010 ( .A(n49), .Y(n1378) );
  INVX2 U1011 ( .A(n1230), .Y(n1177) );
  BUFX2 U1012 ( .A(n523), .Y(n1100) );
  XNOR2X1 U1013 ( .A(n1188), .B(n1101), .Y(n458) );
  XOR2X1 U1014 ( .A(n462), .B(n1102), .Y(n1101) );
  BUFX4 U1015 ( .A(n473), .Y(n1102) );
  INVX2 U1016 ( .A(n1211), .Y(n1188) );
  XOR2X1 U1017 ( .A(n198), .B(n67), .Y(product[33]) );
  HAX1 U1018 ( .A(n715), .B(n651), .YS(n1103) );
  INVX1 U1019 ( .A(n879), .Y(n1104) );
  INVX2 U1020 ( .A(n879), .Y(n1105) );
  INVX1 U1021 ( .A(n879), .Y(n1719) );
  INVX2 U1022 ( .A(n506), .Y(n1106) );
  OR2X2 U1023 ( .A(n1729), .B(n1339), .Y(n806) );
  NOR2X1 U1024 ( .A(n1419), .B(n1023), .Y(n1107) );
  INVX2 U1025 ( .A(n1737), .Y(n1376) );
  INVX8 U1026 ( .A(n1480), .Y(n1481) );
  XOR2X1 U1027 ( .A(n170), .B(n1326), .Y(product[37]) );
  NAND3X1 U1028 ( .A(n1442), .B(n1440), .C(n1441), .Y(n1108) );
  BUFX2 U1029 ( .A(n464), .Y(n1110) );
  NAND3X1 U1030 ( .A(n1438), .B(n1436), .C(n1437), .Y(n1111) );
  XNOR2X1 U1031 ( .A(n1112), .B(n1253), .Y(n430) );
  XOR2X1 U1032 ( .A(n1306), .B(n1111), .Y(n1112) );
  XNOR2X1 U1033 ( .A(n1712), .B(n1190), .Y(n781) );
  INVX2 U1034 ( .A(n609), .Y(n1113) );
  BUFX2 U1035 ( .A(n344), .Y(n1114) );
  INVX4 U1036 ( .A(n1645), .Y(n1696) );
  XOR2X1 U1037 ( .A(n1027), .B(n1115), .Y(n464) );
  XOR2X1 U1038 ( .A(n630), .B(n1016), .Y(n1115) );
  XOR2X1 U1039 ( .A(n1116), .B(n1301), .Y(n374) );
  XNOR2X1 U1040 ( .A(n1181), .B(n389), .Y(n1116) );
  BUFX2 U1041 ( .A(n1413), .Y(n1117) );
  XNOR2X1 U1042 ( .A(n1119), .B(n518), .Y(n516) );
  XNOR2X1 U1043 ( .A(n523), .B(n520), .Y(n1119) );
  INVX1 U1044 ( .A(n1335), .Y(n1120) );
  AND2X2 U1045 ( .A(n1547), .B(n892), .Y(n1335) );
  INVX8 U1046 ( .A(n1143), .Y(n1680) );
  XOR2X1 U1047 ( .A(n698), .B(n650), .Y(n1122) );
  XOR2X1 U1048 ( .A(n1126), .B(n1122), .Y(n504) );
  NAND2X1 U1049 ( .A(n666), .B(n698), .Y(n1123) );
  NAND2X1 U1050 ( .A(n666), .B(n650), .Y(n1124) );
  NAND2X1 U1051 ( .A(n698), .B(n650), .Y(n1125) );
  NAND3X1 U1052 ( .A(n1124), .B(n1123), .C(n1125), .Y(n503) );
  BUFX2 U1053 ( .A(n666), .Y(n1126) );
  INVX4 U1054 ( .A(n1479), .Y(n1679) );
  BUFX2 U1055 ( .A(n1307), .Y(n1127) );
  INVX1 U1056 ( .A(n1486), .Y(n1128) );
  INVX1 U1057 ( .A(n1128), .Y(n1129) );
  INVX2 U1058 ( .A(n1260), .Y(n1131) );
  INVX4 U1059 ( .A(n1711), .Y(n1132) );
  INVX4 U1060 ( .A(n1711), .Y(n1512) );
  XOR2X1 U1061 ( .A(n1512), .B(n1190), .Y(n782) );
  INVX1 U1062 ( .A(n1190), .Y(n1192) );
  INVX4 U1063 ( .A(n7), .Y(n1733) );
  BUFX2 U1064 ( .A(n1622), .Y(n1299) );
  INVX2 U1065 ( .A(n465), .Y(n1133) );
  INVX4 U1066 ( .A(n1133), .Y(n1134) );
  XOR2X1 U1067 ( .A(n1610), .B(n1263), .Y(n834) );
  INVX1 U1068 ( .A(n494), .Y(n1230) );
  XNOR2X1 U1069 ( .A(n1135), .B(n416), .Y(n414) );
  XNOR2X1 U1070 ( .A(n429), .B(n418), .Y(n1135) );
  OAI22X1 U1071 ( .A(n1694), .B(n783), .C(n784), .D(n1695), .Y(n1136) );
  BUFX2 U1072 ( .A(n1567), .Y(n1137) );
  BUFX2 U1073 ( .A(n1541), .Y(n1138) );
  XNOR2X1 U1074 ( .A(n1457), .B(n1139), .Y(n428) );
  NAND2X1 U1075 ( .A(n362), .B(n1021), .Y(n1140) );
  NAND2X1 U1076 ( .A(n362), .B(n364), .Y(n1141) );
  NAND2X1 U1077 ( .A(n1021), .B(n364), .Y(n1142) );
  NAND3X1 U1078 ( .A(n1141), .B(n1140), .C(n1142), .Y(n359) );
  BUFX2 U1079 ( .A(n1643), .Y(n1143) );
  XOR2X1 U1080 ( .A(n656), .B(n672), .Y(n1144) );
  XOR2X1 U1081 ( .A(n624), .B(n1144), .Y(n380) );
  NAND2X1 U1082 ( .A(n672), .B(n624), .Y(n1145) );
  NAND2X1 U1083 ( .A(n624), .B(n656), .Y(n1146) );
  NAND2X1 U1084 ( .A(n672), .B(n656), .Y(n1147) );
  NAND3X1 U1085 ( .A(n1146), .B(n1145), .C(n1147), .Y(n379) );
  XOR2X1 U1086 ( .A(n1148), .B(n1149), .Y(n446) );
  XOR2X1 U1087 ( .A(n1665), .B(n1225), .Y(n1148) );
  INVX1 U1088 ( .A(n450), .Y(n1149) );
  OAI22X1 U1089 ( .A(n1525), .B(n812), .C(n813), .D(n1534), .Y(n1150) );
  BUFX2 U1090 ( .A(n18), .Y(n1526) );
  XOR2X1 U1091 ( .A(n727), .B(n1648), .Y(n759) );
  XNOR2X1 U1092 ( .A(n1152), .B(n696), .Y(n486) );
  XNOR2X1 U1093 ( .A(n680), .B(n648), .Y(n1152) );
  INVX2 U1094 ( .A(n1532), .Y(n1321) );
  BUFX2 U1095 ( .A(n810), .Y(n1154) );
  OAI22X1 U1096 ( .A(n1095), .B(n826), .C(n827), .D(n1687), .Y(n1155) );
  INVX4 U1097 ( .A(n1685), .Y(n1686) );
  BUFX2 U1098 ( .A(n1308), .Y(n1156) );
  NAND3X1 U1099 ( .A(n1309), .B(n1127), .C(n1156), .Y(n1157) );
  NAND2X1 U1100 ( .A(n664), .B(n712), .Y(n1158) );
  NAND2X1 U1101 ( .A(n712), .B(n616), .Y(n1159) );
  NAND2X1 U1102 ( .A(n664), .B(n616), .Y(n1160) );
  NAND3X1 U1103 ( .A(n1159), .B(n1158), .C(n1160), .Y(n487) );
  NAND3X1 U1104 ( .A(n1498), .B(n1499), .C(n1497), .Y(n1161) );
  INVX2 U1105 ( .A(n390), .Y(n1353) );
  INVX1 U1106 ( .A(n174), .Y(n1162) );
  NAND2X1 U1107 ( .A(n172), .B(n1107), .Y(n1163) );
  INVX1 U1108 ( .A(n160), .Y(n1164) );
  AND2X2 U1109 ( .A(n1163), .B(n1164), .Y(n1666) );
  BUFX2 U1110 ( .A(n692), .Y(n1165) );
  INVX8 U1111 ( .A(n1166), .Y(n1167) );
  XOR2X1 U1112 ( .A(n632), .B(n497), .Y(n1168) );
  XOR2X1 U1113 ( .A(n1168), .B(n1108), .Y(n484) );
  NAND2X1 U1114 ( .A(n632), .B(n497), .Y(n1169) );
  NAND2X1 U1115 ( .A(n632), .B(n495), .Y(n1170) );
  NAND2X1 U1116 ( .A(n497), .B(n495), .Y(n1171) );
  NAND3X1 U1117 ( .A(n1169), .B(n1170), .C(n1171), .Y(n483) );
  XOR2X1 U1118 ( .A(n474), .B(n476), .Y(n1172) );
  XOR2X1 U1119 ( .A(n1172), .B(n1109), .Y(n470) );
  NAND2X1 U1120 ( .A(n474), .B(n476), .Y(n1173) );
  NAND2X1 U1121 ( .A(n476), .B(n483), .Y(n1174) );
  NAND2X1 U1122 ( .A(n474), .B(n483), .Y(n1175) );
  NAND3X1 U1123 ( .A(n1173), .B(n1174), .C(n1175), .Y(n469) );
  BUFX2 U1124 ( .A(n1412), .Y(n1176) );
  XOR2X1 U1125 ( .A(n501), .B(n1177), .Y(n1329) );
  NAND2X1 U1126 ( .A(n645), .B(n1136), .Y(n1178) );
  NAND2X1 U1127 ( .A(n645), .B(n1009), .Y(n1179) );
  NAND2X1 U1128 ( .A(n1136), .B(n597), .Y(n1180) );
  NAND3X1 U1129 ( .A(n1179), .B(n1178), .C(n1180), .Y(n451) );
  INVX4 U1130 ( .A(n887), .Y(n1706) );
  NAND3X1 U1131 ( .A(n1523), .B(n1522), .C(n1521), .Y(n1181) );
  NOR2X1 U1132 ( .A(n312), .B(n319), .Y(n1182) );
  XOR2X1 U1133 ( .A(n351), .B(n1184), .Y(n1183) );
  XOR2X1 U1134 ( .A(n344), .B(n353), .Y(n1184) );
  NAND3X1 U1135 ( .A(n1603), .B(n1602), .C(n1604), .Y(n1185) );
  XOR2X1 U1136 ( .A(n1186), .B(n1006), .Y(n338) );
  XOR2X1 U1137 ( .A(n1183), .B(n342), .Y(n1186) );
  BUFX2 U1138 ( .A(n382), .Y(n1187) );
  OR2X2 U1139 ( .A(n1669), .B(n1678), .Y(n1189) );
  INVX4 U1140 ( .A(n1189), .Y(n1533) );
  INVX4 U1141 ( .A(n1321), .Y(n1190) );
  XNOR2X1 U1142 ( .A(n1193), .B(n496), .Y(n492) );
  XNOR2X1 U1143 ( .A(n505), .B(n503), .Y(n1193) );
  XOR2X1 U1144 ( .A(n1269), .B(n1226), .Y(n388) );
  NAND2X1 U1145 ( .A(n444), .B(n1161), .Y(n1194) );
  NAND2X1 U1146 ( .A(n444), .B(n446), .Y(n1195) );
  NAND2X1 U1147 ( .A(n1161), .B(n446), .Y(n1196) );
  NAND3X1 U1148 ( .A(n1195), .B(n1194), .C(n1196), .Y(n441) );
  XOR2X1 U1149 ( .A(n1197), .B(n1198), .Y(n402) );
  XNOR2X1 U1150 ( .A(n406), .B(n419), .Y(n1197) );
  XOR2X1 U1151 ( .A(n683), .B(n699), .Y(n1199) );
  XOR2X1 U1152 ( .A(n566), .B(n1199), .Y(n512) );
  NAND2X1 U1153 ( .A(n566), .B(n683), .Y(n1200) );
  NAND2X1 U1154 ( .A(n566), .B(n699), .Y(n1201) );
  NAND2X1 U1155 ( .A(n699), .B(n683), .Y(n1202) );
  NAND3X1 U1156 ( .A(n1201), .B(n1200), .C(n1202), .Y(n511) );
  XOR2X1 U1157 ( .A(n1229), .B(n1737), .Y(n766) );
  XOR2X1 U1158 ( .A(n1727), .B(n1266), .Y(n858) );
  XOR2X1 U1159 ( .A(n1715), .B(n1204), .Y(n814) );
  INVX4 U1160 ( .A(n881), .Y(n1716) );
  XOR2X1 U1161 ( .A(n1379), .B(n1208), .Y(n1205) );
  XNOR2X1 U1162 ( .A(n1206), .B(n996), .Y(n410) );
  XNOR2X1 U1163 ( .A(n610), .B(n578), .Y(n1206) );
  INVX4 U1164 ( .A(n25), .Y(n1207) );
  XOR2X1 U1165 ( .A(n1379), .B(n1208), .Y(n767) );
  INVX8 U1166 ( .A(n1648), .Y(n1208) );
  INVX2 U1167 ( .A(n1738), .Y(n1737) );
  BUFX2 U1168 ( .A(n311), .Y(n1209) );
  INVX1 U1169 ( .A(n436), .Y(n1210) );
  NAND2X1 U1170 ( .A(n1378), .B(n1658), .Y(n755) );
  INVX8 U1171 ( .A(n1739), .Y(n1668) );
  NAND3X1 U1172 ( .A(n1274), .B(n1275), .C(n1276), .Y(n1211) );
  XOR2X1 U1173 ( .A(n654), .B(n638), .Y(n1212) );
  XOR2X1 U1174 ( .A(n1212), .B(n622), .Y(n354) );
  NAND2X1 U1175 ( .A(n622), .B(n638), .Y(n1213) );
  NAND2X1 U1176 ( .A(n654), .B(n622), .Y(n1214) );
  NAND2X1 U1177 ( .A(n654), .B(n638), .Y(n1215) );
  NAND3X1 U1178 ( .A(n1214), .B(n1213), .C(n1215), .Y(n353) );
  INVX2 U1179 ( .A(n1681), .Y(n1216) );
  XOR2X1 U1180 ( .A(n700), .B(n716), .Y(n1217) );
  XOR2X1 U1181 ( .A(n1217), .B(n652), .Y(n520) );
  NAND2X1 U1182 ( .A(n716), .B(n700), .Y(n1218) );
  NAND2X1 U1183 ( .A(n716), .B(n652), .Y(n1219) );
  NAND2X1 U1184 ( .A(n700), .B(n652), .Y(n1220) );
  NAND3X1 U1185 ( .A(n1218), .B(n1219), .C(n1220), .Y(n519) );
  XOR2X1 U1186 ( .A(n667), .B(n514), .Y(n1221) );
  XOR2X1 U1187 ( .A(n1221), .B(n519), .Y(n510) );
  NAND2X1 U1188 ( .A(n667), .B(n1103), .Y(n1222) );
  NAND2X1 U1189 ( .A(n667), .B(n519), .Y(n1223) );
  NAND2X1 U1190 ( .A(n1103), .B(n519), .Y(n1224) );
  NAND3X1 U1191 ( .A(n1222), .B(n1223), .C(n1224), .Y(n509) );
  INVX2 U1192 ( .A(n452), .Y(n1225) );
  INVX2 U1193 ( .A(n403), .Y(n1226) );
  XNOR2X1 U1194 ( .A(n1227), .B(n1155), .Y(n424) );
  XNOR2X1 U1195 ( .A(n627), .B(n611), .Y(n1227) );
  INVX4 U1196 ( .A(n1614), .Y(n1240) );
  XOR2X1 U1197 ( .A(n1725), .B(n1661), .Y(n859) );
  INVX2 U1198 ( .A(n1736), .Y(n1339) );
  XOR2X1 U1199 ( .A(n711), .B(n615), .Y(n478) );
  INVX2 U1200 ( .A(n1228), .Y(n477) );
  NAND2X1 U1201 ( .A(n711), .B(n615), .Y(n1228) );
  INVX1 U1202 ( .A(n1730), .Y(n1241) );
  INVX2 U1203 ( .A(n885), .Y(n1229) );
  INVX2 U1204 ( .A(n885), .Y(n1709) );
  NAND3X1 U1205 ( .A(n1297), .B(n1296), .C(n1298), .Y(n1231) );
  XOR2X1 U1206 ( .A(n308), .B(n315), .Y(n1232) );
  XOR2X1 U1207 ( .A(n1232), .B(n313), .Y(n306) );
  NAND2X1 U1208 ( .A(n313), .B(n308), .Y(n1233) );
  NAND2X1 U1209 ( .A(n313), .B(n315), .Y(n1234) );
  NAND2X1 U1210 ( .A(n308), .B(n315), .Y(n1235) );
  NAND3X1 U1211 ( .A(n1234), .B(n1233), .C(n1235), .Y(n305) );
  INVX1 U1212 ( .A(n101), .Y(n99) );
  NAND3X1 U1213 ( .A(n1428), .B(n1427), .C(n1429), .Y(n1236) );
  NAND3X1 U1214 ( .A(n1599), .B(n1600), .C(n1601), .Y(n1237) );
  NAND3X1 U1215 ( .A(n1571), .B(n1570), .C(n1572), .Y(n1238) );
  AND2X2 U1216 ( .A(n1739), .B(n1710), .Y(n576) );
  INVX2 U1217 ( .A(n7), .Y(n1414) );
  NOR2X1 U1218 ( .A(n1037), .B(n1030), .Y(n1239) );
  INVX2 U1219 ( .A(n352), .Y(n1464) );
  INVX2 U1220 ( .A(n561), .Y(n1675) );
  BUFX2 U1221 ( .A(n1359), .Y(n1647) );
  INVX4 U1222 ( .A(n13), .Y(n1735) );
  INVX4 U1223 ( .A(n1735), .Y(n1664) );
  INVX2 U1224 ( .A(n1369), .Y(n1641) );
  INVX1 U1225 ( .A(n1614), .Y(n1695) );
  XOR2X1 U1226 ( .A(n1241), .B(n1376), .Y(n771) );
  NAND3X1 U1227 ( .A(n1538), .B(n1539), .C(n1540), .Y(n1242) );
  XNOR2X1 U1228 ( .A(n1104), .B(n1536), .Y(n845) );
  BUFX4 U1229 ( .A(n1414), .Y(n1536) );
  XOR2X1 U1230 ( .A(n1718), .B(n1658), .Y(n744) );
  XOR2X1 U1231 ( .A(n573), .B(n317), .Y(n1243) );
  XOR2X1 U1232 ( .A(n1243), .B(n585), .Y(n310) );
  XOR2X1 U1233 ( .A(n601), .B(n617), .Y(n1244) );
  XOR2X1 U1234 ( .A(n1244), .B(n310), .Y(n308) );
  NAND2X1 U1235 ( .A(n573), .B(n317), .Y(n1245) );
  NAND2X1 U1236 ( .A(n573), .B(n585), .Y(n1246) );
  NAND2X1 U1237 ( .A(n317), .B(n585), .Y(n1247) );
  NAND3X1 U1238 ( .A(n1245), .B(n1246), .C(n1247), .Y(n309) );
  NAND2X1 U1239 ( .A(n601), .B(n617), .Y(n1248) );
  NAND2X1 U1240 ( .A(n601), .B(n310), .Y(n1249) );
  NAND2X1 U1241 ( .A(n617), .B(n310), .Y(n1250) );
  NAND3X1 U1242 ( .A(n1248), .B(n1249), .C(n1250), .Y(n307) );
  OR2X1 U1243 ( .A(n1699), .B(n741), .Y(n1251) );
  OR2X1 U1244 ( .A(n742), .B(n1341), .Y(n1252) );
  NAND2X1 U1245 ( .A(n1251), .B(n1252), .Y(n585) );
  INVX1 U1246 ( .A(n434), .Y(n1253) );
  XOR2X1 U1247 ( .A(n329), .B(n331), .Y(n1387) );
  INVX2 U1248 ( .A(n1663), .Y(n1263) );
  XNOR2X1 U1249 ( .A(n1254), .B(n693), .Y(n450) );
  XNOR2X1 U1250 ( .A(n677), .B(n709), .Y(n1254) );
  XOR2X1 U1251 ( .A(a[29]), .B(n1738), .Y(n1255) );
  AND2X2 U1252 ( .A(n891), .B(n46), .Y(n1256) );
  NAND3X1 U1253 ( .A(n1319), .B(n1318), .C(n1320), .Y(n1257) );
  NAND2X1 U1254 ( .A(n1739), .B(n1084), .Y(n1531) );
  XOR2X1 U1255 ( .A(n1718), .B(n1663), .Y(n829) );
  INVX2 U1256 ( .A(n1335), .Y(n1502) );
  XNOR2X1 U1257 ( .A(n86), .B(n1258), .Y(product[45]) );
  AND2X1 U1258 ( .A(n85), .B(n273), .Y(n1258) );
  BUFX4 U1259 ( .A(n212), .Y(n1259) );
  INVX8 U1260 ( .A(n1240), .Y(n1260) );
  INVX4 U1261 ( .A(n1260), .Y(n1261) );
  INVX4 U1262 ( .A(n1260), .Y(n1262) );
  XOR2X1 U1263 ( .A(n1720), .B(n1263), .Y(n828) );
  INVX8 U1264 ( .A(n1730), .Y(n1264) );
  INVX2 U1265 ( .A(n1730), .Y(n1729) );
  BUFX2 U1266 ( .A(n1694), .Y(n1265) );
  INVX8 U1267 ( .A(n1660), .Y(n1266) );
  XOR2X1 U1268 ( .A(n633), .B(n713), .Y(n498) );
  INVX2 U1269 ( .A(n1267), .Y(n497) );
  NAND2X1 U1270 ( .A(n713), .B(n633), .Y(n1267) );
  NAND3X1 U1271 ( .A(n1471), .B(n1472), .C(n1473), .Y(n1268) );
  XNOR2X1 U1272 ( .A(n392), .B(n405), .Y(n1269) );
  NAND2X1 U1273 ( .A(n648), .B(n680), .Y(n1270) );
  NAND2X1 U1274 ( .A(n680), .B(n696), .Y(n1271) );
  NAND2X1 U1275 ( .A(n648), .B(n696), .Y(n1272) );
  NAND3X1 U1276 ( .A(n1270), .B(n1271), .C(n1272), .Y(n485) );
  XOR2X1 U1277 ( .A(n487), .B(n478), .Y(n1273) );
  XOR2X1 U1278 ( .A(n1273), .B(n1064), .Y(n472) );
  NAND2X1 U1279 ( .A(n487), .B(n478), .Y(n1274) );
  NAND2X1 U1280 ( .A(n487), .B(n485), .Y(n1275) );
  NAND2X1 U1281 ( .A(n478), .B(n485), .Y(n1276) );
  NAND3X1 U1282 ( .A(n1274), .B(n1275), .C(n1276), .Y(n471) );
  BUFX2 U1283 ( .A(n368), .Y(n1277) );
  NAND3X1 U1284 ( .A(n1350), .B(n1349), .C(n1351), .Y(n1278) );
  XNOR2X1 U1285 ( .A(n1279), .B(n628), .Y(n438) );
  XNOR2X1 U1286 ( .A(n676), .B(n612), .Y(n1279) );
  XOR2X1 U1287 ( .A(n330), .B(n341), .Y(n1280) );
  XOR2X1 U1288 ( .A(n1280), .B(n339), .Y(n328) );
  NAND2X1 U1289 ( .A(n339), .B(n330), .Y(n1281) );
  NAND2X1 U1290 ( .A(n339), .B(n341), .Y(n1282) );
  NAND2X1 U1291 ( .A(n330), .B(n341), .Y(n1283) );
  NAND3X1 U1292 ( .A(n1282), .B(n1281), .C(n1283), .Y(n327) );
  XOR2X1 U1293 ( .A(n1284), .B(n363), .Y(n350) );
  XOR2X1 U1294 ( .A(n365), .B(n354), .Y(n1284) );
  XOR2X1 U1295 ( .A(n1286), .B(n1285), .Y(n398) );
  INVX1 U1296 ( .A(n641), .Y(n1285) );
  XNOR2X1 U1297 ( .A(n593), .B(n577), .Y(n1286) );
  XOR2X1 U1298 ( .A(n1610), .B(n1339), .Y(n800) );
  XOR2X1 U1299 ( .A(n1099), .B(n1287), .Y(n1361) );
  INVX2 U1300 ( .A(n451), .Y(n1287) );
  INVX8 U1301 ( .A(n1025), .Y(n727) );
  NAND3X1 U1302 ( .A(n1411), .B(n1176), .C(n1117), .Y(n1288) );
  NOR2X1 U1303 ( .A(n338), .B(n347), .Y(n1289) );
  XOR2X1 U1304 ( .A(n653), .B(n637), .Y(n1290) );
  XOR2X1 U1305 ( .A(n1290), .B(n621), .Y(n344) );
  NAND2X1 U1306 ( .A(n621), .B(n653), .Y(n1291) );
  NAND2X1 U1307 ( .A(n621), .B(n637), .Y(n1292) );
  NAND2X1 U1308 ( .A(n653), .B(n637), .Y(n1293) );
  NAND3X1 U1309 ( .A(n1292), .B(n1291), .C(n1293), .Y(n343) );
  NAND3X1 U1310 ( .A(n1488), .B(n1490), .C(n1489), .Y(n1294) );
  NAND3X1 U1311 ( .A(n1091), .B(n1565), .C(n1137), .Y(n1295) );
  NAND2X1 U1312 ( .A(n641), .B(n577), .Y(n1296) );
  NAND2X1 U1313 ( .A(n593), .B(n641), .Y(n1297) );
  NAND2X1 U1314 ( .A(n577), .B(n593), .Y(n1298) );
  NAND3X1 U1315 ( .A(n1296), .B(n1297), .C(n1298), .Y(n397) );
  INVX8 U1316 ( .A(n1725), .Y(n1726) );
  OAI22X1 U1317 ( .A(n1694), .B(n779), .C(n780), .D(n1695), .Y(n1300) );
  INVX1 U1318 ( .A(n378), .Y(n1301) );
  XOR2X1 U1319 ( .A(n646), .B(n614), .Y(n1302) );
  XOR2X1 U1320 ( .A(n477), .B(n1302), .Y(n462) );
  NAND2X1 U1321 ( .A(n477), .B(n646), .Y(n1303) );
  NAND2X1 U1322 ( .A(n477), .B(n614), .Y(n1304) );
  NAND2X1 U1323 ( .A(n646), .B(n614), .Y(n1305) );
  NAND3X1 U1324 ( .A(n1304), .B(n1303), .C(n1305), .Y(n461) );
  NAND3X1 U1325 ( .A(n1451), .B(n1450), .C(n1452), .Y(n1306) );
  NAND2X1 U1326 ( .A(n1010), .B(n674), .Y(n1307) );
  NAND2X1 U1327 ( .A(n578), .B(n674), .Y(n1308) );
  NAND2X1 U1328 ( .A(n1010), .B(n578), .Y(n1309) );
  NAND3X1 U1329 ( .A(n1309), .B(n1307), .C(n1308), .Y(n409) );
  INVX1 U1330 ( .A(n173), .Y(n1310) );
  NAND3X1 U1331 ( .A(n1554), .B(n1555), .C(n1556), .Y(n1311) );
  INVX2 U1332 ( .A(n1153), .Y(n1364) );
  INVX8 U1333 ( .A(n1681), .Y(n1683) );
  INVX2 U1334 ( .A(n417), .Y(n1366) );
  NAND3X1 U1335 ( .A(n1507), .B(n1508), .C(n1506), .Y(n1312) );
  XOR2X1 U1336 ( .A(n588), .B(n1531), .Y(n1313) );
  XOR2X1 U1337 ( .A(n604), .B(n1313), .Y(n334) );
  NAND2X1 U1338 ( .A(n604), .B(n1028), .Y(n1314) );
  NAND2X1 U1339 ( .A(n604), .B(n1531), .Y(n1315) );
  NAND2X1 U1340 ( .A(n1028), .B(n1531), .Y(n1316) );
  NAND3X1 U1341 ( .A(n1315), .B(n1314), .C(n1316), .Y(n333) );
  XOR2X1 U1342 ( .A(n466), .B(n1079), .Y(n1317) );
  XOR2X1 U1343 ( .A(n1110), .B(n1317), .Y(n460) );
  NAND2X1 U1344 ( .A(n464), .B(n466), .Y(n1318) );
  NAND2X1 U1345 ( .A(n464), .B(n1079), .Y(n1319) );
  NAND2X1 U1346 ( .A(n466), .B(n1079), .Y(n1320) );
  NAND3X1 U1347 ( .A(n1319), .B(n1318), .C(n1320), .Y(n459) );
  XOR2X1 U1348 ( .A(n1676), .B(n579), .Y(n1322) );
  XOR2X1 U1349 ( .A(n1322), .B(n691), .Y(n426) );
  NAND2X1 U1350 ( .A(n691), .B(n1503), .Y(n1323) );
  NAND2X1 U1351 ( .A(n691), .B(n1007), .Y(n1324) );
  NAND2X1 U1352 ( .A(n1503), .B(n1007), .Y(n1325) );
  NAND3X1 U1353 ( .A(n1324), .B(n1323), .C(n1325), .Y(n425) );
  INVX4 U1354 ( .A(n1675), .Y(n1676) );
  NAND2X1 U1355 ( .A(n1020), .B(n281), .Y(n1326) );
  INVX1 U1356 ( .A(n7), .Y(n1327) );
  BUFX2 U1357 ( .A(n1131), .Y(n1328) );
  XOR2X1 U1358 ( .A(n1329), .B(n492), .Y(n490) );
  NAND2X1 U1359 ( .A(n492), .B(n1288), .Y(n1330) );
  NAND2X1 U1360 ( .A(n492), .B(n494), .Y(n1331) );
  NAND2X1 U1361 ( .A(n1288), .B(n494), .Y(n1332) );
  NAND3X1 U1362 ( .A(n1331), .B(n1330), .C(n1332), .Y(n489) );
  XNOR2X1 U1363 ( .A(n1333), .B(n437), .Y(n420) );
  XNOR2X1 U1364 ( .A(n439), .B(n426), .Y(n1333) );
  INVX2 U1365 ( .A(n376), .Y(n1365) );
  AND2X2 U1366 ( .A(n1547), .B(n892), .Y(n1334) );
  INVX2 U1367 ( .A(n13), .Y(n1336) );
  INVX2 U1368 ( .A(n1533), .Y(n1649) );
  NAND2X1 U1369 ( .A(n91), .B(n100), .Y(n1337) );
  NAND2X1 U1370 ( .A(n1381), .B(n1633), .Y(n1338) );
  OR2X2 U1371 ( .A(n306), .B(n311), .Y(n1381) );
  INVX4 U1372 ( .A(n1256), .Y(n1340) );
  INVX4 U1373 ( .A(n1644), .Y(n1341) );
  NAND2X1 U1374 ( .A(n676), .B(n612), .Y(n1342) );
  NAND2X1 U1375 ( .A(n676), .B(n628), .Y(n1343) );
  NAND2X1 U1376 ( .A(n612), .B(n628), .Y(n1344) );
  NAND3X1 U1377 ( .A(n1342), .B(n1343), .C(n1344), .Y(n437) );
  NAND2X1 U1378 ( .A(n426), .B(n1073), .Y(n1345) );
  NAND2X1 U1379 ( .A(n1073), .B(n437), .Y(n1346) );
  NAND2X1 U1380 ( .A(n426), .B(n437), .Y(n1347) );
  NAND3X1 U1381 ( .A(n1345), .B(n1346), .C(n1347), .Y(n419) );
  XOR2X1 U1382 ( .A(n379), .B(n1623), .Y(n1348) );
  XOR2X1 U1383 ( .A(n1277), .B(n1348), .Y(n364) );
  NAND2X1 U1384 ( .A(n368), .B(n379), .Y(n1349) );
  NAND2X1 U1385 ( .A(n368), .B(n1623), .Y(n1350) );
  NAND2X1 U1386 ( .A(n379), .B(n1623), .Y(n1351) );
  NAND3X1 U1387 ( .A(n1350), .B(n1349), .C(n1351), .Y(n363) );
  NAND2X1 U1388 ( .A(n1484), .B(n1461), .Y(n1352) );
  INVX2 U1389 ( .A(n1483), .Y(n1484) );
  XNOR2X1 U1390 ( .A(n402), .B(n1354), .Y(n400) );
  XOR2X1 U1391 ( .A(n415), .B(n1366), .Y(n1354) );
  NOR2X1 U1392 ( .A(n371), .B(n360), .Y(n1355) );
  BUFX2 U1393 ( .A(n878), .Y(n1356) );
  BUFX2 U1394 ( .A(n356), .Y(n1357) );
  INVX4 U1395 ( .A(n18), .Y(n1685) );
  BUFX2 U1396 ( .A(n1262), .Y(n1358) );
  NAND2X1 U1397 ( .A(n1651), .B(n898), .Y(n1359) );
  NAND2X1 U1398 ( .A(n1651), .B(n898), .Y(n1360) );
  INVX1 U1399 ( .A(n1667), .Y(n556) );
  XNOR2X1 U1400 ( .A(n1361), .B(n1001), .Y(n434) );
  XOR2X1 U1401 ( .A(n1708), .B(n1657), .Y(n750) );
  INVX1 U1402 ( .A(n377), .Y(n1416) );
  INVX1 U1403 ( .A(n210), .Y(n287) );
  OAI22X1 U1404 ( .A(n1525), .B(n812), .C(n813), .D(n1650), .Y(n1362) );
  NAND3X1 U1405 ( .A(n1588), .B(n1589), .C(n1590), .Y(n1363) );
  INVX2 U1406 ( .A(a[15]), .Y(n915) );
  XOR2X1 U1407 ( .A(n1203), .B(n1364), .Y(n778) );
  INVX1 U1408 ( .A(n183), .Y(n181) );
  XOR2X1 U1409 ( .A(n387), .B(n1365), .Y(n1377) );
  BUFX2 U1410 ( .A(n394), .Y(n1367) );
  NAND3X1 U1411 ( .A(n1138), .B(n1542), .C(n1543), .Y(n1368) );
  XNOR2X1 U1412 ( .A(a[23]), .B(n19), .Y(n1369) );
  INVX8 U1413 ( .A(n1641), .Y(n1690) );
  NAND3X1 U1414 ( .A(n1485), .B(n1487), .C(n1129), .Y(n1370) );
  INVX1 U1415 ( .A(n1716), .Y(n1371) );
  INVX1 U1416 ( .A(n211), .Y(n1495) );
  BUFX2 U1417 ( .A(n884), .Y(n1372) );
  INVX2 U1418 ( .A(n884), .Y(n1711) );
  XOR2X1 U1419 ( .A(n1718), .B(n998), .Y(n795) );
  XNOR2X1 U1420 ( .A(n1373), .B(n459), .Y(n444) );
  XNOR2X1 U1421 ( .A(n448), .B(n461), .Y(n1373) );
  NAND3X1 U1422 ( .A(n1424), .B(n1423), .C(n1425), .Y(n1374) );
  XNOR2X1 U1423 ( .A(n1377), .B(n374), .Y(n372) );
  INVX1 U1424 ( .A(n1182), .Y(n277) );
  INVX4 U1425 ( .A(n880), .Y(n1718) );
  INVX8 U1426 ( .A(n1708), .Y(n1379) );
  INVX2 U1427 ( .A(n1372), .Y(n1426) );
  INVX4 U1428 ( .A(n1734), .Y(n1545) );
  INVX4 U1429 ( .A(n1336), .Y(n1734) );
  OR2X2 U1430 ( .A(n306), .B(n1209), .Y(n1382) );
  XOR2X1 U1431 ( .A(n576), .B(n1654), .Y(n1383) );
  XOR2X1 U1432 ( .A(n1383), .B(n591), .Y(n370) );
  NAND2X1 U1433 ( .A(n591), .B(n576), .Y(n1384) );
  NAND2X1 U1434 ( .A(n591), .B(n1654), .Y(n1385) );
  NAND2X1 U1435 ( .A(n576), .B(n1654), .Y(n1386) );
  NAND3X1 U1436 ( .A(n1385), .B(n1384), .C(n1386), .Y(n369) );
  INVX1 U1437 ( .A(n1525), .Y(n553) );
  XOR2X1 U1438 ( .A(n1387), .B(n1083), .Y(n320) );
  NAND2X1 U1439 ( .A(n1083), .B(n1238), .Y(n1388) );
  NAND2X1 U1440 ( .A(n1083), .B(n331), .Y(n1389) );
  NAND2X1 U1441 ( .A(n1238), .B(n331), .Y(n1390) );
  NAND3X1 U1442 ( .A(n1389), .B(n1388), .C(n1390), .Y(n319) );
  XOR2X1 U1443 ( .A(n1530), .B(n575), .Y(n1391) );
  XOR2X1 U1444 ( .A(n1391), .B(n1035), .Y(n346) );
  NAND2X1 U1445 ( .A(n1530), .B(n575), .Y(n1392) );
  NAND2X1 U1446 ( .A(n1530), .B(n589), .Y(n1393) );
  NAND2X1 U1447 ( .A(n575), .B(n589), .Y(n1394) );
  NAND3X1 U1448 ( .A(n1392), .B(n1393), .C(n1394), .Y(n345) );
  XOR2X1 U1449 ( .A(n620), .B(n636), .Y(n1395) );
  XOR2X1 U1450 ( .A(n345), .B(n1395), .Y(n332) );
  NAND2X1 U1451 ( .A(n636), .B(n620), .Y(n1396) );
  NAND2X1 U1452 ( .A(n636), .B(n345), .Y(n1397) );
  NAND2X1 U1453 ( .A(n620), .B(n345), .Y(n1398) );
  NAND3X1 U1454 ( .A(n1396), .B(n1397), .C(n1398), .Y(n331) );
  INVX4 U1455 ( .A(n1466), .Y(n1645) );
  XNOR2X1 U1456 ( .A(n179), .B(n1399), .Y(product[36]) );
  AND2X1 U1457 ( .A(n178), .B(n282), .Y(n1399) );
  AND2X2 U1458 ( .A(n1658), .B(n1703), .Y(n579) );
  XOR2X1 U1459 ( .A(n717), .B(n669), .Y(n526) );
  INVX2 U1460 ( .A(n1400), .Y(n525) );
  NAND2X1 U1461 ( .A(n717), .B(n669), .Y(n1400) );
  XOR2X1 U1462 ( .A(n684), .B(n668), .Y(n1401) );
  XOR2X1 U1463 ( .A(n1401), .B(n525), .Y(n518) );
  NAND2X1 U1464 ( .A(n684), .B(n668), .Y(n1402) );
  NAND2X1 U1465 ( .A(n684), .B(n525), .Y(n1403) );
  NAND2X1 U1466 ( .A(n668), .B(n525), .Y(n1404) );
  NAND3X1 U1467 ( .A(n1402), .B(n1403), .C(n1404), .Y(n517) );
  NAND2X1 U1468 ( .A(n520), .B(n523), .Y(n1405) );
  NAND2X1 U1469 ( .A(n520), .B(n518), .Y(n1406) );
  NAND2X1 U1470 ( .A(n518), .B(n1100), .Y(n1407) );
  NAND3X1 U1471 ( .A(n1405), .B(n1406), .C(n1407), .Y(n515) );
  NAND2X1 U1472 ( .A(n682), .B(n714), .Y(n1408) );
  NAND2X1 U1473 ( .A(n714), .B(n634), .Y(n1409) );
  NAND2X1 U1474 ( .A(n682), .B(n634), .Y(n1410) );
  NAND3X1 U1475 ( .A(n1408), .B(n1409), .C(n1410), .Y(n505) );
  NAND2X1 U1476 ( .A(n513), .B(n1067), .Y(n1411) );
  NAND2X1 U1477 ( .A(n506), .B(n513), .Y(n1412) );
  NAND2X1 U1478 ( .A(n1067), .B(n506), .Y(n1413) );
  NAND3X1 U1479 ( .A(n1411), .B(n1412), .C(n1413), .Y(n501) );
  XNOR2X1 U1480 ( .A(a[19]), .B(n1733), .Y(n1642) );
  NAND2X1 U1481 ( .A(n366), .B(n1416), .Y(n1417) );
  NAND2X1 U1482 ( .A(n1415), .B(n1312), .Y(n1418) );
  NAND2X1 U1483 ( .A(n1417), .B(n1418), .Y(n1513) );
  INVX1 U1484 ( .A(n366), .Y(n1415) );
  NOR2X1 U1485 ( .A(n338), .B(n347), .Y(n1419) );
  INVX1 U1486 ( .A(n1419), .Y(n1583) );
  INVX2 U1487 ( .A(n326), .Y(n1420) );
  INVX4 U1488 ( .A(n1420), .Y(n1421) );
  XOR2X1 U1489 ( .A(n380), .B(n393), .Y(n1422) );
  XOR2X1 U1490 ( .A(n1187), .B(n1422), .Y(n376) );
  NAND2X1 U1491 ( .A(n380), .B(n382), .Y(n1423) );
  NAND2X1 U1492 ( .A(n382), .B(n393), .Y(n1424) );
  NAND2X1 U1493 ( .A(n380), .B(n393), .Y(n1425) );
  NAND3X1 U1494 ( .A(n1424), .B(n1423), .C(n1425), .Y(n375) );
  INVX1 U1495 ( .A(n395), .Y(n1430) );
  NAND2X1 U1496 ( .A(n374), .B(n1311), .Y(n1427) );
  NAND2X1 U1497 ( .A(n374), .B(n1019), .Y(n1428) );
  NAND2X1 U1498 ( .A(n1311), .B(n376), .Y(n1429) );
  NAND3X1 U1499 ( .A(n1429), .B(n1427), .C(n1428), .Y(n371) );
  XNOR2X1 U1500 ( .A(n1505), .B(n1430), .Y(n378) );
  BUFX2 U1501 ( .A(n1023), .Y(n1431) );
  NAND2X1 U1502 ( .A(n609), .B(n689), .Y(n1432) );
  NAND2X1 U1503 ( .A(n1300), .B(n609), .Y(n1433) );
  NAND2X1 U1504 ( .A(n689), .B(n1300), .Y(n1434) );
  NAND3X1 U1505 ( .A(n1433), .B(n1432), .C(n1434), .Y(n395) );
  NOR2X1 U1506 ( .A(n455), .B(n442), .Y(n1435) );
  NAND2X1 U1507 ( .A(n454), .B(n1134), .Y(n1436) );
  NAND2X1 U1508 ( .A(n1134), .B(n613), .Y(n1437) );
  NAND2X1 U1509 ( .A(n454), .B(n613), .Y(n1438) );
  NAND3X1 U1510 ( .A(n1437), .B(n1436), .C(n1438), .Y(n447) );
  INVX4 U1511 ( .A(n1530), .Y(n358) );
  XOR2X1 U1512 ( .A(n665), .B(n565), .Y(n1439) );
  XOR2X1 U1513 ( .A(n1439), .B(n681), .Y(n496) );
  NAND2X1 U1514 ( .A(n665), .B(n565), .Y(n1440) );
  NAND2X1 U1515 ( .A(n665), .B(n681), .Y(n1441) );
  NAND2X1 U1516 ( .A(n565), .B(n681), .Y(n1442) );
  NAND3X1 U1517 ( .A(n1442), .B(n1440), .C(n1441), .Y(n495) );
  NAND2X1 U1518 ( .A(n505), .B(n503), .Y(n1443) );
  NAND2X1 U1519 ( .A(n496), .B(n505), .Y(n1444) );
  NAND2X1 U1520 ( .A(n496), .B(n503), .Y(n1445) );
  NAND3X1 U1521 ( .A(n1443), .B(n1444), .C(n1445), .Y(n491) );
  OR2X2 U1522 ( .A(n102), .B(n1659), .Y(n1446) );
  NAND2X1 U1523 ( .A(n709), .B(n677), .Y(n1447) );
  NAND2X1 U1524 ( .A(n709), .B(n693), .Y(n1448) );
  NAND2X1 U1525 ( .A(n677), .B(n693), .Y(n1449) );
  NAND3X1 U1526 ( .A(n1447), .B(n1449), .C(n1448), .Y(n449) );
  NAND2X1 U1527 ( .A(n452), .B(n1665), .Y(n1450) );
  NAND2X1 U1528 ( .A(n450), .B(n1665), .Y(n1451) );
  NAND2X1 U1529 ( .A(n452), .B(n450), .Y(n1452) );
  NAND3X1 U1530 ( .A(n1450), .B(n1451), .C(n1452), .Y(n445) );
  XOR2X1 U1531 ( .A(n655), .B(n639), .Y(n1453) );
  XOR2X1 U1532 ( .A(n370), .B(n1453), .Y(n366) );
  NAND2X1 U1533 ( .A(n370), .B(n639), .Y(n1454) );
  NAND2X1 U1534 ( .A(n370), .B(n655), .Y(n1455) );
  NAND2X1 U1535 ( .A(n639), .B(n655), .Y(n1456) );
  NAND3X1 U1536 ( .A(n1456), .B(n1454), .C(n1455), .Y(n365) );
  XOR2X1 U1537 ( .A(n1426), .B(n1658), .Y(n748) );
  AND2X2 U1538 ( .A(n49), .B(n1698), .Y(n598) );
  INVX1 U1539 ( .A(n1680), .Y(n559) );
  XOR2X1 U1540 ( .A(n443), .B(n432), .Y(n1457) );
  NAND2X1 U1541 ( .A(n430), .B(n1185), .Y(n1458) );
  NAND2X1 U1542 ( .A(n430), .B(n432), .Y(n1459) );
  NAND2X1 U1543 ( .A(n1185), .B(n432), .Y(n1460) );
  NAND3X1 U1544 ( .A(n1460), .B(n1458), .C(n1459), .Y(n427) );
  BUFX2 U1545 ( .A(n427), .Y(n1461) );
  OR2X2 U1546 ( .A(n337), .B(n328), .Y(n1462) );
  INVX1 U1547 ( .A(n1462), .Y(n148) );
  NAND3X1 U1548 ( .A(n1562), .B(n1563), .C(n1561), .Y(n1463) );
  XNOR2X1 U1549 ( .A(n350), .B(n1464), .Y(n1517) );
  BUFX4 U1550 ( .A(n19), .Y(n1465) );
  BUFX2 U1551 ( .A(n19), .Y(n1656) );
  XOR2X1 U1552 ( .A(a[27]), .B(n1548), .Y(n1466) );
  XNOR2X1 U1553 ( .A(n1723), .B(n1731), .Y(n860) );
  XOR2X1 U1554 ( .A(n649), .B(n697), .Y(n1467) );
  XOR2X1 U1555 ( .A(n498), .B(n1467), .Y(n494) );
  NAND2X1 U1556 ( .A(n697), .B(n649), .Y(n1468) );
  NAND2X1 U1557 ( .A(n498), .B(n697), .Y(n1469) );
  NAND2X1 U1558 ( .A(n649), .B(n498), .Y(n1470) );
  NAND3X1 U1559 ( .A(n1468), .B(n1469), .C(n1470), .Y(n493) );
  NAND2X1 U1560 ( .A(n488), .B(n486), .Y(n1471) );
  NAND2X1 U1561 ( .A(n488), .B(n493), .Y(n1472) );
  NAND2X1 U1562 ( .A(n486), .B(n493), .Y(n1473) );
  INVX1 U1563 ( .A(n1694), .Y(n547) );
  XOR2X1 U1564 ( .A(n1362), .B(n596), .Y(n1474) );
  XOR2X1 U1565 ( .A(n1474), .B(n644), .Y(n436) );
  NAND2X1 U1566 ( .A(n644), .B(n1150), .Y(n1475) );
  NAND2X1 U1567 ( .A(n644), .B(n596), .Y(n1476) );
  NAND2X1 U1568 ( .A(n1150), .B(n596), .Y(n1477) );
  NAND3X1 U1569 ( .A(n1476), .B(n1475), .C(n1477), .Y(n435) );
  NAND3X1 U1570 ( .A(n1592), .B(n1093), .C(n1593), .Y(n1478) );
  AND2X2 U1571 ( .A(n1651), .B(n898), .Y(n1479) );
  INVX2 U1572 ( .A(n1327), .Y(n1732) );
  OR2X2 U1573 ( .A(n1264), .B(n1376), .Y(n772) );
  INVX8 U1574 ( .A(n1480), .Y(n1482) );
  INVX2 U1575 ( .A(n539), .Y(n1740) );
  XOR2X1 U1576 ( .A(n1702), .B(n1739), .Y(n753) );
  INVX1 U1577 ( .A(n182), .Y(n283) );
  INVX1 U1578 ( .A(n414), .Y(n1483) );
  INVX1 U1579 ( .A(n1654), .Y(n384) );
  NAND2X1 U1580 ( .A(n406), .B(n419), .Y(n1485) );
  NAND2X1 U1581 ( .A(n404), .B(n419), .Y(n1486) );
  NAND2X1 U1582 ( .A(n406), .B(n404), .Y(n1487) );
  NAND3X1 U1583 ( .A(n1486), .B(n1485), .C(n1487), .Y(n401) );
  NAND2X1 U1584 ( .A(n417), .B(n1478), .Y(n1488) );
  NAND2X1 U1585 ( .A(n402), .B(n417), .Y(n1489) );
  NAND2X1 U1586 ( .A(n402), .B(n1478), .Y(n1490) );
  NAND3X1 U1587 ( .A(n1488), .B(n1490), .C(n1489), .Y(n399) );
  INVX1 U1588 ( .A(n1700), .Y(n1491) );
  NAND2X1 U1589 ( .A(n630), .B(n662), .Y(n1492) );
  NAND2X1 U1590 ( .A(n678), .B(n662), .Y(n1493) );
  NAND2X1 U1591 ( .A(n630), .B(n678), .Y(n1494) );
  NAND3X1 U1592 ( .A(n1493), .B(n1492), .C(n1494), .Y(n463) );
  INVX8 U1593 ( .A(n1207), .Y(n1736) );
  INVX4 U1594 ( .A(n1685), .Y(n1687) );
  INVX1 U1595 ( .A(n1495), .Y(n1496) );
  NAND2X1 U1596 ( .A(n1211), .B(n462), .Y(n1497) );
  NAND2X1 U1597 ( .A(n471), .B(n1102), .Y(n1498) );
  NAND2X1 U1598 ( .A(n462), .B(n1102), .Y(n1499) );
  NAND3X1 U1599 ( .A(n1498), .B(n1499), .C(n1497), .Y(n457) );
  AND2X2 U1600 ( .A(n159), .B(n171), .Y(n1500) );
  INVX4 U1601 ( .A(n1500), .Y(n53) );
  BUFX2 U1602 ( .A(n1239), .Y(n1501) );
  XOR2X1 U1603 ( .A(n640), .B(n397), .Y(n1505) );
  NAND2X1 U1604 ( .A(n640), .B(n1231), .Y(n1506) );
  NAND2X1 U1605 ( .A(n395), .B(n640), .Y(n1507) );
  NAND2X1 U1606 ( .A(n1231), .B(n395), .Y(n1508) );
  NAND3X1 U1607 ( .A(n1507), .B(n1508), .C(n1506), .Y(n377) );
  NAND2X1 U1608 ( .A(n391), .B(n1237), .Y(n1509) );
  NAND2X1 U1609 ( .A(n391), .B(n378), .Y(n1510) );
  NAND2X1 U1610 ( .A(n1237), .B(n378), .Y(n1511) );
  NAND3X1 U1611 ( .A(n1510), .B(n1509), .C(n1511), .Y(n373) );
  XOR2X1 U1612 ( .A(n375), .B(n1513), .Y(n362) );
  NAND2X1 U1613 ( .A(n366), .B(n377), .Y(n1514) );
  NAND2X1 U1614 ( .A(n366), .B(n1374), .Y(n1515) );
  NAND2X1 U1615 ( .A(n1312), .B(n1374), .Y(n1516) );
  NAND3X1 U1616 ( .A(n1514), .B(n1515), .C(n1516), .Y(n361) );
  XOR2X1 U1617 ( .A(n1517), .B(n1036), .Y(n348) );
  NAND2X1 U1618 ( .A(n350), .B(n352), .Y(n1518) );
  NAND2X1 U1619 ( .A(n352), .B(n361), .Y(n1519) );
  NAND2X1 U1620 ( .A(n350), .B(n361), .Y(n1520) );
  NAND3X1 U1621 ( .A(n1518), .B(n1519), .C(n1520), .Y(n347) );
  NAND2X1 U1622 ( .A(n396), .B(n1002), .Y(n1521) );
  NAND2X1 U1623 ( .A(n396), .B(n1157), .Y(n1522) );
  NAND2X1 U1624 ( .A(n411), .B(n1157), .Y(n1523) );
  NAND3X1 U1625 ( .A(n1523), .B(n1522), .C(n1521), .Y(n391) );
  INVX4 U1626 ( .A(n1716), .Y(n1717) );
  BUFX2 U1627 ( .A(n1688), .Y(n1524) );
  BUFX4 U1628 ( .A(n1688), .Y(n1525) );
  INVX1 U1629 ( .A(n1669), .Y(n1688) );
  NAND2X1 U1630 ( .A(n349), .B(n342), .Y(n1527) );
  NAND2X1 U1631 ( .A(n1183), .B(n349), .Y(n1528) );
  NAND2X1 U1632 ( .A(n1183), .B(n342), .Y(n1529) );
  NAND3X1 U1633 ( .A(n1528), .B(n1527), .C(n1529), .Y(n337) );
  INVX1 U1634 ( .A(n1713), .Y(n732) );
  XNOR2X1 U1635 ( .A(n1727), .B(n1536), .Y(n841) );
  INVX4 U1636 ( .A(n1088), .Y(n1530) );
  INVX4 U1637 ( .A(n1531), .Y(n335) );
  XOR2X1 U1638 ( .A(n727), .B(n1661), .Y(n861) );
  INVX1 U1639 ( .A(n31), .Y(n1532) );
  INVX2 U1640 ( .A(n31), .Y(n1548) );
  INVX2 U1641 ( .A(n1533), .Y(n1534) );
  INVX8 U1642 ( .A(n1645), .Y(n1671) );
  BUFX2 U1643 ( .A(n1738), .Y(n1535) );
  INVX1 U1644 ( .A(n201), .Y(n1537) );
  NAND2X1 U1645 ( .A(n1099), .B(n1053), .Y(n1538) );
  NAND2X1 U1646 ( .A(n1099), .B(n449), .Y(n1539) );
  NAND2X1 U1647 ( .A(n1053), .B(n449), .Y(n1540) );
  NAND3X1 U1648 ( .A(n1538), .B(n1539), .C(n1540), .Y(n433) );
  NAND2X1 U1649 ( .A(n447), .B(n445), .Y(n1541) );
  NAND2X1 U1650 ( .A(n434), .B(n447), .Y(n1542) );
  NAND2X1 U1651 ( .A(n445), .B(n434), .Y(n1543) );
  NAND3X1 U1652 ( .A(n1541), .B(n1542), .C(n1543), .Y(n429) );
  XOR2X1 U1653 ( .A(n1132), .B(n1535), .Y(n1544) );
  XNOR2X1 U1654 ( .A(a[27]), .B(n1738), .Y(n892) );
  XNOR2X1 U1655 ( .A(n123), .B(n1546), .Y(product[42]) );
  AND2X2 U1656 ( .A(n122), .B(n1382), .Y(n1546) );
  XOR2X1 U1657 ( .A(n661), .B(n563), .Y(n454) );
  XOR2X1 U1658 ( .A(n1548), .B(a[27]), .Y(n1547) );
  XOR2X1 U1659 ( .A(n1268), .B(n472), .Y(n1549) );
  XOR2X1 U1660 ( .A(n470), .B(n1549), .Y(n468) );
  NAND2X1 U1661 ( .A(n1070), .B(n1268), .Y(n1550) );
  NAND2X1 U1662 ( .A(n1070), .B(n472), .Y(n1551) );
  NAND2X1 U1663 ( .A(n1268), .B(n472), .Y(n1552) );
  NAND3X1 U1664 ( .A(n1551), .B(n1550), .C(n1552), .Y(n467) );
  XNOR2X1 U1665 ( .A(n112), .B(n1553), .Y(product[43]) );
  AND2X2 U1666 ( .A(n111), .B(n1633), .Y(n1553) );
  INVX1 U1667 ( .A(n1728), .Y(n724) );
  NAND2X1 U1668 ( .A(n392), .B(n1050), .Y(n1554) );
  NAND2X1 U1669 ( .A(n403), .B(n1050), .Y(n1555) );
  NAND2X1 U1670 ( .A(n392), .B(n403), .Y(n1556) );
  NAND3X1 U1671 ( .A(n1554), .B(n1555), .C(n1556), .Y(n387) );
  NAND2X1 U1672 ( .A(n390), .B(n1370), .Y(n1557) );
  NAND2X1 U1673 ( .A(n388), .B(n390), .Y(n1558) );
  NAND2X1 U1674 ( .A(n388), .B(n1370), .Y(n1559) );
  NAND3X1 U1675 ( .A(n1557), .B(n1558), .C(n1559), .Y(n385) );
  XOR2X1 U1676 ( .A(n367), .B(n369), .Y(n1560) );
  XOR2X1 U1677 ( .A(n1357), .B(n1560), .Y(n352) );
  NAND2X1 U1678 ( .A(n356), .B(n367), .Y(n1561) );
  NAND2X1 U1679 ( .A(n356), .B(n369), .Y(n1562) );
  NAND2X1 U1680 ( .A(n367), .B(n369), .Y(n1563) );
  NAND3X1 U1681 ( .A(n1563), .B(n1562), .C(n1561), .Y(n351) );
  XNOR2X1 U1682 ( .A(n145), .B(n1564), .Y(product[40]) );
  AND2X2 U1683 ( .A(n144), .B(n1632), .Y(n1564) );
  XOR2X1 U1684 ( .A(n1712), .B(n1658), .Y(n747) );
  NAND2X1 U1685 ( .A(n627), .B(n675), .Y(n1565) );
  NAND2X1 U1686 ( .A(n611), .B(n675), .Y(n1566) );
  NAND2X1 U1687 ( .A(n627), .B(n611), .Y(n1567) );
  NAND3X1 U1688 ( .A(n1566), .B(n1567), .C(n1565), .Y(n423) );
  XOR2X1 U1689 ( .A(n1725), .B(n1380), .Y(n825) );
  NOR2X1 U1690 ( .A(n386), .B(n1294), .Y(n1568) );
  BUFX2 U1691 ( .A(n1720), .Y(n1611) );
  XOR2X1 U1692 ( .A(n334), .B(n343), .Y(n1569) );
  XOR2X1 U1693 ( .A(n1569), .B(n332), .Y(n330) );
  NAND2X1 U1694 ( .A(n334), .B(n332), .Y(n1570) );
  NAND2X1 U1695 ( .A(n332), .B(n1039), .Y(n1571) );
  NAND2X1 U1696 ( .A(n334), .B(n1039), .Y(n1572) );
  NAND3X1 U1697 ( .A(n1571), .B(n1570), .C(n1572), .Y(n329) );
  XOR2X1 U1698 ( .A(n1709), .B(n1662), .Y(n783) );
  XOR2X1 U1699 ( .A(n659), .B(n643), .Y(n1573) );
  XOR2X1 U1700 ( .A(n1573), .B(n595), .Y(n422) );
  NAND2X1 U1701 ( .A(n659), .B(n643), .Y(n1574) );
  NAND2X1 U1702 ( .A(n659), .B(n595), .Y(n1575) );
  NAND2X1 U1703 ( .A(n643), .B(n595), .Y(n1576) );
  NAND3X1 U1704 ( .A(n1574), .B(n1575), .C(n1576), .Y(n421) );
  NAND2X1 U1705 ( .A(n1086), .B(n1081), .Y(n1577) );
  NAND2X1 U1706 ( .A(n1081), .B(n421), .Y(n1578) );
  NAND2X1 U1707 ( .A(n1086), .B(n421), .Y(n1579) );
  NAND3X1 U1708 ( .A(n1579), .B(n1577), .C(n1578), .Y(n403) );
  NAND2X1 U1709 ( .A(n1463), .B(n1114), .Y(n1580) );
  NAND2X1 U1710 ( .A(n1463), .B(n353), .Y(n1581) );
  NAND2X1 U1711 ( .A(n1114), .B(n353), .Y(n1582) );
  NAND3X1 U1712 ( .A(n1582), .B(n1580), .C(n1581), .Y(n339) );
  INVX8 U1713 ( .A(n1533), .Y(n1650) );
  INVX1 U1714 ( .A(n222), .Y(n221) );
  NAND2X1 U1715 ( .A(n1278), .B(n365), .Y(n1584) );
  NAND2X1 U1716 ( .A(n1278), .B(n1034), .Y(n1585) );
  NAND2X1 U1717 ( .A(n365), .B(n1034), .Y(n1586) );
  NAND3X1 U1718 ( .A(n1585), .B(n1584), .C(n1586), .Y(n349) );
  XOR2X1 U1719 ( .A(n1372), .B(n1535), .Y(n765) );
  AND2X2 U1720 ( .A(n1264), .B(n1645), .Y(n616) );
  AND2X2 U1721 ( .A(n1264), .B(n547), .Y(n634) );
  INVX2 U1722 ( .A(n1716), .Y(n1587) );
  NAND2X1 U1723 ( .A(n438), .B(n440), .Y(n1588) );
  NAND2X1 U1724 ( .A(n440), .B(n436), .Y(n1589) );
  NAND2X1 U1725 ( .A(n438), .B(n436), .Y(n1590) );
  NAND3X1 U1726 ( .A(n1590), .B(n1589), .C(n1588), .Y(n431) );
  NAND2X1 U1727 ( .A(n420), .B(n1242), .Y(n1591) );
  NAND2X1 U1728 ( .A(n431), .B(n1242), .Y(n1592) );
  NAND2X1 U1729 ( .A(n431), .B(n420), .Y(n1593) );
  NAND3X1 U1730 ( .A(n1591), .B(n1592), .C(n1593), .Y(n415) );
  XOR2X1 U1731 ( .A(n398), .B(n407), .Y(n1595) );
  XOR2X1 U1732 ( .A(n1595), .B(n1367), .Y(n390) );
  NAND2X1 U1733 ( .A(n1015), .B(n1003), .Y(n1596) );
  NAND2X1 U1734 ( .A(n1090), .B(n707), .Y(n1597) );
  NAND2X1 U1735 ( .A(n1043), .B(n707), .Y(n1598) );
  NAND3X1 U1736 ( .A(n1596), .B(n1597), .C(n1598), .Y(n393) );
  NAND2X1 U1737 ( .A(n398), .B(n407), .Y(n1599) );
  NAND2X1 U1738 ( .A(n394), .B(n407), .Y(n1600) );
  NAND2X1 U1739 ( .A(n398), .B(n394), .Y(n1601) );
  NAND3X1 U1740 ( .A(n1599), .B(n1600), .C(n1601), .Y(n389) );
  NAND2X1 U1741 ( .A(n448), .B(n1257), .Y(n1602) );
  NAND2X1 U1742 ( .A(n1257), .B(n461), .Y(n1603) );
  NAND2X1 U1743 ( .A(n448), .B(n461), .Y(n1604) );
  NAND3X1 U1744 ( .A(n1603), .B(n1602), .C(n1604), .Y(n443) );
  XOR2X1 U1745 ( .A(n708), .B(n580), .Y(n1605) );
  XOR2X1 U1746 ( .A(n1165), .B(n1605), .Y(n440) );
  NAND2X1 U1747 ( .A(n692), .B(n708), .Y(n1606) );
  NAND2X1 U1748 ( .A(n692), .B(n580), .Y(n1607) );
  NAND2X1 U1749 ( .A(n708), .B(n580), .Y(n1608) );
  NAND3X1 U1750 ( .A(n1608), .B(n1606), .C(n1607), .Y(n439) );
  INVX4 U1751 ( .A(n882), .Y(n1714) );
  INVX1 U1752 ( .A(n1013), .Y(n1609) );
  INVX4 U1753 ( .A(n1229), .Y(n1610) );
  INVX4 U1754 ( .A(n889), .Y(n1702) );
  INVX4 U1755 ( .A(n1670), .Y(n1689) );
  INVX2 U1756 ( .A(n1716), .Y(n1613) );
  INVX1 U1757 ( .A(n1594), .Y(n728) );
  INVX1 U1758 ( .A(n1613), .Y(n730) );
  INVX4 U1759 ( .A(n877), .Y(n1723) );
  INVX4 U1760 ( .A(n876), .Y(n1725) );
  AND2X2 U1761 ( .A(n34), .B(n893), .Y(n1614) );
  NAND2X1 U1762 ( .A(n594), .B(n1503), .Y(n1615) );
  NAND2X1 U1763 ( .A(n1503), .B(n690), .Y(n1616) );
  NAND2X1 U1764 ( .A(n594), .B(n690), .Y(n1617) );
  NAND3X1 U1765 ( .A(n1617), .B(n1616), .C(n1615), .Y(n411) );
  NAND2X1 U1766 ( .A(n1072), .B(n1295), .Y(n1618) );
  NAND2X1 U1767 ( .A(n412), .B(n1072), .Y(n1619) );
  NAND2X1 U1768 ( .A(n1295), .B(n412), .Y(n1620) );
  NAND3X1 U1769 ( .A(n1618), .B(n1619), .C(n1620), .Y(n405) );
  XOR2X1 U1770 ( .A(n1709), .B(n1657), .Y(n749) );
  OR2X2 U1771 ( .A(n1642), .B(n1621), .Y(n18) );
  XNOR2X1 U1772 ( .A(n1734), .B(a[19]), .Y(n1621) );
  INVX1 U1773 ( .A(n189), .Y(n284) );
  INVX4 U1774 ( .A(n1653), .Y(n1654) );
  BUFX4 U1775 ( .A(n381), .Y(n1623) );
  INVX1 U1776 ( .A(n177), .Y(n282) );
  INVX4 U1777 ( .A(n1087), .Y(n1667) );
  INVX4 U1778 ( .A(n1), .Y(n1660) );
  INVX8 U1779 ( .A(n1698), .Y(n1699) );
  OR2X2 U1780 ( .A(n80), .B(n1659), .Y(n1627) );
  OR2X2 U1781 ( .A(n468), .B(n479), .Y(n1628) );
  OR2X2 U1782 ( .A(n327), .B(n320), .Y(n1632) );
  OR2X2 U1783 ( .A(n300), .B(n305), .Y(n1633) );
  INVX8 U1784 ( .A(n1693), .Y(n1694) );
  XOR2X1 U1785 ( .A(n571), .B(n1626), .Y(n290) );
  XOR2X1 U1786 ( .A(n581), .B(n293), .Y(n1626) );
  AND2X2 U1787 ( .A(n480), .B(n489), .Y(n1629) );
  OR2X1 U1788 ( .A(n480), .B(n489), .Y(n1630) );
  AND2X2 U1789 ( .A(n479), .B(n468), .Y(n1631) );
  OR2X1 U1790 ( .A(n532), .B(n535), .Y(n1634) );
  AND2X2 U1791 ( .A(n535), .B(n532), .Y(n1635) );
  AND2X2 U1792 ( .A(n706), .B(n722), .Y(n1636) );
  OR2X1 U1793 ( .A(n706), .B(n722), .Y(n1637) );
  INVX2 U1794 ( .A(n552), .Y(n653) );
  INVX2 U1795 ( .A(n549), .Y(n635) );
  XNOR2X1 U1796 ( .A(n73), .B(n1638), .Y(product[46]) );
  AND2X2 U1797 ( .A(n72), .B(n1639), .Y(n1638) );
  OR2X1 U1798 ( .A(n290), .B(n291), .Y(n1639) );
  INVX2 U1799 ( .A(n546), .Y(n617) );
  INVX2 U1800 ( .A(n543), .Y(n599) );
  AND2X2 U1801 ( .A(n570), .B(n723), .Y(n1640) );
  INVX2 U1802 ( .A(n540), .Y(n581) );
  XNOR2X1 U1803 ( .A(a[21]), .B(n1735), .Y(n1669) );
  XOR2X1 U1804 ( .A(a[29]), .B(n1738), .Y(n46) );
  INVX4 U1805 ( .A(n888), .Y(n1704) );
  XOR2X1 U1806 ( .A(n1), .B(a[17]), .Y(n1643) );
  AND2X2 U1807 ( .A(n891), .B(n46), .Y(n1644) );
  INVX4 U1808 ( .A(n875), .Y(n1727) );
  BUFX2 U1809 ( .A(n1360), .Y(n1646) );
  INVX8 U1810 ( .A(n1738), .Y(n1648) );
  INVX4 U1811 ( .A(n883), .Y(n1712) );
  INVX2 U1812 ( .A(n383), .Y(n1653) );
  INVX2 U1813 ( .A(n34), .Y(n1693) );
  INVX1 U1814 ( .A(n1642), .Y(n1684) );
  BUFX4 U1815 ( .A(n19), .Y(n1655) );
  OR2X2 U1816 ( .A(n1264), .B(n1536), .Y(n857) );
  OR2X1 U1817 ( .A(n1264), .B(n1731), .Y(n874) );
  BUFX4 U1818 ( .A(n539), .Y(n1657) );
  BUFX4 U1819 ( .A(n539), .Y(n1658) );
  INVX1 U1820 ( .A(n213), .Y(n212) );
  INVX1 U1821 ( .A(n200), .Y(n202) );
  BUFX4 U1822 ( .A(n137), .Y(n1659) );
  INVX8 U1823 ( .A(n1660), .Y(n1661) );
  INVX4 U1824 ( .A(n1735), .Y(n1663) );
  INVX1 U1825 ( .A(n205), .Y(n286) );
  BUFX4 U1826 ( .A(n463), .Y(n1665) );
  INVX1 U1827 ( .A(n1435), .Y(n288) );
  INVX4 U1828 ( .A(n886), .Y(n1708) );
  XOR2X1 U1829 ( .A(n1080), .B(n1663), .Y(n1670) );
  NAND2X1 U1830 ( .A(n416), .B(n1368), .Y(n1672) );
  NAND2X1 U1831 ( .A(n1024), .B(n416), .Y(n1673) );
  NAND2X1 U1832 ( .A(n1368), .B(n1024), .Y(n1674) );
  NAND3X1 U1833 ( .A(n1674), .B(n1672), .C(n1673), .Y(n413) );
  INVX4 U1834 ( .A(n51), .Y(n1700) );
  INVX1 U1835 ( .A(n199), .Y(n201) );
  INVX1 U1836 ( .A(n1239), .Y(n285) );
  OR2X2 U1837 ( .A(n1643), .B(n1677), .Y(n12) );
  XNOR2X1 U1838 ( .A(a[21]), .B(n19), .Y(n1678) );
  INVX1 U1839 ( .A(n171), .Y(n173) );
  INVX1 U1840 ( .A(n172), .Y(n174) );
  INVX4 U1841 ( .A(n30), .Y(n1691) );
  INVX1 U1842 ( .A(n1431), .Y(n281) );
  INVX4 U1843 ( .A(n12), .Y(n1681) );
  INVX1 U1844 ( .A(n53), .Y(n155) );
  INVX1 U1845 ( .A(n52), .Y(n156) );
  INVX8 U1846 ( .A(n1700), .Y(n1701) );
  INVX8 U1847 ( .A(n1702), .Y(n1703) );
  INVX8 U1848 ( .A(n1704), .Y(n1705) );
  INVX8 U1849 ( .A(n1706), .Y(n1707) );
  INVX8 U1850 ( .A(n1712), .Y(n1713) );
  INVX8 U1851 ( .A(n1714), .Y(n1715) );
  INVX8 U1852 ( .A(n1723), .Y(n1724) );
  INVX8 U1853 ( .A(n1727), .Y(n1728) );
  INVX8 U1854 ( .A(n37), .Y(n1738) );
  INVX2 U1855 ( .A(n94), .Y(n92) );
  INVX2 U1856 ( .A(n79), .Y(n77) );
  OAI22X1 U1857 ( .A(n1651), .B(n1731), .C(n1359), .D(n1731), .Y(n561) );
  OAI22X1 U1858 ( .A(n1680), .B(n1536), .C(n1682), .D(n1536), .Y(n558) );
  OAI22X1 U1859 ( .A(n1095), .B(n1545), .C(n1526), .D(n1545), .Y(n555) );
  OAI22X1 U1860 ( .A(n1525), .B(n1375), .C(n1650), .D(n1375), .Y(n552) );
  OAI22X1 U1861 ( .A(n1690), .B(n1339), .C(n1018), .D(n1339), .Y(n549) );
  OAI22X1 U1862 ( .A(n1265), .B(n1364), .C(n1358), .D(n1364), .Y(n546) );
  OAI22X1 U1863 ( .A(n1696), .B(n1376), .C(n1120), .D(n1376), .Y(n543) );
  OAI22X1 U1864 ( .A(n1699), .B(n1668), .C(n1341), .D(n1668), .Y(n540) );
  INVX2 U1865 ( .A(n317), .Y(n318) );
  INVX2 U1866 ( .A(n303), .Y(n304) );
  INVX2 U1867 ( .A(n293), .Y(n294) );
  INVX2 U1868 ( .A(n93), .Y(n91) );
  INVX2 U1869 ( .A(n84), .Y(n273) );
  INVX2 U1870 ( .A(n262), .Y(n261) );
  INVX2 U1871 ( .A(n149), .Y(n151) );
  INVX2 U1872 ( .A(n144), .Y(n142) );
  INVX2 U1873 ( .A(n129), .Y(n127) );
  INVX2 U1874 ( .A(n122), .Y(n120) );
  INVX2 U1875 ( .A(n111), .Y(n109) );
  INVX2 U1876 ( .A(n105), .Y(n103) );
  INVX2 U1877 ( .A(n104), .Y(n102) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n38, n39, n40, n41, n42, n43, n44, n45, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n103, n104, n105, n106, n107, n108, n111, n112, n113,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n132, n133, n134, n135, n136, n138,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n150, n151,
         n211;

  XOR2X1 U2 ( .A(n21), .B(n1), .Y(SUM[16]) );
  OAI21X1 U3 ( .A(n21), .B(n19), .C(n20), .Y(n18) );
  NAND2X1 U4 ( .A(n20), .B(n133), .Y(n1) );
  NOR2X1 U6 ( .A(n150), .B(n151), .Y(n19) );
  NAND2X1 U7 ( .A(n150), .B(n151), .Y(n20) );
  XNOR2X1 U8 ( .A(n30), .B(n2), .Y(SUM[15]) );
  AOI21X1 U9 ( .A(n90), .B(n22), .C(n23), .Y(n21) );
  NOR2X1 U10 ( .A(n24), .B(n58), .Y(n22) );
  OAI21X1 U11 ( .A(n24), .B(n59), .C(n25), .Y(n23) );
  NAND2X1 U12 ( .A(n26), .B(n42), .Y(n24) );
  AOI21X1 U13 ( .A(n43), .B(n26), .C(n27), .Y(n25) );
  NOR2X1 U14 ( .A(n28), .B(n35), .Y(n26) );
  OAI21X1 U15 ( .A(n28), .B(n38), .C(n29), .Y(n27) );
  NAND2X1 U16 ( .A(n29), .B(n134), .Y(n2) );
  NOR2X1 U18 ( .A(A[15]), .B(B[15]), .Y(n28) );
  NAND2X1 U19 ( .A(A[15]), .B(B[15]), .Y(n29) );
  XNOR2X1 U20 ( .A(n39), .B(n3), .Y(SUM[14]) );
  OAI21X1 U21 ( .A(n31), .B(n89), .C(n32), .Y(n30) );
  NAND2X1 U22 ( .A(n60), .B(n33), .Y(n31) );
  AOI21X1 U23 ( .A(n61), .B(n33), .C(n34), .Y(n32) );
  NOR2X1 U24 ( .A(n35), .B(n44), .Y(n33) );
  OAI21X1 U25 ( .A(n45), .B(n35), .C(n38), .Y(n34) );
  NAND2X1 U28 ( .A(n38), .B(n135), .Y(n3) );
  NOR2X1 U30 ( .A(A[14]), .B(B[14]), .Y(n35) );
  NAND2X1 U31 ( .A(A[14]), .B(B[14]), .Y(n38) );
  XNOR2X1 U32 ( .A(n50), .B(n4), .Y(SUM[13]) );
  OAI21X1 U33 ( .A(n89), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U34 ( .A(n42), .B(n60), .Y(n40) );
  AOI21X1 U35 ( .A(n42), .B(n61), .C(n43), .Y(n41) );
  NOR2X1 U40 ( .A(n48), .B(n55), .Y(n42) );
  OAI21X1 U41 ( .A(n48), .B(n56), .C(n49), .Y(n43) );
  NAND2X1 U42 ( .A(n49), .B(n136), .Y(n4) );
  NOR2X1 U44 ( .A(A[13]), .B(B[13]), .Y(n48) );
  NAND2X1 U45 ( .A(A[13]), .B(B[13]), .Y(n49) );
  XNOR2X1 U46 ( .A(n57), .B(n5), .Y(SUM[12]) );
  OAI21X1 U47 ( .A(n89), .B(n51), .C(n52), .Y(n50) );
  NAND2X1 U48 ( .A(n53), .B(n60), .Y(n51) );
  AOI21X1 U49 ( .A(n53), .B(n61), .C(n54), .Y(n52) );
  NAND2X1 U52 ( .A(n56), .B(n53), .Y(n5) );
  NOR2X1 U54 ( .A(A[12]), .B(B[12]), .Y(n55) );
  NAND2X1 U55 ( .A(A[12]), .B(B[12]), .Y(n56) );
  XNOR2X1 U56 ( .A(n68), .B(n6), .Y(SUM[11]) );
  OAI21X1 U57 ( .A(n89), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U62 ( .A(n64), .B(n78), .Y(n58) );
  AOI21X1 U63 ( .A(n79), .B(n64), .C(n65), .Y(n59) );
  NOR2X1 U64 ( .A(n66), .B(n73), .Y(n64) );
  OAI21X1 U65 ( .A(n66), .B(n74), .C(n67), .Y(n65) );
  NAND2X1 U66 ( .A(n67), .B(n138), .Y(n6) );
  NOR2X1 U68 ( .A(A[11]), .B(B[11]), .Y(n66) );
  NAND2X1 U69 ( .A(A[11]), .B(B[11]), .Y(n67) );
  XNOR2X1 U70 ( .A(n75), .B(n7), .Y(SUM[10]) );
  OAI21X1 U71 ( .A(n89), .B(n69), .C(n70), .Y(n68) );
  NAND2X1 U72 ( .A(n71), .B(n78), .Y(n69) );
  AOI21X1 U73 ( .A(n71), .B(n79), .C(n72), .Y(n70) );
  NAND2X1 U76 ( .A(n74), .B(n71), .Y(n7) );
  NOR2X1 U78 ( .A(A[10]), .B(B[10]), .Y(n73) );
  NAND2X1 U79 ( .A(A[10]), .B(B[10]), .Y(n74) );
  XNOR2X1 U80 ( .A(n86), .B(n8), .Y(SUM[9]) );
  OAI21X1 U81 ( .A(n89), .B(n76), .C(n77), .Y(n75) );
  NOR2X1 U88 ( .A(n84), .B(n87), .Y(n78) );
  OAI21X1 U89 ( .A(n84), .B(n88), .C(n85), .Y(n79) );
  NAND2X1 U90 ( .A(n85), .B(n140), .Y(n8) );
  NOR2X1 U92 ( .A(A[9]), .B(B[9]), .Y(n84) );
  NAND2X1 U93 ( .A(A[9]), .B(B[9]), .Y(n85) );
  XOR2X1 U94 ( .A(n89), .B(n9), .Y(SUM[8]) );
  OAI21X1 U95 ( .A(n89), .B(n87), .C(n88), .Y(n86) );
  NAND2X1 U96 ( .A(n88), .B(n141), .Y(n9) );
  NOR2X1 U98 ( .A(A[8]), .B(B[8]), .Y(n87) );
  NAND2X1 U99 ( .A(A[8]), .B(B[8]), .Y(n88) );
  XOR2X1 U100 ( .A(n97), .B(n10), .Y(SUM[7]) );
  OAI21X1 U102 ( .A(n91), .B(n119), .C(n92), .Y(n90) );
  NAND2X1 U103 ( .A(n93), .B(n105), .Y(n91) );
  AOI21X1 U104 ( .A(n106), .B(n93), .C(n94), .Y(n92) );
  NOR2X1 U105 ( .A(n95), .B(n100), .Y(n93) );
  OAI21X1 U106 ( .A(n95), .B(n103), .C(n96), .Y(n94) );
  NAND2X1 U107 ( .A(n96), .B(n142), .Y(n10) );
  NOR2X1 U109 ( .A(A[7]), .B(B[7]), .Y(n95) );
  NAND2X1 U110 ( .A(A[7]), .B(B[7]), .Y(n96) );
  XOR2X1 U111 ( .A(n104), .B(n11), .Y(SUM[6]) );
  AOI21X1 U112 ( .A(n118), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U113 ( .A(n100), .B(n107), .Y(n98) );
  OAI21X1 U114 ( .A(n108), .B(n100), .C(n103), .Y(n99) );
  NAND2X1 U117 ( .A(n103), .B(n143), .Y(n11) );
  NOR2X1 U119 ( .A(A[6]), .B(B[6]), .Y(n100) );
  NAND2X1 U120 ( .A(A[6]), .B(B[6]), .Y(n103) );
  XOR2X1 U121 ( .A(n113), .B(n12), .Y(SUM[5]) );
  AOI21X1 U122 ( .A(n105), .B(n118), .C(n106), .Y(n104) );
  NOR2X1 U127 ( .A(n111), .B(n116), .Y(n105) );
  OAI21X1 U128 ( .A(n111), .B(n117), .C(n112), .Y(n106) );
  NAND2X1 U129 ( .A(n112), .B(n144), .Y(n12) );
  NOR2X1 U131 ( .A(A[5]), .B(B[5]), .Y(n111) );
  NAND2X1 U132 ( .A(A[5]), .B(B[5]), .Y(n112) );
  XNOR2X1 U133 ( .A(n118), .B(n13), .Y(SUM[4]) );
  AOI21X1 U134 ( .A(n145), .B(n118), .C(n115), .Y(n113) );
  NAND2X1 U137 ( .A(n117), .B(n145), .Y(n13) );
  NOR2X1 U139 ( .A(A[4]), .B(B[4]), .Y(n116) );
  NAND2X1 U140 ( .A(A[4]), .B(B[4]), .Y(n117) );
  XNOR2X1 U141 ( .A(n124), .B(n14), .Y(SUM[3]) );
  AOI21X1 U143 ( .A(n128), .B(n120), .C(n121), .Y(n119) );
  NOR2X1 U144 ( .A(n122), .B(n125), .Y(n120) );
  OAI21X1 U145 ( .A(n122), .B(n126), .C(n123), .Y(n121) );
  NAND2X1 U146 ( .A(n123), .B(n146), .Y(n14) );
  NOR2X1 U148 ( .A(A[3]), .B(B[3]), .Y(n122) );
  NAND2X1 U149 ( .A(A[3]), .B(B[3]), .Y(n123) );
  XOR2X1 U150 ( .A(n127), .B(n15), .Y(SUM[2]) );
  OAI21X1 U151 ( .A(n127), .B(n125), .C(n126), .Y(n124) );
  NAND2X1 U152 ( .A(n126), .B(n147), .Y(n15) );
  NOR2X1 U154 ( .A(A[2]), .B(B[2]), .Y(n125) );
  NAND2X1 U155 ( .A(A[2]), .B(B[2]), .Y(n126) );
  XOR2X1 U156 ( .A(n16), .B(n132), .Y(SUM[1]) );
  OAI21X1 U158 ( .A(n129), .B(n132), .C(n130), .Y(n128) );
  NAND2X1 U159 ( .A(n130), .B(n148), .Y(n16) );
  NOR2X1 U161 ( .A(A[1]), .B(B[1]), .Y(n129) );
  NAND2X1 U162 ( .A(A[1]), .B(B[1]), .Y(n130) );
  NAND2X1 U167 ( .A(A[0]), .B(B[0]), .Y(n132) );
  AND2X1 U173 ( .A(n132), .B(n211), .Y(SUM[0]) );
  OR2X1 U174 ( .A(A[0]), .B(B[0]), .Y(n211) );
  INVX2 U175 ( .A(n90), .Y(n89) );
  INVX2 U176 ( .A(n79), .Y(n77) );
  INVX2 U177 ( .A(n78), .Y(n76) );
  INVX2 U178 ( .A(n74), .Y(n72) );
  INVX2 U179 ( .A(n59), .Y(n61) );
  INVX2 U180 ( .A(n58), .Y(n60) );
  INVX2 U181 ( .A(n56), .Y(n54) );
  INVX2 U182 ( .A(n43), .Y(n45) );
  INVX2 U183 ( .A(n42), .Y(n44) );
  INVX2 U184 ( .A(A[17]), .Y(n151) );
  INVX2 U185 ( .A(B[17]), .Y(n150) );
  INVX2 U186 ( .A(n129), .Y(n148) );
  INVX2 U187 ( .A(n125), .Y(n147) );
  INVX2 U188 ( .A(n122), .Y(n146) );
  INVX2 U189 ( .A(n111), .Y(n144) );
  INVX2 U190 ( .A(n100), .Y(n143) );
  INVX2 U191 ( .A(n95), .Y(n142) );
  INVX2 U192 ( .A(n87), .Y(n141) );
  INVX2 U193 ( .A(n84), .Y(n140) );
  INVX2 U194 ( .A(n73), .Y(n71) );
  INVX2 U195 ( .A(n66), .Y(n138) );
  INVX2 U196 ( .A(n55), .Y(n53) );
  INVX2 U197 ( .A(n48), .Y(n136) );
  INVX2 U198 ( .A(n35), .Y(n135) );
  INVX2 U199 ( .A(n28), .Y(n134) );
  INVX2 U200 ( .A(n19), .Y(n133) );
  INVX2 U201 ( .A(n128), .Y(n127) );
  INVX2 U202 ( .A(n119), .Y(n118) );
  INVX2 U203 ( .A(n117), .Y(n115) );
  INVX2 U204 ( .A(n116), .Y(n145) );
  INVX2 U205 ( .A(n106), .Y(n108) );
  INVX2 U206 ( .A(n105), .Y(n107) );
  INVX2 U207 ( .A(n18), .Y(SUM[17]) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n37, n38, n39, n40, n41, n42, n43, n44, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n102, n103, n104, n105, n106, n107, n110, n111, n112,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n136,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n163, n222;

  XOR2X1 U2 ( .A(n20), .B(n1), .Y(DIFF[16]) );
  OAI21X1 U3 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U4 ( .A(n19), .B(n131), .Y(n1) );
  NOR2X1 U6 ( .A(n163), .B(B[16]), .Y(n18) );
  NAND2X1 U7 ( .A(n163), .B(B[16]), .Y(n19) );
  XNOR2X1 U8 ( .A(n29), .B(n2), .Y(DIFF[15]) );
  AOI21X1 U9 ( .A(n89), .B(n21), .C(n22), .Y(n20) );
  NOR2X1 U10 ( .A(n23), .B(n57), .Y(n21) );
  OAI21X1 U11 ( .A(n23), .B(n58), .C(n24), .Y(n22) );
  NAND2X1 U12 ( .A(n25), .B(n41), .Y(n23) );
  AOI21X1 U13 ( .A(n42), .B(n25), .C(n26), .Y(n24) );
  NOR2X1 U14 ( .A(n27), .B(n34), .Y(n25) );
  OAI21X1 U15 ( .A(n27), .B(n37), .C(n28), .Y(n26) );
  NAND2X1 U16 ( .A(n28), .B(n132), .Y(n2) );
  NOR2X1 U18 ( .A(A[15]), .B(n147), .Y(n27) );
  NAND2X1 U19 ( .A(A[15]), .B(n147), .Y(n28) );
  XNOR2X1 U20 ( .A(n38), .B(n3), .Y(DIFF[14]) );
  OAI21X1 U21 ( .A(n30), .B(n88), .C(n31), .Y(n29) );
  NAND2X1 U22 ( .A(n59), .B(n32), .Y(n30) );
  AOI21X1 U23 ( .A(n60), .B(n32), .C(n33), .Y(n31) );
  NOR2X1 U24 ( .A(n34), .B(n43), .Y(n32) );
  OAI21X1 U25 ( .A(n44), .B(n34), .C(n37), .Y(n33) );
  NAND2X1 U28 ( .A(n37), .B(n133), .Y(n3) );
  NOR2X1 U30 ( .A(A[14]), .B(n148), .Y(n34) );
  NAND2X1 U31 ( .A(A[14]), .B(n148), .Y(n37) );
  XNOR2X1 U32 ( .A(n49), .B(n4), .Y(DIFF[13]) );
  OAI21X1 U33 ( .A(n88), .B(n39), .C(n40), .Y(n38) );
  NAND2X1 U34 ( .A(n41), .B(n59), .Y(n39) );
  AOI21X1 U35 ( .A(n41), .B(n60), .C(n42), .Y(n40) );
  NOR2X1 U40 ( .A(n47), .B(n54), .Y(n41) );
  OAI21X1 U41 ( .A(n47), .B(n55), .C(n48), .Y(n42) );
  NAND2X1 U42 ( .A(n48), .B(n134), .Y(n4) );
  NOR2X1 U44 ( .A(A[13]), .B(n149), .Y(n47) );
  NAND2X1 U45 ( .A(A[13]), .B(n149), .Y(n48) );
  XNOR2X1 U46 ( .A(n56), .B(n5), .Y(DIFF[12]) );
  OAI21X1 U47 ( .A(n88), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U48 ( .A(n52), .B(n59), .Y(n50) );
  AOI21X1 U49 ( .A(n52), .B(n60), .C(n53), .Y(n51) );
  NAND2X1 U52 ( .A(n55), .B(n52), .Y(n5) );
  NOR2X1 U54 ( .A(A[12]), .B(n150), .Y(n54) );
  NAND2X1 U55 ( .A(A[12]), .B(n150), .Y(n55) );
  XNOR2X1 U56 ( .A(n67), .B(n6), .Y(DIFF[11]) );
  OAI21X1 U57 ( .A(n88), .B(n57), .C(n58), .Y(n56) );
  NAND2X1 U62 ( .A(n63), .B(n77), .Y(n57) );
  AOI21X1 U63 ( .A(n78), .B(n63), .C(n64), .Y(n58) );
  NOR2X1 U64 ( .A(n65), .B(n72), .Y(n63) );
  OAI21X1 U65 ( .A(n65), .B(n73), .C(n66), .Y(n64) );
  NAND2X1 U66 ( .A(n66), .B(n136), .Y(n6) );
  NOR2X1 U68 ( .A(A[11]), .B(n151), .Y(n65) );
  NAND2X1 U69 ( .A(A[11]), .B(n151), .Y(n66) );
  XNOR2X1 U70 ( .A(n74), .B(n7), .Y(DIFF[10]) );
  OAI21X1 U71 ( .A(n88), .B(n68), .C(n69), .Y(n67) );
  NAND2X1 U72 ( .A(n70), .B(n77), .Y(n68) );
  AOI21X1 U73 ( .A(n70), .B(n78), .C(n71), .Y(n69) );
  NAND2X1 U76 ( .A(n73), .B(n70), .Y(n7) );
  NOR2X1 U78 ( .A(A[10]), .B(n152), .Y(n72) );
  NAND2X1 U79 ( .A(A[10]), .B(n152), .Y(n73) );
  XNOR2X1 U80 ( .A(n85), .B(n8), .Y(DIFF[9]) );
  OAI21X1 U81 ( .A(n88), .B(n75), .C(n76), .Y(n74) );
  NOR2X1 U88 ( .A(n83), .B(n86), .Y(n77) );
  OAI21X1 U89 ( .A(n83), .B(n87), .C(n84), .Y(n78) );
  NAND2X1 U90 ( .A(n84), .B(n138), .Y(n8) );
  NOR2X1 U92 ( .A(A[9]), .B(n153), .Y(n83) );
  NAND2X1 U93 ( .A(A[9]), .B(n153), .Y(n84) );
  XOR2X1 U94 ( .A(n88), .B(n9), .Y(DIFF[8]) );
  OAI21X1 U95 ( .A(n88), .B(n86), .C(n87), .Y(n85) );
  NAND2X1 U96 ( .A(n87), .B(n139), .Y(n9) );
  NOR2X1 U98 ( .A(A[8]), .B(n154), .Y(n86) );
  NAND2X1 U99 ( .A(A[8]), .B(n154), .Y(n87) );
  XOR2X1 U100 ( .A(n96), .B(n10), .Y(DIFF[7]) );
  OAI21X1 U102 ( .A(n90), .B(n118), .C(n91), .Y(n89) );
  NAND2X1 U103 ( .A(n92), .B(n104), .Y(n90) );
  AOI21X1 U104 ( .A(n105), .B(n92), .C(n93), .Y(n91) );
  NOR2X1 U105 ( .A(n94), .B(n99), .Y(n92) );
  OAI21X1 U106 ( .A(n94), .B(n102), .C(n95), .Y(n93) );
  NAND2X1 U107 ( .A(n95), .B(n140), .Y(n10) );
  NOR2X1 U109 ( .A(A[7]), .B(n155), .Y(n94) );
  NAND2X1 U110 ( .A(A[7]), .B(n155), .Y(n95) );
  XOR2X1 U111 ( .A(n103), .B(n11), .Y(DIFF[6]) );
  AOI21X1 U112 ( .A(n117), .B(n97), .C(n98), .Y(n96) );
  NOR2X1 U113 ( .A(n99), .B(n106), .Y(n97) );
  OAI21X1 U114 ( .A(n107), .B(n99), .C(n102), .Y(n98) );
  NAND2X1 U117 ( .A(n102), .B(n141), .Y(n11) );
  NOR2X1 U119 ( .A(A[6]), .B(n156), .Y(n99) );
  NAND2X1 U120 ( .A(A[6]), .B(n156), .Y(n102) );
  XOR2X1 U121 ( .A(n112), .B(n12), .Y(DIFF[5]) );
  AOI21X1 U122 ( .A(n104), .B(n117), .C(n105), .Y(n103) );
  NOR2X1 U127 ( .A(n110), .B(n115), .Y(n104) );
  OAI21X1 U128 ( .A(n110), .B(n116), .C(n111), .Y(n105) );
  NAND2X1 U129 ( .A(n111), .B(n142), .Y(n12) );
  NOR2X1 U131 ( .A(A[5]), .B(n157), .Y(n110) );
  NAND2X1 U132 ( .A(A[5]), .B(n157), .Y(n111) );
  XNOR2X1 U133 ( .A(n117), .B(n13), .Y(DIFF[4]) );
  AOI21X1 U134 ( .A(n143), .B(n117), .C(n114), .Y(n112) );
  NAND2X1 U137 ( .A(n116), .B(n143), .Y(n13) );
  NOR2X1 U139 ( .A(A[4]), .B(n158), .Y(n115) );
  NAND2X1 U140 ( .A(A[4]), .B(n158), .Y(n116) );
  XNOR2X1 U141 ( .A(n123), .B(n14), .Y(DIFF[3]) );
  AOI21X1 U143 ( .A(n127), .B(n119), .C(n120), .Y(n118) );
  NOR2X1 U144 ( .A(n121), .B(n124), .Y(n119) );
  OAI21X1 U145 ( .A(n121), .B(n125), .C(n122), .Y(n120) );
  NAND2X1 U146 ( .A(n122), .B(n144), .Y(n14) );
  NOR2X1 U148 ( .A(A[3]), .B(n159), .Y(n121) );
  NAND2X1 U149 ( .A(A[3]), .B(n159), .Y(n122) );
  XOR2X1 U150 ( .A(n126), .B(n15), .Y(DIFF[2]) );
  OAI21X1 U151 ( .A(n126), .B(n124), .C(n125), .Y(n123) );
  NAND2X1 U152 ( .A(n125), .B(n145), .Y(n15) );
  NOR2X1 U154 ( .A(A[2]), .B(n160), .Y(n124) );
  NAND2X1 U155 ( .A(A[2]), .B(n160), .Y(n125) );
  XOR2X1 U156 ( .A(n16), .B(n130), .Y(DIFF[1]) );
  OAI21X1 U158 ( .A(n128), .B(n130), .C(n129), .Y(n127) );
  NAND2X1 U159 ( .A(n129), .B(n146), .Y(n16) );
  NOR2X1 U161 ( .A(A[1]), .B(n161), .Y(n128) );
  NAND2X1 U162 ( .A(A[1]), .B(n161), .Y(n129) );
  XNOR2X1 U163 ( .A(n222), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U164 ( .A(A[0]), .B(n222), .Y(n130) );
  INVX1 U185 ( .A(B[2]), .Y(n160) );
  INVX1 U186 ( .A(B[0]), .Y(n222) );
  INVX1 U187 ( .A(B[1]), .Y(n161) );
  INVX1 U188 ( .A(B[10]), .Y(n152) );
  INVX1 U189 ( .A(B[13]), .Y(n149) );
  INVX1 U190 ( .A(B[9]), .Y(n153) );
  INVX1 U191 ( .A(B[3]), .Y(n159) );
  INVX1 U192 ( .A(B[14]), .Y(n148) );
  INVX1 U193 ( .A(B[7]), .Y(n155) );
  INVX1 U194 ( .A(B[11]), .Y(n151) );
  INVX1 U195 ( .A(B[15]), .Y(n147) );
  INVX1 U196 ( .A(B[12]), .Y(n150) );
  INVX1 U197 ( .A(B[8]), .Y(n154) );
  INVX1 U198 ( .A(B[5]), .Y(n157) );
  INVX1 U199 ( .A(B[4]), .Y(n158) );
  INVX1 U200 ( .A(B[6]), .Y(n156) );
  INVX2 U201 ( .A(n89), .Y(n88) );
  INVX2 U202 ( .A(n78), .Y(n76) );
  INVX2 U203 ( .A(n77), .Y(n75) );
  INVX2 U204 ( .A(n73), .Y(n71) );
  INVX2 U205 ( .A(n58), .Y(n60) );
  INVX2 U206 ( .A(n57), .Y(n59) );
  INVX2 U207 ( .A(n55), .Y(n53) );
  INVX2 U208 ( .A(n42), .Y(n44) );
  INVX2 U209 ( .A(n41), .Y(n43) );
  INVX2 U210 ( .A(A[17]), .Y(n163) );
  INVX2 U211 ( .A(n128), .Y(n146) );
  INVX2 U212 ( .A(n124), .Y(n145) );
  INVX2 U213 ( .A(n121), .Y(n144) );
  INVX2 U214 ( .A(n110), .Y(n142) );
  INVX2 U215 ( .A(n99), .Y(n141) );
  INVX2 U216 ( .A(n94), .Y(n140) );
  INVX2 U217 ( .A(n86), .Y(n139) );
  INVX2 U218 ( .A(n83), .Y(n138) );
  INVX2 U219 ( .A(n72), .Y(n70) );
  INVX2 U220 ( .A(n65), .Y(n136) );
  INVX2 U221 ( .A(n54), .Y(n52) );
  INVX2 U222 ( .A(n47), .Y(n134) );
  INVX2 U223 ( .A(n34), .Y(n133) );
  INVX2 U224 ( .A(n27), .Y(n132) );
  INVX2 U225 ( .A(n18), .Y(n131) );
  INVX2 U226 ( .A(n127), .Y(n126) );
  INVX2 U227 ( .A(n118), .Y(n117) );
  INVX2 U228 ( .A(n116), .Y(n114) );
  INVX2 U229 ( .A(n115), .Y(n143) );
  INVX2 U230 ( .A(n105), .Y(n107) );
  INVX2 U231 ( .A(n104), .Y(n106) );
  INVX2 U232 ( .A(n17), .Y(DIFF[17]) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW_mult_uns_1 mult_35 ( .a({src1_data[15:2], n20, src1_data[0], 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .b({src2_data[15:1], n52}), .product({N26, 
        full_mult[45:30], SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n42, n1, n33, n3, 
        n55, n19, n50, n32, n48, n2, n37, n41, n47, n36, n30, n29}), .B({
        src2_data[16], src2_data[16], n10, n44, n24, n40, n14, n46, n31, n22, 
        n18, n8, n35, n16, n43, n38, n12, n25}), .CI(1'b0), .SUM(large_sum) );
  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n42, n1, n33, n3, 
        n55, n19, n50, n32, n48, n2, n37, n41, n47, n36, n30, n29}), .B({
        src2_data[16], src2_data[16], n10, n44, n24, n40, n14, n46, n31, n22, 
        n18, n8, n35, n16, n43, n38, n12, n25}), .CI(1'b0), .DIFF(large_dif)
         );
  BUFX2 U3 ( .A(src1_data[14]), .Y(n1) );
  BUFX2 U4 ( .A(src1_data[6]), .Y(n2) );
  BUFX2 U6 ( .A(src1_data[12]), .Y(n3) );
  BUFX2 U7 ( .A(n2), .Y(n4) );
  BUFX2 U9 ( .A(n3), .Y(n5) );
  INVX2 U10 ( .A(n26), .Y(n29) );
  INVX2 U11 ( .A(n15), .Y(n16) );
  INVX2 U12 ( .A(n13), .Y(n14) );
  INVX2 U13 ( .A(n21), .Y(n22) );
  INVX2 U14 ( .A(n11), .Y(n12) );
  INVX2 U15 ( .A(n17), .Y(n18) );
  INVX2 U16 ( .A(n23), .Y(n24) );
  INVX2 U17 ( .A(n7), .Y(n8) );
  INVX2 U18 ( .A(n34), .Y(n35) );
  INVX2 U19 ( .A(n9), .Y(n10) );
  AND2X2 U20 ( .A(alu_op[1]), .B(n61), .Y(n6) );
  INVX1 U21 ( .A(src2_data[6]), .Y(n7) );
  INVX1 U22 ( .A(src2_data[15]), .Y(n9) );
  INVX1 U23 ( .A(src2_data[1]), .Y(n11) );
  INVX1 U24 ( .A(src2_data[11]), .Y(n13) );
  INVX1 U25 ( .A(src2_data[4]), .Y(n15) );
  INVX1 U26 ( .A(src2_data[7]), .Y(n17) );
  BUFX2 U27 ( .A(src1_data[10]), .Y(n19) );
  BUFX4 U28 ( .A(src1_data[1]), .Y(n20) );
  INVX1 U29 ( .A(src2_data[8]), .Y(n21) );
  INVX1 U30 ( .A(src2_data[13]), .Y(n23) );
  BUFX2 U31 ( .A(n52), .Y(n25) );
  BUFX2 U32 ( .A(src1_data[3]), .Y(n47) );
  INVX1 U33 ( .A(src1_data[0]), .Y(n26) );
  BUFX2 U34 ( .A(n20), .Y(n30) );
  BUFX2 U35 ( .A(src2_data[9]), .Y(n31) );
  BUFX2 U36 ( .A(src1_data[8]), .Y(n32) );
  BUFX2 U37 ( .A(src1_data[13]), .Y(n33) );
  INVX1 U38 ( .A(src2_data[5]), .Y(n34) );
  BUFX2 U39 ( .A(src1_data[2]), .Y(n36) );
  INVX2 U40 ( .A(n54), .Y(n37) );
  BUFX2 U41 ( .A(src2_data[2]), .Y(n38) );
  INVX1 U42 ( .A(src2_data[12]), .Y(n39) );
  INVX2 U43 ( .A(n39), .Y(n40) );
  BUFX2 U44 ( .A(src1_data[4]), .Y(n41) );
  BUFX2 U45 ( .A(src1_data[15]), .Y(n42) );
  BUFX2 U46 ( .A(src2_data[3]), .Y(n43) );
  BUFX2 U47 ( .A(src2_data[14]), .Y(n44) );
  INVX1 U48 ( .A(src2_data[10]), .Y(n45) );
  INVX2 U49 ( .A(n45), .Y(n46) );
  BUFX2 U50 ( .A(src1_data[7]), .Y(n48) );
  INVX1 U51 ( .A(large_sum[16]), .Y(n123) );
  AND2X2 U52 ( .A(alu_op[0]), .B(n62), .Y(n49) );
  INVX2 U53 ( .A(n56), .Y(n55) );
  INVX1 U54 ( .A(src1_data[5]), .Y(n54) );
  INVX1 U55 ( .A(src1_data[11]), .Y(n56) );
  INVX4 U56 ( .A(src2_data[0]), .Y(n53) );
  BUFX2 U57 ( .A(src1_data[9]), .Y(n50) );
  INVX8 U58 ( .A(n49), .Y(n51) );
  INVX4 U59 ( .A(n74), .Y(n121) );
  INVX4 U60 ( .A(n79), .Y(n119) );
  INVX8 U61 ( .A(n53), .Y(n52) );
  NAND2X1 U62 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n79) );
  INVX2 U63 ( .A(N26), .Y(n60) );
  INVX2 U64 ( .A(alu_op[0]), .Y(n61) );
  XOR2X1 U65 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n58) );
  INVX2 U66 ( .A(alu_op[1]), .Y(n62) );
  INVX2 U67 ( .A(n51), .Y(n76) );
  XOR2X1 U68 ( .A(large_sum[17]), .B(large_sum[16]), .Y(n57) );
  AOI22X1 U69 ( .A(n6), .B(n58), .C(n76), .D(n57), .Y(n59) );
  OAI21X1 U70 ( .A(n79), .B(n60), .C(n59), .Y(overflow) );
  NAND2X1 U71 ( .A(n62), .B(n61), .Y(n74) );
  AOI22X1 U72 ( .A(n29), .B(n121), .C(full_mult[30]), .D(n119), .Y(n64) );
  AOI22X1 U73 ( .A(large_dif[0]), .B(n6), .C(large_sum[0]), .D(n76), .Y(n63)
         );
  NAND2X1 U74 ( .A(n63), .B(n64), .Y(result[0]) );
  AOI22X1 U75 ( .A(n30), .B(n121), .C(full_mult[31]), .D(n119), .Y(n66) );
  AOI22X1 U76 ( .A(large_dif[1]), .B(n6), .C(large_sum[1]), .D(n76), .Y(n65)
         );
  NAND2X1 U77 ( .A(n65), .B(n66), .Y(result[1]) );
  AOI22X1 U78 ( .A(n36), .B(n121), .C(full_mult[32]), .D(n119), .Y(n68) );
  AOI22X1 U79 ( .A(large_dif[2]), .B(n6), .C(large_sum[2]), .D(n76), .Y(n67)
         );
  NAND2X1 U80 ( .A(n67), .B(n68), .Y(result[2]) );
  AOI22X1 U81 ( .A(n47), .B(n121), .C(full_mult[33]), .D(n119), .Y(n70) );
  AOI22X1 U82 ( .A(large_dif[3]), .B(n6), .C(large_sum[3]), .D(n76), .Y(n69)
         );
  NAND2X1 U83 ( .A(n69), .B(n70), .Y(result[3]) );
  AOI22X1 U84 ( .A(n41), .B(n121), .C(full_mult[34]), .D(n119), .Y(n72) );
  AOI22X1 U85 ( .A(large_dif[4]), .B(n6), .C(large_sum[4]), .D(n76), .Y(n71)
         );
  NAND2X1 U86 ( .A(n71), .B(n72), .Y(result[4]) );
  INVX2 U87 ( .A(full_mult[35]), .Y(n78) );
  NAND2X1 U88 ( .A(large_dif[5]), .B(n6), .Y(n73) );
  OAI21X1 U89 ( .A(n74), .B(n54), .C(n73), .Y(n75) );
  AOI21X1 U90 ( .A(large_sum[5]), .B(n76), .C(n75), .Y(n77) );
  OAI21X1 U91 ( .A(n79), .B(n78), .C(n77), .Y(result[5]) );
  INVX2 U92 ( .A(large_sum[6]), .Y(n81) );
  AOI22X1 U93 ( .A(n4), .B(n121), .C(large_dif[6]), .D(n6), .Y(n80) );
  OAI21X1 U94 ( .A(n51), .B(n81), .C(n80), .Y(n82) );
  OAI22X1 U95 ( .A(n119), .B(n82), .C(n82), .D(full_mult[36]), .Y(n83) );
  INVX2 U96 ( .A(n83), .Y(result[6]) );
  INVX2 U97 ( .A(large_sum[7]), .Y(n85) );
  AOI22X1 U98 ( .A(n48), .B(n121), .C(large_dif[7]), .D(n6), .Y(n84) );
  OAI21X1 U99 ( .A(n51), .B(n85), .C(n84), .Y(n86) );
  OAI22X1 U100 ( .A(n119), .B(n86), .C(n86), .D(full_mult[37]), .Y(n87) );
  INVX2 U101 ( .A(n87), .Y(result[7]) );
  INVX2 U102 ( .A(large_sum[8]), .Y(n89) );
  AOI22X1 U103 ( .A(n32), .B(n121), .C(large_dif[8]), .D(n6), .Y(n88) );
  OAI21X1 U104 ( .A(n51), .B(n89), .C(n88), .Y(n90) );
  OAI22X1 U105 ( .A(n119), .B(n90), .C(n90), .D(full_mult[38]), .Y(n91) );
  INVX2 U106 ( .A(n91), .Y(result[8]) );
  INVX2 U107 ( .A(large_sum[9]), .Y(n93) );
  AOI22X1 U108 ( .A(n50), .B(n121), .C(large_dif[9]), .D(n6), .Y(n92) );
  OAI21X1 U109 ( .A(n51), .B(n93), .C(n92), .Y(n94) );
  OAI22X1 U110 ( .A(n119), .B(n94), .C(n94), .D(full_mult[39]), .Y(n95) );
  INVX2 U111 ( .A(n95), .Y(result[9]) );
  INVX2 U112 ( .A(large_sum[10]), .Y(n97) );
  AOI22X1 U113 ( .A(n19), .B(n121), .C(large_dif[10]), .D(n6), .Y(n96) );
  OAI21X1 U114 ( .A(n51), .B(n97), .C(n96), .Y(n98) );
  OAI22X1 U115 ( .A(n119), .B(n98), .C(n98), .D(full_mult[40]), .Y(n99) );
  INVX2 U116 ( .A(n99), .Y(result[10]) );
  INVX2 U117 ( .A(large_sum[11]), .Y(n101) );
  AOI22X1 U118 ( .A(n55), .B(n121), .C(large_dif[11]), .D(n6), .Y(n100) );
  OAI21X1 U119 ( .A(n51), .B(n101), .C(n100), .Y(n102) );
  OAI22X1 U120 ( .A(n119), .B(n102), .C(n102), .D(full_mult[41]), .Y(n103) );
  INVX2 U121 ( .A(n103), .Y(result[11]) );
  INVX2 U122 ( .A(large_sum[12]), .Y(n105) );
  AOI22X1 U123 ( .A(n5), .B(n121), .C(large_dif[12]), .D(n6), .Y(n104) );
  OAI21X1 U124 ( .A(n51), .B(n105), .C(n104), .Y(n106) );
  OAI22X1 U125 ( .A(n119), .B(n106), .C(n106), .D(full_mult[42]), .Y(n107) );
  INVX2 U126 ( .A(n107), .Y(result[12]) );
  INVX2 U127 ( .A(large_sum[13]), .Y(n109) );
  AOI22X1 U128 ( .A(n33), .B(n121), .C(large_dif[13]), .D(n6), .Y(n108) );
  OAI21X1 U129 ( .A(n51), .B(n109), .C(n108), .Y(n110) );
  OAI22X1 U130 ( .A(n119), .B(n110), .C(n110), .D(full_mult[43]), .Y(n111) );
  INVX2 U131 ( .A(n111), .Y(result[13]) );
  INVX2 U132 ( .A(large_sum[14]), .Y(n113) );
  AOI22X1 U133 ( .A(n1), .B(n121), .C(large_dif[14]), .D(n6), .Y(n112) );
  OAI21X1 U134 ( .A(n51), .B(n113), .C(n112), .Y(n114) );
  OAI22X1 U135 ( .A(n119), .B(n114), .C(n114), .D(full_mult[44]), .Y(n115) );
  INVX2 U136 ( .A(n115), .Y(result[14]) );
  INVX2 U137 ( .A(large_sum[15]), .Y(n117) );
  AOI22X1 U138 ( .A(n42), .B(n121), .C(large_dif[15]), .D(n6), .Y(n116) );
  OAI21X1 U139 ( .A(n51), .B(n117), .C(n116), .Y(n118) );
  OAI22X1 U140 ( .A(n119), .B(n118), .C(n118), .D(full_mult[45]), .Y(n120) );
  INVX2 U141 ( .A(n120), .Y(result[15]) );
  AOI22X1 U142 ( .A(src1_data[16]), .B(n121), .C(large_dif[16]), .D(n6), .Y(
        n122) );
  OAI21X1 U143 ( .A(n51), .B(n123), .C(n122), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n17), .Y(n34) );
  INVX1 U4 ( .A(n20), .Y(n30) );
  INVX1 U5 ( .A(n8), .Y(n52) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n14), .Y(n40) );
  INVX1 U8 ( .A(n9), .Y(n50) );
  INVX1 U9 ( .A(n7), .Y(n53) );
  INVX1 U10 ( .A(n18), .Y(n32) );
  INVX1 U11 ( .A(n11), .Y(n46) );
  INVX1 U12 ( .A(n13), .Y(n42) );
  INVX1 U13 ( .A(n12), .Y(n44) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(
        n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(n2), .Y(n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(n2), .Y(n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(n2), .Y(n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(n2), .Y(n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n12), .Y(n44) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n9), .Y(n50) );
  INVX1 U9 ( .A(n7), .Y(n53) );
  INVX1 U10 ( .A(n8), .Y(n52) );
  INVX1 U11 ( .A(n11), .Y(n46) );
  INVX1 U12 ( .A(n14), .Y(n40) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n9), .Y(n50) );
  INVX1 U9 ( .A(n7), .Y(n53) );
  INVX1 U10 ( .A(n8), .Y(n52) );
  INVX1 U11 ( .A(n11), .Y(n46) );
  INVX1 U12 ( .A(n14), .Y(n40) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n9), .Y(n50) );
  INVX1 U9 ( .A(n7), .Y(n53) );
  INVX1 U10 ( .A(n8), .Y(n52) );
  INVX1 U11 ( .A(n11), .Y(n46) );
  INVX1 U12 ( .A(n14), .Y(n40) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n9), .Y(n50) );
  INVX1 U9 ( .A(n7), .Y(n53) );
  INVX1 U10 ( .A(n8), .Y(n52) );
  INVX1 U11 ( .A(n11), .Y(n46) );
  INVX1 U12 ( .A(n14), .Y(n40) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n9), .Y(n50) );
  INVX1 U9 ( .A(n7), .Y(n53) );
  INVX1 U10 ( .A(n8), .Y(n52) );
  INVX1 U11 ( .A(n11), .Y(n46) );
  INVX1 U12 ( .A(n14), .Y(n40) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n20), .Y(n30) );
  INVX1 U9 ( .A(n9), .Y(n50) );
  INVX1 U10 ( .A(n7), .Y(n53) );
  INVX1 U11 ( .A(n8), .Y(n52) );
  INVX1 U12 ( .A(n14), .Y(n40) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n12), .Y(n44) );
  INVX1 U7 ( .A(n17), .Y(n34) );
  INVX1 U8 ( .A(n20), .Y(n30) );
  INVX1 U9 ( .A(n9), .Y(n50) );
  INVX1 U10 ( .A(n7), .Y(n53) );
  INVX1 U11 ( .A(n8), .Y(n52) );
  INVX1 U12 ( .A(n14), .Y(n40) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n9), .Y(n50) );
  INVX1 U9 ( .A(n7), .Y(n53) );
  INVX1 U10 ( .A(n8), .Y(n52) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55, n56;

  DFFSR \value_reg[16]  ( .D(n28), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n30), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n32), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n34), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n36), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n38), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n40), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n42), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n44), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n46), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n48), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n50), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n56), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n44) );
  INVX1 U3 ( .A(n16), .Y(n40) );
  INVX1 U4 ( .A(n12), .Y(n48) );
  INVX1 U5 ( .A(n18), .Y(n36) );
  INVX1 U6 ( .A(n22), .Y(n32) );
  INVX1 U7 ( .A(n10), .Y(n52) );
  INVX1 U8 ( .A(n8), .Y(n54) );
  INVX1 U9 ( .A(n9), .Y(n53) );
  INVX1 U10 ( .A(n15), .Y(n42) );
  INVX1 U11 ( .A(n13), .Y(n46) );
  INVX1 U12 ( .A(n20), .Y(n34) );
  INVX1 U13 ( .A(n17), .Y(n38) );
  INVX2 U14 ( .A(n1), .Y(n2) );
  INVX2 U15 ( .A(n1), .Y(n3) );
  INVX2 U16 ( .A(write_enable), .Y(n1) );
  INVX2 U17 ( .A(n5), .Y(n4) );
  INVX2 U18 ( .A(n_reset), .Y(n5) );
  INVX1 U19 ( .A(n24), .Y(n30) );
  MUX2X1 U20 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n6) );
  INVX2 U21 ( .A(n6), .Y(n56) );
  MUX2X1 U22 ( .B(current_value[1]), .A(new_value[1]), .S(n3), .Y(n7) );
  INVX2 U23 ( .A(n7), .Y(n55) );
  MUX2X1 U24 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[3]), .A(new_value[3]), .S(n3), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n10) );
  MUX2X1 U27 ( .B(current_value[5]), .A(new_value[5]), .S(n3), .Y(n11) );
  INVX2 U28 ( .A(n11), .Y(n50) );
  MUX2X1 U29 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n12) );
  MUX2X1 U30 ( .B(current_value[7]), .A(new_value[7]), .S(n3), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n14) );
  MUX2X1 U32 ( .B(current_value[9]), .A(new_value[9]), .S(n3), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n16) );
  MUX2X1 U34 ( .B(current_value[11]), .A(new_value[11]), .S(n3), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n18) );
  MUX2X1 U36 ( .B(current_value[13]), .A(new_value[13]), .S(n3), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n22) );
  MUX2X1 U55 ( .B(current_value[15]), .A(new_value[15]), .S(n3), .Y(n24) );
  MUX2X1 U56 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n26) );
  INVX2 U57 ( .A(n26), .Y(n28) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n9), .Y(n50) );
  INVX1 U9 ( .A(n7), .Y(n53) );
  INVX1 U10 ( .A(n8), .Y(n52) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55, n56;

  DFFSR \value_reg[16]  ( .D(n28), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n30), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n32), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n34), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n36), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n38), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n40), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n42), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n44), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n46), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n48), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n50), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n56), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n44) );
  INVX1 U3 ( .A(n16), .Y(n40) );
  INVX1 U4 ( .A(n12), .Y(n48) );
  INVX1 U5 ( .A(n13), .Y(n46) );
  INVX1 U6 ( .A(n18), .Y(n36) );
  INVX1 U7 ( .A(n22), .Y(n32) );
  INVX1 U8 ( .A(n10), .Y(n52) );
  INVX1 U9 ( .A(n8), .Y(n54) );
  INVX1 U10 ( .A(n9), .Y(n53) );
  INVX1 U11 ( .A(n15), .Y(n42) );
  INVX1 U12 ( .A(n20), .Y(n34) );
  INVX1 U13 ( .A(n17), .Y(n38) );
  INVX2 U14 ( .A(n1), .Y(n2) );
  INVX2 U15 ( .A(n1), .Y(n3) );
  INVX2 U16 ( .A(write_enable), .Y(n1) );
  INVX2 U17 ( .A(n5), .Y(n4) );
  INVX2 U18 ( .A(n_reset), .Y(n5) );
  INVX1 U19 ( .A(n24), .Y(n30) );
  MUX2X1 U20 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n6) );
  INVX2 U21 ( .A(n6), .Y(n56) );
  MUX2X1 U22 ( .B(current_value[1]), .A(new_value[1]), .S(n3), .Y(n7) );
  INVX2 U23 ( .A(n7), .Y(n55) );
  MUX2X1 U24 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[3]), .A(new_value[3]), .S(n3), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n10) );
  MUX2X1 U27 ( .B(current_value[5]), .A(new_value[5]), .S(n3), .Y(n11) );
  INVX2 U28 ( .A(n11), .Y(n50) );
  MUX2X1 U29 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n12) );
  MUX2X1 U30 ( .B(current_value[7]), .A(new_value[7]), .S(n3), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n14) );
  MUX2X1 U32 ( .B(current_value[9]), .A(new_value[9]), .S(n3), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n16) );
  MUX2X1 U34 ( .B(current_value[11]), .A(new_value[11]), .S(n3), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n18) );
  MUX2X1 U36 ( .B(current_value[13]), .A(new_value[13]), .S(n3), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n22) );
  MUX2X1 U55 ( .B(current_value[15]), .A(new_value[15]), .S(n3), .Y(n24) );
  MUX2X1 U56 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n26) );
  INVX2 U57 ( .A(n26), .Y(n28) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n9), .Y(n50) );
  INVX1 U9 ( .A(n7), .Y(n53) );
  INVX1 U10 ( .A(n8), .Y(n52) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55, n56;

  DFFSR \value_reg[16]  ( .D(n28), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n30), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n32), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n34), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n36), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n38), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n40), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n42), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n44), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n46), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n48), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n50), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n56), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n44) );
  INVX1 U3 ( .A(n16), .Y(n40) );
  INVX1 U4 ( .A(n12), .Y(n48) );
  INVX1 U5 ( .A(n13), .Y(n46) );
  INVX1 U6 ( .A(n18), .Y(n36) );
  INVX1 U7 ( .A(n22), .Y(n32) );
  INVX1 U8 ( .A(n10), .Y(n52) );
  INVX1 U9 ( .A(n8), .Y(n54) );
  INVX1 U10 ( .A(n9), .Y(n53) );
  INVX1 U11 ( .A(n15), .Y(n42) );
  INVX1 U12 ( .A(n20), .Y(n34) );
  INVX1 U13 ( .A(n17), .Y(n38) );
  INVX2 U14 ( .A(n1), .Y(n2) );
  INVX2 U15 ( .A(n1), .Y(n3) );
  INVX2 U16 ( .A(write_enable), .Y(n1) );
  INVX2 U17 ( .A(n5), .Y(n4) );
  INVX2 U18 ( .A(n_reset), .Y(n5) );
  INVX1 U19 ( .A(n24), .Y(n30) );
  MUX2X1 U20 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n6) );
  INVX2 U21 ( .A(n6), .Y(n56) );
  MUX2X1 U22 ( .B(current_value[1]), .A(new_value[1]), .S(n3), .Y(n7) );
  INVX2 U23 ( .A(n7), .Y(n55) );
  MUX2X1 U24 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[3]), .A(new_value[3]), .S(n3), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n10) );
  MUX2X1 U27 ( .B(current_value[5]), .A(new_value[5]), .S(n3), .Y(n11) );
  INVX2 U28 ( .A(n11), .Y(n50) );
  MUX2X1 U29 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n12) );
  MUX2X1 U30 ( .B(current_value[7]), .A(new_value[7]), .S(n3), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n14) );
  MUX2X1 U32 ( .B(current_value[9]), .A(new_value[9]), .S(n3), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n16) );
  MUX2X1 U34 ( .B(current_value[11]), .A(new_value[11]), .S(n3), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n18) );
  MUX2X1 U36 ( .B(current_value[13]), .A(new_value[13]), .S(n3), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n22) );
  MUX2X1 U55 ( .B(current_value[15]), .A(new_value[15]), .S(n3), .Y(n24) );
  MUX2X1 U56 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n26) );
  INVX2 U57 ( .A(n26), .Y(n28) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX4 U2 ( .A(n1), .Y(n2) );
  INVX1 U3 ( .A(n13), .Y(n42) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n11), .Y(n46) );
  INVX1 U6 ( .A(n17), .Y(n34) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n9), .Y(n50) );
  INVX1 U9 ( .A(n7), .Y(n53) );
  INVX1 U10 ( .A(n8), .Y(n52) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX1 U12 ( .A(n12), .Y(n44) );
  INVX1 U13 ( .A(n18), .Y(n32) );
  INVX1 U14 ( .A(n16), .Y(n36) );
  INVX2 U15 ( .A(write_enable), .Y(n1) );
  INVX2 U16 ( .A(n4), .Y(n3) );
  INVX2 U17 ( .A(n_reset), .Y(n4) );
  INVX1 U18 ( .A(n22), .Y(n28) );
  MUX2X1 U19 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U20 ( .A(n5), .Y(n55) );
  MUX2X1 U21 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U22 ( .A(n6), .Y(n54) );
  MUX2X1 U23 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  MUX2X1 U24 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55, n56;

  DFFSR \value_reg[16]  ( .D(n28), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n30), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n32), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n34), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n36), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n38), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n40), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n42), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n44), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n46), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n48), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n50), .CLK(clk), .R(n4), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n56), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n14), .Y(n44) );
  INVX1 U3 ( .A(n16), .Y(n40) );
  INVX1 U4 ( .A(n12), .Y(n48) );
  INVX1 U5 ( .A(n18), .Y(n36) );
  INVX1 U6 ( .A(n22), .Y(n32) );
  INVX1 U7 ( .A(n10), .Y(n52) );
  INVX1 U8 ( .A(n8), .Y(n54) );
  INVX1 U9 ( .A(n9), .Y(n53) );
  INVX1 U10 ( .A(n15), .Y(n42) );
  INVX1 U11 ( .A(n13), .Y(n46) );
  INVX1 U12 ( .A(n20), .Y(n34) );
  INVX1 U13 ( .A(n17), .Y(n38) );
  INVX2 U14 ( .A(n1), .Y(n2) );
  INVX2 U15 ( .A(n1), .Y(n3) );
  INVX2 U16 ( .A(write_enable), .Y(n1) );
  INVX2 U17 ( .A(n5), .Y(n4) );
  INVX2 U18 ( .A(n_reset), .Y(n5) );
  INVX1 U19 ( .A(n24), .Y(n30) );
  MUX2X1 U20 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n6) );
  INVX2 U21 ( .A(n6), .Y(n56) );
  MUX2X1 U22 ( .B(current_value[1]), .A(new_value[1]), .S(n3), .Y(n7) );
  INVX2 U23 ( .A(n7), .Y(n55) );
  MUX2X1 U24 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n8) );
  MUX2X1 U25 ( .B(current_value[3]), .A(new_value[3]), .S(n3), .Y(n9) );
  MUX2X1 U26 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n10) );
  MUX2X1 U27 ( .B(current_value[5]), .A(new_value[5]), .S(n3), .Y(n11) );
  INVX2 U28 ( .A(n11), .Y(n50) );
  MUX2X1 U29 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n12) );
  MUX2X1 U30 ( .B(current_value[7]), .A(new_value[7]), .S(n3), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n14) );
  MUX2X1 U32 ( .B(current_value[9]), .A(new_value[9]), .S(n3), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n16) );
  MUX2X1 U34 ( .B(current_value[11]), .A(new_value[11]), .S(n3), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n18) );
  MUX2X1 U36 ( .B(current_value[13]), .A(new_value[13]), .S(n3), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n22) );
  MUX2X1 U55 ( .B(current_value[15]), .A(new_value[15]), .S(n3), .Y(n24) );
  MUX2X1 U56 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n26) );
  INVX2 U57 ( .A(n26), .Y(n28) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n98, n99, n100, n101, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n789), 
        .write_enable(write_enables[0]), .new_value({n781, w_data[15:6], n778, 
        n7, n19, n776, n774, n772}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n782), 
        .write_enable(write_enables[1]), .new_value({n780, w_data[15:6], n778, 
        n18, n17, n776, n774, n772}), .current_value({\regs_matrix[1][16] , 
        \regs_matrix[1][15] , \regs_matrix[1][14] , \regs_matrix[1][13] , 
        \regs_matrix[1][12] , \regs_matrix[1][11] , \regs_matrix[1][10] , 
        \regs_matrix[1][9] , \regs_matrix[1][8] , \regs_matrix[1][7] , 
        \regs_matrix[1][6] , \regs_matrix[1][5] , \regs_matrix[1][4] , 
        \regs_matrix[1][3] , \regs_matrix[1][2] , \regs_matrix[1][1] , 
        \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n782), 
        .write_enable(write_enables[2]), .new_value({n781, w_data[15:6], n778, 
        n7, n19, n776, n774, n772}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n783), 
        .write_enable(write_enables[3]), .new_value({n780, w_data[15:6], n778, 
        n18, n17, n776, n774, n772}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n783), 
        .write_enable(write_enables[4]), .new_value({n781, w_data[15:6], n778, 
        n7, n19, n776, n774, n772}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n784), 
        .write_enable(write_enables[5]), .new_value({n780, w_data[15:6], n778, 
        n18, n17, n776, n774, n772}), .current_value({\regs_matrix[5][16] , 
        \regs_matrix[5][15] , \regs_matrix[5][14] , \regs_matrix[5][13] , 
        \regs_matrix[5][12] , \regs_matrix[5][11] , \regs_matrix[5][10] , 
        \regs_matrix[5][9] , \regs_matrix[5][8] , \regs_matrix[5][7] , 
        \regs_matrix[5][6] , \regs_matrix[5][5] , \regs_matrix[5][4] , 
        \regs_matrix[5][3] , \regs_matrix[5][2] , \regs_matrix[5][1] , 
        \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n784), 
        .write_enable(write_enables[6]), .new_value({n781, w_data[15:6], n778, 
        n7, n19, n776, n774, n772}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n785), 
        .write_enable(write_enables[7]), .new_value({n780, w_data[15:6], n778, 
        n18, n17, n776, n774, n772}), .current_value({\regs_matrix[7][16] , 
        \regs_matrix[7][15] , \regs_matrix[7][14] , \regs_matrix[7][13] , 
        \regs_matrix[7][12] , \regs_matrix[7][11] , \regs_matrix[7][10] , 
        \regs_matrix[7][9] , \regs_matrix[7][8] , \regs_matrix[7][7] , 
        \regs_matrix[7][6] , \regs_matrix[7][5] , \regs_matrix[7][4] , 
        \regs_matrix[7][3] , \regs_matrix[7][2] , \regs_matrix[7][1] , 
        \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n785), 
        .write_enable(write_enables[8]), .new_value({n781, w_data[15:6], n778, 
        n7, n19, n776, n774, n772}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n786), 
        .write_enable(write_enables[9]), .new_value({n780, w_data[15:6], n778, 
        n18, n17, n776, n774, n772}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n786), 
        .write_enable(write_enables[10]), .new_value({n781, w_data[15:6], n778, 
        n7, n19, n776, n774, n772}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n787), 
        .write_enable(write_enables[11]), .new_value({n780, w_data[15:6], n778, 
        n18, n17, n776, n774, n772}), .current_value({\regs_matrix[11][16] , 
        \regs_matrix[11][15] , \regs_matrix[11][14] , \regs_matrix[11][13] , 
        \regs_matrix[11][12] , \regs_matrix[11][11] , \regs_matrix[11][10] , 
        \regs_matrix[11][9] , \regs_matrix[11][8] , \regs_matrix[11][7] , 
        \regs_matrix[11][6] , \regs_matrix[11][5] , \regs_matrix[11][4] , 
        \regs_matrix[11][3] , \regs_matrix[11][2] , \regs_matrix[11][1] , 
        \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n787), 
        .write_enable(write_enables[12]), .new_value({n781, w_data[15:6], n778, 
        n7, n19, n776, n774, n772}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n788), 
        .write_enable(write_enables[13]), .new_value({n780, w_data[15:6], n778, 
        n18, n17, n776, n774, n772}), .current_value({\regs_matrix[13][16] , 
        \regs_matrix[13][15] , \regs_matrix[13][14] , \regs_matrix[13][13] , 
        \regs_matrix[13][12] , \regs_matrix[13][11] , \regs_matrix[13][10] , 
        \regs_matrix[13][9] , \regs_matrix[13][8] , \regs_matrix[13][7] , 
        \regs_matrix[13][6] , \regs_matrix[13][5] , \regs_matrix[13][4] , 
        \regs_matrix[13][3] , \regs_matrix[13][2] , \regs_matrix[13][1] , 
        \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n788), 
        .write_enable(write_enables[14]), .new_value({n781, w_data[15:6], n778, 
        n7, n19, n776, n774, n772}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n789), 
        .write_enable(write_enables[15]), .new_value({n780, w_data[15:6], n778, 
        n18, n17, n776, n774, n772}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  BUFX2 U2 ( .A(n92), .Y(n1) );
  MUX2X1 U3 ( .B(n587), .A(n588), .S(n769), .Y(r2_data[6]) );
  NOR2X1 U4 ( .A(n223), .B(n2), .Y(n87) );
  NAND2X1 U5 ( .A(n413), .B(n45), .Y(n2) );
  INVX2 U6 ( .A(N10), .Y(n33) );
  INVX2 U7 ( .A(n495), .Y(n24) );
  INVX1 U8 ( .A(n49), .Y(n3) );
  INVX2 U9 ( .A(n49), .Y(n6) );
  INVX2 U10 ( .A(n71), .Y(n70) );
  MUX2X1 U11 ( .B(n601), .A(n602), .S(n768), .Y(r2_data[7]) );
  BUFX2 U12 ( .A(n756), .Y(n4) );
  INVX1 U13 ( .A(n223), .Y(n5) );
  MUX2X1 U14 ( .B(n700), .A(n699), .S(n770), .Y(r2_data[14]) );
  BUFX4 U15 ( .A(w_data[4]), .Y(n7) );
  BUFX2 U16 ( .A(N15), .Y(n8) );
  INVX4 U17 ( .A(n83), .Y(n43) );
  BUFX2 U18 ( .A(n484), .Y(n9) );
  AND2X2 U19 ( .A(n5), .B(n1), .Y(n10) );
  INVX4 U20 ( .A(n10), .Y(n118) );
  INVX2 U21 ( .A(N10), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n12) );
  INVX2 U23 ( .A(n103), .Y(r1_data[0]) );
  INVX8 U24 ( .A(n759), .Y(n49) );
  INVX2 U25 ( .A(n62), .Y(n64) );
  BUFX4 U26 ( .A(n118), .Y(n485) );
  INVX2 U27 ( .A(n20), .Y(n21) );
  INVX4 U28 ( .A(n294), .Y(r1_data[8]) );
  BUFX2 U29 ( .A(n87), .Y(n13) );
  BUFX4 U30 ( .A(n87), .Y(n14) );
  BUFX2 U31 ( .A(n87), .Y(n15) );
  INVX1 U32 ( .A(n51), .Y(n16) );
  INVX1 U33 ( .A(\regs_matrix[2][2] ), .Y(n30) );
  INVX2 U34 ( .A(n486), .Y(n47) );
  INVX1 U35 ( .A(n9), .Y(n20) );
  INVX8 U36 ( .A(n771), .Y(n772) );
  INVX4 U37 ( .A(w_data[0]), .Y(n771) );
  INVX8 U38 ( .A(n773), .Y(n774) );
  INVX4 U39 ( .A(w_data[1]), .Y(n773) );
  BUFX4 U40 ( .A(w_data[3]), .Y(n17) );
  INVX8 U41 ( .A(n777), .Y(n778) );
  BUFX4 U42 ( .A(w_data[4]), .Y(n18) );
  BUFX4 U43 ( .A(w_data[3]), .Y(n19) );
  INVX4 U44 ( .A(w_data[5]), .Y(n777) );
  INVX2 U45 ( .A(n25), .Y(n52) );
  INVX2 U46 ( .A(n26), .Y(n41) );
  MUX2X1 U47 ( .B(n559), .A(n560), .S(n768), .Y(r2_data[4]) );
  INVX4 U48 ( .A(n62), .Y(n73) );
  INVX2 U49 ( .A(N12), .Y(n22) );
  INVX1 U50 ( .A(N12), .Y(n413) );
  MUX2X1 U51 ( .B(n615), .A(n616), .S(n768), .Y(r2_data[8]) );
  NAND2X1 U52 ( .A(n92), .B(n223), .Y(n23) );
  INVX1 U53 ( .A(n78), .Y(n482) );
  MUX2X1 U54 ( .B(n517), .A(n518), .S(n768), .Y(r2_data[1]) );
  BUFX4 U55 ( .A(n38), .Y(n62) );
  INVX1 U56 ( .A(n16), .Y(n25) );
  INVX1 U57 ( .A(n42), .Y(n26) );
  INVX2 U58 ( .A(N14), .Y(n740) );
  INVX2 U59 ( .A(n223), .Y(n27) );
  BUFX4 U60 ( .A(n36), .Y(n28) );
  INVX2 U61 ( .A(n36), .Y(n88) );
  INVX4 U62 ( .A(n748), .Y(n29) );
  NAND2X1 U63 ( .A(n30), .B(n135), .Y(n161) );
  INVX4 U64 ( .A(n23), .Y(n31) );
  MUX2X1 U65 ( .B(n574), .A(n573), .S(n770), .Y(r2_data[5]) );
  AND2X2 U66 ( .A(n412), .B(n413), .Y(n55) );
  MUX2X1 U67 ( .B(n644), .A(n643), .S(n770), .Y(r2_data[10]) );
  INVX4 U68 ( .A(n770), .Y(n768) );
  INVX4 U69 ( .A(n46), .Y(n759) );
  INVX2 U70 ( .A(n71), .Y(n76) );
  INVX4 U71 ( .A(n165), .Y(n135) );
  INVX4 U72 ( .A(n755), .Y(n32) );
  MUX2X1 U73 ( .B(n657), .A(n658), .S(n768), .Y(r2_data[11]) );
  INVX4 U74 ( .A(N10), .Y(n223) );
  INVX4 U75 ( .A(n748), .Y(n751) );
  INVX4 U76 ( .A(n34), .Y(n51) );
  NAND2X1 U77 ( .A(n27), .B(n90), .Y(n34) );
  BUFX2 U78 ( .A(n481), .Y(n35) );
  NAND2X1 U79 ( .A(n91), .B(N10), .Y(n36) );
  MUX2X1 U80 ( .B(n686), .A(n685), .S(n770), .Y(r2_data[13]) );
  MUX2X1 U81 ( .B(n629), .A(n630), .S(N17), .Y(r2_data[9]) );
  INVX4 U82 ( .A(N17), .Y(n770) );
  INVX2 U83 ( .A(n61), .Y(n68) );
  BUFX4 U84 ( .A(n38), .Y(n61) );
  INVX1 U85 ( .A(n72), .Y(n75) );
  BUFX4 U86 ( .A(n759), .Y(n37) );
  AND2X2 U87 ( .A(n84), .B(N16), .Y(n38) );
  NAND2X1 U88 ( .A(N14), .B(N16), .Y(n39) );
  NAND2X1 U89 ( .A(n741), .B(n40), .Y(n510) );
  INVX2 U90 ( .A(n39), .Y(n40) );
  INVX2 U91 ( .A(n88), .Y(n480) );
  INVX8 U92 ( .A(n49), .Y(n54) );
  INVX4 U93 ( .A(n205), .Y(r1_data[4]) );
  INVX4 U94 ( .A(n78), .Y(n42) );
  INVX4 U95 ( .A(n48), .Y(r1_data[13]) );
  INVX4 U96 ( .A(n447), .Y(r1_data[15]) );
  BUFX2 U97 ( .A(n91), .Y(n44) );
  AND2X2 U98 ( .A(N14), .B(N15), .Y(n84) );
  BUFX2 U99 ( .A(N11), .Y(n45) );
  INVX1 U100 ( .A(n62), .Y(n67) );
  INVX4 U101 ( .A(n504), .Y(n748) );
  INVX4 U102 ( .A(n748), .Y(n750) );
  INVX2 U103 ( .A(n72), .Y(n50) );
  INVX2 U104 ( .A(n61), .Y(n65) );
  INVX4 U105 ( .A(n748), .Y(n749) );
  INVX4 U106 ( .A(n755), .Y(n756) );
  INVX8 U107 ( .A(n775), .Y(n776) );
  AND2X2 U108 ( .A(n84), .B(n739), .Y(n46) );
  INVX4 U109 ( .A(w_data[2]), .Y(n775) );
  INVX4 U110 ( .A(n764), .Y(n766) );
  INVX4 U111 ( .A(n764), .Y(n767) );
  INVX1 U112 ( .A(n61), .Y(n69) );
  INVX4 U113 ( .A(n250), .Y(r1_data[6]) );
  INVX4 U114 ( .A(n755), .Y(n758) );
  OR2X2 U115 ( .A(n401), .B(n400), .Y(n48) );
  INVX8 U116 ( .A(n51), .Y(n53) );
  INVX4 U117 ( .A(n506), .Y(n755) );
  INVX4 U118 ( .A(n755), .Y(n757) );
  INVX2 U119 ( .A(n60), .Y(n71) );
  INVX2 U120 ( .A(n110), .Y(n495) );
  INVX4 U121 ( .A(n764), .Y(n765) );
  AND2X2 U122 ( .A(n412), .B(n22), .Y(n85) );
  INVX1 U123 ( .A(n22), .Y(n56) );
  INVX2 U124 ( .A(n61), .Y(n66) );
  AND2X2 U125 ( .A(n412), .B(n56), .Y(n93) );
  INVX4 U126 ( .A(n760), .Y(n763) );
  INVX4 U127 ( .A(n760), .Y(n762) );
  INVX4 U128 ( .A(n760), .Y(n761) );
  AND2X2 U129 ( .A(N11), .B(N12), .Y(n92) );
  BUFX2 U130 ( .A(n480), .Y(n57) );
  BUFX2 U131 ( .A(n480), .Y(n58) );
  INVX2 U132 ( .A(n38), .Y(n60) );
  INVX8 U133 ( .A(n49), .Y(n59) );
  INVX1 U134 ( .A(n72), .Y(n63) );
  INVX2 U135 ( .A(n60), .Y(n72) );
  INVX1 U136 ( .A(n71), .Y(n74) );
  INVX1 U137 ( .A(n72), .Y(n77) );
  INVX2 U138 ( .A(n43), .Y(n491) );
  INVX4 U139 ( .A(n80), .Y(n481) );
  INVX4 U140 ( .A(n770), .Y(n769) );
  AND2X2 U141 ( .A(n85), .B(n33), .Y(n83) );
  INVX2 U142 ( .A(w_data[16]), .Y(n779) );
  AND2X2 U143 ( .A(n90), .B(n33), .Y(n78) );
  AND2X2 U144 ( .A(n33), .B(n93), .Y(n79) );
  AND2X2 U145 ( .A(n92), .B(n223), .Y(n80) );
  AND2X2 U146 ( .A(n85), .B(n33), .Y(n81) );
  AND2X2 U147 ( .A(n93), .B(n33), .Y(n82) );
  AND2X2 U148 ( .A(n92), .B(N10), .Y(n86) );
  AND2X2 U149 ( .A(n12), .B(n91), .Y(n89) );
  AND2X2 U150 ( .A(n45), .B(n22), .Y(n90) );
  AND2X2 U151 ( .A(n412), .B(N12), .Y(n91) );
  INVX2 U152 ( .A(N11), .Y(n412) );
  INVX2 U153 ( .A(n779), .Y(n781) );
  INVX2 U154 ( .A(n779), .Y(n780) );
  AND2X2 U155 ( .A(w_sel[3]), .B(w_en), .Y(n94) );
  BUFX2 U156 ( .A(n_reset), .Y(n782) );
  BUFX2 U157 ( .A(n_reset), .Y(n783) );
  BUFX2 U158 ( .A(n_reset), .Y(n784) );
  BUFX2 U159 ( .A(n_reset), .Y(n785) );
  BUFX2 U160 ( .A(n_reset), .Y(n786) );
  BUFX2 U161 ( .A(n_reset), .Y(n787) );
  BUFX2 U162 ( .A(n_reset), .Y(n788) );
  BUFX2 U163 ( .A(n_reset), .Y(n789) );
  INVX2 U164 ( .A(N13), .Y(n95) );
  AOI22X1 U165 ( .A(n104), .B(n105), .C(n106), .D(n107), .Y(n103) );
  NOR2X1 U166 ( .A(n108), .B(n109), .Y(n107) );
  OAI22X1 U167 ( .A(\regs_matrix[5][0] ), .B(n28), .C(outreg_data[0]), .D(n487), .Y(n109) );
  OAI21X1 U168 ( .A(\regs_matrix[4][0] ), .B(n494), .C(n111), .Y(n108) );
  AOI21X1 U169 ( .A(n47), .B(n112), .C(N13), .Y(n111) );
  INVX2 U170 ( .A(\regs_matrix[7][0] ), .Y(n112) );
  NOR2X1 U171 ( .A(n114), .B(n113), .Y(n106) );
  OAI22X1 U172 ( .A(\regs_matrix[3][0] ), .B(n53), .C(\regs_matrix[6][0] ), 
        .D(n481), .Y(n114) );
  OAI22X1 U173 ( .A(\regs_matrix[2][0] ), .B(n42), .C(\regs_matrix[1][0] ), 
        .D(n484), .Y(n113) );
  NOR2X1 U174 ( .A(n116), .B(n117), .Y(n105) );
  OAI22X1 U175 ( .A(\regs_matrix[11][0] ), .B(n52), .C(\regs_matrix[13][0] ), 
        .D(n58), .Y(n117) );
  OAI21X1 U176 ( .A(\regs_matrix[15][0] ), .B(n485), .C(N13), .Y(n116) );
  NOR2X1 U177 ( .A(n119), .B(n120), .Y(n104) );
  OAI21X1 U178 ( .A(\regs_matrix[10][0] ), .B(n41), .C(n121), .Y(n120) );
  AOI22X1 U179 ( .A(n491), .B(n123), .C(n496), .D(n124), .Y(n121) );
  INVX2 U180 ( .A(\regs_matrix[12][0] ), .Y(n124) );
  INVX2 U181 ( .A(\regs_matrix[8][0] ), .Y(n123) );
  OAI22X1 U182 ( .A(\regs_matrix[9][0] ), .B(n21), .C(\regs_matrix[14][0] ), 
        .D(n35), .Y(n119) );
  NOR2X1 U183 ( .A(n125), .B(n126), .Y(r1_data[1]) );
  NAND3X1 U184 ( .A(n128), .B(n127), .C(n129), .Y(n126) );
  AOI22X1 U185 ( .A(n130), .B(n31), .C(n131), .D(n132), .Y(n129) );
  NOR2X1 U186 ( .A(\regs_matrix[1][1] ), .B(n133), .Y(n131) );
  NOR2X1 U187 ( .A(\regs_matrix[6][1] ), .B(n133), .Y(n130) );
  NAND2X1 U188 ( .A(n134), .B(n135), .Y(n128) );
  NOR2X1 U189 ( .A(\regs_matrix[2][1] ), .B(n133), .Y(n134) );
  AOI22X1 U190 ( .A(n82), .B(n136), .C(n137), .D(n83), .Y(n127) );
  NOR2X1 U191 ( .A(outreg_data[1]), .B(n133), .Y(n137) );
  NOR2X1 U192 ( .A(\regs_matrix[4][1] ), .B(n133), .Y(n136) );
  NAND2X1 U193 ( .A(n139), .B(n138), .Y(n125) );
  AOI22X1 U194 ( .A(N13), .B(n140), .C(n141), .D(n47), .Y(n139) );
  NOR2X1 U195 ( .A(\regs_matrix[7][1] ), .B(n133), .Y(n141) );
  AOI22X1 U196 ( .A(n88), .B(n142), .C(n14), .D(n143), .Y(n138) );
  NOR2X1 U197 ( .A(\regs_matrix[3][1] ), .B(n133), .Y(n143) );
  NOR2X1 U198 ( .A(\regs_matrix[5][1] ), .B(n133), .Y(n142) );
  INVX2 U199 ( .A(n140), .Y(n133) );
  NAND2X1 U200 ( .A(n144), .B(n145), .Y(n140) );
  NOR2X1 U201 ( .A(n146), .B(n147), .Y(n145) );
  OAI22X1 U202 ( .A(\regs_matrix[11][1] ), .B(n52), .C(\regs_matrix[13][1] ), 
        .D(n58), .Y(n147) );
  OAI21X1 U203 ( .A(\regs_matrix[15][1] ), .B(n485), .C(N13), .Y(n146) );
  NOR2X1 U204 ( .A(n148), .B(n149), .Y(n144) );
  OAI21X1 U205 ( .A(\regs_matrix[10][1] ), .B(n41), .C(n150), .Y(n149) );
  AOI22X1 U206 ( .A(n491), .B(n151), .C(n496), .D(n152), .Y(n150) );
  INVX2 U207 ( .A(\regs_matrix[12][1] ), .Y(n152) );
  INVX2 U208 ( .A(\regs_matrix[8][1] ), .Y(n151) );
  OAI22X1 U209 ( .A(\regs_matrix[9][1] ), .B(n21), .C(\regs_matrix[14][1] ), 
        .D(n35), .Y(n148) );
  AOI22X1 U210 ( .A(n156), .B(n86), .C(n157), .D(n89), .Y(n155) );
  NOR2X1 U211 ( .A(\regs_matrix[5][2] ), .B(n158), .Y(n157) );
  NOR2X1 U212 ( .A(\regs_matrix[7][2] ), .B(n158), .Y(n156) );
  AOI21X1 U213 ( .A(n159), .B(n122), .C(n160), .Y(n154) );
  OAI21X1 U214 ( .A(n158), .B(n161), .C(n162), .Y(n160) );
  AOI22X1 U215 ( .A(n483), .B(n163), .C(n164), .D(n31), .Y(n162) );
  NOR2X1 U216 ( .A(\regs_matrix[6][2] ), .B(n158), .Y(n164) );
  NOR2X1 U217 ( .A(\regs_matrix[1][2] ), .B(n158), .Y(n163) );
  NOR2X1 U218 ( .A(outreg_data[2]), .B(n158), .Y(n159) );
  OAI21X1 U219 ( .A(n494), .B(n166), .C(n167), .Y(n153) );
  AOI22X1 U220 ( .A(N13), .B(n168), .C(n169), .D(n14), .Y(n167) );
  NOR2X1 U221 ( .A(\regs_matrix[3][2] ), .B(n158), .Y(n169) );
  OR2X1 U222 ( .A(\regs_matrix[4][2] ), .B(n158), .Y(n166) );
  INVX2 U223 ( .A(n168), .Y(n158) );
  NAND2X1 U224 ( .A(n170), .B(n171), .Y(n168) );
  NOR2X1 U225 ( .A(n172), .B(n173), .Y(n171) );
  OAI22X1 U226 ( .A(\regs_matrix[11][2] ), .B(n52), .C(\regs_matrix[13][2] ), 
        .D(n58), .Y(n173) );
  OAI21X1 U227 ( .A(\regs_matrix[15][2] ), .B(n485), .C(N13), .Y(n172) );
  NOR2X1 U228 ( .A(n174), .B(n175), .Y(n170) );
  OAI21X1 U229 ( .A(\regs_matrix[10][2] ), .B(n41), .C(n176), .Y(n175) );
  AOI22X1 U230 ( .A(n491), .B(n177), .C(n496), .D(n178), .Y(n176) );
  INVX2 U231 ( .A(\regs_matrix[12][2] ), .Y(n178) );
  INVX2 U232 ( .A(\regs_matrix[8][2] ), .Y(n177) );
  OAI22X1 U233 ( .A(\regs_matrix[9][2] ), .B(n21), .C(\regs_matrix[14][2] ), 
        .D(n35), .Y(n174) );
  NOR2X1 U234 ( .A(n179), .B(n180), .Y(n98) );
  NAND3X1 U235 ( .A(n181), .B(n182), .C(n183), .Y(n180) );
  AOI22X1 U236 ( .A(n184), .B(n31), .C(n185), .D(n132), .Y(n183) );
  NOR2X1 U237 ( .A(\regs_matrix[1][3] ), .B(n186), .Y(n185) );
  NOR2X1 U238 ( .A(\regs_matrix[6][3] ), .B(n186), .Y(n184) );
  NAND2X1 U239 ( .A(n187), .B(n135), .Y(n182) );
  NOR2X1 U240 ( .A(\regs_matrix[2][3] ), .B(n186), .Y(n187) );
  AOI22X1 U241 ( .A(n79), .B(n188), .C(n189), .D(n81), .Y(n181) );
  NOR2X1 U242 ( .A(outreg_data[3]), .B(n186), .Y(n189) );
  NOR2X1 U243 ( .A(\regs_matrix[4][3] ), .B(n186), .Y(n188) );
  NAND2X1 U244 ( .A(n190), .B(n191), .Y(n179) );
  AOI22X1 U245 ( .A(N13), .B(n192), .C(n193), .D(n47), .Y(n191) );
  NOR2X1 U246 ( .A(\regs_matrix[7][3] ), .B(n186), .Y(n193) );
  AOI22X1 U247 ( .A(n88), .B(n194), .C(n195), .D(n13), .Y(n190) );
  NOR2X1 U248 ( .A(\regs_matrix[3][3] ), .B(n186), .Y(n195) );
  NOR2X1 U249 ( .A(\regs_matrix[5][3] ), .B(n186), .Y(n194) );
  INVX2 U250 ( .A(n192), .Y(n186) );
  NAND2X1 U251 ( .A(n196), .B(n197), .Y(n192) );
  NOR2X1 U252 ( .A(n198), .B(n199), .Y(n197) );
  OAI22X1 U253 ( .A(\regs_matrix[11][3] ), .B(n52), .C(\regs_matrix[13][3] ), 
        .D(n58), .Y(n199) );
  OAI21X1 U254 ( .A(\regs_matrix[15][3] ), .B(n485), .C(N13), .Y(n198) );
  NOR2X1 U255 ( .A(n200), .B(n201), .Y(n196) );
  OAI21X1 U256 ( .A(\regs_matrix[10][3] ), .B(n41), .C(n202), .Y(n201) );
  AOI22X1 U257 ( .A(n491), .B(n203), .C(n496), .D(n204), .Y(n202) );
  INVX2 U258 ( .A(\regs_matrix[12][3] ), .Y(n204) );
  INVX2 U259 ( .A(\regs_matrix[8][3] ), .Y(n203) );
  OAI22X1 U260 ( .A(\regs_matrix[9][3] ), .B(n21), .C(\regs_matrix[14][3] ), 
        .D(n35), .Y(n200) );
  AOI22X1 U261 ( .A(n206), .B(n207), .C(n208), .D(n209), .Y(n205) );
  NOR2X1 U262 ( .A(n210), .B(n211), .Y(n209) );
  OAI22X1 U263 ( .A(\regs_matrix[11][4] ), .B(n52), .C(\regs_matrix[13][4] ), 
        .D(n58), .Y(n211) );
  OAI21X1 U264 ( .A(\regs_matrix[15][4] ), .B(n485), .C(N13), .Y(n210) );
  NOR2X1 U265 ( .A(n212), .B(n213), .Y(n208) );
  OAI21X1 U266 ( .A(\regs_matrix[10][4] ), .B(n41), .C(n214), .Y(n213) );
  AOI22X1 U267 ( .A(n491), .B(n215), .C(n496), .D(n216), .Y(n214) );
  INVX2 U268 ( .A(\regs_matrix[12][4] ), .Y(n216) );
  INVX2 U269 ( .A(\regs_matrix[8][4] ), .Y(n215) );
  OAI22X1 U270 ( .A(\regs_matrix[9][4] ), .B(n21), .C(\regs_matrix[14][4] ), 
        .D(n35), .Y(n212) );
  NOR2X1 U271 ( .A(n218), .B(n217), .Y(n207) );
  OAI22X1 U272 ( .A(\regs_matrix[2][4] ), .B(n42), .C(\regs_matrix[1][4] ), 
        .D(n484), .Y(n218) );
  OAI22X1 U273 ( .A(\regs_matrix[4][4] ), .B(n494), .C(outreg_data[4]), .D(
        n487), .Y(n217) );
  NOR2X1 U274 ( .A(n219), .B(n220), .Y(n206) );
  OAI21X1 U275 ( .A(\regs_matrix[7][4] ), .B(n118), .C(n221), .Y(n220) );
  AOI21X1 U276 ( .A(n222), .B(n44), .C(N13), .Y(n221) );
  NOR2X1 U277 ( .A(\regs_matrix[5][4] ), .B(n33), .Y(n222) );
  OAI22X1 U278 ( .A(\regs_matrix[3][4] ), .B(n53), .C(\regs_matrix[6][4] ), 
        .D(n481), .Y(n219) );
  NOR2X1 U279 ( .A(n224), .B(n225), .Y(n100) );
  NAND3X1 U280 ( .A(n227), .B(n226), .C(n228), .Y(n225) );
  AOI22X1 U281 ( .A(n229), .B(n31), .C(n230), .D(n132), .Y(n228) );
  NOR2X1 U282 ( .A(\regs_matrix[1][5] ), .B(n231), .Y(n230) );
  NOR2X1 U283 ( .A(\regs_matrix[6][5] ), .B(n231), .Y(n229) );
  NAND2X1 U284 ( .A(n232), .B(n135), .Y(n227) );
  NOR2X1 U285 ( .A(\regs_matrix[2][5] ), .B(n231), .Y(n232) );
  AOI22X1 U286 ( .A(n233), .B(n79), .C(n234), .D(n83), .Y(n226) );
  NOR2X1 U287 ( .A(outreg_data[5]), .B(n231), .Y(n234) );
  NOR2X1 U288 ( .A(\regs_matrix[4][5] ), .B(n231), .Y(n233) );
  NAND2X1 U289 ( .A(n236), .B(n235), .Y(n224) );
  AOI22X1 U290 ( .A(N13), .B(n237), .C(n238), .D(n86), .Y(n236) );
  NOR2X1 U291 ( .A(\regs_matrix[7][5] ), .B(n231), .Y(n238) );
  AOI22X1 U292 ( .A(n239), .B(n89), .C(n240), .D(n15), .Y(n235) );
  NOR2X1 U293 ( .A(\regs_matrix[3][5] ), .B(n231), .Y(n240) );
  NOR2X1 U294 ( .A(\regs_matrix[5][5] ), .B(n231), .Y(n239) );
  INVX2 U295 ( .A(n237), .Y(n231) );
  NAND2X1 U296 ( .A(n241), .B(n242), .Y(n237) );
  NOR2X1 U297 ( .A(n243), .B(n244), .Y(n242) );
  OAI22X1 U298 ( .A(\regs_matrix[11][5] ), .B(n52), .C(\regs_matrix[13][5] ), 
        .D(n58), .Y(n244) );
  OAI21X1 U299 ( .A(\regs_matrix[15][5] ), .B(n485), .C(N13), .Y(n243) );
  NOR2X1 U300 ( .A(n245), .B(n246), .Y(n241) );
  OAI21X1 U301 ( .A(\regs_matrix[10][5] ), .B(n41), .C(n247), .Y(n246) );
  AOI22X1 U302 ( .A(n491), .B(n248), .C(n496), .D(n249), .Y(n247) );
  INVX2 U303 ( .A(\regs_matrix[12][5] ), .Y(n249) );
  INVX2 U304 ( .A(\regs_matrix[8][5] ), .Y(n248) );
  OAI22X1 U305 ( .A(\regs_matrix[9][5] ), .B(n21), .C(\regs_matrix[14][5] ), 
        .D(n35), .Y(n245) );
  AOI22X1 U306 ( .A(n251), .B(n252), .C(n253), .D(n254), .Y(n250) );
  NOR2X1 U307 ( .A(n255), .B(n256), .Y(n254) );
  OAI22X1 U308 ( .A(\regs_matrix[11][6] ), .B(n52), .C(\regs_matrix[13][6] ), 
        .D(n58), .Y(n256) );
  OAI21X1 U309 ( .A(\regs_matrix[15][6] ), .B(n485), .C(N13), .Y(n255) );
  NOR2X1 U310 ( .A(n257), .B(n258), .Y(n253) );
  OAI21X1 U311 ( .A(\regs_matrix[10][6] ), .B(n41), .C(n259), .Y(n258) );
  AOI22X1 U312 ( .A(n491), .B(n260), .C(n496), .D(n261), .Y(n259) );
  INVX2 U313 ( .A(\regs_matrix[12][6] ), .Y(n261) );
  INVX2 U314 ( .A(\regs_matrix[8][6] ), .Y(n260) );
  OAI22X1 U315 ( .A(\regs_matrix[9][6] ), .B(n21), .C(\regs_matrix[14][6] ), 
        .D(n35), .Y(n257) );
  NOR2X1 U316 ( .A(n262), .B(n263), .Y(n252) );
  OAI22X1 U317 ( .A(\regs_matrix[4][6] ), .B(n494), .C(\regs_matrix[1][6] ), 
        .D(n484), .Y(n263) );
  OAI22X1 U318 ( .A(\regs_matrix[2][6] ), .B(n42), .C(outreg_data[6]), .D(n487), .Y(n262) );
  NOR2X1 U319 ( .A(n265), .B(n264), .Y(n251) );
  OAI21X1 U320 ( .A(\regs_matrix[3][6] ), .B(n53), .C(n266), .Y(n265) );
  AOI21X1 U321 ( .A(n80), .B(n267), .C(N13), .Y(n266) );
  INVX2 U322 ( .A(\regs_matrix[6][6] ), .Y(n267) );
  OAI22X1 U323 ( .A(n28), .B(\regs_matrix[5][6] ), .C(\regs_matrix[7][6] ), 
        .D(n118), .Y(n264) );
  NOR2X1 U324 ( .A(n268), .B(n269), .Y(n101) );
  NAND3X1 U325 ( .A(n271), .B(n270), .C(n272), .Y(n269) );
  AOI22X1 U326 ( .A(n273), .B(n80), .C(n274), .D(n132), .Y(n272) );
  NOR2X1 U327 ( .A(\regs_matrix[1][7] ), .B(n275), .Y(n274) );
  NOR2X1 U328 ( .A(\regs_matrix[6][7] ), .B(n275), .Y(n273) );
  NAND2X1 U329 ( .A(n276), .B(n135), .Y(n271) );
  NOR2X1 U330 ( .A(\regs_matrix[2][7] ), .B(n275), .Y(n276) );
  AOI22X1 U331 ( .A(n82), .B(n277), .C(n278), .D(n81), .Y(n270) );
  NOR2X1 U332 ( .A(outreg_data[7]), .B(n275), .Y(n278) );
  NOR2X1 U333 ( .A(\regs_matrix[4][7] ), .B(n275), .Y(n277) );
  NAND2X1 U334 ( .A(n280), .B(n279), .Y(n268) );
  AOI22X1 U335 ( .A(N13), .B(n281), .C(n282), .D(n86), .Y(n280) );
  NOR2X1 U336 ( .A(\regs_matrix[7][7] ), .B(n275), .Y(n282) );
  AOI22X1 U337 ( .A(n283), .B(n89), .C(n14), .D(n284), .Y(n279) );
  NOR2X1 U338 ( .A(\regs_matrix[3][7] ), .B(n275), .Y(n284) );
  NOR2X1 U339 ( .A(\regs_matrix[5][7] ), .B(n275), .Y(n283) );
  INVX2 U340 ( .A(n281), .Y(n275) );
  NAND2X1 U341 ( .A(n285), .B(n286), .Y(n281) );
  NOR2X1 U342 ( .A(n287), .B(n288), .Y(n286) );
  OAI22X1 U343 ( .A(\regs_matrix[11][7] ), .B(n52), .C(\regs_matrix[13][7] ), 
        .D(n58), .Y(n288) );
  OAI21X1 U344 ( .A(\regs_matrix[15][7] ), .B(n485), .C(N13), .Y(n287) );
  NOR2X1 U345 ( .A(n289), .B(n290), .Y(n285) );
  OAI21X1 U346 ( .A(\regs_matrix[10][7] ), .B(n41), .C(n291), .Y(n290) );
  AOI22X1 U347 ( .A(n491), .B(n292), .C(n496), .D(n293), .Y(n291) );
  INVX2 U348 ( .A(\regs_matrix[12][7] ), .Y(n293) );
  INVX2 U349 ( .A(\regs_matrix[8][7] ), .Y(n292) );
  OAI22X1 U350 ( .A(\regs_matrix[9][7] ), .B(n21), .C(\regs_matrix[14][7] ), 
        .D(n35), .Y(n289) );
  AOI22X1 U351 ( .A(n295), .B(n296), .C(n297), .D(n298), .Y(n294) );
  NOR2X1 U352 ( .A(n299), .B(n300), .Y(n298) );
  OAI22X1 U353 ( .A(\regs_matrix[11][8] ), .B(n52), .C(\regs_matrix[13][8] ), 
        .D(n58), .Y(n300) );
  OAI21X1 U354 ( .A(\regs_matrix[15][8] ), .B(n485), .C(N13), .Y(n299) );
  NOR2X1 U355 ( .A(n301), .B(n302), .Y(n297) );
  OAI21X1 U356 ( .A(\regs_matrix[10][8] ), .B(n41), .C(n303), .Y(n302) );
  AOI22X1 U357 ( .A(n491), .B(n304), .C(n496), .D(n305), .Y(n303) );
  INVX2 U358 ( .A(\regs_matrix[12][8] ), .Y(n305) );
  INVX2 U359 ( .A(\regs_matrix[8][8] ), .Y(n304) );
  OAI22X1 U360 ( .A(\regs_matrix[9][8] ), .B(n21), .C(\regs_matrix[14][8] ), 
        .D(n35), .Y(n301) );
  NOR2X1 U361 ( .A(n307), .B(n306), .Y(n296) );
  OAI22X1 U362 ( .A(\regs_matrix[3][8] ), .B(n53), .C(\regs_matrix[6][8] ), 
        .D(n481), .Y(n307) );
  OAI22X1 U363 ( .A(\regs_matrix[2][8] ), .B(n42), .C(\regs_matrix[1][8] ), 
        .D(n484), .Y(n306) );
  NOR2X1 U364 ( .A(n308), .B(n309), .Y(n295) );
  OAI22X1 U365 ( .A(\regs_matrix[5][8] ), .B(n28), .C(outreg_data[8]), .D(n487), .Y(n309) );
  OAI21X1 U366 ( .A(\regs_matrix[4][8] ), .B(n494), .C(n310), .Y(n308) );
  AOI21X1 U367 ( .A(n311), .B(n86), .C(N13), .Y(n310) );
  INVX2 U368 ( .A(\regs_matrix[7][8] ), .Y(n311) );
  NOR2X1 U369 ( .A(n312), .B(n313), .Y(n96) );
  NAND3X1 U370 ( .A(n314), .B(n315), .C(n316), .Y(n313) );
  AOI22X1 U371 ( .A(n317), .B(n31), .C(n318), .D(n132), .Y(n316) );
  NOR2X1 U372 ( .A(\regs_matrix[1][9] ), .B(n319), .Y(n318) );
  NOR2X1 U373 ( .A(\regs_matrix[6][9] ), .B(n319), .Y(n317) );
  NAND2X1 U374 ( .A(n320), .B(n135), .Y(n315) );
  NOR2X1 U375 ( .A(\regs_matrix[2][9] ), .B(n319), .Y(n320) );
  AOI22X1 U376 ( .A(n79), .B(n321), .C(n322), .D(n81), .Y(n314) );
  NOR2X1 U377 ( .A(outreg_data[9]), .B(n319), .Y(n322) );
  NOR2X1 U378 ( .A(\regs_matrix[4][9] ), .B(n319), .Y(n321) );
  NAND2X1 U379 ( .A(n324), .B(n323), .Y(n312) );
  AOI22X1 U380 ( .A(N13), .B(n325), .C(n326), .D(n47), .Y(n324) );
  NOR2X1 U381 ( .A(\regs_matrix[7][9] ), .B(n319), .Y(n326) );
  AOI22X1 U382 ( .A(n327), .B(n89), .C(n14), .D(n328), .Y(n323) );
  NOR2X1 U383 ( .A(\regs_matrix[3][9] ), .B(n319), .Y(n328) );
  NOR2X1 U384 ( .A(\regs_matrix[5][9] ), .B(n319), .Y(n327) );
  INVX2 U385 ( .A(n325), .Y(n319) );
  NAND2X1 U386 ( .A(n329), .B(n330), .Y(n325) );
  NOR2X1 U387 ( .A(n331), .B(n332), .Y(n330) );
  OAI22X1 U388 ( .A(\regs_matrix[11][9] ), .B(n52), .C(\regs_matrix[13][9] ), 
        .D(n58), .Y(n332) );
  OAI21X1 U389 ( .A(\regs_matrix[15][9] ), .B(n485), .C(N13), .Y(n331) );
  NOR2X1 U390 ( .A(n333), .B(n334), .Y(n329) );
  OAI21X1 U391 ( .A(\regs_matrix[10][9] ), .B(n41), .C(n335), .Y(n334) );
  AOI22X1 U392 ( .A(n491), .B(n336), .C(n496), .D(n337), .Y(n335) );
  INVX2 U393 ( .A(\regs_matrix[12][9] ), .Y(n337) );
  INVX2 U394 ( .A(\regs_matrix[8][9] ), .Y(n336) );
  OAI22X1 U395 ( .A(\regs_matrix[9][9] ), .B(n21), .C(\regs_matrix[14][9] ), 
        .D(n35), .Y(n333) );
  AOI22X1 U396 ( .A(n339), .B(n340), .C(n341), .D(n342), .Y(n338) );
  NOR2X1 U397 ( .A(n343), .B(n344), .Y(n342) );
  OAI22X1 U398 ( .A(\regs_matrix[11][10] ), .B(n52), .C(\regs_matrix[13][10] ), 
        .D(n58), .Y(n344) );
  OAI21X1 U399 ( .A(\regs_matrix[15][10] ), .B(n485), .C(N13), .Y(n343) );
  NOR2X1 U400 ( .A(n345), .B(n346), .Y(n341) );
  OAI21X1 U401 ( .A(\regs_matrix[10][10] ), .B(n41), .C(n347), .Y(n346) );
  AOI22X1 U402 ( .A(n491), .B(n348), .C(n496), .D(n349), .Y(n347) );
  INVX2 U403 ( .A(\regs_matrix[12][10] ), .Y(n349) );
  INVX2 U404 ( .A(\regs_matrix[8][10] ), .Y(n348) );
  OAI22X1 U405 ( .A(\regs_matrix[9][10] ), .B(n21), .C(\regs_matrix[14][10] ), 
        .D(n35), .Y(n345) );
  NOR2X1 U406 ( .A(n351), .B(n350), .Y(n340) );
  OAI22X1 U407 ( .A(outreg_data[10]), .B(n487), .C(\regs_matrix[2][10] ), .D(
        n42), .Y(n351) );
  OAI22X1 U408 ( .A(\regs_matrix[4][10] ), .B(n24), .C(\regs_matrix[5][10] ), 
        .D(n28), .Y(n350) );
  NOR2X1 U409 ( .A(n352), .B(n353), .Y(n339) );
  OAI21X1 U410 ( .A(\regs_matrix[6][10] ), .B(n481), .C(n354), .Y(n353) );
  AOI21X1 U411 ( .A(n47), .B(n355), .C(N13), .Y(n354) );
  INVX2 U412 ( .A(\regs_matrix[7][10] ), .Y(n355) );
  OAI22X1 U413 ( .A(\regs_matrix[1][10] ), .B(n484), .C(\regs_matrix[3][10] ), 
        .D(n53), .Y(n352) );
  NOR2X1 U414 ( .A(n356), .B(n357), .Y(n99) );
  NAND3X1 U415 ( .A(n359), .B(n358), .C(n360), .Y(n357) );
  AOI22X1 U416 ( .A(n361), .B(n31), .C(n362), .D(n132), .Y(n360) );
  NOR2X1 U417 ( .A(\regs_matrix[1][11] ), .B(n363), .Y(n362) );
  NOR2X1 U418 ( .A(\regs_matrix[6][11] ), .B(n363), .Y(n361) );
  NAND2X1 U419 ( .A(n364), .B(n135), .Y(n359) );
  NOR2X1 U420 ( .A(\regs_matrix[2][11] ), .B(n363), .Y(n364) );
  AOI22X1 U421 ( .A(n82), .B(n365), .C(n366), .D(n81), .Y(n358) );
  NOR2X1 U422 ( .A(outreg_data[11]), .B(n363), .Y(n366) );
  NOR2X1 U423 ( .A(\regs_matrix[4][11] ), .B(n363), .Y(n365) );
  NAND2X1 U424 ( .A(n368), .B(n367), .Y(n356) );
  AOI22X1 U425 ( .A(N13), .B(n369), .C(n370), .D(n86), .Y(n368) );
  NOR2X1 U426 ( .A(\regs_matrix[7][11] ), .B(n363), .Y(n370) );
  AOI22X1 U427 ( .A(n371), .B(n89), .C(n13), .D(n372), .Y(n367) );
  NOR2X1 U428 ( .A(\regs_matrix[3][11] ), .B(n363), .Y(n372) );
  NOR2X1 U429 ( .A(\regs_matrix[5][11] ), .B(n363), .Y(n371) );
  INVX2 U430 ( .A(n369), .Y(n363) );
  NAND2X1 U431 ( .A(n373), .B(n374), .Y(n369) );
  NOR2X1 U432 ( .A(n375), .B(n376), .Y(n374) );
  OAI22X1 U433 ( .A(\regs_matrix[11][11] ), .B(n52), .C(\regs_matrix[13][11] ), 
        .D(n58), .Y(n376) );
  OAI21X1 U434 ( .A(\regs_matrix[15][11] ), .B(n485), .C(N13), .Y(n375) );
  NOR2X1 U435 ( .A(n377), .B(n378), .Y(n373) );
  OAI21X1 U436 ( .A(\regs_matrix[10][11] ), .B(n41), .C(n379), .Y(n378) );
  AOI22X1 U437 ( .A(n491), .B(n380), .C(n496), .D(n381), .Y(n379) );
  INVX2 U438 ( .A(\regs_matrix[12][11] ), .Y(n381) );
  INVX2 U439 ( .A(\regs_matrix[8][11] ), .Y(n380) );
  OAI22X1 U440 ( .A(\regs_matrix[9][11] ), .B(n21), .C(\regs_matrix[14][11] ), 
        .D(n35), .Y(n377) );
  AOI22X1 U441 ( .A(n383), .B(n384), .C(n385), .D(n386), .Y(n382) );
  NOR2X1 U442 ( .A(n387), .B(n388), .Y(n386) );
  OAI22X1 U443 ( .A(\regs_matrix[11][12] ), .B(n52), .C(\regs_matrix[13][12] ), 
        .D(n58), .Y(n388) );
  OAI21X1 U444 ( .A(\regs_matrix[15][12] ), .B(n485), .C(N13), .Y(n387) );
  NOR2X1 U445 ( .A(n389), .B(n390), .Y(n385) );
  OAI21X1 U446 ( .A(\regs_matrix[10][12] ), .B(n41), .C(n391), .Y(n390) );
  AOI22X1 U447 ( .A(n491), .B(n392), .C(n496), .D(n393), .Y(n391) );
  INVX2 U448 ( .A(\regs_matrix[12][12] ), .Y(n393) );
  INVX2 U449 ( .A(\regs_matrix[8][12] ), .Y(n392) );
  OAI22X1 U450 ( .A(\regs_matrix[9][12] ), .B(n21), .C(\regs_matrix[14][12] ), 
        .D(n35), .Y(n389) );
  NOR2X1 U451 ( .A(n394), .B(n395), .Y(n384) );
  OAI22X1 U452 ( .A(outreg_data[12]), .B(n43), .C(\regs_matrix[2][12] ), .D(
        n42), .Y(n395) );
  OAI22X1 U453 ( .A(\regs_matrix[4][12] ), .B(n494), .C(\regs_matrix[5][12] ), 
        .D(n28), .Y(n394) );
  NOR2X1 U454 ( .A(n396), .B(n397), .Y(n383) );
  OAI21X1 U455 ( .A(\regs_matrix[6][12] ), .B(n481), .C(n398), .Y(n397) );
  AOI21X1 U456 ( .A(n86), .B(n399), .C(N13), .Y(n398) );
  INVX2 U457 ( .A(\regs_matrix[7][12] ), .Y(n399) );
  OAI22X1 U458 ( .A(\regs_matrix[1][12] ), .B(n484), .C(\regs_matrix[3][12] ), 
        .D(n53), .Y(n396) );
  NAND3X1 U459 ( .A(n402), .B(n403), .C(n404), .Y(n401) );
  AOI22X1 U460 ( .A(n405), .B(n31), .C(n406), .D(n132), .Y(n404) );
  NAND2X1 U461 ( .A(n55), .B(n27), .Y(n407) );
  NOR2X1 U462 ( .A(\regs_matrix[1][13] ), .B(n408), .Y(n406) );
  NOR2X1 U463 ( .A(\regs_matrix[6][13] ), .B(n408), .Y(n405) );
  NAND2X1 U464 ( .A(n409), .B(n135), .Y(n403) );
  NAND2X1 U465 ( .A(n90), .B(n33), .Y(n165) );
  NOR2X1 U466 ( .A(\regs_matrix[2][13] ), .B(n408), .Y(n409) );
  AOI22X1 U467 ( .A(n82), .B(n410), .C(n411), .D(n83), .Y(n402) );
  NOR2X1 U468 ( .A(outreg_data[13]), .B(n408), .Y(n411) );
  NOR2X1 U469 ( .A(\regs_matrix[4][13] ), .B(n408), .Y(n410) );
  NAND2X1 U470 ( .A(n414), .B(n415), .Y(n400) );
  AOI22X1 U471 ( .A(N13), .B(n416), .C(n417), .D(n86), .Y(n415) );
  NOR2X1 U472 ( .A(\regs_matrix[7][13] ), .B(n408), .Y(n417) );
  AOI22X1 U473 ( .A(n418), .B(n88), .C(n419), .D(n15), .Y(n414) );
  NOR2X1 U474 ( .A(\regs_matrix[3][13] ), .B(n408), .Y(n419) );
  NOR2X1 U475 ( .A(\regs_matrix[5][13] ), .B(n408), .Y(n418) );
  INVX2 U476 ( .A(n416), .Y(n408) );
  NAND2X1 U477 ( .A(n420), .B(n421), .Y(n416) );
  NOR2X1 U478 ( .A(n422), .B(n423), .Y(n421) );
  OAI22X1 U479 ( .A(\regs_matrix[11][13] ), .B(n52), .C(\regs_matrix[13][13] ), 
        .D(n58), .Y(n423) );
  OAI21X1 U480 ( .A(\regs_matrix[15][13] ), .B(n485), .C(N13), .Y(n422) );
  NOR2X1 U481 ( .A(n424), .B(n425), .Y(n420) );
  OAI21X1 U482 ( .A(\regs_matrix[10][13] ), .B(n41), .C(n426), .Y(n425) );
  AOI22X1 U483 ( .A(n491), .B(n427), .C(n496), .D(n428), .Y(n426) );
  INVX2 U484 ( .A(\regs_matrix[12][13] ), .Y(n428) );
  INVX2 U485 ( .A(\regs_matrix[8][13] ), .Y(n427) );
  OAI22X1 U486 ( .A(\regs_matrix[9][13] ), .B(n21), .C(\regs_matrix[14][13] ), 
        .D(n35), .Y(n424) );
  AOI22X1 U487 ( .A(n430), .B(n431), .C(n432), .D(n433), .Y(n429) );
  NOR2X1 U488 ( .A(n434), .B(n435), .Y(n433) );
  OAI22X1 U489 ( .A(\regs_matrix[11][14] ), .B(n52), .C(\regs_matrix[13][14] ), 
        .D(n58), .Y(n435) );
  OAI21X1 U490 ( .A(\regs_matrix[15][14] ), .B(n485), .C(N13), .Y(n434) );
  NOR2X1 U491 ( .A(n436), .B(n437), .Y(n432) );
  OAI21X1 U492 ( .A(\regs_matrix[10][14] ), .B(n41), .C(n438), .Y(n437) );
  AOI22X1 U493 ( .A(n491), .B(n439), .C(n496), .D(n440), .Y(n438) );
  INVX2 U494 ( .A(\regs_matrix[12][14] ), .Y(n440) );
  INVX2 U495 ( .A(\regs_matrix[8][14] ), .Y(n439) );
  OAI22X1 U496 ( .A(\regs_matrix[9][14] ), .B(n21), .C(\regs_matrix[14][14] ), 
        .D(n35), .Y(n436) );
  NOR2X1 U497 ( .A(n442), .B(n441), .Y(n431) );
  OAI22X1 U498 ( .A(\regs_matrix[4][14] ), .B(n494), .C(\regs_matrix[1][14] ), 
        .D(n484), .Y(n442) );
  OAI22X1 U499 ( .A(\regs_matrix[2][14] ), .B(n482), .C(outreg_data[14]), .D(
        n487), .Y(n441) );
  NOR2X1 U500 ( .A(n444), .B(n443), .Y(n430) );
  OAI21X1 U501 ( .A(\regs_matrix[3][14] ), .B(n53), .C(n445), .Y(n444) );
  AOI21X1 U502 ( .A(n446), .B(n31), .C(N13), .Y(n445) );
  INVX2 U503 ( .A(\regs_matrix[6][14] ), .Y(n446) );
  OAI22X1 U504 ( .A(\regs_matrix[5][14] ), .B(n480), .C(\regs_matrix[7][14] ), 
        .D(n118), .Y(n443) );
  AOI22X1 U505 ( .A(n448), .B(n449), .C(n450), .D(n451), .Y(n447) );
  NOR2X1 U506 ( .A(n452), .B(n453), .Y(n451) );
  OAI22X1 U507 ( .A(\regs_matrix[3][15] ), .B(n53), .C(\regs_matrix[5][15] ), 
        .D(n28), .Y(n453) );
  OAI21X1 U508 ( .A(\regs_matrix[7][15] ), .B(n118), .C(n95), .Y(n452) );
  NOR2X1 U509 ( .A(n454), .B(n455), .Y(n450) );
  OAI21X1 U510 ( .A(n482), .B(\regs_matrix[2][15] ), .C(n456), .Y(n455) );
  AOI22X1 U511 ( .A(n81), .B(n457), .C(n489), .D(n458), .Y(n456) );
  INVX2 U512 ( .A(\regs_matrix[4][15] ), .Y(n458) );
  INVX2 U513 ( .A(outreg_data[15]), .Y(n457) );
  OAI22X1 U514 ( .A(\regs_matrix[1][15] ), .B(n484), .C(\regs_matrix[6][15] ), 
        .D(n481), .Y(n454) );
  NOR2X1 U515 ( .A(n459), .B(n460), .Y(n449) );
  OAI22X1 U516 ( .A(\regs_matrix[11][15] ), .B(n52), .C(\regs_matrix[13][15] ), 
        .D(n58), .Y(n460) );
  OAI21X1 U517 ( .A(\regs_matrix[15][15] ), .B(n485), .C(N13), .Y(n459) );
  NOR2X1 U518 ( .A(n461), .B(n462), .Y(n448) );
  OAI21X1 U519 ( .A(\regs_matrix[10][15] ), .B(n41), .C(n463), .Y(n462) );
  AOI22X1 U520 ( .A(n491), .B(n464), .C(n496), .D(n465), .Y(n463) );
  INVX2 U521 ( .A(\regs_matrix[12][15] ), .Y(n465) );
  INVX2 U522 ( .A(\regs_matrix[8][15] ), .Y(n464) );
  OAI22X1 U523 ( .A(\regs_matrix[9][15] ), .B(n21), .C(\regs_matrix[14][15] ), 
        .D(n35), .Y(n461) );
  MUX2X1 U524 ( .B(n466), .A(n467), .S(N13), .Y(r1_data[16]) );
  NAND2X1 U525 ( .A(n468), .B(n469), .Y(n467) );
  NOR2X1 U526 ( .A(n470), .B(n471), .Y(n469) );
  OAI22X1 U527 ( .A(\regs_matrix[13][16] ), .B(n58), .C(\regs_matrix[9][16] ), 
        .D(n21), .Y(n471) );
  OAI22X1 U528 ( .A(\regs_matrix[15][16] ), .B(n485), .C(\regs_matrix[11][16] ), .D(n52), .Y(n470) );
  NOR2X1 U529 ( .A(n472), .B(n473), .Y(n468) );
  OAI22X1 U530 ( .A(\regs_matrix[12][16] ), .B(n488), .C(\regs_matrix[8][16] ), 
        .D(n43), .Y(n473) );
  OAI22X1 U531 ( .A(\regs_matrix[14][16] ), .B(n35), .C(\regs_matrix[10][16] ), 
        .D(n41), .Y(n472) );
  NAND2X1 U532 ( .A(n474), .B(n475), .Y(n466) );
  NOR2X1 U533 ( .A(n476), .B(n477), .Y(n475) );
  OAI22X1 U534 ( .A(\regs_matrix[5][16] ), .B(n57), .C(\regs_matrix[1][16] ), 
        .D(n9), .Y(n477) );
  NAND2X1 U535 ( .A(n12), .B(n55), .Y(n115) );
  OAI22X1 U536 ( .A(\regs_matrix[7][16] ), .B(n485), .C(\regs_matrix[3][16] ), 
        .D(n16), .Y(n476) );
  NOR2X1 U537 ( .A(n478), .B(n479), .Y(n474) );
  OAI22X1 U538 ( .A(\regs_matrix[4][16] ), .B(n24), .C(outreg_data[16]), .D(
        n43), .Y(n479) );
  NAND2X1 U539 ( .A(n91), .B(n223), .Y(n110) );
  OAI22X1 U540 ( .A(\regs_matrix[6][16] ), .B(n481), .C(n42), .D(
        \regs_matrix[2][16] ), .Y(n478) );
  BUFX4 U541 ( .A(n99), .Y(r1_data[11]) );
  BUFX4 U542 ( .A(n96), .Y(r1_data[9]) );
  BUFX4 U543 ( .A(n101), .Y(r1_data[7]) );
  BUFX4 U544 ( .A(n100), .Y(r1_data[5]) );
  BUFX4 U545 ( .A(n98), .Y(r1_data[3]) );
  INVX8 U546 ( .A(n483), .Y(n484) );
  NAND2X1 U547 ( .A(n12), .B(n92), .Y(n486) );
  INVX4 U548 ( .A(n407), .Y(n132) );
  AND2X2 U549 ( .A(n85), .B(n33), .Y(n490) );
  NOR2X1 U550 ( .A(n493), .B(n153), .Y(n492) );
  AND2X2 U551 ( .A(n154), .B(n492), .Y(r1_data[2]) );
  INVX4 U552 ( .A(n429), .Y(r1_data[14]) );
  INVX4 U553 ( .A(n115), .Y(n483) );
  INVX4 U554 ( .A(n338), .Y(r1_data[10]) );
  INVX4 U555 ( .A(n382), .Y(r1_data[12]) );
  INVX1 U556 ( .A(n110), .Y(n489) );
  INVX1 U557 ( .A(n489), .Y(n488) );
  INVX4 U558 ( .A(n495), .Y(n494) );
  INVX2 U559 ( .A(n488), .Y(n496) );
  INVX1 U560 ( .A(n155), .Y(n493) );
  INVX4 U561 ( .A(n490), .Y(n487) );
  INVX2 U562 ( .A(n487), .Y(n122) );
  MUX2X1 U563 ( .B(n497), .A(n498), .S(n769), .Y(r2_data[0]) );
  NAND2X1 U564 ( .A(n500), .B(n499), .Y(n498) );
  NOR2X1 U565 ( .A(n502), .B(n501), .Y(n500) );
  OAI22X1 U566 ( .A(\regs_matrix[8][0] ), .B(n746), .C(\regs_matrix[10][0] ), 
        .D(n750), .Y(n502) );
  OAI22X1 U567 ( .A(\regs_matrix[12][0] ), .B(n754), .C(\regs_matrix[14][0] ), 
        .D(n32), .Y(n501) );
  NOR2X1 U568 ( .A(n507), .B(n508), .Y(n499) );
  OAI22X1 U569 ( .A(\regs_matrix[11][0] ), .B(n6), .C(\regs_matrix[9][0] ), 
        .D(n761), .Y(n508) );
  OAI22X1 U570 ( .A(\regs_matrix[13][0] ), .B(n767), .C(\regs_matrix[15][0] ), 
        .D(n68), .Y(n507) );
  NAND2X1 U571 ( .A(n511), .B(n512), .Y(n497) );
  NOR2X1 U572 ( .A(n513), .B(n514), .Y(n512) );
  OAI22X1 U573 ( .A(outreg_data[0]), .B(n746), .C(\regs_matrix[2][0] ), .D(
        n749), .Y(n514) );
  OAI22X1 U574 ( .A(\regs_matrix[4][0] ), .B(n754), .C(\regs_matrix[6][0] ), 
        .D(n756), .Y(n513) );
  NOR2X1 U575 ( .A(n515), .B(n516), .Y(n511) );
  OAI22X1 U576 ( .A(\regs_matrix[3][0] ), .B(n59), .C(\regs_matrix[1][0] ), 
        .D(n761), .Y(n516) );
  OAI22X1 U577 ( .A(\regs_matrix[5][0] ), .B(n765), .C(n76), .D(
        \regs_matrix[7][0] ), .Y(n515) );
  NAND2X1 U578 ( .A(n520), .B(n519), .Y(n518) );
  NOR2X1 U579 ( .A(n522), .B(n521), .Y(n520) );
  OAI22X1 U580 ( .A(\regs_matrix[8][1] ), .B(n745), .C(\regs_matrix[10][1] ), 
        .D(n749), .Y(n522) );
  OAI22X1 U581 ( .A(\regs_matrix[12][1] ), .B(n754), .C(\regs_matrix[14][1] ), 
        .D(n32), .Y(n521) );
  NOR2X1 U582 ( .A(n523), .B(n524), .Y(n519) );
  OAI22X1 U583 ( .A(\regs_matrix[11][1] ), .B(n59), .C(\regs_matrix[9][1] ), 
        .D(n761), .Y(n524) );
  OAI22X1 U584 ( .A(\regs_matrix[13][1] ), .B(n765), .C(\regs_matrix[15][1] ), 
        .D(n73), .Y(n523) );
  NAND2X1 U585 ( .A(n525), .B(n526), .Y(n517) );
  NOR2X1 U586 ( .A(n527), .B(n528), .Y(n526) );
  OAI22X1 U587 ( .A(outreg_data[1]), .B(n745), .C(\regs_matrix[2][1] ), .D(
        n749), .Y(n528) );
  OAI22X1 U588 ( .A(\regs_matrix[4][1] ), .B(n754), .C(\regs_matrix[6][1] ), 
        .D(n32), .Y(n527) );
  NOR2X1 U589 ( .A(n529), .B(n530), .Y(n525) );
  OAI22X1 U590 ( .A(\regs_matrix[3][1] ), .B(n59), .C(\regs_matrix[1][1] ), 
        .D(n761), .Y(n530) );
  OAI22X1 U591 ( .A(\regs_matrix[5][1] ), .B(n767), .C(\regs_matrix[7][1] ), 
        .D(n73), .Y(n529) );
  MUX2X1 U592 ( .B(n531), .A(n532), .S(n769), .Y(r2_data[2]) );
  NAND2X1 U593 ( .A(n533), .B(n534), .Y(n532) );
  NOR2X1 U594 ( .A(n535), .B(n536), .Y(n534) );
  OAI22X1 U595 ( .A(\regs_matrix[8][2] ), .B(n747), .C(\regs_matrix[10][2] ), 
        .D(n749), .Y(n536) );
  OAI22X1 U596 ( .A(\regs_matrix[12][2] ), .B(n753), .C(\regs_matrix[14][2] ), 
        .D(n757), .Y(n535) );
  NOR2X1 U597 ( .A(n537), .B(n538), .Y(n533) );
  OAI22X1 U598 ( .A(\regs_matrix[11][2] ), .B(n59), .C(\regs_matrix[9][2] ), 
        .D(n761), .Y(n538) );
  OAI22X1 U599 ( .A(\regs_matrix[13][2] ), .B(n765), .C(\regs_matrix[15][2] ), 
        .D(n50), .Y(n537) );
  NAND2X1 U600 ( .A(n539), .B(n540), .Y(n531) );
  NOR2X1 U601 ( .A(n541), .B(n542), .Y(n540) );
  OAI22X1 U602 ( .A(outreg_data[2]), .B(n747), .C(\regs_matrix[2][2] ), .D(n29), .Y(n542) );
  OAI22X1 U603 ( .A(\regs_matrix[4][2] ), .B(n753), .C(\regs_matrix[6][2] ), 
        .D(n32), .Y(n541) );
  NOR2X1 U604 ( .A(n543), .B(n544), .Y(n539) );
  OAI22X1 U605 ( .A(\regs_matrix[3][2] ), .B(n59), .C(\regs_matrix[1][2] ), 
        .D(n761), .Y(n544) );
  OAI22X1 U606 ( .A(\regs_matrix[5][2] ), .B(n766), .C(\regs_matrix[7][2] ), 
        .D(n66), .Y(n543) );
  MUX2X1 U607 ( .B(n545), .A(n546), .S(n768), .Y(r2_data[3]) );
  NAND2X1 U608 ( .A(n547), .B(n548), .Y(n546) );
  NOR2X1 U609 ( .A(n549), .B(n550), .Y(n548) );
  OAI22X1 U610 ( .A(\regs_matrix[8][3] ), .B(n745), .C(\regs_matrix[10][3] ), 
        .D(n29), .Y(n550) );
  OAI22X1 U611 ( .A(\regs_matrix[12][3] ), .B(n753), .C(\regs_matrix[14][3] ), 
        .D(n757), .Y(n549) );
  NOR2X1 U612 ( .A(n551), .B(n552), .Y(n547) );
  OAI22X1 U613 ( .A(\regs_matrix[11][3] ), .B(n59), .C(\regs_matrix[9][3] ), 
        .D(n761), .Y(n552) );
  OAI22X1 U614 ( .A(\regs_matrix[13][3] ), .B(n767), .C(\regs_matrix[15][3] ), 
        .D(n64), .Y(n551) );
  NAND2X1 U615 ( .A(n554), .B(n553), .Y(n545) );
  NOR2X1 U616 ( .A(n555), .B(n556), .Y(n554) );
  OAI22X1 U617 ( .A(outreg_data[3]), .B(n747), .C(\regs_matrix[2][3] ), .D(
        n749), .Y(n556) );
  OAI22X1 U618 ( .A(\regs_matrix[4][3] ), .B(n754), .C(\regs_matrix[6][3] ), 
        .D(n32), .Y(n555) );
  NOR2X1 U619 ( .A(n558), .B(n557), .Y(n553) );
  OAI22X1 U620 ( .A(\regs_matrix[3][3] ), .B(n59), .C(\regs_matrix[1][3] ), 
        .D(n761), .Y(n558) );
  OAI22X1 U621 ( .A(\regs_matrix[5][3] ), .B(n767), .C(\regs_matrix[7][3] ), 
        .D(n74), .Y(n557) );
  NAND2X1 U622 ( .A(n562), .B(n561), .Y(n560) );
  NOR2X1 U623 ( .A(n563), .B(n564), .Y(n562) );
  OAI22X1 U624 ( .A(\regs_matrix[8][4] ), .B(n747), .C(\regs_matrix[10][4] ), 
        .D(n29), .Y(n564) );
  OAI22X1 U625 ( .A(\regs_matrix[12][4] ), .B(n753), .C(\regs_matrix[14][4] ), 
        .D(n756), .Y(n563) );
  NOR2X1 U626 ( .A(n565), .B(n566), .Y(n561) );
  OAI22X1 U627 ( .A(\regs_matrix[11][4] ), .B(n59), .C(\regs_matrix[9][4] ), 
        .D(n761), .Y(n566) );
  OAI22X1 U628 ( .A(\regs_matrix[13][4] ), .B(n767), .C(\regs_matrix[15][4] ), 
        .D(n64), .Y(n565) );
  NAND2X1 U629 ( .A(n567), .B(n568), .Y(n559) );
  NOR2X1 U630 ( .A(n569), .B(n570), .Y(n568) );
  OAI22X1 U631 ( .A(outreg_data[4]), .B(n745), .C(\regs_matrix[2][4] ), .D(n29), .Y(n570) );
  OAI22X1 U632 ( .A(\regs_matrix[4][4] ), .B(n753), .C(\regs_matrix[6][4] ), 
        .D(n756), .Y(n569) );
  NOR2X1 U633 ( .A(n571), .B(n572), .Y(n567) );
  OAI22X1 U634 ( .A(\regs_matrix[3][4] ), .B(n54), .C(\regs_matrix[1][4] ), 
        .D(n761), .Y(n572) );
  OAI22X1 U635 ( .A(\regs_matrix[5][4] ), .B(n765), .C(n65), .D(
        \regs_matrix[7][4] ), .Y(n571) );
  NAND2X1 U636 ( .A(n576), .B(n575), .Y(n574) );
  NOR2X1 U637 ( .A(n577), .B(n578), .Y(n576) );
  OAI22X1 U638 ( .A(\regs_matrix[8][5] ), .B(n745), .C(\regs_matrix[10][5] ), 
        .D(n749), .Y(n578) );
  OAI22X1 U639 ( .A(\regs_matrix[12][5] ), .B(n753), .C(\regs_matrix[14][5] ), 
        .D(n757), .Y(n577) );
  NOR2X1 U640 ( .A(n580), .B(n579), .Y(n575) );
  OAI22X1 U641 ( .A(\regs_matrix[11][5] ), .B(n59), .C(\regs_matrix[9][5] ), 
        .D(n762), .Y(n580) );
  OAI22X1 U642 ( .A(\regs_matrix[13][5] ), .B(n765), .C(\regs_matrix[15][5] ), 
        .D(n50), .Y(n579) );
  NAND2X1 U643 ( .A(n581), .B(n582), .Y(n573) );
  NOR2X1 U644 ( .A(n583), .B(n584), .Y(n582) );
  OAI22X1 U645 ( .A(outreg_data[5]), .B(n747), .C(\regs_matrix[2][5] ), .D(n29), .Y(n584) );
  OAI22X1 U646 ( .A(\regs_matrix[4][5] ), .B(n753), .C(\regs_matrix[6][5] ), 
        .D(n756), .Y(n583) );
  NOR2X1 U647 ( .A(n585), .B(n586), .Y(n581) );
  OAI22X1 U648 ( .A(\regs_matrix[3][5] ), .B(n59), .C(\regs_matrix[1][5] ), 
        .D(n762), .Y(n586) );
  OAI22X1 U649 ( .A(\regs_matrix[5][5] ), .B(n767), .C(\regs_matrix[7][5] ), 
        .D(n50), .Y(n585) );
  NAND2X1 U650 ( .A(n589), .B(n590), .Y(n588) );
  NOR2X1 U651 ( .A(n591), .B(n592), .Y(n590) );
  OAI22X1 U652 ( .A(\regs_matrix[8][6] ), .B(n745), .C(\regs_matrix[10][6] ), 
        .D(n749), .Y(n592) );
  OAI22X1 U653 ( .A(\regs_matrix[12][6] ), .B(n754), .C(\regs_matrix[14][6] ), 
        .D(n757), .Y(n591) );
  NOR2X1 U654 ( .A(n594), .B(n593), .Y(n589) );
  OAI22X1 U655 ( .A(\regs_matrix[11][6] ), .B(n59), .C(\regs_matrix[9][6] ), 
        .D(n762), .Y(n594) );
  OAI22X1 U656 ( .A(\regs_matrix[13][6] ), .B(n767), .C(\regs_matrix[15][6] ), 
        .D(n70), .Y(n593) );
  NAND2X1 U657 ( .A(n596), .B(n595), .Y(n587) );
  NOR2X1 U658 ( .A(n597), .B(n598), .Y(n596) );
  OAI22X1 U659 ( .A(outreg_data[6]), .B(n745), .C(\regs_matrix[2][6] ), .D(
        n751), .Y(n598) );
  OAI22X1 U660 ( .A(\regs_matrix[4][6] ), .B(n754), .C(\regs_matrix[6][6] ), 
        .D(n757), .Y(n597) );
  NOR2X1 U661 ( .A(n599), .B(n600), .Y(n595) );
  OAI22X1 U662 ( .A(\regs_matrix[3][6] ), .B(n6), .C(\regs_matrix[1][6] ), .D(
        n762), .Y(n600) );
  OAI22X1 U663 ( .A(\regs_matrix[5][6] ), .B(n767), .C(\regs_matrix[7][6] ), 
        .D(n76), .Y(n599) );
  NAND2X1 U664 ( .A(n603), .B(n604), .Y(n602) );
  NOR2X1 U665 ( .A(n605), .B(n606), .Y(n604) );
  OAI22X1 U666 ( .A(\regs_matrix[8][7] ), .B(n745), .C(\regs_matrix[10][7] ), 
        .D(n751), .Y(n606) );
  OAI22X1 U667 ( .A(\regs_matrix[12][7] ), .B(n753), .C(\regs_matrix[14][7] ), 
        .D(n32), .Y(n605) );
  NOR2X1 U668 ( .A(n607), .B(n608), .Y(n603) );
  OAI22X1 U669 ( .A(\regs_matrix[11][7] ), .B(n37), .C(\regs_matrix[9][7] ), 
        .D(n762), .Y(n608) );
  OAI22X1 U670 ( .A(\regs_matrix[13][7] ), .B(n767), .C(\regs_matrix[15][7] ), 
        .D(n73), .Y(n607) );
  NAND2X1 U671 ( .A(n609), .B(n610), .Y(n601) );
  NOR2X1 U672 ( .A(n611), .B(n612), .Y(n610) );
  OAI22X1 U673 ( .A(outreg_data[7]), .B(n745), .C(\regs_matrix[2][7] ), .D(n29), .Y(n612) );
  OAI22X1 U674 ( .A(\regs_matrix[4][7] ), .B(n753), .C(\regs_matrix[6][7] ), 
        .D(n756), .Y(n611) );
  NOR2X1 U675 ( .A(n613), .B(n614), .Y(n609) );
  OAI22X1 U676 ( .A(\regs_matrix[3][7] ), .B(n59), .C(\regs_matrix[1][7] ), 
        .D(n762), .Y(n614) );
  OAI22X1 U677 ( .A(\regs_matrix[5][7] ), .B(n766), .C(\regs_matrix[7][7] ), 
        .D(n76), .Y(n613) );
  NAND2X1 U678 ( .A(n617), .B(n618), .Y(n616) );
  NOR2X1 U679 ( .A(n619), .B(n620), .Y(n618) );
  OAI22X1 U680 ( .A(\regs_matrix[8][8] ), .B(n746), .C(\regs_matrix[10][8] ), 
        .D(n29), .Y(n620) );
  OAI22X1 U681 ( .A(\regs_matrix[12][8] ), .B(n754), .C(\regs_matrix[14][8] ), 
        .D(n756), .Y(n619) );
  NOR2X1 U682 ( .A(n621), .B(n622), .Y(n617) );
  OAI22X1 U683 ( .A(\regs_matrix[11][8] ), .B(n37), .C(\regs_matrix[9][8] ), 
        .D(n762), .Y(n622) );
  OAI22X1 U684 ( .A(\regs_matrix[13][8] ), .B(n766), .C(\regs_matrix[15][8] ), 
        .D(n73), .Y(n621) );
  NAND2X1 U685 ( .A(n623), .B(n624), .Y(n615) );
  NOR2X1 U686 ( .A(n626), .B(n625), .Y(n624) );
  OAI22X1 U687 ( .A(outreg_data[8]), .B(n746), .C(\regs_matrix[2][8] ), .D(
        n750), .Y(n626) );
  OAI22X1 U688 ( .A(\regs_matrix[4][8] ), .B(n754), .C(\regs_matrix[6][8] ), 
        .D(n32), .Y(n625) );
  NOR2X1 U689 ( .A(n627), .B(n628), .Y(n623) );
  OAI22X1 U690 ( .A(n37), .B(\regs_matrix[3][8] ), .C(\regs_matrix[1][8] ), 
        .D(n762), .Y(n628) );
  OAI22X1 U691 ( .A(\regs_matrix[5][8] ), .B(n766), .C(\regs_matrix[7][8] ), 
        .D(n67), .Y(n627) );
  NAND2X1 U692 ( .A(n631), .B(n632), .Y(n630) );
  NOR2X1 U693 ( .A(n633), .B(n634), .Y(n632) );
  OAI22X1 U694 ( .A(\regs_matrix[8][9] ), .B(n747), .C(\regs_matrix[10][9] ), 
        .D(n751), .Y(n634) );
  OAI22X1 U695 ( .A(\regs_matrix[12][9] ), .B(n753), .C(n758), .D(
        \regs_matrix[14][9] ), .Y(n633) );
  NOR2X1 U696 ( .A(n635), .B(n636), .Y(n631) );
  OAI22X1 U697 ( .A(\regs_matrix[11][9] ), .B(n59), .C(\regs_matrix[9][9] ), 
        .D(n762), .Y(n636) );
  OAI22X1 U698 ( .A(\regs_matrix[13][9] ), .B(n767), .C(\regs_matrix[15][9] ), 
        .D(n66), .Y(n635) );
  NAND2X1 U699 ( .A(n638), .B(n637), .Y(n629) );
  NOR2X1 U700 ( .A(n639), .B(n640), .Y(n638) );
  OAI22X1 U701 ( .A(outreg_data[9]), .B(n746), .C(\regs_matrix[2][9] ), .D(
        n750), .Y(n640) );
  OAI22X1 U702 ( .A(\regs_matrix[4][9] ), .B(n754), .C(n758), .D(
        \regs_matrix[6][9] ), .Y(n639) );
  NOR2X1 U703 ( .A(n641), .B(n642), .Y(n637) );
  OAI22X1 U704 ( .A(\regs_matrix[3][9] ), .B(n37), .C(\regs_matrix[1][9] ), 
        .D(n762), .Y(n642) );
  OAI22X1 U705 ( .A(\regs_matrix[5][9] ), .B(n766), .C(\regs_matrix[7][9] ), 
        .D(n77), .Y(n641) );
  NAND2X1 U706 ( .A(n646), .B(n645), .Y(n644) );
  NOR2X1 U707 ( .A(n647), .B(n648), .Y(n646) );
  OAI22X1 U708 ( .A(\regs_matrix[8][10] ), .B(n746), .C(\regs_matrix[10][10] ), 
        .D(n751), .Y(n648) );
  OAI22X1 U709 ( .A(\regs_matrix[12][10] ), .B(n754), .C(n758), .D(
        \regs_matrix[14][10] ), .Y(n647) );
  NOR2X1 U710 ( .A(n649), .B(n650), .Y(n645) );
  OAI22X1 U711 ( .A(\regs_matrix[11][10] ), .B(n37), .C(\regs_matrix[9][10] ), 
        .D(n762), .Y(n650) );
  OAI22X1 U712 ( .A(\regs_matrix[13][10] ), .B(n766), .C(n65), .D(
        \regs_matrix[15][10] ), .Y(n649) );
  NAND2X1 U713 ( .A(n651), .B(n652), .Y(n643) );
  NOR2X1 U714 ( .A(n653), .B(n654), .Y(n652) );
  OAI22X1 U715 ( .A(outreg_data[10]), .B(n747), .C(\regs_matrix[2][10] ), .D(
        n751), .Y(n654) );
  OAI22X1 U716 ( .A(\regs_matrix[4][10] ), .B(n753), .C(\regs_matrix[6][10] ), 
        .D(n756), .Y(n653) );
  NOR2X1 U717 ( .A(n656), .B(n655), .Y(n651) );
  OAI22X1 U718 ( .A(\regs_matrix[3][10] ), .B(n54), .C(\regs_matrix[1][10] ), 
        .D(n762), .Y(n656) );
  OAI22X1 U719 ( .A(\regs_matrix[5][10] ), .B(n766), .C(\regs_matrix[7][10] ), 
        .D(n75), .Y(n655) );
  NAND2X1 U720 ( .A(n660), .B(n659), .Y(n658) );
  NOR2X1 U721 ( .A(n661), .B(n662), .Y(n660) );
  OAI22X1 U722 ( .A(\regs_matrix[8][11] ), .B(n746), .C(\regs_matrix[10][11] ), 
        .D(n750), .Y(n662) );
  OAI22X1 U723 ( .A(\regs_matrix[12][11] ), .B(n754), .C(\regs_matrix[14][11] ), .D(n758), .Y(n661) );
  NOR2X1 U724 ( .A(n663), .B(n664), .Y(n659) );
  OAI22X1 U725 ( .A(\regs_matrix[11][11] ), .B(n3), .C(\regs_matrix[9][11] ), 
        .D(n763), .Y(n664) );
  OAI22X1 U726 ( .A(\regs_matrix[13][11] ), .B(n766), .C(\regs_matrix[15][11] ), .D(n73), .Y(n663) );
  NAND2X1 U727 ( .A(n666), .B(n665), .Y(n657) );
  NOR2X1 U728 ( .A(n667), .B(n668), .Y(n666) );
  OAI22X1 U729 ( .A(outreg_data[11]), .B(n746), .C(\regs_matrix[2][11] ), .D(
        n750), .Y(n668) );
  OAI22X1 U730 ( .A(n754), .B(\regs_matrix[4][11] ), .C(n758), .D(
        \regs_matrix[6][11] ), .Y(n667) );
  NOR2X1 U731 ( .A(n669), .B(n670), .Y(n665) );
  OAI22X1 U732 ( .A(\regs_matrix[3][11] ), .B(n54), .C(\regs_matrix[1][11] ), 
        .D(n763), .Y(n670) );
  OAI22X1 U733 ( .A(\regs_matrix[5][11] ), .B(n765), .C(\regs_matrix[7][11] ), 
        .D(n69), .Y(n669) );
  MUX2X1 U734 ( .B(n671), .A(n672), .S(n769), .Y(r2_data[12]) );
  NAND2X1 U735 ( .A(n673), .B(n674), .Y(n672) );
  NOR2X1 U736 ( .A(n675), .B(n676), .Y(n674) );
  OAI22X1 U737 ( .A(\regs_matrix[8][12] ), .B(n746), .C(\regs_matrix[10][12] ), 
        .D(n750), .Y(n676) );
  OAI22X1 U738 ( .A(\regs_matrix[12][12] ), .B(n754), .C(\regs_matrix[14][12] ), .D(n758), .Y(n675) );
  NOR2X1 U739 ( .A(n677), .B(n678), .Y(n673) );
  OAI22X1 U740 ( .A(\regs_matrix[11][12] ), .B(n54), .C(\regs_matrix[9][12] ), 
        .D(n763), .Y(n678) );
  OAI22X1 U741 ( .A(\regs_matrix[13][12] ), .B(n766), .C(\regs_matrix[15][12] ), .D(n63), .Y(n677) );
  NAND2X1 U742 ( .A(n680), .B(n679), .Y(n671) );
  NOR2X1 U743 ( .A(n681), .B(n682), .Y(n680) );
  OAI22X1 U744 ( .A(outreg_data[12]), .B(n746), .C(\regs_matrix[2][12] ), .D(
        n750), .Y(n682) );
  OAI22X1 U745 ( .A(\regs_matrix[4][12] ), .B(n754), .C(n758), .D(
        \regs_matrix[6][12] ), .Y(n681) );
  NOR2X1 U746 ( .A(n684), .B(n683), .Y(n679) );
  OAI22X1 U747 ( .A(\regs_matrix[3][12] ), .B(n54), .C(\regs_matrix[1][12] ), 
        .D(n763), .Y(n684) );
  OAI22X1 U748 ( .A(\regs_matrix[5][12] ), .B(n765), .C(\regs_matrix[7][12] ), 
        .D(n66), .Y(n683) );
  NAND2X1 U749 ( .A(n687), .B(n688), .Y(n686) );
  NOR2X1 U750 ( .A(n689), .B(n690), .Y(n688) );
  OAI22X1 U751 ( .A(\regs_matrix[8][13] ), .B(n747), .C(\regs_matrix[10][13] ), 
        .D(n751), .Y(n690) );
  OAI22X1 U752 ( .A(\regs_matrix[12][13] ), .B(n753), .C(\regs_matrix[14][13] ), .D(n32), .Y(n689) );
  NOR2X1 U753 ( .A(n692), .B(n691), .Y(n687) );
  OAI22X1 U754 ( .A(\regs_matrix[11][13] ), .B(n54), .C(\regs_matrix[9][13] ), 
        .D(n763), .Y(n692) );
  OAI22X1 U755 ( .A(\regs_matrix[13][13] ), .B(n765), .C(\regs_matrix[15][13] ), .D(n74), .Y(n691) );
  NAND2X1 U756 ( .A(n693), .B(n694), .Y(n685) );
  NOR2X1 U757 ( .A(n695), .B(n696), .Y(n694) );
  OAI22X1 U758 ( .A(outreg_data[13]), .B(n745), .C(\regs_matrix[2][13] ), .D(
        n751), .Y(n696) );
  OAI22X1 U759 ( .A(\regs_matrix[4][13] ), .B(n753), .C(\regs_matrix[6][13] ), 
        .D(n756), .Y(n695) );
  NOR2X1 U760 ( .A(n698), .B(n697), .Y(n693) );
  OAI22X1 U761 ( .A(\regs_matrix[3][13] ), .B(n54), .C(\regs_matrix[1][13] ), 
        .D(n763), .Y(n698) );
  OAI22X1 U762 ( .A(\regs_matrix[5][13] ), .B(n766), .C(\regs_matrix[7][13] ), 
        .D(n73), .Y(n697) );
  NAND2X1 U763 ( .A(n701), .B(n702), .Y(n700) );
  NOR2X1 U764 ( .A(n703), .B(n704), .Y(n702) );
  OAI22X1 U765 ( .A(\regs_matrix[8][14] ), .B(n747), .C(\regs_matrix[10][14] ), 
        .D(n749), .Y(n704) );
  OAI22X1 U766 ( .A(\regs_matrix[12][14] ), .B(n753), .C(\regs_matrix[14][14] ), .D(n757), .Y(n703) );
  NOR2X1 U767 ( .A(n706), .B(n705), .Y(n701) );
  OAI22X1 U768 ( .A(\regs_matrix[11][14] ), .B(n54), .C(\regs_matrix[9][14] ), 
        .D(n763), .Y(n706) );
  OAI22X1 U769 ( .A(\regs_matrix[13][14] ), .B(n766), .C(\regs_matrix[15][14] ), .D(n70), .Y(n705) );
  NAND2X1 U770 ( .A(n707), .B(n708), .Y(n699) );
  NOR2X1 U771 ( .A(n709), .B(n710), .Y(n708) );
  OAI22X1 U772 ( .A(outreg_data[14]), .B(n747), .C(\regs_matrix[2][14] ), .D(
        n29), .Y(n710) );
  OAI22X1 U773 ( .A(\regs_matrix[4][14] ), .B(n753), .C(\regs_matrix[6][14] ), 
        .D(n757), .Y(n709) );
  NOR2X1 U774 ( .A(n711), .B(n712), .Y(n707) );
  OAI22X1 U775 ( .A(\regs_matrix[3][14] ), .B(n6), .C(\regs_matrix[1][14] ), 
        .D(n763), .Y(n712) );
  OAI22X1 U776 ( .A(\regs_matrix[5][14] ), .B(n765), .C(\regs_matrix[7][14] ), 
        .D(n68), .Y(n711) );
  MUX2X1 U777 ( .B(n713), .A(n714), .S(n768), .Y(r2_data[15]) );
  NAND2X1 U778 ( .A(n715), .B(n716), .Y(n714) );
  NOR2X1 U779 ( .A(n717), .B(n718), .Y(n716) );
  OAI22X1 U780 ( .A(\regs_matrix[8][15] ), .B(n747), .C(\regs_matrix[10][15] ), 
        .D(n751), .Y(n718) );
  OAI22X1 U781 ( .A(\regs_matrix[12][15] ), .B(n753), .C(\regs_matrix[14][15] ), .D(n757), .Y(n717) );
  NOR2X1 U782 ( .A(n720), .B(n719), .Y(n715) );
  OAI22X1 U783 ( .A(\regs_matrix[11][15] ), .B(n54), .C(\regs_matrix[9][15] ), 
        .D(n763), .Y(n720) );
  OAI22X1 U784 ( .A(\regs_matrix[13][15] ), .B(n765), .C(\regs_matrix[15][15] ), .D(n64), .Y(n719) );
  NAND2X1 U785 ( .A(n721), .B(n722), .Y(n713) );
  NOR2X1 U786 ( .A(n723), .B(n724), .Y(n722) );
  OAI22X1 U787 ( .A(outreg_data[15]), .B(n745), .C(\regs_matrix[2][15] ), .D(
        n749), .Y(n724) );
  OAI22X1 U788 ( .A(n753), .B(\regs_matrix[4][15] ), .C(\regs_matrix[6][15] ), 
        .D(n757), .Y(n723) );
  NOR2X1 U789 ( .A(n726), .B(n725), .Y(n721) );
  OAI22X1 U790 ( .A(\regs_matrix[3][15] ), .B(n54), .C(\regs_matrix[1][15] ), 
        .D(n763), .Y(n726) );
  OAI22X1 U791 ( .A(\regs_matrix[5][15] ), .B(n765), .C(\regs_matrix[7][15] ), 
        .D(n68), .Y(n725) );
  MUX2X1 U792 ( .B(n727), .A(n728), .S(n769), .Y(r2_data[16]) );
  NAND2X1 U793 ( .A(n729), .B(n730), .Y(n728) );
  NOR2X1 U794 ( .A(n731), .B(n732), .Y(n730) );
  OAI22X1 U795 ( .A(\regs_matrix[14][16] ), .B(n4), .C(\regs_matrix[12][16] ), 
        .D(n753), .Y(n732) );
  OAI22X1 U796 ( .A(\regs_matrix[15][16] ), .B(n70), .C(\regs_matrix[9][16] ), 
        .D(n763), .Y(n731) );
  NOR2X1 U797 ( .A(n733), .B(n734), .Y(n729) );
  OAI22X1 U798 ( .A(\regs_matrix[13][16] ), .B(n767), .C(\regs_matrix[11][16] ), .D(n37), .Y(n734) );
  OAI22X1 U799 ( .A(\regs_matrix[8][16] ), .B(n747), .C(\regs_matrix[10][16] ), 
        .D(n751), .Y(n733) );
  NAND2X1 U800 ( .A(n735), .B(n736), .Y(n727) );
  NOR2X1 U801 ( .A(n737), .B(n738), .Y(n736) );
  OAI22X1 U802 ( .A(outreg_data[16]), .B(n745), .C(\regs_matrix[2][16] ), .D(
        n29), .Y(n738) );
  NAND3X1 U803 ( .A(n739), .B(n8), .C(n740), .Y(n504) );
  NAND3X1 U804 ( .A(n739), .B(n741), .C(n740), .Y(n503) );
  OAI22X1 U805 ( .A(\regs_matrix[4][16] ), .B(n753), .C(\regs_matrix[6][16] ), 
        .D(n32), .Y(n737) );
  NAND3X1 U806 ( .A(n740), .B(N16), .C(n8), .Y(n506) );
  NAND3X1 U807 ( .A(n740), .B(n741), .C(N16), .Y(n505) );
  NOR2X1 U808 ( .A(n742), .B(n743), .Y(n735) );
  OAI22X1 U809 ( .A(\regs_matrix[3][16] ), .B(n59), .C(\regs_matrix[1][16] ), 
        .D(n763), .Y(n743) );
  NAND3X1 U810 ( .A(N14), .B(n739), .C(n741), .Y(n509) );
  INVX2 U811 ( .A(N16), .Y(n739) );
  OAI22X1 U812 ( .A(\regs_matrix[5][16] ), .B(n765), .C(\regs_matrix[7][16] ), 
        .D(n65), .Y(n742) );
  INVX2 U813 ( .A(N15), .Y(n741) );
  INVX8 U814 ( .A(n752), .Y(n753) );
  INVX8 U815 ( .A(n752), .Y(n754) );
  INVX4 U816 ( .A(n505), .Y(n752) );
  INVX4 U817 ( .A(n744), .Y(n747) );
  INVX4 U818 ( .A(n744), .Y(n745) );
  INVX4 U819 ( .A(n744), .Y(n746) );
  INVX4 U820 ( .A(n503), .Y(n744) );
  INVX4 U821 ( .A(n509), .Y(n760) );
  INVX4 U822 ( .A(n510), .Y(n764) );
  NAND2X1 U823 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n796) );
  NAND2X1 U824 ( .A(n94), .B(w_sel[0]), .Y(n792) );
  NOR2X1 U825 ( .A(n796), .B(n792), .Y(write_enables[15]) );
  INVX2 U826 ( .A(w_sel[0]), .Y(n795) );
  NAND2X1 U827 ( .A(n94), .B(n795), .Y(n793) );
  NOR2X1 U828 ( .A(n796), .B(n793), .Y(write_enables[14]) );
  INVX2 U829 ( .A(w_sel[1]), .Y(n790) );
  NAND2X1 U830 ( .A(w_sel[2]), .B(n790), .Y(n797) );
  NOR2X1 U831 ( .A(n797), .B(n792), .Y(write_enables[13]) );
  NOR2X1 U832 ( .A(n797), .B(n793), .Y(write_enables[12]) );
  INVX2 U833 ( .A(w_sel[2]), .Y(n791) );
  NAND2X1 U834 ( .A(w_sel[1]), .B(n791), .Y(n798) );
  NOR2X1 U835 ( .A(n798), .B(n792), .Y(write_enables[11]) );
  NOR2X1 U836 ( .A(n798), .B(n793), .Y(write_enables[10]) );
  NAND2X1 U837 ( .A(n791), .B(n790), .Y(n800) );
  NOR2X1 U838 ( .A(n800), .B(n792), .Y(write_enables[9]) );
  NOR2X1 U839 ( .A(n800), .B(n793), .Y(write_enables[8]) );
  INVX2 U840 ( .A(w_sel[3]), .Y(n794) );
  NAND3X1 U841 ( .A(w_sel[0]), .B(w_en), .C(n794), .Y(n799) );
  NOR2X1 U842 ( .A(n799), .B(n796), .Y(write_enables[7]) );
  NAND3X1 U843 ( .A(w_en), .B(n795), .C(n794), .Y(n801) );
  NOR2X1 U844 ( .A(n801), .B(n796), .Y(write_enables[6]) );
  NOR2X1 U845 ( .A(n799), .B(n797), .Y(write_enables[5]) );
  NOR2X1 U846 ( .A(n801), .B(n797), .Y(write_enables[4]) );
  NOR2X1 U847 ( .A(n799), .B(n798), .Y(write_enables[3]) );
  NOR2X1 U848 ( .A(n801), .B(n798), .Y(write_enables[2]) );
  NOR2X1 U849 ( .A(n800), .B(n799), .Y(write_enables[1]) );
  NOR2X1 U850 ( .A(n801), .B(n800), .Y(write_enables[0]) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data({dest_data[16], n60, n59, n58, 
        n57, n56, n55, n54, n53, n52, n51, dest_data[5:0]}), .r1_data(
        src1_data), .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX4 U2 ( .A(n50), .Y(n60) );
  INVX4 U3 ( .A(n42), .Y(n58) );
  INVX4 U4 ( .A(n33), .Y(n55) );
  INVX4 U5 ( .A(n27), .Y(n53) );
  INVX4 U6 ( .A(n30), .Y(n54) );
  INVX4 U7 ( .A(n45), .Y(n59) );
  INVX4 U8 ( .A(n21), .Y(n51) );
  INVX4 U9 ( .A(n24), .Y(n52) );
  INVX4 U10 ( .A(n36), .Y(n56) );
  INVX4 U11 ( .A(n39), .Y(n57) );
  INVX4 U12 ( .A(w_data_sel[1]), .Y(n1) );
  INVX8 U13 ( .A(n1), .Y(n2) );
  INVX4 U14 ( .A(n3), .Y(n47) );
  INVX4 U15 ( .A(n5), .Y(n46) );
  INVX2 U16 ( .A(n2), .Y(n18) );
  INVX2 U17 ( .A(alu_result[0]), .Y(n7) );
  NAND2X1 U18 ( .A(w_data_sel[0]), .B(n18), .Y(n3) );
  INVX2 U19 ( .A(w_data_sel[0]), .Y(n4) );
  NAND2X1 U20 ( .A(n18), .B(n4), .Y(n5) );
  AOI22X1 U21 ( .A(ext_data2[0]), .B(n47), .C(ext_data1[0]), .D(n46), .Y(n6)
         );
  OAI21X1 U22 ( .A(n18), .B(n7), .C(n6), .Y(dest_data[0]) );
  INVX2 U23 ( .A(alu_result[1]), .Y(n9) );
  AOI22X1 U24 ( .A(ext_data2[1]), .B(n47), .C(ext_data1[1]), .D(n46), .Y(n8)
         );
  OAI21X1 U25 ( .A(n18), .B(n9), .C(n8), .Y(dest_data[1]) );
  INVX2 U26 ( .A(alu_result[2]), .Y(n11) );
  AOI22X1 U27 ( .A(ext_data2[2]), .B(n47), .C(ext_data1[2]), .D(n46), .Y(n10)
         );
  OAI21X1 U28 ( .A(n18), .B(n11), .C(n10), .Y(dest_data[2]) );
  INVX2 U29 ( .A(alu_result[3]), .Y(n13) );
  AOI22X1 U30 ( .A(ext_data2[3]), .B(n47), .C(ext_data1[3]), .D(n46), .Y(n12)
         );
  OAI21X1 U31 ( .A(n18), .B(n13), .C(n12), .Y(dest_data[3]) );
  INVX2 U32 ( .A(alu_result[4]), .Y(n15) );
  AOI22X1 U33 ( .A(ext_data2[4]), .B(n47), .C(ext_data1[4]), .D(n46), .Y(n14)
         );
  OAI21X1 U34 ( .A(n18), .B(n15), .C(n14), .Y(dest_data[4]) );
  INVX2 U35 ( .A(alu_result[5]), .Y(n17) );
  AOI22X1 U36 ( .A(ext_data2[5]), .B(n47), .C(ext_data1[5]), .D(n46), .Y(n16)
         );
  OAI21X1 U37 ( .A(n18), .B(n17), .C(n16), .Y(dest_data[5]) );
  AOI22X1 U38 ( .A(ext_data2[6]), .B(n47), .C(ext_data1[6]), .D(n46), .Y(n19)
         );
  INVX2 U39 ( .A(n19), .Y(n20) );
  OAI22X1 U40 ( .A(n2), .B(n20), .C(n20), .D(alu_result[6]), .Y(n21) );
  AOI22X1 U41 ( .A(ext_data2[7]), .B(n47), .C(ext_data1[7]), .D(n46), .Y(n22)
         );
  INVX2 U42 ( .A(n22), .Y(n23) );
  OAI22X1 U43 ( .A(n2), .B(n23), .C(n23), .D(alu_result[7]), .Y(n24) );
  AOI22X1 U44 ( .A(ext_data2[8]), .B(n47), .C(ext_data1[8]), .D(n46), .Y(n25)
         );
  INVX2 U45 ( .A(n25), .Y(n26) );
  OAI22X1 U46 ( .A(n2), .B(n26), .C(n26), .D(alu_result[8]), .Y(n27) );
  AOI22X1 U47 ( .A(ext_data2[9]), .B(n47), .C(ext_data1[9]), .D(n46), .Y(n28)
         );
  INVX2 U48 ( .A(n28), .Y(n29) );
  OAI22X1 U49 ( .A(n2), .B(n29), .C(n29), .D(alu_result[9]), .Y(n30) );
  AOI22X1 U50 ( .A(ext_data2[10]), .B(n47), .C(ext_data1[10]), .D(n46), .Y(n31) );
  INVX2 U51 ( .A(n31), .Y(n32) );
  OAI22X1 U52 ( .A(n2), .B(n32), .C(n32), .D(alu_result[10]), .Y(n33) );
  AOI22X1 U53 ( .A(ext_data2[11]), .B(n47), .C(ext_data1[11]), .D(n46), .Y(n34) );
  INVX2 U54 ( .A(n34), .Y(n35) );
  OAI22X1 U55 ( .A(n2), .B(n35), .C(n35), .D(alu_result[11]), .Y(n36) );
  AOI22X1 U56 ( .A(ext_data2[12]), .B(n47), .C(ext_data1[12]), .D(n46), .Y(n37) );
  INVX2 U57 ( .A(n37), .Y(n38) );
  OAI22X1 U58 ( .A(n2), .B(n38), .C(n38), .D(alu_result[12]), .Y(n39) );
  AOI22X1 U59 ( .A(ext_data2[13]), .B(n47), .C(ext_data1[13]), .D(n46), .Y(n40) );
  INVX2 U60 ( .A(n40), .Y(n41) );
  OAI22X1 U61 ( .A(n2), .B(n41), .C(n41), .D(alu_result[13]), .Y(n42) );
  AOI22X1 U62 ( .A(ext_data2[14]), .B(n47), .C(ext_data1[14]), .D(n46), .Y(n43) );
  INVX2 U63 ( .A(n43), .Y(n44) );
  OAI22X1 U64 ( .A(n2), .B(n44), .C(n44), .D(alu_result[14]), .Y(n45) );
  AOI22X1 U65 ( .A(ext_data2[15]), .B(n47), .C(ext_data1[15]), .D(n46), .Y(n48) );
  INVX2 U66 ( .A(n48), .Y(n49) );
  OAI22X1 U67 ( .A(n2), .B(n49), .C(n49), .D(alu_result[15]), .Y(n50) );
  AND2X2 U68 ( .A(alu_result[16]), .B(n2), .Y(dest_data[16]) );
endmodule


module magnitude_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35;

  magnitude_DW01_inc_0 add_13 ( .A({n20, n21, n22, n23, n24, n25, n26, n27, 
        n28, n29, n30, n31, n32, n33, n34, n35}), .SUM({N33, N32, N31, N30, 
        N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18}) );
  INVX2 U2 ( .A(n1), .Y(n3) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX1 U4 ( .A(in[16]), .Y(n1) );
  INVX2 U5 ( .A(in[15]), .Y(n20) );
  INVX2 U6 ( .A(in[14]), .Y(n21) );
  INVX2 U7 ( .A(in[13]), .Y(n22) );
  INVX2 U8 ( .A(in[12]), .Y(n23) );
  INVX2 U9 ( .A(in[11]), .Y(n24) );
  INVX2 U10 ( .A(in[10]), .Y(n25) );
  INVX2 U11 ( .A(in[9]), .Y(n26) );
  INVX2 U12 ( .A(in[8]), .Y(n27) );
  INVX2 U13 ( .A(in[7]), .Y(n28) );
  INVX2 U14 ( .A(in[6]), .Y(n29) );
  INVX2 U15 ( .A(in[5]), .Y(n30) );
  INVX2 U16 ( .A(in[4]), .Y(n31) );
  INVX2 U17 ( .A(in[3]), .Y(n32) );
  INVX2 U18 ( .A(in[2]), .Y(n33) );
  INVX2 U19 ( .A(in[1]), .Y(n34) );
  INVX2 U20 ( .A(in[0]), .Y(n35) );
  MUX2X1 U21 ( .B(in[0]), .A(N18), .S(n2), .Y(n4) );
  INVX2 U22 ( .A(n4), .Y(out[0]) );
  MUX2X1 U23 ( .B(in[1]), .A(N19), .S(n3), .Y(n5) );
  INVX2 U24 ( .A(n5), .Y(out[1]) );
  MUX2X1 U25 ( .B(in[2]), .A(N20), .S(n2), .Y(n6) );
  INVX2 U26 ( .A(n6), .Y(out[2]) );
  MUX2X1 U27 ( .B(in[3]), .A(N21), .S(n3), .Y(n7) );
  INVX2 U28 ( .A(n7), .Y(out[3]) );
  MUX2X1 U29 ( .B(in[4]), .A(N22), .S(n2), .Y(n8) );
  INVX2 U30 ( .A(n8), .Y(out[4]) );
  MUX2X1 U31 ( .B(in[5]), .A(N23), .S(n3), .Y(n9) );
  INVX2 U32 ( .A(n9), .Y(out[5]) );
  MUX2X1 U33 ( .B(in[6]), .A(N24), .S(n2), .Y(n10) );
  INVX2 U34 ( .A(n10), .Y(out[6]) );
  MUX2X1 U35 ( .B(in[7]), .A(N25), .S(n3), .Y(n11) );
  INVX2 U36 ( .A(n11), .Y(out[7]) );
  MUX2X1 U37 ( .B(in[8]), .A(N26), .S(n2), .Y(n12) );
  INVX2 U38 ( .A(n12), .Y(out[8]) );
  MUX2X1 U39 ( .B(in[9]), .A(N27), .S(n3), .Y(n13) );
  INVX2 U40 ( .A(n13), .Y(out[9]) );
  MUX2X1 U41 ( .B(in[10]), .A(N28), .S(n2), .Y(n14) );
  INVX2 U42 ( .A(n14), .Y(out[10]) );
  MUX2X1 U43 ( .B(in[11]), .A(N29), .S(n3), .Y(n15) );
  INVX2 U44 ( .A(n15), .Y(out[11]) );
  MUX2X1 U45 ( .B(in[12]), .A(N30), .S(n2), .Y(n16) );
  INVX2 U46 ( .A(n16), .Y(out[12]) );
  MUX2X1 U47 ( .B(in[13]), .A(N31), .S(n3), .Y(n17) );
  INVX2 U48 ( .A(n17), .Y(out[13]) );
  MUX2X1 U49 ( .B(in[14]), .A(N32), .S(n2), .Y(n18) );
  INVX2 U50 ( .A(n18), .Y(out[14]) );
  MUX2X1 U51 ( .B(in[15]), .A(N33), .S(n3), .Y(n19) );
  INVX2 U52 ( .A(n19), .Y(out[15]) );
endmodule


module fir_filter ( clk, n_reset, load_coeff, data_ready, sample_data, 
        fir_coefficient, one_k_samples, modwait, err, fir_out );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg_data;
  wire   SYNOPSYS_UNCONNECTED__0;

  controller controller ( .clk(clk), .n_rst(n_reset), .dr(data_ready), .lc(
        load_coeff), .overflow(overflow), .cnt_up(cnt_up), .clear(clear), 
        .modwait(modwait), .err(err), .op(op), .src1({SYNOPSYS_UNCONNECTED__0, 
        src1[2:0]}), .src2(src2), .dest(dest) );
  counter counter ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  datapath datapath ( .clk(clk), .n_reset(n_reset), .op(op), .src1({1'b0, 
        src1[2:0]}), .src2(src2), .dest(dest), .ext_data1(sample_data), 
        .ext_data2(fir_coefficient), .outreg_data(outreg_data), .overflow(
        overflow) );
  magnitude magnitude ( .in(outreg_data), .out(fir_out) );
endmodule


module coefficient_loader ( clk, n_reset, new_coefficient_set, modwait, 
        load_coeff, coefficient_num );
  output [1:0] coefficient_num;
  input clk, n_reset, new_coefficient_set, modwait;
  output load_coeff;
  wire   n15, n16, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [2:0] state;

  DFFSR \state_reg[0]  ( .D(n14), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        load_coeff) );
  DFFSR \state_reg[1]  ( .D(n16), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(n15), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[2]) );
  XNOR2X1 U6 ( .A(state[2]), .B(n7), .Y(n15) );
  INVX2 U7 ( .A(load_coeff), .Y(n11) );
  XOR2X1 U8 ( .A(n11), .B(state[1]), .Y(n10) );
  INVX2 U9 ( .A(n10), .Y(n16) );
  INVX2 U10 ( .A(state[1]), .Y(n12) );
  INVX2 U11 ( .A(state[2]), .Y(n8) );
  NAND2X1 U12 ( .A(n12), .B(n8), .Y(n5) );
  INVX2 U13 ( .A(modwait), .Y(n4) );
  OAI21X1 U14 ( .A(new_coefficient_set), .B(n5), .C(n4), .Y(n6) );
  NOR2X1 U15 ( .A(load_coeff), .B(n6), .Y(n14) );
  NAND2X1 U16 ( .A(load_coeff), .B(state[1]), .Y(n7) );
  OAI21X1 U17 ( .A(modwait), .B(n8), .C(n7), .Y(n9) );
  AND2X2 U18 ( .A(n10), .B(n9), .Y(coefficient_num[0]) );
  OAI21X1 U19 ( .A(modwait), .B(n12), .C(n11), .Y(n13) );
  AND2X2 U20 ( .A(state[2]), .B(n13), .Y(coefficient_num[1]) );
endmodule


module ahb_lite_fir_filter ( clk, n_rst, hsel, hsize, hwrite, haddr, htrans, 
        hwdata, hrdata, hresp );
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, hsel, hsize, hwrite;
  output hresp;
  wire   modwait, err, data_ready, new_coefficient_set, load_coeff;
  wire   [1:0] coefficient_num;
  wire   [15:0] fir_out;
  wire   [15:0] sample_data;
  wire   [15:0] fir_coefficient;

  ahb_lite_slave slave ( .clk(clk), .n_rst(n_rst), .modwait(modwait), .err(err), .hsel(hsel), .hsize(hsize), .hwrite(hwrite), .coefficient_num(
        coefficient_num), .htrans(htrans), .haddr(haddr), .fir_out(fir_out), 
        .hwdata(hwdata), .data_ready(data_ready), .new_coefficient_set(
        new_coefficient_set), .hresp(hresp), .sample_data(sample_data), 
        .fir_coefficient(fir_coefficient), .hrdata(hrdata) );
  fir_filter fir_filter ( .clk(clk), .n_reset(n_rst), .load_coeff(load_coeff), 
        .data_ready(data_ready), .sample_data(sample_data), .fir_coefficient(
        fir_coefficient), .modwait(modwait), .err(err), .fir_out(fir_out) );
  coefficient_loader loader ( .clk(clk), .n_reset(n_rst), 
        .new_coefficient_set(new_coefficient_set), .modwait(modwait), 
        .load_coeff(load_coeff), .coefficient_num(coefficient_num) );
endmodule

