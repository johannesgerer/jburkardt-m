function [ sval, spval ] = spline_hermite_val ( ndata, tdata, c, tval )

%*****************************************************************************80
%
%% SPLINE_HERMITE_VAL evaluates a piecewise cubic Hermite interpolant.
%
%  Discussion:
%
%    SPLINE_HERMITE_SET must be called first, to set up the
%    spline data from the raw function and derivative data.
%
%    In the interval (TDATA(I), TDATA(I+1)), the interpolating
%    Hermite polynomial is given by
%
%      SVAL(TVAL) =                 C(1,I)
%         + ( TVAL - TDATA(I) ) * ( C(2,I)
%         + ( TVAL - TDATA(I) ) * ( C(3,I)
%         + ( TVAL - TDATA(I) ) *   C(4,I) ) )
%
%    and
%
%      SVAL'(TVAL) =                    C(2,I)
%         + ( TVAL - TDATA(I) ) * ( 2 * C(3,I)
%         + ( TVAL - TDATA(I) ) *   3 * C(4,I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Samuel Conte and Carl de Boor,
%    Algorithm PCUBIC,
%    Elementary Numerical Analysis,
%    1973, page 234.
%
%  Parameters:
%
%    Input, integer NDATA, the number of data points.
%    NDATA is assumed to be at least 2.
%
%    Input, real TDATA(NDATA), the abscissas of the data points.
%    The entries of TDATA are assumed to be strictly increasing.
%
%    Input, real C(4,NDATA), the coefficient data computed by
%    SPLINE_HERMITE_SET.
%
%    Input, real TVAL, the point where the interpolant is to
%    be evaluated.
%
%    Output, real SVAL, SPVAL, the value of the interpolant
%    and its derivative at TVAL.
%

%
%  Find the interval [ TDATA(LEFT), TDATA(RIGHT) ] that contains
%  or is nearest to TVAL.
%
  [ left, right ] = r8vec_bracket ( ndata, tdata, tval );
%
%  Evaluate the cubic polynomial.
%
  dt = tval - tdata(left);

  sval = c(1,left) + dt * ( c(2,left) + dt * ( c(3,left) + dt * c(4,left) ) );

  spval = c(2,left) + dt * ( 2.0 * c(3,left) + dt * 3.0 * c(4,left) );

  return
end
