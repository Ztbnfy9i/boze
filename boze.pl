#!/usr/bin/perl

sub factorial{
	my $nowcount = $_[0];
	#print "start $nowcount\n";

	if ($nowcount == 1){
		#print "if $nowcount return 1\n";
		foreach $nowelements (@elements){
			$result[$nowcount]=$nowelements;
			#print "0or1: result_nowcount $nowcount: $result[$nowcount]\n";
			#      [坊主]    が[屏風]    に[チョーク]で上手に[ジョーズ]の絵を描いた
			print "$result[4]が$result[3]に$result[2]で上手に$result[1]の絵を描いた\n";
		}
	}else{
		foreach $nowelements (@elements){
			$result[$nowcount]=$nowelements;
			#print "else: result_nowcount $nowcount: $result[$nowcount]\n";
			factorial($nowcount - 1);
			#print "-- else end --\n";
		}
	}
}

# Driver Code
$inifile="boze.ini";
$count = 4;
@result=();
open(INI,$inifile);
while($ini_line=<INI>){
	chomp($ini_line);
	$ini_line =~ s/^( |\t)*//;
	$ini_line =~ s/( |\t)*$//;
	if($ini_line !~ /^#/){
		#print "ini_line: $ini_line..\n";
		push(@elements, $ini_line);
	}
}
close(INI);

factorial($count);
