# modified from GcdUnit full commercial example

import os

from mflowgen.components import Graph, Step

def construct():


  g = Graph()

  #-----------------------------------------------------------------------
  # Parameters
  #-----------------------------------------------------------------------

  adk_name = 'skywater-130nm-adk'
  adk_view = 'view-standard'

  parameters = {
    'construct_path' : __file__,
    'design_name'    : 'qr_4t1_mux_top',
    'clock_period'   : 2.0,
    'adk'            : adk_name,
    'adk_view'       : adk_view,
    'topographical'  : True,
  }

  #-----------------------------------------------------------------------
  # Create nodes
  #-----------------------------------------------------------------------

  this_dir = os.path.dirname( os.path.abspath( __file__ ) )

  # ADK step

  g.set_adk( adk_name )
  adk = g.get_adk_step()

  # Custom steps
  
  rtl = Step( this_dir + '/rtl' )
  custom_init = Step(this_dir + '/custom-init')
  custom_power = Step( this_dir + '/custom-power')
  custom_geom = Step(this_dir + '/custom-geom')
  custom_place = Step(this_dir + '/custom-place')

  constraints = Step( this_dir + '/constraints' )
  dc = Step( this_dir + '/synopsys-dc-synthesis' )
  # qtm = Step(this_dir + '/qtm')
  # Define blocks function

  blocks = []

  # Added steps for blackbox

  init = Step(this_dir + '/cadence-innovus-init')
  cts  = Step(this_dir + '/cadence-innovus-cts')
  place = Step(this_dir + '/cadence-innovus-place') 
  prelvs = Step(this_dir + '/prelvs_fix')
  lvs  = Step(this_dir + '/mentor-calibre-lvs')
  gdsmerge = Step(this_dir + '/mentor-calibre-gdsmerge')


# Default steps

  info           = Step( 'info',                           default=True )
  iflow          = Step( 'cadence-innovus-flowsetup',      default=True )
#  init           = Step( 'cadence-innovus-init',           default=True )
  power          = Step( 'cadence-innovus-power',          default=True )
#  place          = Step( 'cadence-innovus-place',          default=True )
#  cts            = Step( 'cadence-innovus-cts',            default=True )
  postcts_hold   = Step( 'cadence-innovus-postcts_hold',   default=True )
  route          = Step( 'cadence-innovus-route',          default=True )
  postroute      = Step( 'cadence-innovus-postroute',      default=True )
  postroute_hold = Step( 'cadence-innovus-postroute_hold', default=True )
  signoff        = Step( 'cadence-innovus-signoff',        default=True )
  genlibdb       = Step( 'synopsys-ptpx-genlibdb',         default=True )
#  gdsmerge       = Step( 'mentor-calibre-gdsmerge',        default=True )
  drc            = Step( 'mentor-calibre-drc',             default=True )
#  lvs            = Step( 'mentor-calibre-lvs',             default=True )
  debugcalibre   = Step( 'cadence-innovus-debug-calibre',  default=True )

  # Add extra inputs to innovus init and power steps
  init.extend_inputs(custom_init.all_outputs())
  init.extend_inputs(custom_geom.all_outputs())
  power.extend_inputs(custom_power.all_outputs())
  power.extend_inputs(custom_geom.all_outputs())
  place.extend_inputs(custom_place.all_outputs())

   
  lib_lef_steps = \
      [iflow, init, power, place, cts, postcts_hold, route, postroute, signoff]
#  for step in lib_lef_steps:
#      step.extend_inputs(libs + lefs)

   # gds_list needed for gds_merge step

   # spi_list or verilog netlists needed for blackbox LVS


#-----------------------------------------------------------------------
  # Graph -- Add nodes
  #-----------------------------------------------------------------------

  g.add_step( info           )
  g.add_step( rtl            )
  g.add_step( constraints    )
  g.add_step( dc             )
  g.add_step( iflow          )
  g.add_step( init           )
  g.add_step( power          )
  g.add_step( place          )
  g.add_step( cts            )
  g.add_step( postcts_hold   )
  g.add_step( route          )
  g.add_step( postroute      )
  g.add_step( postroute_hold )
  g.add_step( signoff        )
  g.add_step( genlibdb       )
  g.add_step( gdsmerge       )
  g.add_step( drc            )
  g.add_step( lvs            )
  g.add_step( debugcalibre   )
  g.add_step( custom_geom    )
  g.add_step( custom_init    )
  g.add_step( custom_power   )
  g.add_step( custom_place   )
  g.add_step( prelvs         )

  for block in blocks:
    g.add_step ( block )

#  g.add_step( qtm )

  #g.add_step( custom_geom )
  #-----------------------------------------------------------------------
  # Graph -- Add edges
  #-----------------------------------------------------------------------

  # Connect by name

  g.connect_by_name( adk,            dc             )
  g.connect_by_name( adk,            iflow          )
  g.connect_by_name( adk,            init           )
  g.connect_by_name( adk,            power          )
  g.connect_by_name( adk,            place          )
  g.connect_by_name( adk,            cts            )
  g.connect_by_name( adk,            postcts_hold   )
  g.connect_by_name( adk,            route          )
  g.connect_by_name( adk,            postroute      )
  g.connect_by_name( adk,            postroute_hold )
  g.connect_by_name( adk,            signoff        )
  g.connect_by_name( adk,            gdsmerge       )
  g.connect_by_name( adk,            drc            )
  g.connect_by_name( adk,            lvs            )
#  g.connect_by_name( adk, 	     qtm            )

#  for block in blocks + [qtm]:
#    g.connect_by_name(block, dc)
#    g.connect_by_name(block, iflow)
#    g.connect_by_name(block, init)
#    g.connect_by_name(block, power)
#    g.connect_by_name(block, place)
#    g.connect_by_name(block, cts)
#    g.connect_by_name(block, postcts_hold)
#    g.connect_by_name(block, route)
#    g.connect_by_name(block, postroute)
#    g.connect_by_name(block, signoff)
#    g.connect_by_name(block, gdsmerge)
#    g.connect_by_name(block, lvs)
  

  g.connect_by_name( custom_place,   place          )
  g.connect_by_name( custom_init,    init           )
  g.connect_by_name( custom_geom,    init           )

  g.connect_by_name( custom_power,   power          )
  g.connect_by_name( custom_geom,    power          )


  g.connect_by_name( rtl,            dc             )
  g.connect_by_name( constraints,    dc             )

  g.connect_by_name( dc,             iflow          )
  g.connect_by_name( dc,             init           )
  g.connect_by_name( dc,             power          )
  g.connect_by_name( dc,             place          )
  g.connect_by_name( dc,             cts            )

  g.connect_by_name( iflow,          init           )
  g.connect_by_name( iflow,          power          )
  g.connect_by_name( iflow,          place          )
  g.connect_by_name( iflow,          cts            )
  g.connect_by_name( iflow,          postcts_hold   )
  g.connect_by_name( iflow,          route          )
  g.connect_by_name( iflow,          postroute      )
  g.connect_by_name( iflow,          postroute_hold )
  g.connect_by_name( iflow,          signoff        )

  g.connect_by_name( init,           power          )
  g.connect_by_name( power,          place          )
  g.connect_by_name( place,          cts            )
  g.connect_by_name( cts,            postcts_hold   )
  g.connect_by_name( postcts_hold,   route          )
  g.connect_by_name( route,          postroute      )
  g.connect_by_name( postroute,      postroute_hold )
  g.connect_by_name( postroute_hold, signoff        )

  g.connect_by_name( signoff,        genlibdb       )
  g.connect_by_name( adk,            genlibdb       )

  g.connect_by_name( signoff,        gdsmerge       )

  g.connect_by_name( signoff,        prelvs         )
  g.connect_by_name( prelvs,         lvs            )


  g.connect_by_name( signoff,        drc            )
  g.connect_by_name( gdsmerge,       drc            )
  g.connect_by_name( signoff,        lvs            )
  g.connect_by_name( gdsmerge,       lvs            )

  g.connect_by_name( adk,            debugcalibre   )
  g.connect_by_name( dc,             debugcalibre   )
  g.connect_by_name( iflow,          debugcalibre   )
  g.connect_by_name( signoff,        debugcalibre   )
  g.connect_by_name( drc,            debugcalibre   )
  g.connect_by_name( lvs,            debugcalibre   )

  #-----------------------------------------------------------------------
  # Parameterize
  #-----------------------------------------------------------------------

  g.update_params( parameters )


  #-----------------------------------------------------------------------
  # Order definition
  #-----------------------------------------------------------------------

  
  order = init.get_param('order')  # get the default script run order

  # Add 'set-geom-vars.tcl' at the beginning
  order.insert(0, 'set-geom-vars.tcl')

  init.update_params({'order': order})


  #insert variable definition infront of the power planning

  order = power.get_param('order')  # get the default script run order

    # Add 'set-geom-vars.tcl' at the beginning
  order.insert(0, 'set-geom-vars.tcl')

  power.update_params({'order': order})

  #order = route.get_param('order')
  #order.insert(0, 'route-settings.tcl')
  power.update_params({'order':order})
#  postroute_hold.update_params({'hold_target_slack' : parameters['hold_target_slack']}, allow_new=True)





  return g


if __name__ == '__main__':
  g = construct()
#  g.plot()

