# LargestTriangleThreeBuckets
Perl module to downsample data using the Largest Triangle Three Buckets algorithm

## Description

Implements a downsample technique known as Largest Triangle Three Buckets as defined in Sveinn Steinarsson MS thesis.

http://skemman.is/stream/get/1946/15343/37285/3/SS_MSthesis.pdf

The idea is to downsample a data set without losing the visual character of the plotted data. The technique draws on ideas in cartographic generalization or polyline simplification. This technique is often useful in client-server applications such as webserver-browser where the length of the data far exceeds the pixels available to plot. Reducing the data size significantly speeds up data transfer and rendering time.

## Synopsis

use Data::DownSample::LargestTriangleThreeBuckets;

$lttb = new Data::DownSample::LargestTriangleThreeBuckets( {threshold=>1000} );

$data_src = [ [1,2], [2,3], [3,4], [4,5], ... ];  <-- load your data source here as reference to a list of a list

$data_sampled = $lttb->lttb($data_src);
