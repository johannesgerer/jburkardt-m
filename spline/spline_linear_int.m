function int_val = spline_linear_int ( ndata, tdata, ydata, a, b )

%*****************************************************************************80
%
%% SPLINE_LINEAR_INT evaluates the integral of a piecewise linear spline.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NDATA, the number of data points defining the spline.
%
%    Input, real TDATA(NDATA), YDATA(NDATA), the values of the independent
%    and dependent variables at the data points.  The values of TDATA should
%    be distinct and increasing.
%
%    Input, real A, B, the interval over which the integral is desired.
%
%    Output, real INT_VAL, the value of the integral.
%
  int_val = 0.0;

  if ( a == b )
    return;
  end

  a_copy = min ( a, b );
  b_copy = max ( a, b );
%
%  Find the interval [ TDATA(A_LEFT), TDATA(A_RIGHT) ] that contains, or is
%  nearest to, A.
%
  [ a_left, a_right ] = r8vec_bracket ( ndata, tdata, a_copy );
%
%  Find the interval [ TDATA(B_LEFT), TDATA(B_RIGHT) ] that contains, or is
%  nearest to, B.
%
  [ b_left, b_right ] = r8vec_bracket ( ndata, tdata, b_copy );
%
%  If A and B are in the same interval...
%
  if ( a_left == b_left )

    tval = ( a_copy + b_copy ) / 2.0;

    yp = ( ydata(a_right) - ydata(a_left) ) / ...
         ( tdata(a_right) - tdata(a_left) );

    yval = ydata(a_left) + ( tval - tdata(a_left) ) * yp;

    int_val = yval * ( b_copy - a_copy );

    return;
  end
%
%  Otherwise, integrate from:
%
%  A               to TDATA(A_RIGHT),
%  TDATA(A_RIGHT)  to TDATA(A_RIGHT+1),...
%  TDATA(B_LEFT-1) to TDATA(B_LEFT),
%  TDATA(B_LEFT)   to B.
%
%  Use the fact that the integral of a linear function is the
%  value of the function at the midpoint times the width of the interval.
%
  tval = ( a_copy + tdata(a_right) ) / 2.0E+00;

  yp = ( ydata(a_right) - ydata(a_left) ) / ...
       ( tdata(a_right) - tdata(a_left) );

  yval = ydata(a_left) + ( tval - tdata(a_left) ) * yp;

  int_val = int_val + yval * ( tdata(a_right) - a_copy );

  for i_left = a_right : b_left - 1

    tval = ( tdata(i_left+1) + tdata(i_left) ) / 2.0E+00;

    yp = ( ydata(i_left+1) - ydata(i_left) ) / ...
         ( tdata(i_left+1) - tdata(i_left) );

    yval = ydata(i_left) + ( tval - tdata(i_left) ) * yp;

    int_val = int_val + yval * ( tdata(i_left + 1) - tdata(i_left) );

  end

  tval = ( tdata(b_left) + b_copy ) / 2.0E+00;

  yp = ( ydata(b_right) - ydata(b_left) ) / ...
       ( tdata(b_right) - tdata(b_left) );

  yval = ydata(b_left) + ( tval - tdata(b_left) ) * yp;

  int_val = int_val + yval * ( b_copy - tdata(b_left) );

  if ( b < a )
    int_val = -int_val;
  end

  return
end
