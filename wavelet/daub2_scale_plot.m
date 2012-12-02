function daub2_scale_plot ( n )

%*****************************************************************************80
%
%% DAUB2_SCALE_PLOT plots the DAUB2 scaling function.
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
  x = linspace ( 0.0, 2.0, 101 );

  y = daub2_scale ( n, x );

  plot ( x, y, 'LineWidth', 2 );

  grid on
  xlabel ( '<---X--->' );
  ylabel ( '<---Y--->' );
  title ( sprintf ( 'DAUB2 Scale Function, Recursion level n = %d', n ) );

  return
end
