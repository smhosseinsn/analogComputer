#!/usr/bin/perl
use strict;
use warnings;
use Cwd;
no warnings 'uninitialized';

#Config Vars
my $acType=1;
my $errorType=2;
my $longType=3;
my $plainType=4;
my $plain_W_N_Type=5;
my $mode = 1;
my $dir = getcwd;
my @files = glob "$dir/results/*.txt";

#Files
my $acFile = 'tabulated/ac.csv'; unlink $acFile;
my $errorFile = 'tabulated/error.csv'; unlink $errorFile;
my $longFile = 'tabulated/long.csv'; unlink $longFile;
my $plainTranFile = 'tabulated/plain_tran.csv'; unlink $plainTranFile;
my $plainWNTranFile = 'tabulated/plain_w_n_tran.csv'; unlink $plainTranFile;
open(my $acH, '>:encoding(UTF-8)', $acFile) or die "Could not open file '$acFile' $!";
open(my $errorH, '>:encoding(UTF-8)', $errorFile) or die "Could not open file '$errorFile' $!";
open(my $longH, '>:encoding(UTF-8)', $longFile) or die "Could not open file '$longFile' $!";
open(my $plainTranH, '>:encoding(UTF-8)', $plainTranFile) or die "Could not open file '$plainTranFile' $!";
open(my $plainWNTranH, '>:encoding(UTF-8)', $plainWNTranFile) or die "Could not open file '$plainTranFile' $!";

#Filename Regexes
my $word='((?:[a-z][a-z]+))';	# Word 1
my $ac='(ac)';
my $error='(tranError)';
my $tranFSpaceLong='(tranFSpaceLongPost)';
my $tranFSpace='(tranFSpace)';
my $char_ws='(_)';	# Any Single Character 1
my $char_dot='(.)';	# Any Single Character 2
my $int='(\\d+)';	# Integer Number 1
#ddcc_mode_gain_numFreqs_load
my $ac_re=$word.$char_ws.$ac.$char_dot.$int.$char_ws.$int.$char_ws.$int.$char_dot.$word;
my $error_file_re=$word.$char_ws.$error.$char_dot.$int.$char_ws.$int.$char_ws.$int.$char_dot.$word;
my $long_re=$word.$char_ws.$tranFSpaceLong.$int.$char_ws.$int.$char_ws.$int.$char_ws.$int.$char_dot.$word;
my $plain_re=$word.$char_ws.$tranFSpace.$int.$char_ws.$int.$char_ws.$int.$char_ws.$int.$char_dot.$word;
my $plain_w_n_re=$word.$char_ws.$tranFSpaceLong.$int.$char_ws.$int.$char_ws.$int.$char_ws.$int.$char_ws.$int.$char_dot.$word;

#Data Regexes
my $ws='(\\s+)';	# White Space 1
my $avg_power='(total_average_power)';	# Variable Name 1
my $error_rate='(x_error_rate)';	# Variable Name 1
my $gainmax='(peak)';	# Word 1
my $gainSuffix='(  from=  1.0000E+00     to=  1.0000E+05)';
my $f3db='(f3db)';
my $bias_power='(total_bias_power)';	# Variable Name 1
my $eq='(=)';	# Any Single Character 1
my $any_single='(.)';	# Any Single Character 1
my $some_spaces='(  )';	# White Space 2
my $float='([+-]?\\d*\\.\\d+)(?![-+0-9\\.])';	# Float 1
my $exponent='((?:[a-z][a-z0-9_]*))';	# Variable Name 1
my $integer='([-+]\\d+)';	# Integer Number 1
my $bias_re=$ws.$bias_power.$any_single.$ws.$float.$exponent.$integer;
my $average_re=$ws.$avg_power.$any_single.$ws.$float.$exponent.$integer;
my $error_re=$ws.$error_rate.$eq.$some_spaces.$float.$exponent.$integer;
my $bw_re=$ws.$f3db.$any_single.$ws.$float.$exponent.$integer;
my $max_re=$ws.$gainmax.$any_single.$ws.$float.$exponent.$integer.$ws.$word.$any_single.$ws.$float.$exponent.$integer.$ws.$word.$eq.$ws.$float.$exponent.$integer.$ws.$word.$eq.$ws.$float.$exponent.$integer;

for (0..$#files) {
  if($files[$_] =~ s/\.txt$//) {
    my $inFile = $files[$_].".txt";
    open my $input, $inFile or die "Could not open $inFile: $!";

    if ($inFile =~ m/$ac_re/is) {
        my $gain=$5;
        my $numFreqs=$7;
        my $load=$9;
        print $acH "$gain,$numFreqs,$load";
        $mode=$acType;
    } elsif ($inFile =~ m/$error_file_re/is) {
        my $gain=$5;
        my $numFreqs=$7;
        my $load=$9;
        print $errorH "$gain,$numFreqs,$load";
        $mode=$errorType;
    } elsif ($inFile =~ m/$long_re/is) {
        my $spacing="";
        if(length $4) {
          $spacing=$4;
        }
        my $gain=$6;
        my $numFreqs=$8;
        my $load=$10;
        print $longH "$spacing,$gain,$numFreqs,$load";
        $mode=$longType;
    } elsif ($inFile =~ m/$plain_re/is) {
        my $spacing="";
        if(length $4) {
          $spacing=$4;
        }
        my $gain="";
        if(length $6) {
          $gain=$6;
        }
        my $numFreqs="";
        if(length $8) {
          $numFreqs=$8;
        }
        my $load="";
        if(length $10) {
          $load=$10;
        }
        print $plainTranH "$spacing,$gain,$numFreqs,$load";
        $mode=$plainType;
    } elsif ($inFile =~ m/$plain_w_n_re/is) {
        my $spacing=$4;
        my $gain=$6;
        my $numFreqs=$8;
        my $nMax=$10;
        my $load=$12;
        print $plainWNTranH "$spacing,$gain,$numFreqs,$nMax,$load";
        $mode=$plain_W_N_Type;
    }

    while( my $line = <$input>)  {
      my $recognized = 0;
      my $num_value;
      my $exponent_char;
      my $exponent_value;
      if ($line =~ m/$average_re/is || $line =~ m/$error_re/is || $line =~ m/$bias_re/is || $line =~ m/$max_re/is || $line =~ m/$bw_re/is) {
          $num_value=$5;
          $exponent_char=$6;
          $exponent_value=$7;
          $recognized = 1;
      }

      if ($recognized) {
        if($mode eq $longType) {
          print $longH ",$num_value";
          print $longH "$exponent_char";
          print $longH "$exponent_value";
        } elsif($mode eq $errorType) {
          print $errorH ",$num_value";
          print $errorH "$exponent_char";
          print $errorH "$exponent_value";
        } elsif($mode eq $plainType) {
          print $plainTranH ",$num_value";
          print $plainTranH "$exponent_char";
          print $plainTranH "$exponent_value";
        } elsif($mode eq $acType) {
          print $acH ",$num_value";
          print $acH "$exponent_char";
          print $acH "$exponent_value";
        } elsif($mode eq $plain_W_N_Type) {
          print $plainWNTranH ",$num_value";
          print $plainWNTranH "$exponent_char";
          print $plainWNTranH "$exponent_value";
        }
      }
    }
    if($mode == $longType) {
      print $longH "\n";
    } elsif($mode == $errorType) {
      print $errorH "\n";
    } elsif($mode == $plainType) {
      print $plainTranH "\n";
    } elsif($mode == $acType) {
      print $acH "\n";
    } elsif($mode == $plain_W_N_Type) {
      print $plainWNTranH "\n";
    }
    close $input;
  }
}

close $acH;
close $errorH;
close $longH;
close $plainTranH;
close $plainWNTranH;

