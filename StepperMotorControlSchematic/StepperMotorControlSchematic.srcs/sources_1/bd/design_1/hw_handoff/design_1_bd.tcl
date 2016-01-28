
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2014.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg484-1
#    set_property BOARD_PART em.avnet.com:zed:part0:0.9 [current_project]


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set SEL [ create_bd_port -dir I SEL ]
  set a_out_V [ create_bd_port -dir O -from 0 -to 0 -type data a_out_V ]
  set b_out_V [ create_bd_port -dir O -from 0 -to 0 -type data b_out_V ]
  set c_out_V [ create_bd_port -dir O -from 0 -to 0 -type data c_out_V ]
  set d_out_V [ create_bd_port -dir O -from 0 -to 0 -type data d_out_V ]
  set doRewind_in_V [ create_bd_port -dir I -from 0 -to 0 -type data doRewind_in_V ]
  set_property -dict [ list CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}  ] $doRewind_in_V
  set doStep_in_V [ create_bd_port -dir I -from 0 -to 0 -type data doStep_in_V ]
  set_property -dict [ list CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}  ] $doStep_in_V
  set full_step_in_V [ create_bd_port -dir I -from 0 -to 0 -type data full_step_in_V ]
  set_property -dict [ list CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}  ] $full_step_in_V
  set reset_rtl [ create_bd_port -dir I -type rst reset_rtl ]
  set_property -dict [ list CONFIG.POLARITY {ACTIVE_LOW}  ] $reset_rtl
  set stepDone_out_V [ create_bd_port -dir O -from 0 -to 0 -type data stepDone_out_V ]
  set stopRewind_in_V [ create_bd_port -dir I -from 0 -to 0 -type data stopRewind_in_V ]
  set_property -dict [ list CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}  ] $stopRewind_in_V
  set sys_clock [ create_bd_port -dir I -type clk sys_clock ]
  set_property -dict [ list CONFIG.FREQ_HZ {100000000} CONFIG.PHASE {0.000}  ] $sys_clock

  # Create instance: MUX_32_0, and set properties
  set MUX_32_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:MUX_32:1.0 MUX_32_0 ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: stepperMotor_0, and set properties
  set stepperMotor_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:stepperMotor:1.0 stepperMotor_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list CONFIG.CONST_VAL {5000000} CONFIG.CONST_WIDTH {32}  ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list CONFIG.CONST_WIDTH {32}  ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list CONFIG.CONST_VAL {200} CONFIG.CONST_WIDTH {32}  ] $xlconstant_2

  # Create port connections
  connect_bd_net -net MUX_32_0_X [get_bd_pins MUX_32_0/X] [get_bd_pins stepperMotor_0/nSteps_in]
  connect_bd_net -net SEL_1 [get_bd_ports SEL] [get_bd_pins MUX_32_0/SEL]
  connect_bd_net -net doRewind_in_V_1 [get_bd_ports doRewind_in_V] [get_bd_pins stepperMotor_0/doRewind_in_V]
  connect_bd_net -net doStep_in_V_1 [get_bd_ports doStep_in_V] [get_bd_pins stepperMotor_0/doStep_in_V]
  connect_bd_net -net full_step_in_V_1 [get_bd_ports full_step_in_V] [get_bd_pins stepperMotor_0/full_step_in_V]
  connect_bd_net -net proc_sys_reset_0_mb_reset [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins stepperMotor_0/ap_rst]
  connect_bd_net -net reset_rtl_1 [get_bd_ports reset_rtl] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net stepperMotor_0_a_out_V [get_bd_ports a_out_V] [get_bd_pins stepperMotor_0/a_out_V]
  connect_bd_net -net stepperMotor_0_b_out_V [get_bd_ports b_out_V] [get_bd_pins stepperMotor_0/b_out_V]
  connect_bd_net -net stepperMotor_0_c_out_V [get_bd_ports c_out_V] [get_bd_pins stepperMotor_0/c_out_V]
  connect_bd_net -net stepperMotor_0_d_out_V [get_bd_ports d_out_V] [get_bd_pins stepperMotor_0/d_out_V]
  connect_bd_net -net stepperMotor_0_stepDone_out_V [get_bd_ports stepDone_out_V] [get_bd_pins stepperMotor_0/stepDone_out_V]
  connect_bd_net -net stopRewind_in_V_1 [get_bd_ports stopRewind_in_V] [get_bd_pins stepperMotor_0/stopRewind_in_V]
  connect_bd_net -net sys_clock_1 [get_bd_ports sys_clock] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins stepperMotor_0/ap_clk]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins stepperMotor_0/delayDuration_in] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins MUX_32_0/A] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins MUX_32_0/B] [get_bd_pins xlconstant_2/dout]

  # Create address segments
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


