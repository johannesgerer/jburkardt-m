function daub6_scale_plot ( n )

%*****************************************************************************80
%
%% DAUB6_SCALE_PLOT plots the DAUB6 scaling function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the recursion level.
%
  x = linspace ( 0.0, 6.0, 801 );

  y = daub6_scale ( n, x );

  plot ( x, y, 'LineWidth', 2 );

  grid on
  xlabel ( '<---X--->' );
  ylabel ( '<---Y--->' );
  title ( sprintf ( 'DAUB6 Scale Function, Recursion level n = %d', n ) );

  return
end
