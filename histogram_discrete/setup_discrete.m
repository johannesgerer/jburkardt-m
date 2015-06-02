function [ x_num, x, y ] = setup_discrete ( s_num, s, s_min, s_max )

%*****************************************************************************80
%
%% SETUP_DISCRETE sets up the discrete histogram representation.
%
%  Purpose:
%
%    S_NUM sample values are given, presumed to lie between S_MIN and S_MAX,
%    and we want some kind of histogram representation of this sample data.
%
%    For consistency, values less than S_MIN are reassigned to S_MIN, 
%    and values greater than S_MAX to S_MAX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer S_NUM, the number of sample values.
%
%    Input, real S(S_NUM,1), the sample values.
%
%    Input, real S_MIN, the minimum value.  Sample values less than S_MIN are
%    reassigned to S_MIN.
%
%    Input, real S_MAX, the maximum value.  Sample values greater than S_MAX 
%    are reassigned to S_MAX.
%
%    Output, integer X_NUM, the number of values in the discrete histogram.
%
%    Output, real X(X_NUM,1), the histogram data values.
%
%    Output, real Y(X_NUM,1), the normalized histogram values.
%
  s = s(:);

  if ( s_max < s_min )
    t = s_max;
    s_max = s_min;
    s_min = s_max;
  end
%
%  Reassign sample values that are outside [S_MIN,S_MAX].
%
  i = find ( s < s_min );
  s(i,1) = s_min;
  i = find ( s_max < s );
  s(i,1) = s_max;
%
%  Sort the sample values.
%
  s = sort ( s );
%
%  Generate vectors X and C consisting of unique ordered points and counts.
%  All the counts will be positive, except possibly for the first and last
%  X values, which are S_MIN and S_MAX respectively.
%
  x_num = 1;
  x(x_num,1) = s_min;
  c(x_num,1) = 0;

  for j = 1 : s_num

    if ( x(x_num,1) ~= s(j,1) )
      x_num = x_num + 1;
      x(x_num,1) = s(j,1);
      c(x_num,1) = 1;
    else
      c(x_num,1) = c(x_num,1) + 1;
    end

  end

  if ( x(x_num,1) ~= s_max )
    x_num = x_num + 1;
    x(x_num,1) = s_max;
    c(x_num,1) = 0;
  end
%
%  Define a piecewise linear function Y whose behavior is modeled
%  by the interaction of the C's (heights) and delta X's, (widths).
%
  y = zeros ( x_num, 1 );

  y(1,1) = c(1,1) / ( x(2,1) - x(1,1) );
  for i = 2 : x_num - 1
    y(i,1) = c(i,1) / ( x(i+1,1) - x(i-1,1) );
  end
  y(x_num,1) = c(x_num,1) / ( x(x_num,1) - x(x_num-1,1) );
%
%  Compute the integral of Y.
%
  y_int = 0.0;
  for i = 1 : x_num - 1
    y_int = y_int + ( x(i+1,1) - x(i,1) ) * ( y(i+1,1) + y(i,1) ) / 2.0;
  end
%
%  Normalize Y to have integral 1.
%
  y(1:x_num,1) = y(1:x_num,1) / y_int;

  return
end
