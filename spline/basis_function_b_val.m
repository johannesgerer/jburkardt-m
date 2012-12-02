function yval = basis_function_b_val ( tdata, tval )

%*****************************************************************************80
%
%% BASIS_FUNCTION_B_VAL evaluates the B spline basis function.
%
%  Discussion:
%
%    The B spline basis function is a piecewise cubic which
%    has the properties that:
%
%    * it equals 2/3 at TDATA(3), 1/6 at TDATA(2) and TDATA(4);
%    * it is 0 for TVAL <= TDATA(1) or TDATA(5) <= TVAL;
%    * it is strictly increasing from TDATA(1) to TDATA(3),
%      and strictly decreasing from TDATA(3) to TDATA(5);
%    * the function and its first two derivatives are continuous
%      at each node TDATA(I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Davies and Philip Samuels,
%    An Introduction to Computational Geometry for Curves and Surfaces,
%    Clarendon Press, 1996.
%
%  Parameters:
%
%    Input, real TDATA(5), the nodes associated with the basis function.
%    The entries of TDATA are assumed to be distinct and increasing.
%
%    Input, real TVAL, a point at which the B spline basis function is
%    to be evaluated.
%
%    Output, real YVAL, the value of the function at TVAL.
%
  ndata = 5;

  if ( tval <= tdata(1) | tdata(ndata) <= tval )
    yval = 0.0;
    return
  end
%
%  Find the interval [ TDATA(LEFT), TDATA(RIGHT) ] containing TVAL.
%
  [ left, right ] = r8vec_bracket ( ndata, tdata, tval );
%
%  U is the normalized coordinate of TVAL in this interval.
%
  u = ( tval - tdata(left) ) / ( tdata(right) - tdata(left) );
%
%  Now evaluate the function.
%
  if ( tval < tdata(2) )
    yval = u^3 / 6.0;
  elseif ( tval < tdata(3) )
    yval = ( ( (    - 3.0E+00   ...
                * u + 3.0E+00 ) ...
                * u + 3.0E+00 ) ...
                * u + 1.0E+00 ) / 6.0E+00;
  elseif ( tval < tdata(4) )
    yval = ( ( (    + 3.0E+00   ...
                * u - 6.0E+00 ) ...
                * u + 0.0E+00 ) ...
                * u + 4.0E+00 ) / 6.0E+00;
  elseif ( tval < tdata(5) )
    yval = ( 1.0E+00 - u )^3 / 6.0E+00;
  end

  return
end
