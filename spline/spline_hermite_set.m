function c = spline_hermite_set ( ndata, tdata, ydata, ypdata )

%*****************************************************************************80
%
%% SPLINE_HERMITE_SET sets up a piecewise cubic Hermite interpolant.
%
%  Discussion:
%
%    Once the array C is computed, then in the interval
%    (TDATA(I), TDATA(I+1)), the interpolating Hermite polynomial
%    is given by
%
%      SVAL(TVAL) =                 C(1,I)
%         + ( TVAL - TDATA(I) ) * ( C(2,I)
%         + ( TVAL - TDATA(I) ) * ( C(3,I)
%         + ( TVAL - TDATA(I) ) *   C(4,I) ) )
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
%    Algorithm CALCCF,
%    Elementary Numerical Analysis,
%    1973, page 235.
%
%  Parameters:
%
%    Input, integer NDATA, the number of data points.
%    NDATA must be at least 2.
%
%    Input, real TDATA(NDATA), the abscissas of the data points.
%    The entries of TDATA are assumed to be strictly increasing.
%
%    Input, real Y(NDATA), YP(NDATA), the value of the
%    function and its derivative at TDATA(1:NDATA).
%
%    Output, real C(4,NDATA), the coefficients of the Hermite polynomial.
%    C(1,1:NDATA) = Y(1:NDATA) and C(2,1:NDATA) = YP(1:NDATA).
%    C(3,1:NDATA-1) and C(4,1:NDATA-1) are the quadratic and cubic
%    coefficients.
%
  c(1,1:ndata) = ydata(1:ndata);
  c(2,1:ndata) = ypdata(1:ndata);

  for i = 1 : ndata-1
    dt = tdata(i+1) - tdata(i);
    divdif1 = ( c(1,i+1) - c(1,i) ) / dt;
    divdif3 = c(2,i) + c(2,i+1) - 2.0E+00 * divdif1;
    c(3,i) = ( divdif1 - c(2,i) - divdif3 ) / dt;
    c(4,i) = divdif3 / ( dt * dt );
  end

  c(3,ndata) = 0.0E+00; 
  c(4,ndata) = 0.0E+00;

  return
end
