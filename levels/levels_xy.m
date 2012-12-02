function levels_xy ( function_handle, level_num, x_range, y_range )

%*****************************************************************************80
%
%% LEVELS_XY draws contours using random contour levels.
%
%  Discussion:
%
%    The function to be contoured is defined by a MATLAB M file of the form
%
%      function f = values ( x, y )
%      f = sin ( x*x + y*y)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, handle FUNCTION_HANDLE, the handle for the function.  This
%    is simply the name of the function routine, with an "@" sign in front of it.
%
%    Input, integer LEVEL_NUM, the number of levels.
%    Default: 50.
%
%    Input, real X_RANGE(2), the minimum and maximum X values.
%    Default: [-1,+1].
%
%    Input, real Y_RANGE(2), the minimum and maximum Y values.
%    Default: same as X_RANGE.
%

%
%  If number of levels not supplied, use 50.
%
  if ( nargin < 2 )
    level_num = 50;
  end
%
%  If X range not supplied, use -1 to +1.
%
  if ( nargin < 3 )
    x_min = -1.0;
    x_max = +1.0;
  else
    x_min = x_range(1);
    x_max = x_range(2);
  end
%
%  If Y range not supplied, use X range.
%
  if ( nargin < 4 )
    y_min = x_min;
    y_max = x_max;
  else
    y_min = y_range(1);
    y_max = y_range(2);
  end
%
%  Determine the number of sample values in X and in Y.
%
  data_num = 101;
%
%  Set the sample points.
%
  xp = linspace ( x_min, x_max, data_num );
  yp = linspace ( y_min, y_max, data_num );
%
%  Evaluate F(X,Y).
%
  for i = 1 : data_num
    for j = 1 : data_num
      fp(j,i) = feval ( function_handle, xp(i), yp(j) );
    end
  end
%
%  Select LEVEL_NUM points at random, and use their values of F
%  as the contour levels.
%
  ip = floor ( ( data_num - 1 ) * rand ( level_num ) + 1 );
  jp = floor ( ( data_num - 1 ) * rand ( level_num ) + 1 );

  for i = 1 : level_num
    cp(i) = fp(ip(i),jp(i));
  end
%
%  Sort the level values.
%
  sort ( cp );
%
%  Plot the contours.
%   
  [ C1, H1 ] = contour ( xp, yp, fp, cp );
  axis equal

  return
end
