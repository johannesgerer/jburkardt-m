function x = blend_ij_0d1 ( x, m1, m2 )

%*****************************************************************************80
%
%% BLEND_IJ_0D1 extends indexed scalar data at corners into a table.
%
%  Diagram:
%
%    ( X11,  ..., ..., ..., ..., ..., X1M2  )
%    ( ...,  ..., ..., ..., ..., ..., ...   )
%    ( ...,  ..., ..., ..., ..., ..., ...   )
%    ( ...,  ..., ..., ..., ..., ..., ...   )
%    ( XM11, ..., ..., ..., ..., ..., XM1M2 )
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
%    Input, real X(M1,M2).  On input, X(1,1), X(1,M2), X(M1,1) and X(M1,M2) 
%    contain scalar values which are to be interpolated throughout the table, 
%    using the table indices I and J as independent variables.
%
%    Input, integer M1, M2, the number of rows and columns in X.
%
%    Output, real X(M1,M2), all entries in X have been assigned a value.
%

%
%  Interpolate values along the edges.
%
  for i = 2 : m1 - 1

    r = (  i - 1 ) / ( m1 - 1 );

    x(i,1) = blend_101 ( r, x(1,1), x(m1,1) );

    x(i,m2) = blend_101 ( r, x(1,m2), x(m1,m2) );

  end

  for j = 2 : m2 - 1

    s = (  j - 1 ) / ( m2 - 1 );

    x(1,j) = blend_101 ( s, x(1,1), x(1,m2) );

    x(m1,j) = blend_101 ( s, x(m1,1), x(m1,m2) );

  end
%
%  Interpolate values in the interior.
%
  for i = 2 : m1 - 1

    r = (  i - 1 ) / ( m1 - 1 );

    for j = 2 : m2 - 1

      s = (  j - 1 ) / ( m2 - 1 );

      x(i,j) = blend_112 ( r, s, x(1,1), x(1,m2), x(m1,1), x(m1,m2), ...
        x(i,1), x(i,m2), x(1,j), x(m1,j) );

    end

  end

  return
end
