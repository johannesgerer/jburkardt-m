function double_c_plot ( x, y, c )

%*****************************************************************************80
%
%% DOUBLE_C_PLOT displays the "double C" data.
%
%  Discussion:
%
%    The data comprises a "C" shape and its reverse, which do not intersect,
%    but which nestle together fairly closely.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%   Input, real X(N), Y(N), the coordinates of the data points.  The points
%   have been shuffled so that data belonging to the two components is
%   interleaved.
%
%   Input, integer C(N), is 1 or 2, depending on which set the corresponding
%   data point belongs to.
%
  i1 = ( c == 1 );
  i2 = ( c == 2 );

  n1 = sum ( i1 );
  n2 = sum ( i2 );

  plot ( x(i1), y(i1), 'r.', ...
         x(i2), y(i2), 'b.' )

  xlabel ( '<-- X -->' );
  ylabel ( '<-- Y -->' );
  title ( sprintf ( 'Double C Data, N1 (red) = %d, N2 (blue) = %d', n1, n2 ) );
  grid on
  axis equal

  return
end

