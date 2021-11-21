#!bin/bash

##---- CHCH process ----##
### SMS grid
MZp_arr=( 1700 1700 1700 2100 2100 2100 2500 2500 2500 2500 2900 2900 2900 2900 2900 3300 3300 3300 3300 3300 3700 3700 3700 3700 3700 3700 3700 4100 4100 4100 4100 4100 4100 4100 ) 
MCH_arr=( 345  595  845  345  595  845  345  595  845  1095 345  595  845  1095 1345 595  845  1095 1345 1595 343  595  845  1095 1345 1595 1845 343  595  845  1095 1345 1595 1845 )
width_arr=( 3.84753949E+01 500 )
width_name_arr=( narrow wide )
for idx_width in "${!width_arr[@]}"; do
	for idx in "${!MZp_arr[@]}"; do
	  MZp=${MZp_arr[$idx]}
	  MCH=${MCH_arr[$idx]}
	  two=2
	  MNT=$((${MCH_arr[$idx]}/$two))
	  new_name_process=ZprimeTo2ChiTo2L_mZp-${MZp}_mCH-${MCH}_${width_name_arr[$idx_width]}
	  mkdir cards/production/2017/14TeV/${new_name_process}
	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_extramodels.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_extramodels.dat
	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_proc_card.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_proc_card.dat
	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_run_card.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_run_card.dat
	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_param_card.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat
	  # modify proc_card: process output name
	  sed -i "s/ZprimeTo2ChiTo2L/${new_name_process}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_proc_card.dat
	  # modify param_card: masses, width
	  sed -i "s/REPLACEME_MZp/${MZp}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat  
	  sed -i "s/REPLACEME_MCH/${MCH}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat  
	  sed -i "s/REPLACEME_MNT/${MNT}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat  
	  sed -i "s/REPLACEME_width/${width_arr[$idx_width]}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat  
	done
done

### BMs specific masses
# MZp_arr=( 2500 3300 2300 3900 3900 2100 )
# MCH_arr=( 343  359  161  896  974  360 )
# MNT_arr=( 178  44   44   892  971  94 )
# width_arr=( 3.84753949E+01 3.84753949E+02 )
# width_name_arr=( narrow wide )
# for idx_width in "${!width_arr[@]}"; do
# 	for idx in "${!MZp_arr[@]}"; do
# 	  MZp=${MZp_arr[$idx]}
# 	  MCH=${MCH_arr[$idx]}
# 	  MNT=${MNT_arr[$idx]}
# 	  new_name_process=ZprimeTo2ChiTo2L_mZp-${MZp}_mCH-${MCH}_${width_name_arr[$idx_width]}
# 	  mkdir cards/production/2017/14TeV/${new_name_process}
# 	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_extramodels.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_extramodels.dat
# 	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_proc_card.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_proc_card.dat
# 	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_run_card.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_run_card.dat
# 	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_param_card.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat
# 	  # modify proc_card: process output name
# 	  sed -i "s/ZprimeTo2ChiTo2L/${new_name_process}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_proc_card.dat
# 	  # modify param_card: masses, width
# 	  sed -i "s/REPLACEME_MZp/${MZp}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat  
# 	  sed -i "s/REPLACEME_MCH/${MCH}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat  
# 	  sed -i "s/REPLACEME_MNT/${MNT}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat  
# 	  sed -i "s/REPLACEME_width/${width_arr[$idx_width]}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat  
# 	done
# done

##---- WW process ----##
# MZp_arr2=( 2500 3000 4000 ) #Zp 2500 CH 343 NT 178 width 3.84753949E+01
# width_arr=( 3.84753949E+01, 3.84753949E+02 )
# width_name_arr=( narrow wide )
# for idx_width in "${!width_arr[@]}"; do
# 	for idx in "${!MZp_arr2[@]}"; do
# 	  MZp=${MZp_arr2[$idx]}
# 	  new_name_process=ZprimeToWWTo2L_mZp-${MZp}_${width_name_arr[$idx_width]}
# 	  mkdir cards/production/2017/14TeV/${new_name_process}
# 	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_extramodels.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_extramodels.dat
# 	  cp ZprimeToWWTo2L_proc_card.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_proc_card.dat
# 	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_run_card.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_run_card.dat
# 	  cp cards/production/2017/14TeV/ZprimeTo2ChiTo2L/ZprimeTo2ChiTo2L_param_card.dat cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat
# 	  # modify proc_card: process output name
# 	  sed -i "s/ZprimeTo2ChiTo2L/${new_name_process}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_proc_card.dat
# 	  # modify param_card: mass, width
# 	  sed -i "s/REPLACEME_MZp/${MZp}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat  
# 	  sed -i "s/REPLACEME_width/${width_arr[$idx_width]}/" cards/production/2017/14TeV/${new_name_process}/${new_name_process}_param_card.dat  
# 	done
# done
