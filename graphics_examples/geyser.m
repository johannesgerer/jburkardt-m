%function geyser ( )

%*****************************************************************************80
%
%% GEYSER uses MATLAB to make a histogram.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2011
%
%  Author:
%
%    John Burkardt
%

%
%  Load the data.
%
  t = load ( 'geyser.txt' );
%
%  Our data lies in the range 40 to 110.
%  Dividing into bins of width 5, we want 14 bins.
%  But that means 14+1 "edges".
%
  bin_num = 14;
  bin_edges = linspace ( 40.0, 110.0, bin_num + 1 );
%
%  T_BINNED counts data between successive bin edges.
%
  t_binned = histc ( t, bin_edges );
%
%  Discard the last entry, which counts data greater than the last bin edge.
%
  t_binned = t_binned(1:bin_num);
%
%  Set the average value of each bin.  
%
  bar_center = linspace ( ( bin_edges(1)     + bin_edges(2)    ) / 2, ...
                          ( bin_edges(end-1) + bin_edges(end) ) / 2, ...
                          bin_num );
%
%  Set the relative width of the bar.
%
  bar_width = 0.90;
%
%  Draw a bar graph.
%
  bar ( bar_center, t_binned, bar_width, 'r' );

  grid on
  title ( 'Time between eruptions of Old Faithful' )
  xlabel ( 'Minutes' )
  ylabel ( 'Frequency' )

%  return
%end

