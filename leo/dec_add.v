//
// Verilog description for cell dec_add, 
// Thu May 11 02:05:10 2023
//
// LeonardoSpectrum Level 3, 2011a.4 
//


module dec_add ( clk, input_signal, addedop ) ;

    input clk ;
    input [7:0]input_signal ;
    output [7:0]addedop ;

    wire nx203, count_5, nx222, count_4, count_3, count_2, count_1, count_0, nx4, 
         nx223, nx20, nx224, nx36, nx60, nx226, nx80, output_buffer_0, nx114, 
         output_buffer_1, nx128, nx134, output_buffer_2, nx162, output_buffer_3, 
         nx182, nx186, nx190, output_buffer_4, nx218, output_buffer_5, nx238, 
         nx242, nx246, output_buffer_6, nx274, output_buffer_7, nx294, nx298, 
         nx302, nx233, nx243, nx253, nx263, nx273, nx283, nx293, nx303, nx317, 
         nx321, nx328, nx339, nx341, nx344, nx346, nx348, nx352, nx362, nx364, 
         nx366, nx374, nx376, nx379, nx381, nx389, nx397, nx399, nx401, nx403, 
         nx411, nx419, nx421, nx423, nx425, nx433, nx442, nx450, nx452;
    wire [17:0] \$dummy ;




    fake_gnd ix204 (.Y (nx203)) ;
    dff reg_addedop_0 (.Q (addedop[0]), .QB (\$dummy [0]), .D (nx233), .CLK (clk
        )) ;
    dff reg_output_buffer_0 (.Q (output_buffer_0), .QB (\$dummy [1]), .D (nx114)
        , .CLK (clk)) ;
    nor02 ix318 (.Y (nx317), .A0 (output_buffer_0), .A1 (input_signal[0])) ;
    nor02ii ix89 (.Y (nx226), .A0 (nx321), .A1 (count_4)) ;
    nand04 ix322 (.Y (nx321), .A0 (count_3), .A1 (count_1), .A2 (count_0), .A3 (
           count_2)) ;
    aoi21 ix61 (.Y (nx60), .A0 (nx224), .A1 (nx344), .B0 (nx346)) ;
    nand03 ix49 (.Y (nx224), .A0 (count_1), .A1 (count_0), .A2 (count_2)) ;
    dff reg_count_1 (.Q (count_1), .QB (\$dummy [2]), .D (nx20), .CLK (clk)) ;
    nor03 ix21 (.Y (nx20), .A0 (nx328), .A1 (nx223), .A2 (count_5)) ;
    nor02 ix329 (.Y (nx328), .A0 (count_0), .A1 (count_1)) ;
    dff reg_count_0 (.Q (count_0), .QB (\$dummy [3]), .D (nx4), .CLK (clk)) ;
    nor02 ix5 (.Y (nx4), .A0 (count_0), .A1 (count_5)) ;
    dff reg_count_5 (.Q (count_5), .QB (\$dummy [4]), .D (nx203), .CLK (clk)) ;
    and02 ix29 (.Y (nx223), .A0 (count_1), .A1 (count_0)) ;
    dff reg_count_2 (.Q (count_2), .QB (\$dummy [5]), .D (nx36), .CLK (clk)) ;
    nor03 ix37 (.Y (nx36), .A0 (nx339), .A1 (nx341), .A2 (count_5)) ;
    aoi21 ix340 (.Y (nx339), .A0 (count_1), .A1 (count_0), .B0 (count_2)) ;
    dff reg_count_3 (.Q (count_3), .QB (nx344), .D (nx60), .CLK (clk)) ;
    nand02 ix347 (.Y (nx346), .A0 (nx442), .A1 (nx321)) ;
    nor02 ix349 (.Y (nx348), .A0 (nx226), .A1 (count_5)) ;
    dff reg_count_4 (.Q (count_4), .QB (\$dummy [6]), .D (nx80), .CLK (clk)) ;
    nor03 ix81 (.Y (nx80), .A0 (nx352), .A1 (nx226), .A2 (count_5)) ;
    nor02ii ix353 (.Y (nx352), .A0 (count_4), .A1 (nx321)) ;
    dff reg_addedop_1 (.Q (addedop[1]), .QB (\$dummy [7]), .D (nx243), .CLK (clk
        )) ;
    dff reg_output_buffer_1 (.Q (output_buffer_1), .QB (\$dummy [8]), .D (nx134)
        , .CLK (clk)) ;
    xnor2 ix363 (.Y (nx362), .A0 (nx364), .A1 (nx366)) ;
    nand02 ix365 (.Y (nx364), .A0 (input_signal[0]), .A1 (output_buffer_0)) ;
    xnor2 ix367 (.Y (nx366), .A0 (input_signal[1]), .A1 (output_buffer_1)) ;
    dff reg_addedop_2 (.Q (addedop[2]), .QB (\$dummy [9]), .D (nx253), .CLK (clk
        )) ;
    dff reg_output_buffer_2 (.Q (output_buffer_2), .QB (nx381), .D (nx162), .CLK (
        clk)) ;
    xnor2 ix375 (.Y (nx374), .A0 (nx376), .A1 (nx379)) ;
    aoi32 ix377 (.Y (nx376), .A0 (input_signal[0]), .A1 (output_buffer_0), .A2 (
          nx128), .B0 (output_buffer_1), .B1 (input_signal[1])) ;
    dff reg_addedop_3 (.Q (addedop[3]), .QB (\$dummy [10]), .D (nx263), .CLK (
        clk)) ;
    dff reg_output_buffer_3 (.Q (output_buffer_3), .QB (\$dummy [11]), .D (nx190
        ), .CLK (clk)) ;
    xnor2 ix187 (.Y (nx186), .A0 (nx182), .A1 (nx389)) ;
    mux21 ix183 (.Y (nx182), .A0 (nx376), .A1 (nx381), .S0 (nx379)) ;
    xnor2 ix390 (.Y (nx389), .A0 (input_signal[3]), .A1 (output_buffer_3)) ;
    dff reg_addedop_4 (.Q (addedop[4]), .QB (\$dummy [12]), .D (nx273), .CLK (
        clk)) ;
    dff reg_output_buffer_4 (.Q (output_buffer_4), .QB (nx403), .D (nx218), .CLK (
        clk)) ;
    xnor2 ix398 (.Y (nx397), .A0 (nx399), .A1 (nx401)) ;
    mux21 ix400 (.Y (nx399), .A0 (nx182), .A1 (output_buffer_3), .S0 (nx389)) ;
    dff reg_addedop_5 (.Q (addedop[5]), .QB (\$dummy [13]), .D (nx283), .CLK (
        clk)) ;
    dff reg_output_buffer_5 (.Q (output_buffer_5), .QB (\$dummy [14]), .D (nx246
        ), .CLK (clk)) ;
    xnor2 ix243 (.Y (nx242), .A0 (nx238), .A1 (nx411)) ;
    mux21 ix239 (.Y (nx238), .A0 (nx399), .A1 (nx403), .S0 (nx401)) ;
    xnor2 ix412 (.Y (nx411), .A0 (input_signal[5]), .A1 (output_buffer_5)) ;
    dff reg_addedop_6 (.Q (addedop[6]), .QB (\$dummy [15]), .D (nx293), .CLK (
        clk)) ;
    dff reg_output_buffer_6 (.Q (output_buffer_6), .QB (nx425), .D (nx274), .CLK (
        clk)) ;
    xnor2 ix420 (.Y (nx419), .A0 (nx421), .A1 (nx423)) ;
    mux21 ix422 (.Y (nx421), .A0 (nx238), .A1 (output_buffer_5), .S0 (nx411)) ;
    dff reg_addedop_7 (.Q (addedop[7]), .QB (\$dummy [16]), .D (nx303), .CLK (
        clk)) ;
    dff reg_output_buffer_7 (.Q (output_buffer_7), .QB (\$dummy [17]), .D (nx302
        ), .CLK (clk)) ;
    xnor2 ix299 (.Y (nx298), .A0 (nx294), .A1 (nx433)) ;
    mux21 ix295 (.Y (nx294), .A0 (nx421), .A1 (nx425), .S0 (nx423)) ;
    xnor2 ix434 (.Y (nx433), .A0 (input_signal[7]), .A1 (output_buffer_7)) ;
    inv01 ix129 (.Y (nx128), .A (nx366)) ;
    inv01 ix342 (.Y (nx341), .A (nx224)) ;
    inv01 ix103 (.Y (nx222), .A (nx348)) ;
    inv01 ix441 (.Y (nx442), .A (nx452)) ;
    mux21_ni ix234 (.Y (nx233), .A0 (addedop[0]), .A1 (output_buffer_0), .S0 (
             nx452)) ;
    and03 ix115 (.Y (nx114), .A0 (nx450), .A1 (nx348), .A2 (nx364)) ;
    inv01 ix449 (.Y (nx450), .A (nx317)) ;
    mux21_ni ix244 (.Y (nx243), .A0 (addedop[1]), .A1 (output_buffer_1), .S0 (
             nx452)) ;
    nor02ii ix135 (.Y (nx134), .A0 (nx362), .A1 (nx348)) ;
    mux21_ni ix254 (.Y (nx253), .A0 (addedop[2]), .A1 (output_buffer_2), .S0 (
             nx452)) ;
    nor02ii ix163 (.Y (nx162), .A0 (nx374), .A1 (nx348)) ;
    xor2 ix380 (.Y (nx379), .A0 (input_signal[2]), .A1 (nx381)) ;
    mux21_ni ix264 (.Y (nx263), .A0 (addedop[3]), .A1 (output_buffer_3), .S0 (
             nx452)) ;
    nor02ii ix191 (.Y (nx190), .A0 (nx452), .A1 (nx186)) ;
    mux21_ni ix274 (.Y (nx273), .A0 (addedop[4]), .A1 (output_buffer_4), .S0 (
             nx222)) ;
    nor02ii ix219 (.Y (nx218), .A0 (nx397), .A1 (nx348)) ;
    xor2 ix402 (.Y (nx401), .A0 (input_signal[4]), .A1 (nx403)) ;
    mux21_ni ix284 (.Y (nx283), .A0 (addedop[5]), .A1 (output_buffer_5), .S0 (
             nx222)) ;
    nor02ii ix247 (.Y (nx246), .A0 (nx222), .A1 (nx242)) ;
    mux21_ni ix294 (.Y (nx293), .A0 (addedop[6]), .A1 (output_buffer_6), .S0 (
             nx222)) ;
    nor02ii ix275 (.Y (nx274), .A0 (nx419), .A1 (nx348)) ;
    xor2 ix424 (.Y (nx423), .A0 (input_signal[6]), .A1 (nx425)) ;
    mux21_ni ix304 (.Y (nx303), .A0 (addedop[7]), .A1 (output_buffer_7), .S0 (
             nx222)) ;
    nor02ii ix303 (.Y (nx302), .A0 (nx222), .A1 (nx298)) ;
    inv01 ix451 (.Y (nx452), .A (nx348)) ;
endmodule

