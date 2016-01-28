# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
set_param xicom.use_bs_reader 1
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

create_project -in_memory -part xc7z020clg484-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.cache/wt [current_project]
set_property parent.project_path C:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part em.avnet.com:zed:part0:0.9 [current_project]
set_property ip_repo_paths {
  C:/Users/utente/Desktop/StepperMotorControl
  C:/Users/utente/Desktop/StepperMotorControlSchematic
} [current_project]
add_files C:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.srcs/sources_1/bd/design_1/design_1.bd
set_property used_in_implementation false [get_files -all c:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.srcs/sources_1/ipshared/xilinx.com/stepperMotor_v1_0/dd458a5d/constraints/stepperMotor_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.srcs/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.srcs/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.srcs/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.srcs/sources_1/bd/design_1/design_1_ooc.xdc]
set_property is_locked true [get_files C:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.srcs/sources_1/bd/design_1/design_1.bd]

read_vhdl -library xil_defaultlib C:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.vhd
read_xdc C:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.srcs/constrs_1/new/Constraints.xdc
set_property used_in_implementation false [get_files C:/Users/utente/Desktop/StepperMotorControlSchematic/StepperMotorControlSchematic.srcs/constrs_1/new/Constraints.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
catch { write_hwdef -file design_1_wrapper.hwdef }
synth_design -top design_1_wrapper -part xc7z020clg484-1
write_checkpoint -noxdef design_1_wrapper.dcp
catch { report_utilization -file design_1_wrapper_utilization_synth.rpt -pb design_1_wrapper_utilization_synth.pb }
