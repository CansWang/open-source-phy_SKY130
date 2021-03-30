set outbuf_pin_width 4
set outbuf_pin_height 4
set outbuf_pin_space 4 
set outbuf_pin_offset_x [expr $output_buffer_width+3]
set outbuf_pin_offset_y [expr $outbuf_pin_space]

set pin_tx_outp_x $origin_async_x	
set pin_tx_outp_y [expr $origin_ref_y+$input_buffer_height-$outbuf_pin_height]
set pin_tx_outn_x $origin_async_x
set pin_tx_outn_y [expr $origin_ref_y]

 createPhysicalPin ext_tx_outp -net ext_tx_outp -layer 10 -rect $pin_tx_outp_x $pin_tx_outp_y [expr $pin_tx_outp_x+$outbuf_pin_width] [expr $pin_tx_outp_y+$outbuf_pin_height]
 createPhysicalPin ext_tx_outn -net ext_tx_outn -layer 10 -rect $pin_tx_outn_x $pin_tx_outn_y [expr $pin_tx_outn_x+$outbuf_pin_width] [expr $pin_tx_outn_y+$outbuf_pin_height]
 
routeMixedSignal -constraintFile inputs/tx_MS_routes.tcl    
