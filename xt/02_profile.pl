#!/usr/bin/perl 

use Data::Dumper; 
use Benchmark qw(cmpthese);

use lib "../lib";
use Data::DownSample::LargestTriangleThreeBuckets;

my $lttb = new Data::DownSample::LargestTriangleThreeBuckets( {threshold=>1000} );

open(FID,'./source_set2.csv');
chomp(my @data_csv = <FID>); 
close FID;

my $data_src=[]; 
foreach my $line ( @data_csv )
{
   push @$data_src, [ split /,/, $line ]; 
}


cmpthese(500, {
	'Opt' => sub { my $data_sampled = $lttb->lttb($data_src) },
	'Ref' => sub { my $data_sampled = $lttb->lttb_ref($data_src) },
    });


#print Dumper $data_src; 
my $data_sampled = $lttb->lttb($data_src);

open(FID,'>./sampled_set2.csv');
foreach my $ref (@$data_sampled)
{
   print FID "$ref->[0],$ref->[1]\n";
}

#print Dumper $data_sampled; 
