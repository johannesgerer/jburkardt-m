function yi = pwl_interp_1d ( nd, xd, yd, ni, xi )

%*****************************************************************************80
%
%% PWL_INTERP_1D evaluates the piecewise linear interpolant.
%
%  Discussion:
%
%    The piecewise linear interpolant L(ND,XD,YD)(X) is the piecewise
%    linear function which interpolates the data (XD(I),YD(I)) for I = 1
%    to ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%    ND must be at least 1.
%
%    Input, real XD(ND,1), the data points.
%
%    Input, real YD(ND,1), the data values.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(NI,1), the interpolation points.
%
%    Output, real YI(NI,1), the interpolated values.
%
  if ( nd == 1 )
    yi(1:ni,1) = yd;
    return
  end

  [ k, k ] = histc ( xi, xd );
%
%  Use extrapolation, if necessary.
%
  k ( k == 0 ) = 1;
  k ( k == nd ) = nd - 1;

  t = ( xi - xd(k,1) ) ./ ( xd(k+1,1) - xd(k,1) );
  yi = ( 1 - t ) .* yd(k) + t .* yd(k+1);
  
  return
end
