function levels ( function_handle, level_num, range )

%*****************************************************************************80
%
%% LEVELS draws contours using random contour levels.
%
%  Discussion:
%
%    The function to be contoured is defined by a MATLAB M file of the form
%
%      function f = values ( x )
%      f = sin ( x(1)*x(1) + y(2)*y(2))
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
%    Input, real RANGE(2,2), contains the minimum and maximum X and Y values.
%    Default: [-1,-1;+1,+1].
%

%
%  If number of levels not supplied, use 50.
%
  if ( nargin < 2 )
    level_num = 50;
  end
%
%  If range not supplied, use -1 to +1.
%
  if ( nargin < 3 )
    x_min = -1.0;
    x_max = +1.0;
    y_min = -1.0;
    y_max = +1.0;
  else
    x_min = range(1,1);
    x_max = range(2,1);
    y_min = range(1,2);
    y_max = range(2,2);
  end
%
%  Determine the number of sample values in X and in Y.
%
  data_num = 101;
%
%  Set the sample points.
%
  xp(1,1:data_num) = linspace ( x_min, x_max, data_num );
  xp(2,1:data_num) = linspace ( y_min, y_max, data_num );
%
%  Evaluate F(X,Y).
%
  for i = 1 : data_num
    for j = 1 : data_num
      fp(j,i) = feval ( function_handle, [ xp(1,i), xp(2,j) ] );
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
  [ C1, H1 ] = contour ( xp(1,1:data_num), xp(2,1:data_num), fp, cp );
  axis equal

  return
end
