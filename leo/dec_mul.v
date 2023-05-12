//
// Verilog description for cell dec_mul, 
// Thu May 11 01:48:02 2023
//
// LeonardoSpectrum Level 3, 2011a.4 
//


module dec_mul ( clk, received_signal, walsh_like_code, product_output ) ;

    input clk ;
    input [7:0]received_signal ;
    input [7:0]walsh_like_code ;
    output [15:0]product_output ;

    wire product_0, rs_0, nx12, product_1, rs_1, nx50, product_2, nx80, rs_2, 
         nx96, product_3, nx116, nx132, rs_3, nx150, nx154, product_4, nx182, 
         nx198, nx210, nx214, rs_4, nx224, nx226, product_5, nx246, nx262, nx278, 
         nx290, nx294, nx298, nx300, rs_5, nx308, nx310, nx312, product_6, nx340, 
         nx356, nx372, nx384, nx388, nx392, nx394, nx396, nx398, rs_6, nx412, 
         product_7, nx432, nx448, nx464, nx482, nx494, nx498, nx502, nx504, 
         nx506, nx508, rs_7, nx524, nx528, product_8, nx556, nx572, nx588, nx596, 
         nx600, nx604, nx606, nx608, nx610, nx620, nx624, nx626, nx632, 
         product_9, nx660, nx676, nx692, nx696, nx700, nx704, nx706, nx708, 
         nx710, nx720, nx724, nx726, nx728, product_10, nx764, nx780, nx798, 
         nx802, nx806, nx808, nx810, nx812, nx818, product_11, nx838, nx854, 
         nx870, nx874, nx878, nx882, nx884, nx886, nx888, nx890, nx894, 
         product_12, nx930, nx948, nx952, nx954, nx956, product_13, nx976, nx992, 
         nx996, nx1000, nx1002, nx1004, product_14, nx1038, product_15, nx1058, 
         nx199, nx211, nx217, nx218, nx227, nx229, nx231, nx234, nx236, nx249, 
         nx251, nx253, nx255, nx257, nx261, nx263, nx265, nx277, nx287, nx289, 
         nx291, nx293, nx295, nx299, nx301, nx303, nx305, nx320, nx326, nx329, 
         nx331, nx333, nx335, nx339, nx341, nx343, nx345, nx347, nx360, nx363, 
         nx365, nx373, nx383, nx385, nx387, nx389, nx391, nx395, nx397, nx399, 
         nx401, nx403, nx405, nx418, nx420, nx422, nx425, nx427, nx435, nx445, 
         nx447, nx449, nx451, nx453, nx457, nx459, nx461, nx463, nx465, nx467, 
         nx469, nx483, nx491, nx493, nx495, nx499, nx501, nx509, nx519, nx521, 
         nx523, nx525, nx527, nx529, nx531, nx533, nx535, nx537, nx549, nx557, 
         nx559, nx561, nx565, nx567, nx575, nx585, nx587, nx589, nx591, nx593, 
         nx595, nx597, nx599, nx609, nx611, nx613, nx617, nx625, nx635, nx637, 
         nx639, nx642, nx644, nx646, nx649, nx651, nx653, nx665, nx667, nx671, 
         nx679, nx689, nx691, nx693, nx695, nx697, nx707, nx713, nx721, nx723, 
         nx725, nx729, nx731, nx733, nx735, nx743, nx747, nx755, nx757, nx759, 
         nx769, nx771, nx773, nx777, nx796, nx799, nx801, nx805, nx807, nx809, 
         nx813, nx815, nx817, nx819, nx821, nx823, nx825, nx827, nx829, nx831, 
         nx833, nx835, nx837, nx839, nx841, nx843, nx845, nx847, nx849, nx851, 
         nx853, nx855, nx857, nx859, nx861, nx863, nx865, nx867, nx875, nx877;
    wire [47:0] \$dummy ;




    dff reg_product_output_0 (.Q (product_output[0]), .QB (\$dummy [0]), .D (
        product_0), .CLK (clk)) ;
    dff reg_product_0 (.Q (product_0), .QB (\$dummy [1]), .D (nx12), .CLK (clk)
        ) ;
    dff reg_wlc_0 (.Q (\$dummy [2]), .QB (nx199), .D (walsh_like_code[0]), .CLK (
        clk)) ;
    dff reg_rs_0 (.Q (rs_0), .QB (\$dummy [3]), .D (received_signal[0]), .CLK (
        clk)) ;
    dff reg_product_output_1 (.Q (product_output[1]), .QB (\$dummy [4]), .D (
        product_1), .CLK (clk)) ;
    dff reg_product_1 (.Q (product_1), .QB (\$dummy [5]), .D (nx50), .CLK (clk)
        ) ;
    nor02ii ix51 (.Y (nx50), .A0 (nx211), .A1 (nx218)) ;
    aoi22 ix212 (.Y (nx211), .A0 (nx796), .A1 (nx809), .B0 (nx805), .B1 (nx801)
          ) ;
    dff reg_rs_1 (.Q (rs_1), .QB (\$dummy [6]), .D (received_signal[1]), .CLK (
        clk)) ;
    dff reg_wlc_1 (.Q (\$dummy [7]), .QB (nx217), .D (walsh_like_code[1]), .CLK (
        clk)) ;
    dff reg_product_output_2 (.Q (product_output[2]), .QB (\$dummy [8]), .D (
        product_2), .CLK (clk)) ;
    dff reg_product_2 (.Q (product_2), .QB (\$dummy [9]), .D (nx96), .CLK (clk)
        ) ;
    xor2 ix97 (.Y (nx96), .A0 (nx218), .A1 (nx227)) ;
    xnor2 ix228 (.Y (nx227), .A0 (nx229), .A1 (nx236)) ;
    nand02 ix230 (.Y (nx229), .A0 (nx231), .A1 (nx80)) ;
    dff reg_wlc_2 (.Q (\$dummy [10]), .QB (nx234), .D (walsh_like_code[2]), .CLK (
        clk)) ;
    oai22 ix81 (.Y (nx80), .A0 (nx217), .A1 (nx865), .B0 (nx234), .B1 (nx861)) ;
    nand02 ix237 (.Y (nx236), .A0 (nx796), .A1 (nx817)) ;
    dff reg_rs_2 (.Q (rs_2), .QB (\$dummy [11]), .D (received_signal[2]), .CLK (
        clk)) ;
    dff reg_product_output_3 (.Q (product_output[3]), .QB (\$dummy [12]), .D (
        product_3), .CLK (clk)) ;
    dff reg_product_3 (.Q (product_3), .QB (\$dummy [13]), .D (nx154), .CLK (clk
        )) ;
    xnor2 ix155 (.Y (nx154), .A0 (nx116), .A1 (nx249)) ;
    mux21 ix117 (.Y (nx116), .A0 (nx218), .A1 (nx236), .S0 (nx227)) ;
    xnor2 ix250 (.Y (nx249), .A0 (nx251), .A1 (nx265)) ;
    xnor2 ix252 (.Y (nx251), .A0 (nx231), .A1 (nx253)) ;
    xnor2 ix254 (.Y (nx253), .A0 (nx255), .A1 (nx263)) ;
    nand02 ix256 (.Y (nx255), .A0 (nx257), .A1 (nx132)) ;
    dff reg_wlc_3 (.Q (\$dummy [14]), .QB (nx261), .D (walsh_like_code[3]), .CLK (
        clk)) ;
    oai22 ix133 (.Y (nx132), .A0 (nx234), .A1 (nx865), .B0 (nx261), .B1 (nx861)
          ) ;
    nand02 ix264 (.Y (nx263), .A0 (nx805), .A1 (nx817)) ;
    nand02 ix266 (.Y (nx265), .A0 (nx796), .A1 (nx825)) ;
    dff reg_rs_3 (.Q (rs_3), .QB (\$dummy [15]), .D (received_signal[3]), .CLK (
        clk)) ;
    dff reg_product_output_4 (.Q (product_output[4]), .QB (\$dummy [16]), .D (
        product_4), .CLK (clk)) ;
    dff reg_product_4 (.Q (product_4), .QB (\$dummy [17]), .D (nx226), .CLK (clk
        )) ;
    xnor2 ix227 (.Y (nx226), .A0 (nx277), .A1 (nx224)) ;
    mux21 ix278 (.Y (nx277), .A0 (nx116), .A1 (nx150), .S0 (nx249)) ;
    xnor2 ix225 (.Y (nx224), .A0 (nx214), .A1 (nx305)) ;
    xnor2 ix215 (.Y (nx214), .A0 (nx182), .A1 (nx287)) ;
    mux21 ix183 (.Y (nx182), .A0 (nx231), .A1 (nx263), .S0 (nx253)) ;
    xnor2 ix288 (.Y (nx287), .A0 (nx289), .A1 (nx303)) ;
    xnor2 ix290 (.Y (nx289), .A0 (nx257), .A1 (nx291)) ;
    xnor2 ix292 (.Y (nx291), .A0 (nx293), .A1 (nx301)) ;
    nand02 ix294 (.Y (nx293), .A0 (nx295), .A1 (nx198)) ;
    dff reg_wlc_4 (.Q (\$dummy [18]), .QB (nx299), .D (walsh_like_code[4]), .CLK (
        clk)) ;
    oai22 ix199 (.Y (nx198), .A0 (nx261), .A1 (nx865), .B0 (nx299), .B1 (nx861)
          ) ;
    nand02 ix302 (.Y (nx301), .A0 (nx813), .A1 (nx817)) ;
    nand02 ix304 (.Y (nx303), .A0 (nx805), .A1 (nx825)) ;
    nand02 ix306 (.Y (nx305), .A0 (nx796), .A1 (nx833)) ;
    dff reg_rs_4 (.Q (rs_4), .QB (\$dummy [19]), .D (received_signal[4]), .CLK (
        clk)) ;
    dff reg_product_output_5 (.Q (product_output[5]), .QB (\$dummy [20]), .D (
        product_5), .CLK (clk)) ;
    dff reg_product_5 (.Q (product_5), .QB (\$dummy [21]), .D (nx312), .CLK (clk
        )) ;
    xor2 ix313 (.Y (nx312), .A0 (nx246), .A1 (nx310)) ;
    mux21 ix247 (.Y (nx246), .A0 (nx305), .A1 (nx277), .S0 (nx224)) ;
    xnor2 ix311 (.Y (nx310), .A0 (nx300), .A1 (nx347)) ;
    xnor2 ix301 (.Y (nx300), .A0 (nx320), .A1 (nx298)) ;
    mux21 ix321 (.Y (nx320), .A0 (nx182), .A1 (nx210), .S0 (nx287)) ;
    xnor2 ix299 (.Y (nx298), .A0 (nx294), .A1 (nx345)) ;
    xnor2 ix295 (.Y (nx294), .A0 (nx262), .A1 (nx326)) ;
    mux21 ix263 (.Y (nx262), .A0 (nx257), .A1 (nx301), .S0 (nx291)) ;
    xnor2 ix328 (.Y (nx326), .A0 (nx329), .A1 (nx343)) ;
    xnor2 ix330 (.Y (nx329), .A0 (nx295), .A1 (nx331)) ;
    xnor2 ix332 (.Y (nx331), .A0 (nx333), .A1 (nx341)) ;
    nand02 ix334 (.Y (nx333), .A0 (nx335), .A1 (nx278)) ;
    dff reg_wlc_5 (.Q (\$dummy [22]), .QB (nx339), .D (walsh_like_code[5]), .CLK (
        clk)) ;
    oai22 ix279 (.Y (nx278), .A0 (nx299), .A1 (nx865), .B0 (nx339), .B1 (nx861)
          ) ;
    nand02 ix342 (.Y (nx341), .A0 (nx821), .A1 (nx817)) ;
    nand02 ix344 (.Y (nx343), .A0 (nx813), .A1 (nx825)) ;
    nand02 ix346 (.Y (nx345), .A0 (nx805), .A1 (nx833)) ;
    nand02 ix348 (.Y (nx347), .A0 (nx796), .A1 (nx841)) ;
    dff reg_rs_5 (.Q (rs_5), .QB (\$dummy [23]), .D (received_signal[5]), .CLK (
        clk)) ;
    dff reg_product_output_6 (.Q (product_output[6]), .QB (\$dummy [24]), .D (
        product_6), .CLK (clk)) ;
    dff reg_product_6 (.Q (product_6), .QB (\$dummy [25]), .D (nx412), .CLK (clk
        )) ;
    xor2 ix413 (.Y (nx412), .A0 (nx360), .A1 (nx363)) ;
    mux21 ix361 (.Y (nx360), .A0 (nx308), .A1 (nx246), .S0 (nx310)) ;
    xnor2 ix364 (.Y (nx363), .A0 (nx365), .A1 (nx405)) ;
    xnor2 ix366 (.Y (nx365), .A0 (nx340), .A1 (nx398)) ;
    mux21 ix341 (.Y (nx340), .A0 (nx345), .A1 (nx320), .S0 (nx298)) ;
    xnor2 ix399 (.Y (nx398), .A0 (nx394), .A1 (nx403)) ;
    xnor2 ix395 (.Y (nx394), .A0 (nx373), .A1 (nx392)) ;
    mux21 ix374 (.Y (nx373), .A0 (nx262), .A1 (nx290), .S0 (nx326)) ;
    xnor2 ix393 (.Y (nx392), .A0 (nx388), .A1 (nx401)) ;
    xnor2 ix389 (.Y (nx388), .A0 (nx356), .A1 (nx383)) ;
    mux21 ix357 (.Y (nx356), .A0 (nx295), .A1 (nx341), .S0 (nx331)) ;
    xnor2 ix384 (.Y (nx383), .A0 (nx385), .A1 (nx399)) ;
    xnor2 ix386 (.Y (nx385), .A0 (nx335), .A1 (nx387)) ;
    xnor2 ix388 (.Y (nx387), .A0 (nx389), .A1 (nx397)) ;
    nand02 ix390 (.Y (nx389), .A0 (nx391), .A1 (nx372)) ;
    dff reg_wlc_6 (.Q (\$dummy [26]), .QB (nx395), .D (walsh_like_code[6]), .CLK (
        clk)) ;
    oai22 ix373 (.Y (nx372), .A0 (nx339), .A1 (nx865), .B0 (nx395), .B1 (nx861)
          ) ;
    nand02 ix398 (.Y (nx397), .A0 (nx829), .A1 (nx817)) ;
    nand02 ix400 (.Y (nx399), .A0 (nx821), .A1 (nx825)) ;
    nand02 ix402 (.Y (nx401), .A0 (nx813), .A1 (nx833)) ;
    nand02 ix404 (.Y (nx403), .A0 (nx807), .A1 (nx841)) ;
    nand02 ix406 (.Y (nx405), .A0 (nx799), .A1 (nx849)) ;
    dff reg_rs_6 (.Q (rs_6), .QB (\$dummy [27]), .D (received_signal[6]), .CLK (
        clk)) ;
    dff reg_product_output_7 (.Q (product_output[7]), .QB (\$dummy [28]), .D (
        product_7), .CLK (clk)) ;
    dff reg_product_7 (.Q (product_7), .QB (\$dummy [29]), .D (nx528), .CLK (clk
        )) ;
    xnor2 ix529 (.Y (nx528), .A0 (nx432), .A1 (nx418)) ;
    mux21 ix433 (.Y (nx432), .A0 (nx360), .A1 (nx405), .S0 (nx363)) ;
    xnor2 ix419 (.Y (nx418), .A0 (nx420), .A1 (nx469)) ;
    xnor2 ix421 (.Y (nx420), .A0 (nx422), .A1 (nx425)) ;
    mux21 ix423 (.Y (nx422), .A0 (nx396), .A1 (nx340), .S0 (nx398)) ;
    xnor2 ix426 (.Y (nx425), .A0 (nx427), .A1 (nx467)) ;
    xnor2 ix428 (.Y (nx427), .A0 (nx448), .A1 (nx508)) ;
    mux21 ix449 (.Y (nx448), .A0 (nx401), .A1 (nx373), .S0 (nx392)) ;
    xnor2 ix509 (.Y (nx508), .A0 (nx504), .A1 (nx465)) ;
    xnor2 ix505 (.Y (nx504), .A0 (nx435), .A1 (nx502)) ;
    mux21 ix436 (.Y (nx435), .A0 (nx356), .A1 (nx384), .S0 (nx383)) ;
    xnor2 ix503 (.Y (nx502), .A0 (nx498), .A1 (nx463)) ;
    xnor2 ix499 (.Y (nx498), .A0 (nx464), .A1 (nx445)) ;
    mux21 ix465 (.Y (nx464), .A0 (nx335), .A1 (nx397), .S0 (nx387)) ;
    xnor2 ix446 (.Y (nx445), .A0 (nx447), .A1 (nx461)) ;
    xnor2 ix448 (.Y (nx447), .A0 (nx391), .A1 (nx449)) ;
    xnor2 ix450 (.Y (nx449), .A0 (nx451), .A1 (nx459)) ;
    nand02 ix452 (.Y (nx451), .A0 (nx453), .A1 (nx482)) ;
    dff reg_wlc_7 (.Q (\$dummy [30]), .QB (nx457), .D (walsh_like_code[7]), .CLK (
        clk)) ;
    oai22 ix483 (.Y (nx482), .A0 (nx395), .A1 (nx865), .B0 (nx457), .B1 (nx875)
          ) ;
    nand02 ix460 (.Y (nx459), .A0 (nx837), .A1 (nx817)) ;
    nand02 ix462 (.Y (nx461), .A0 (nx829), .A1 (nx825)) ;
    nand02 ix464 (.Y (nx463), .A0 (nx821), .A1 (nx833)) ;
    nand02 ix466 (.Y (nx465), .A0 (nx813), .A1 (nx841)) ;
    nand02 ix468 (.Y (nx467), .A0 (nx807), .A1 (nx849)) ;
    nand02 ix470 (.Y (nx469), .A0 (nx799), .A1 (nx857)) ;
    dff reg_rs_7 (.Q (rs_7), .QB (\$dummy [31]), .D (received_signal[7]), .CLK (
        clk)) ;
    dff reg_product_output_8 (.Q (product_output[8]), .QB (\$dummy [32]), .D (
        product_8), .CLK (clk)) ;
    dff reg_product_8 (.Q (product_8), .QB (\$dummy [33]), .D (nx632), .CLK (clk
        )) ;
    xnor2 ix633 (.Y (nx632), .A0 (nx483), .A1 (nx624)) ;
    mux21 ix484 (.Y (nx483), .A0 (nx432), .A1 (nx524), .S0 (nx418)) ;
    xnor2 ix625 (.Y (nx624), .A0 (nx556), .A1 (nx491)) ;
    mux21 ix557 (.Y (nx556), .A0 (nx422), .A1 (nx467), .S0 (nx425)) ;
    xnor2 ix492 (.Y (nx491), .A0 (nx493), .A1 (nx537)) ;
    xnor2 ix494 (.Y (nx493), .A0 (nx495), .A1 (nx499)) ;
    mux21 ix496 (.Y (nx495), .A0 (nx506), .A1 (nx448), .S0 (nx508)) ;
    xnor2 ix500 (.Y (nx499), .A0 (nx501), .A1 (nx535)) ;
    xnor2 ix502 (.Y (nx501), .A0 (nx572), .A1 (nx610)) ;
    mux21 ix573 (.Y (nx572), .A0 (nx463), .A1 (nx435), .S0 (nx502)) ;
    xnor2 ix611 (.Y (nx610), .A0 (nx606), .A1 (nx533)) ;
    xnor2 ix607 (.Y (nx606), .A0 (nx509), .A1 (nx604)) ;
    mux21 ix510 (.Y (nx509), .A0 (nx464), .A1 (nx494), .S0 (nx445)) ;
    xnor2 ix605 (.Y (nx604), .A0 (nx600), .A1 (nx531)) ;
    xnor2 ix601 (.Y (nx600), .A0 (nx588), .A1 (nx519)) ;
    mux21 ix589 (.Y (nx588), .A0 (nx391), .A1 (nx459), .S0 (nx449)) ;
    xnor2 ix520 (.Y (nx519), .A0 (nx521), .A1 (nx529)) ;
    xnor2 ix522 (.Y (nx521), .A0 (nx453), .A1 (nx523)) ;
    xnor2 ix524 (.Y (nx523), .A0 (nx525), .A1 (nx527)) ;
    nand02 ix528 (.Y (nx527), .A0 (nx845), .A1 (nx819)) ;
    nand02 ix530 (.Y (nx529), .A0 (nx837), .A1 (nx825)) ;
    nand02 ix532 (.Y (nx531), .A0 (nx829), .A1 (nx833)) ;
    nand02 ix534 (.Y (nx533), .A0 (nx821), .A1 (nx841)) ;
    nand02 ix536 (.Y (nx535), .A0 (nx815), .A1 (nx849)) ;
    nand02 ix538 (.Y (nx537), .A0 (nx807), .A1 (nx857)) ;
    dff reg_product_output_9 (.Q (product_output[9]), .QB (\$dummy [34]), .D (
        product_9), .CLK (clk)) ;
    dff reg_product_9 (.Q (product_9), .QB (\$dummy [35]), .D (nx728), .CLK (clk
        )) ;
    xor2 ix729 (.Y (nx728), .A0 (nx626), .A1 (nx726)) ;
    nor02ii ix627 (.Y (nx626), .A0 (nx483), .A1 (nx624)) ;
    xnor2 ix727 (.Y (nx726), .A0 (nx549), .A1 (nx724)) ;
    mux21 ix550 (.Y (nx549), .A0 (nx556), .A1 (nx620), .S0 (nx491)) ;
    xnor2 ix725 (.Y (nx724), .A0 (nx660), .A1 (nx557)) ;
    mux21 ix661 (.Y (nx660), .A0 (nx495), .A1 (nx535), .S0 (nx499)) ;
    xnor2 ix558 (.Y (nx557), .A0 (nx559), .A1 (nx599)) ;
    xnor2 ix560 (.Y (nx559), .A0 (nx561), .A1 (nx565)) ;
    mux21 ix562 (.Y (nx561), .A0 (nx608), .A1 (nx572), .S0 (nx610)) ;
    xnor2 ix566 (.Y (nx565), .A0 (nx567), .A1 (nx597)) ;
    xnor2 ix568 (.Y (nx567), .A0 (nx676), .A1 (nx710)) ;
    mux21 ix677 (.Y (nx676), .A0 (nx531), .A1 (nx509), .S0 (nx604)) ;
    xnor2 ix711 (.Y (nx710), .A0 (nx706), .A1 (nx595)) ;
    xnor2 ix707 (.Y (nx706), .A0 (nx575), .A1 (nx704)) ;
    mux21 ix576 (.Y (nx575), .A0 (nx588), .A1 (nx596), .S0 (nx519)) ;
    xnor2 ix705 (.Y (nx704), .A0 (nx700), .A1 (nx593)) ;
    xnor2 ix701 (.Y (nx700), .A0 (nx692), .A1 (nx587)) ;
    aoi21 ix693 (.Y (nx692), .A0 (nx585), .A1 (nx527), .B0 (nx525)) ;
    xnor2 ix588 (.Y (nx587), .A0 (nx589), .A1 (nx591)) ;
    nand02 ix590 (.Y (nx589), .A0 (nx853), .A1 (nx819)) ;
    nand02 ix592 (.Y (nx591), .A0 (nx845), .A1 (nx827)) ;
    nand02 ix594 (.Y (nx593), .A0 (nx837), .A1 (nx833)) ;
    nand02 ix596 (.Y (nx595), .A0 (nx829), .A1 (nx841)) ;
    nand02 ix598 (.Y (nx597), .A0 (nx823), .A1 (nx849)) ;
    nand02 ix600 (.Y (nx599), .A0 (nx815), .A1 (nx857)) ;
    dff reg_product_output_10 (.Q (product_output[10]), .QB (\$dummy [36]), .D (
        product_10), .CLK (clk)) ;
    dff reg_product_10 (.Q (product_10), .QB (\$dummy [37]), .D (nx818), .CLK (
        clk)) ;
    xor2 ix819 (.Y (nx818), .A0 (nx609), .A1 (nx611)) ;
    mux21 ix610 (.Y (nx609), .A0 (nx724), .A1 (nx626), .S0 (nx726)) ;
    xnor2 ix612 (.Y (nx611), .A0 (nx613), .A1 (nx617)) ;
    mux21 ix614 (.Y (nx613), .A0 (nx660), .A1 (nx720), .S0 (nx557)) ;
    xnor2 ix618 (.Y (nx617), .A0 (nx764), .A1 (nx812)) ;
    mux21 ix765 (.Y (nx764), .A0 (nx561), .A1 (nx597), .S0 (nx565)) ;
    xnor2 ix813 (.Y (nx812), .A0 (nx808), .A1 (nx653)) ;
    xnor2 ix809 (.Y (nx808), .A0 (nx625), .A1 (nx806)) ;
    mux21 ix626 (.Y (nx625), .A0 (nx708), .A1 (nx676), .S0 (nx710)) ;
    xnor2 ix807 (.Y (nx806), .A0 (nx802), .A1 (nx651)) ;
    xnor2 ix803 (.Y (nx802), .A0 (nx780), .A1 (nx635)) ;
    mux21 ix781 (.Y (nx780), .A0 (nx593), .A1 (nx575), .S0 (nx704)) ;
    xnor2 ix636 (.Y (nx635), .A0 (nx637), .A1 (nx649)) ;
    xnor2 ix638 (.Y (nx637), .A0 (nx639), .A1 (nx642)) ;
    mux21 ix640 (.Y (nx639), .A0 (nx692), .A1 (nx696), .S0 (nx587)) ;
    xnor2 ix643 (.Y (nx642), .A0 (nx644), .A1 (nx646)) ;
    nand02 ix645 (.Y (nx644), .A0 (nx853), .A1 (nx827)) ;
    nand02 ix648 (.Y (nx646), .A0 (nx845), .A1 (nx835)) ;
    nand02 ix650 (.Y (nx649), .A0 (nx837), .A1 (nx841)) ;
    nand02 ix652 (.Y (nx651), .A0 (nx831), .A1 (nx849)) ;
    nand02 ix654 (.Y (nx653), .A0 (nx823), .A1 (nx857)) ;
    dff reg_product_output_11 (.Q (product_output[11]), .QB (\$dummy [38]), .D (
        product_11), .CLK (clk)) ;
    dff reg_product_11 (.Q (product_11), .QB (\$dummy [39]), .D (nx894), .CLK (
        clk)) ;
    xnor2 ix895 (.Y (nx894), .A0 (nx838), .A1 (nx665)) ;
    mux21 ix839 (.Y (nx838), .A0 (nx609), .A1 (nx617), .S0 (nx611)) ;
    xnor2 ix666 (.Y (nx665), .A0 (nx667), .A1 (nx671)) ;
    mux21 ix668 (.Y (nx667), .A0 (nx810), .A1 (nx764), .S0 (nx812)) ;
    xnor2 ix672 (.Y (nx671), .A0 (nx854), .A1 (nx888)) ;
    mux21 ix855 (.Y (nx854), .A0 (nx651), .A1 (nx625), .S0 (nx806)) ;
    xnor2 ix889 (.Y (nx888), .A0 (nx884), .A1 (nx697)) ;
    xnor2 ix885 (.Y (nx884), .A0 (nx679), .A1 (nx882)) ;
    mux21 ix680 (.Y (nx679), .A0 (nx780), .A1 (nx798), .S0 (nx635)) ;
    xnor2 ix883 (.Y (nx882), .A0 (nx878), .A1 (nx695)) ;
    xnor2 ix879 (.Y (nx878), .A0 (nx870), .A1 (nx689)) ;
    mux21 ix871 (.Y (nx870), .A0 (nx639), .A1 (nx646), .S0 (nx642)) ;
    xnor2 ix690 (.Y (nx689), .A0 (nx691), .A1 (nx693)) ;
    nand02 ix692 (.Y (nx691), .A0 (nx853), .A1 (nx835)) ;
    nand02 ix694 (.Y (nx693), .A0 (nx847), .A1 (nx843)) ;
    nand02 ix696 (.Y (nx695), .A0 (nx839), .A1 (nx849)) ;
    nand02 ix698 (.Y (nx697), .A0 (nx831), .A1 (nx857)) ;
    dff reg_product_output_12 (.Q (product_output[12]), .QB (\$dummy [40]), .D (
        product_12), .CLK (clk)) ;
    dff reg_product_12 (.Q (product_12), .QB (\$dummy [41]), .D (nx956), .CLK (
        clk)) ;
    xnor2 ix957 (.Y (nx956), .A0 (nx707), .A1 (nx954)) ;
    mux21 ix708 (.Y (nx707), .A0 (nx838), .A1 (nx890), .S0 (nx665)) ;
    xnor2 ix955 (.Y (nx954), .A0 (nx713), .A1 (nx952)) ;
    mux21 ix714 (.Y (nx713), .A0 (nx886), .A1 (nx854), .S0 (nx888)) ;
    xnor2 ix953 (.Y (nx952), .A0 (nx930), .A1 (nx721)) ;
    mux21 ix931 (.Y (nx930), .A0 (nx695), .A1 (nx679), .S0 (nx882)) ;
    xnor2 ix722 (.Y (nx721), .A0 (nx723), .A1 (nx735)) ;
    xnor2 ix724 (.Y (nx723), .A0 (nx725), .A1 (nx729)) ;
    mux21 ix726 (.Y (nx725), .A0 (nx870), .A1 (nx874), .S0 (nx689)) ;
    xnor2 ix730 (.Y (nx729), .A0 (nx731), .A1 (nx733)) ;
    nand02 ix732 (.Y (nx731), .A0 (nx853), .A1 (nx843)) ;
    nand02 ix734 (.Y (nx733), .A0 (nx847), .A1 (nx851)) ;
    nand02 ix736 (.Y (nx735), .A0 (nx839), .A1 (nx857)) ;
    dff reg_product_output_13 (.Q (product_output[13]), .QB (\$dummy [42]), .D (
        product_13), .CLK (clk)) ;
    dff reg_product_13 (.Q (product_13), .QB (\$dummy [43]), .D (nx1004), .CLK (
        clk)) ;
    xor2 ix1005 (.Y (nx1004), .A0 (nx976), .A1 (nx1002)) ;
    mux21 ix977 (.Y (nx976), .A0 (nx743), .A1 (nx707), .S0 (nx954)) ;
    xnor2 ix1003 (.Y (nx1002), .A0 (nx747), .A1 (nx1000)) ;
    mux21 ix748 (.Y (nx747), .A0 (nx930), .A1 (nx948), .S0 (nx721)) ;
    xnor2 ix1001 (.Y (nx1000), .A0 (nx992), .A1 (nx755)) ;
    mux21 ix993 (.Y (nx992), .A0 (nx725), .A1 (nx733), .S0 (nx729)) ;
    xnor2 ix756 (.Y (nx755), .A0 (nx757), .A1 (nx759)) ;
    nand02 ix758 (.Y (nx757), .A0 (nx855), .A1 (nx851)) ;
    nand02 ix760 (.Y (nx759), .A0 (nx847), .A1 (nx859)) ;
    dff reg_product_output_14 (.Q (product_output[14]), .QB (\$dummy [44]), .D (
        product_14), .CLK (clk)) ;
    dff reg_product_14 (.Q (product_14), .QB (\$dummy [45]), .D (nx1038), .CLK (
        clk)) ;
    xor2 ix1039 (.Y (nx1038), .A0 (nx769), .A1 (nx771)) ;
    mux21 ix770 (.Y (nx769), .A0 (nx1000), .A1 (nx976), .S0 (nx1002)) ;
    xnor2 ix772 (.Y (nx771), .A0 (nx773), .A1 (nx777)) ;
    mux21 ix774 (.Y (nx773), .A0 (nx992), .A1 (nx996), .S0 (nx755)) ;
    nand02 ix778 (.Y (nx777), .A0 (nx855), .A1 (nx859)) ;
    dff reg_product_output_15 (.Q (product_output[15]), .QB (\$dummy [46]), .D (
        product_15), .CLK (clk)) ;
    dff reg_product_15 (.Q (product_15), .QB (\$dummy [47]), .D (nx1058), .CLK (
        clk)) ;
    mux21 ix1059 (.Y (nx1058), .A0 (nx769), .A1 (nx777), .S0 (nx771)) ;
    inv01 ix997 (.Y (nx996), .A (nx759)) ;
    inv01 ix744 (.Y (nx743), .A (nx952)) ;
    inv01 ix949 (.Y (nx948), .A (nx735)) ;
    inv01 ix891 (.Y (nx890), .A (nx671)) ;
    inv01 ix887 (.Y (nx886), .A (nx697)) ;
    inv01 ix875 (.Y (nx874), .A (nx693)) ;
    inv01 ix811 (.Y (nx810), .A (nx653)) ;
    inv01 ix799 (.Y (nx798), .A (nx649)) ;
    inv01 ix721 (.Y (nx720), .A (nx599)) ;
    inv01 ix709 (.Y (nx708), .A (nx595)) ;
    inv01 ix697 (.Y (nx696), .A (nx591)) ;
    inv01 ix621 (.Y (nx620), .A (nx537)) ;
    inv01 ix609 (.Y (nx608), .A (nx533)) ;
    inv01 ix597 (.Y (nx596), .A (nx529)) ;
    inv01 ix525 (.Y (nx524), .A (nx469)) ;
    inv01 ix507 (.Y (nx506), .A (nx465)) ;
    inv01 ix495 (.Y (nx494), .A (nx461)) ;
    inv01 ix397 (.Y (nx396), .A (nx403)) ;
    inv01 ix385 (.Y (nx384), .A (nx399)) ;
    inv01 ix309 (.Y (nx308), .A (nx347)) ;
    inv01 ix291 (.Y (nx290), .A (nx343)) ;
    inv01 ix211 (.Y (nx210), .A (nx303)) ;
    inv01 ix151 (.Y (nx150), .A (nx265)) ;
    inv01 ix795 (.Y (nx796), .A (nx199)) ;
    inv01 ix797 (.Y (nx799), .A (nx199)) ;
    inv01 ix800 (.Y (nx801), .A (nx875)) ;
    inv01 ix804 (.Y (nx805), .A (nx217)) ;
    inv01 ix806 (.Y (nx807), .A (nx217)) ;
    inv01 ix808 (.Y (nx809), .A (nx877)) ;
    inv01 ix812 (.Y (nx813), .A (nx234)) ;
    inv01 ix814 (.Y (nx815), .A (nx234)) ;
    buf02 ix816 (.Y (nx817), .A (rs_2)) ;
    buf02 ix818 (.Y (nx819), .A (rs_2)) ;
    inv01 ix820 (.Y (nx821), .A (nx261)) ;
    inv01 ix822 (.Y (nx823), .A (nx261)) ;
    buf02 ix824 (.Y (nx825), .A (rs_3)) ;
    buf02 ix826 (.Y (nx827), .A (rs_3)) ;
    inv01 ix828 (.Y (nx829), .A (nx299)) ;
    inv01 ix830 (.Y (nx831), .A (nx299)) ;
    buf02 ix832 (.Y (nx833), .A (rs_4)) ;
    buf02 ix834 (.Y (nx835), .A (rs_4)) ;
    inv01 ix836 (.Y (nx837), .A (nx339)) ;
    inv01 ix838 (.Y (nx839), .A (nx339)) ;
    buf02 ix840 (.Y (nx841), .A (rs_5)) ;
    buf02 ix842 (.Y (nx843), .A (rs_5)) ;
    inv01 ix844 (.Y (nx845), .A (nx395)) ;
    inv01 ix846 (.Y (nx847), .A (nx395)) ;
    buf02 ix848 (.Y (nx849), .A (rs_6)) ;
    buf02 ix850 (.Y (nx851), .A (rs_6)) ;
    inv01 ix852 (.Y (nx853), .A (nx457)) ;
    inv01 ix854 (.Y (nx855), .A (nx457)) ;
    buf02 ix856 (.Y (nx857), .A (rs_7)) ;
    buf02 ix858 (.Y (nx859), .A (rs_7)) ;
    inv01 ix860 (.Y (nx861), .A (rs_0)) ;
    inv01 ix862 (.Y (nx863), .A (rs_0)) ;
    inv01 ix864 (.Y (nx865), .A (rs_1)) ;
    inv01 ix866 (.Y (nx867), .A (rs_1)) ;
    nor02ii ix13 (.Y (nx12), .A0 (nx199), .A1 (rs_0)) ;
    or04 ix219 (.Y (nx218), .A0 (nx199), .A1 (nx875), .A2 (nx217), .A3 (nx877)
         ) ;
    or04 ix232 (.Y (nx231), .A0 (nx877), .A1 (nx875), .A2 (nx234), .A3 (nx217)
         ) ;
    or04 ix258 (.Y (nx257), .A0 (nx877), .A1 (nx875), .A2 (nx261), .A3 (nx234)
         ) ;
    or04 ix296 (.Y (nx295), .A0 (nx877), .A1 (nx875), .A2 (nx299), .A3 (nx261)
         ) ;
    or04 ix336 (.Y (nx335), .A0 (nx877), .A1 (nx863), .A2 (nx339), .A3 (nx299)
         ) ;
    or04 ix392 (.Y (nx391), .A0 (nx867), .A1 (nx863), .A2 (nx395), .A3 (nx339)
         ) ;
    or04 ix454 (.Y (nx453), .A0 (nx457), .A1 (nx867), .A2 (nx395), .A3 (nx863)
         ) ;
    or02 ix526 (.Y (nx525), .A0 (nx457), .A1 (nx867)) ;
    or02 ix586 (.Y (nx585), .A0 (nx395), .A1 (nx863)) ;
    inv01 ix873 (.Y (nx875), .A (rs_0)) ;
    inv01 ix876 (.Y (nx877), .A (rs_1)) ;
endmodule

