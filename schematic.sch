# File saved with Nlview 7.8.0 2024-04-26 e1825d835c VDI=44 GEI=38 GUI=JA:21.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 15
property maxzoom 6.25
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #0000ff
property overlaycolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 15
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new top work:top:NOFILE -nosplit
load symbol CPU_Pipelined work:CPU_Pipelined:NOFILE HIERBOX pin clk_IBUF_BUFG input.left pin reset_n_IBUF input.left pinBus an_OBUF input.left [0:0] pinBus seg_OBUF output.right [6:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol hex_display work:hex_display:NOFILE HIERBOX pin clk_IBUF_BUFG input.left pinBus an_OBUF output.right [1:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol OBUF hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol BUFG hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol IBUF hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol OBUFT hdi_primitives BOX pin O output.right pin I input.left pin T input.left fillcolor 1
load port clk input -pg 1 -lvl 0 -x 0 -y 250
load port dp output -pg 1 -lvl 6 -x 1270 -y 610
load port reset_n input -pg 1 -lvl 0 -x 0 -y 210
load portBus an output [7:0] -attr @name an[7:0] -pg 1 -lvl 6 -x 1270 -y 40
load portBus buttons input [4:0] -attr @name buttons[4:0] -pg 1 -lvl 0 -x 0 -y 20
load portBus leds output [15:0] -attr @name leds[15:0] -pg 1 -lvl 6 -x 1270 -y 1180
load portBus seg output [6:0] -attr @name seg[6:0] -pg 1 -lvl 6 -x 1270 -y 680
load portBus switches input [15:0] -attr @name switches[15:0] -pg 1 -lvl 0 -x 0 -y 40
load inst CPU CPU_Pipelined work:CPU_Pipelined:NOFILE -autohide -attr @cell(#000000) CPU_Pipelined -pinBusAttr an_OBUF @name an_OBUF -pinBusAttr seg_OBUF @name seg_OBUF[6:0] -pg 1 -lvl 4 -x 820 -y 160
load inst CPU_Display hex_display work:hex_display:NOFILE -autohide -attr @cell(#000000) hex_display -pinBusAttr an_OBUF @name an_OBUF[1:0] -pg 1 -lvl 3 -x 500 -y 120
load inst an_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 40
load inst an_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 110
load inst an_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 190
load inst an_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 260
load inst an_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 330
load inst an_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 400
load inst an_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 470
load inst an_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 540
load inst clk_IBUF_BUFG_inst BUFG hdi_primitives -attr @cell(#000000) BUFG -pg 1 -lvl 2 -x 190 -y 250
load inst clk_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 1 -x 40 -y 250
load inst dp_OBUF_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 610
load inst leds_OBUF[0]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 1170
load inst leds_OBUF[10]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 2070
load inst leds_OBUF[11]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 2160
load inst leds_OBUF[12]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 2250
load inst leds_OBUF[13]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 2340
load inst leds_OBUF[14]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 2430
load inst leds_OBUF[15]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 2520
load inst leds_OBUF[1]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 1260
load inst leds_OBUF[2]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 1350
load inst leds_OBUF[3]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 1440
load inst leds_OBUF[4]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 1530
load inst leds_OBUF[5]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 1620
load inst leds_OBUF[6]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 1710
load inst leds_OBUF[7]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 1800
load inst leds_OBUF[8]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 1890
load inst leds_OBUF[9]_inst OBUFT hdi_primitives -attr @cell(#000000) OBUFT -pg 1 -lvl 5 -x 1090 -y 1980
load inst reset_n_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 3 -x 500 -y 210
load inst seg_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 680
load inst seg_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 750
load inst seg_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 820
load inst seg_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 890
load inst seg_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 960
load inst seg_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 1030
load inst seg_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 5 -x 1090 -y 1100
load net <const0> -ground -pin leds_OBUF[0]_inst I -pin leds_OBUF[10]_inst I -pin leds_OBUF[11]_inst I -pin leds_OBUF[12]_inst I -pin leds_OBUF[13]_inst I -pin leds_OBUF[14]_inst I -pin leds_OBUF[15]_inst I -pin leds_OBUF[1]_inst I -pin leds_OBUF[2]_inst I -pin leds_OBUF[3]_inst I -pin leds_OBUF[4]_inst I -pin leds_OBUF[5]_inst I -pin leds_OBUF[6]_inst I -pin leds_OBUF[7]_inst I -pin leds_OBUF[8]_inst I -pin leds_OBUF[9]_inst I
load net <const1> -power -pin an_OBUF[2]_inst I -pin an_OBUF[3]_inst I -pin an_OBUF[4]_inst I -pin an_OBUF[5]_inst I -pin an_OBUF[6]_inst I -pin an_OBUF[7]_inst I -pin dp_OBUF_inst I -pin leds_OBUF[0]_inst T -pin leds_OBUF[10]_inst T -pin leds_OBUF[11]_inst T -pin leds_OBUF[12]_inst T -pin leds_OBUF[13]_inst T -pin leds_OBUF[14]_inst T -pin leds_OBUF[15]_inst T -pin leds_OBUF[1]_inst T -pin leds_OBUF[2]_inst T -pin leds_OBUF[3]_inst T -pin leds_OBUF[4]_inst T -pin leds_OBUF[5]_inst T -pin leds_OBUF[6]_inst T -pin leds_OBUF[7]_inst T -pin leds_OBUF[8]_inst T -pin leds_OBUF[9]_inst T
load net an[0] -attr @rip(#000000) 0 -port an[0] -pin an_OBUF[0]_inst O
load net an[1] -attr @rip(#000000) 1 -port an[1] -pin an_OBUF[1]_inst O
load net an[2] -attr @rip(#000000) 2 -port an[2] -pin an_OBUF[2]_inst O
load net an[3] -attr @rip(#000000) 3 -port an[3] -pin an_OBUF[3]_inst O
load net an[4] -attr @rip(#000000) 4 -port an[4] -pin an_OBUF[4]_inst O
load net an[5] -attr @rip(#000000) 5 -port an[5] -pin an_OBUF[5]_inst O
load net an[6] -attr @rip(#000000) 6 -port an[6] -pin an_OBUF[6]_inst O
load net an[7] -attr @rip(#000000) 7 -port an[7] -pin an_OBUF[7]_inst O
load net an_OBUF[0] -attr @rip(#000000) an_OBUF[0] -pin CPU an_OBUF[0] -pin CPU_Display an_OBUF[0] -pin an_OBUF[0]_inst I
load net an_OBUF[1] -attr @rip(#000000) an_OBUF[1] -pin CPU_Display an_OBUF[1] -pin an_OBUF[1]_inst I
load net clk -port clk -pin clk_IBUF_inst I
netloc clk 1 0 1 NJ 250
load net clk_IBUF -pin clk_IBUF_BUFG_inst I -pin clk_IBUF_inst O
netloc clk_IBUF 1 1 1 NJ 250
load net clk_IBUF_BUFG -pin CPU clk_IBUF_BUFG -pin CPU_Display clk_IBUF_BUFG -pin clk_IBUF_BUFG_inst O
netloc clk_IBUF_BUFG 1 2 2 370 170 670J
load net dp -port dp -pin dp_OBUF_inst O
netloc dp 1 5 1 NJ 610
load net leds[0] -attr @rip(#000000) 0 -port leds[0] -pin leds_OBUF[0]_inst O
load net leds[10] -attr @rip(#000000) 10 -port leds[10] -pin leds_OBUF[10]_inst O
load net leds[11] -attr @rip(#000000) 11 -port leds[11] -pin leds_OBUF[11]_inst O
load net leds[12] -attr @rip(#000000) 12 -port leds[12] -pin leds_OBUF[12]_inst O
load net leds[13] -attr @rip(#000000) 13 -port leds[13] -pin leds_OBUF[13]_inst O
load net leds[14] -attr @rip(#000000) 14 -port leds[14] -pin leds_OBUF[14]_inst O
load net leds[15] -attr @rip(#000000) 15 -port leds[15] -pin leds_OBUF[15]_inst O
load net leds[1] -attr @rip(#000000) 1 -port leds[1] -pin leds_OBUF[1]_inst O
load net leds[2] -attr @rip(#000000) 2 -port leds[2] -pin leds_OBUF[2]_inst O
load net leds[3] -attr @rip(#000000) 3 -port leds[3] -pin leds_OBUF[3]_inst O
load net leds[4] -attr @rip(#000000) 4 -port leds[4] -pin leds_OBUF[4]_inst O
load net leds[5] -attr @rip(#000000) 5 -port leds[5] -pin leds_OBUF[5]_inst O
load net leds[6] -attr @rip(#000000) 6 -port leds[6] -pin leds_OBUF[6]_inst O
load net leds[7] -attr @rip(#000000) 7 -port leds[7] -pin leds_OBUF[7]_inst O
load net leds[8] -attr @rip(#000000) 8 -port leds[8] -pin leds_OBUF[8]_inst O
load net leds[9] -attr @rip(#000000) 9 -port leds[9] -pin leds_OBUF[9]_inst O
load net reset_n -port reset_n -pin reset_n_IBUF_inst I
netloc reset_n 1 0 3 NJ 210 NJ 210 NJ
load net reset_n_IBUF -pin CPU reset_n_IBUF -pin reset_n_IBUF_inst O
netloc reset_n_IBUF 1 3 1 NJ 210
load net seg[0] -attr @rip(#000000) 0 -port seg[0] -pin seg_OBUF[0]_inst O
load net seg[1] -attr @rip(#000000) 1 -port seg[1] -pin seg_OBUF[1]_inst O
load net seg[2] -attr @rip(#000000) 2 -port seg[2] -pin seg_OBUF[2]_inst O
load net seg[3] -attr @rip(#000000) 3 -port seg[3] -pin seg_OBUF[3]_inst O
load net seg[4] -attr @rip(#000000) 4 -port seg[4] -pin seg_OBUF[4]_inst O
load net seg[5] -attr @rip(#000000) 5 -port seg[5] -pin seg_OBUF[5]_inst O
load net seg[6] -attr @rip(#000000) 6 -port seg[6] -pin seg_OBUF[6]_inst O
load net seg_OBUF[0] -attr @rip(#000000) seg_OBUF[0] -pin CPU seg_OBUF[0] -pin seg_OBUF[0]_inst I
load net seg_OBUF[1] -attr @rip(#000000) seg_OBUF[1] -pin CPU seg_OBUF[1] -pin seg_OBUF[1]_inst I
load net seg_OBUF[2] -attr @rip(#000000) seg_OBUF[2] -pin CPU seg_OBUF[2] -pin seg_OBUF[2]_inst I
load net seg_OBUF[3] -attr @rip(#000000) seg_OBUF[3] -pin CPU seg_OBUF[3] -pin seg_OBUF[3]_inst I
load net seg_OBUF[4] -attr @rip(#000000) seg_OBUF[4] -pin CPU seg_OBUF[4] -pin seg_OBUF[4]_inst I
load net seg_OBUF[5] -attr @rip(#000000) seg_OBUF[5] -pin CPU seg_OBUF[5] -pin seg_OBUF[5]_inst I
load net seg_OBUF[6] -attr @rip(#000000) seg_OBUF[6] -pin CPU seg_OBUF[6] -pin seg_OBUF[6]_inst I
load netBundle @an 8 an[7] an[6] an[5] an[4] an[3] an[2] an[1] an[0] -autobundled
netbloc @an 1 5 1 1250 40n
load netBundle @leds 16 leds[15] leds[14] leds[13] leds[12] leds[11] leds[10] leds[9] leds[8] leds[7] leds[6] leds[5] leds[4] leds[3] leds[2] leds[1] leds[0] -autobundled
netbloc @leds 1 5 1 1250 1180n
load netBundle @seg 7 seg[6] seg[5] seg[4] seg[3] seg[2] seg[1] seg[0] -autobundled
netbloc @seg 1 5 1 1250 680n
load netBundle @seg_OBUF 7 seg_OBUF[6] seg_OBUF[5] seg_OBUF[4] seg_OBUF[3] seg_OBUF[2] seg_OBUF[1] seg_OBUF[0] -autobundled
netbloc @seg_OBUF 1 4 1 1000 190n
load netBundle @an_OBUF 2 an_OBUF[1] an_OBUF[0] -autobundled
netbloc @an_OBUF 1 3 2 690 110 1020
levelinfo -pg 1 0 40 190 500 820 1090 1270
pagesize -pg 1 -db -bbox -sgen -140 0 1390 2610
show
zoom 0.612798
scrollpos -463 -1
#
# initialize ictrl to current module top work:top:NOFILE
ictrl init topinfo |
