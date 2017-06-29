#!/bin/bash
# ------------------------------------------------------------------
# Matt Joslin: Automate Spice Testing
# ------------------------------------------------------------------

VERSION=0.1.0
SUBJECT=auto_spice

# --- Body --------------------------------------------------------
#  SCRIPT LOGIC GOES HERE

function execute_test {
	#Get new file name
	txt_file=$cwd"/"$f_name".txt"
	spice_file=$cwd"/"$f_name".sp"
	#rm $txt_file
	#rm $spice_file
	#Copy boilerplate
	cat $cwd"/chenBody.txt" > $spice_file
	#Write sizing params
	for i in `seq 0 5`;
	do
	echo ".param chenL"$((i+1))"="${l_base_values[$i]}"u" >> $spice_file
	echo ".param chenW"$((i+1))"="${w_base_values[$i]} >> $spice_file
	done
	echo ".param g="$default_g >> $spice_file
	#Write analysis info
	echo ".param t_total="$t_total"us" >> $spice_file
	echo ".param t_start_in="$t_start_in"us" >> $spice_file
	echo ".param t_bias="$t_bias"us" >> $spice_file
	if [ $mode = $dc ]; then
		echo ".dc    "$dc_port"   "$dc_lower"     "$dc_upper"    "$dc_step"m" >> $spice_file
	fi
	if [ $mode = $ac ]; then
		echo ".ac  DEC  "$ac_step"     "$ac_lower"        "$ac_upper"G" >> $spice_file
	fi
	if [ $mode = $tran ]; then
		echo ".tran "$t_step"ps t_total" >> $spice_file
	fi

	#Write stimulus
	coef_prefix=".param A"
	echo ".param n="$n_max >> $spice_file
	for curr_freq in `seq 0 $((n-1))`;
	do
		echo ".param f"$((curr_freq+1))"="$((freq_max-curr_freq*freq_spacing)) >> $spice_file
			for i in `seq 0 2`;
			do
					echo $coef_prefix$((i+1))$((curr_freq+1))"=1" >> $spice_file
			if [ $curr_freq = $((n-1)) ]; then
				echo "VY"$((i+1))$((curr_freq+1))"		y"$((i+1))$((curr_freq+1))"		gnd		sin(0 'A"$((i+1))$((curr_freq+1))"*Amax/n' f"$((curr_freq+1))" t_start_in 0 0)	AC	0.3" >> $spice_file
			else
				echo "VY"$((i+1))$((curr_freq+1))"		y"$((i+1))$((curr_freq+1))"		y"$((i+1))$((curr_freq+2))"		sin(0 'A"$((i+1))$((curr_freq+1))"*Amax/n' f"$((curr_freq+1))" t_start_in 0 0)" >> $spice_file
			fi
			done
	done
	#Write load
	echo "c0	x gnd "$cap"f" >> $spice_file
	#Terminate
	echo ".end" >> $spice_file
	#Execute
	#timeout 100 hspice $spice_file > $txt_file
	hspice $spice_file > $txt_file
}

#Parameters
f_name="ddcc_mode_gain_numFreqs_load"
declare -a l_base_values=(0.26 0.26 0.13 0.26 0.13 0.26)
declare -a w_base_values=(1 2 8 1.5 8 1.5)
default_g=1

mode=1
dc=1
ac=2
tran=3
t_total=40	#in us
t_start_in=25	#in us
t_bias=0.1	#in us
t_step=0.1	#in ps
cap=1		#in femto farads
freq_max=5000000
freq_spacing=500000
n=10
n_max=10

cwd=$(pwd)

#Test AC
mode=$ac
ac_lower=1	#in Hz
ac_upper=10	#in GHz
ac_step=10000	#in data points
n=1
n_max=1
default_g=1

for i in `seq 1 5`;
do
cap=1		#in femto farads
for j in `seq 1 10`;
do
f_name="ddcc_ac_"$default_g"_1_"$cap
execute_test
cap=$((cap*10))
done
default_g=$((default_g*10))
done

#Test Tran
# mode=$tran
# t_total=100	#in us
# t_start_in=10	#in us
# t_bias=0.1	#in us
# t_step=0.1	#in ps
# freq_max=1000000
# freq_spacing=10000
# n=10
# for i in `seq 1 5`;
# do
# cap=1		#in femto farads
# for j in `seq 1 5`;
# do
# n=10
# for j in `seq 1 5`;
# do
# f_name="ddcc_tranError_"$default_g"_"$n"_"$cap
# #execute_test
# n=$((n+10))
# done
# cap=$((cap*10))
# done
# default_g=$((default_g+2))
# done

#Test DC
#Later gator
# mode=$dc
# dc_port="VY11"
# dc_lower=-1
# dc_upper=1	#in volts
# dc_step=0.1	#in millivolts

#Test Tran
mode=$tran
t_total=100	#in us
t_start_in=1	#in us
t_bias=0.1	#in us
t_step=0.1	#in ps

#Scale n
n_max=100
cap=1		#in femto farads
freq_max=700000
freq_spacing=1000
n=10
default_g=10
for i in `seq 1 5`;
do
	# for j in `seq 1 4`;
	# do
	f_name="ddcc_tranFSpaceLongPost"$freq_spacing"_"$default_g"_"$n"_"$cap
	# execute_test
	# cap=$((cap*10))
	# done
	n=$((n+10))
done

#Scale n
# n_max=100
# cap=1		#in femto farads
# freq_max=700000
# freq_spacing=7000
# n=10
# default_g=10
# for i in `seq 1 1`;
# do
# for j in `seq 200 200`;
# do
# 	n_max=$j
# 	for k in `seq 1 $(((j+1)/2))`;
# 	do
# 	n=$k
# 	f_name="ddcc_tranFSpaceLong"$freq_spacing"_"$default_g"_"$n"_"$n_max"_"$cap
# 	execute_test
# 	# cap=$((cap*10))
# 	done
# 	# n=$((n+10))
# done
# # freq_spacing=$((freq_spacing*10));
# done

# #Scale gain vs load
# l_base_values=(0.26 0.26 0.13 0.26 0.13 0.26)
# w_base_values=(1 2 8 1.5 8 1.5)
# #default_g=1
# #cap=1		#in femto farads
# f_name="ddcc_mode_gain_numFreqs_load"
# mode=$tran
# n=1
# n_max=1
# default_g=1
# for i in `seq 1 3`;
# do
# cap=1		#in femto farads
# for j in `seq 1 6`;
# do
# 		f_name="ddcc_tran_"$default_g"_1_"$cap
# #		execute_test
# 		cap=$((cap*10))
# 	done
# 	default_g=$((default_g*10))
# done
