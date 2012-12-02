function x = blend_ijk_2d1 ( x, m1, m2, m3 )

%*****************************************************************************80
%
%% BLEND_IJK_2D1 extends indexed scalar face data into a cubic table.
%
%  Diagram:
%
%    ( X111    X121    X131    X141    X151    X1M21   )
%    ( X211    X221    X231    X241    X251    X2M21   )
%    ( X311    X321    X331    X341    X351    X3M21   )   Layer 1
%    ( X411    X421    X431    X441    X451    X4M21   )
%    ( XM111   XM121   XM131   XM141   XM151   XM1M21  )
%
%    ( X11K    X12K    X13K    X14K    X15K    X1M2K   )
%    ( X21K    ...     ....    ....    ....    X2M2K   )
%    ( X31K    ...     ....    ....    ....    X3M2K   )   Layer K
%    ( X41K    ...     ....    ....    ....    X4M2K   )   1 < K < M3
%    ( XM11K   XM12K   XM13K   XM14K   XM15K   XM1M2K  )
%
%    ( X11M3   X12M3   X13M3   X14M3   X15M3   X1M2M3  )
%    ( X21M3   X22M3   X23M3   X24M3   X25M3   X2M2M3  )
%    ( X31M3   X32M3   X33M3   X34M3   X35M3   X3M2M3  )   Layer M3
%    ( X41M3   X42M3   X43M3   X44M3   X45M3   X4M2M3  )
%    ( XM11M3  XM12M3  XM13M3  XM14M3  XM15M3  XM1M2M3 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2008
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
%    Input, real X(M1,M2,M3).
%    On input, there is already scalar data in the entries X(I,J,K)
%    corresponding to "faces" of the table, that is, entries for which
%    at least one of the three indices I, J and K is equal to their
%    minimum or maximum possible values.
%
%    Input, integer M1, M2, M3, the number of rows, columns, and
%    layers in X.
%
%    Output, real X(M1,M2,M3), all entries in X have been assigned a value,
%    using the table indices as independent variables.
%

%
%  Interpolate values in the interior.
%
  for i = 2 : m1 - 1

    r = ( i - 1 ) / ( m1 - 1 );

    for j = 2 : m2 - 1

      s = ( j - 1 ) / ( m2 - 1 );

      for k = 2 : m3 - 1

        t = ( k - 1 ) / ( m3 - 1 );

        x(i,j,k) = blend_123 ( r, s, t, ...
          x( 1,1,1), x( 1, 1,m3), x( 1,m2,1), x( 1,m2,m3), ...
          x(m1,1,1), x(m1, 1,m3), x(m1,m2,1), x(m1,m2,m3), ...
          x( i,1,1), x( i, 1,m3), x( i,m2,1), x( i,m2,m3), ...
          x( 1,j,1), x( 1, j,m3), x(m1, j,1), x(m1, j,m3), ...
          x( 1,1,k), x( 1,m2, k), x(m1, 1,k), x(m1,m2, k), ...
          x( 1,j,k), x(m1, j, k), x( i, 1,k), x( i,m2, k), ...
          x( i,j,1), x( i, j,m3) );

      end

    end

  end

  return
end
