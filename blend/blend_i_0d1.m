function x = blend_i_0d1 ( x, m )

%*****************************************************************************80
%
%% BLEND_I_0D1 extends indexed scalar data at endpoints along a line.
%
%  Diagram:
%
%    ( X1, ..., ..., ..., ..., ..., XM )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Gordon,
%    Blending-Function Methods of Bivariate and Multivariate Interpolation
%    and Approximation,
%    SIAM Journal on Numerical Analysis,
%    Volume 8, Number 1, March 1971, pages 158-177.
%
%    William Gordon and Charles Hall,
%    Transfinite Element Methods: Blending-Function Interpolation over
%    Arbitrary Curved Element Domains,
%    Numerische Mathematik,
%    Volume 21, Number 1, 1973, pages 109-129.
%
%    William Gordon and Charles Hall,
%    Construction of Curvilinear Coordinate Systems and Application to
%    Mesh Generation,
%    International Journal of Numerical Methods in Engineering,
%    Volume 7, 1973, pages 461-477.
%
%    Joe Thompson, Bharat Soni, Nigel Weatherill,
%    Handbook of Grid Generation,
%    CRC Press, 1999.
%
%  Parameters:
%
%    Input, real X(M).  X(1) and X(M) contain scalar values which are to be
%    interpolated through the entries X(2) through X(M).  It is assumed
%    that the dependence of the data is linear in the vector index I.
%
%    Input, integer M, the number of entries in X.
%
%    Output, real X(M).  X(2) through X(M-1) have been assigned interpolated
%    values.
%
  for i = 2 : m - 1

    r = ( i - 1 ) / ( m - 1 );

    x(i) = blend_101 ( r, x(1), x(m) );

  end

  return
end
