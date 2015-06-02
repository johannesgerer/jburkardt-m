function [ x, y ] = grid_2d ( x_num, x_lo, x_hi, y_num, y_lo, y_hi )

%*****************************************************************************80
%
%% GRID_2D returns a regular 2D grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X_NUM, the number of X values to use.
%
%    Input, real X_LO, X_HI, the range of X values.
%
%    Input, integer Y_NUM, the number of Y values to use.
%
%    Input, real Y_LO, Y_HI, the range of Y values.
%
%    Output, real X(X_NUM,Y_NUM), Y(X_NUM,Y_NUM), the coordinates of the grid.
%
  x = zeros ( x_num, y_num );
  y = zeros ( x_num, y_num );

  if ( x_num == 1 )
    x(1:x_num,1:y_num) = ( x_lo + x_hi ) / 2.0;
  else
    for i = 1 : x_num
      xi = ( ( x_num - i     ) * x_lo   ...
           + (         i - 1 ) * x_hi ) ...
           / ( x_num     - 1 );
      x(i,1:y_num) = xi;
    end

  end

  if ( y_num == 1 )
    y(1:x_num,1:y_num) = ( y_lo + y_hi ) / 2.0;
  else
    for j = 1 : y_num
      yi = ( ( y_num - j     ) * y_lo   ...
           + (         j - 1 ) * y_hi ) ...
           / ( y_num     - 1 );
      y(1:x_num,j) = yi;
    end
  end

  return
end
