function x = blend_ijk_0d1 ( x, m1, m2, m3 )

%*****************************************************************************80
%
%% BLEND_IJK_0D1 extends indexed scalar corner data into a cubic table.
%
%  Diagram:
%
%    ( X111,   ...,  ...,  ...,  ...,  ...,  X1M21   )
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )   First "layer"
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )
%    ( XM111,  ...,  ...,  ...,  ...,  ...,  XM1M21  )
%
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )   Middle "layers"
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )
%
%    ( X11M3,  ...,  ...,  ...,  ...,  ...,  X1M2M3  )
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )   Last "layer"
%    ( ....,   ...,  ...,  ...,  ...,  ...,  ...     )
%    ( XM11M3, ...,  ...,  ...,  ...,  ...,  XM1M2M3 )
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
%    Input, real X(M1,M2,M3).
%    On input, X(1,1,1), X(1,M2,1), X(M1,1,1), X(M1,M2,1), X(1,1,M3),
%    X(1,M2,M3), X(M1,1,M3) and X(M1,M2,M3) contain scalar values
%    which are to be interpolated throughout the table, using the table
%    indices I and J as independent variables.
%
%    Input, integer M1, M2, M3, the number of rows, columns, and layers
%    in X.
%
%    Output, real X(M1,M2,M3), all entries in X have been assigned a value.
%

%
%  Interpolate values along the "edges", that is, index triplets (i,j,k)
%  with exactly two of I, J, K an "extreme" value.
%
  for i = 2 : m1 - 1

    r = ( i - 1 ) / ( m1 - 1 );

    x( i, 1, 1) = blend_101 ( r, x( 1, 1, 1), x(m1, 1, 1) );
    x( i,m2, 1) = blend_101 ( r, x( 1,m2, 1), x(m1,m2, 1) );
    x( i, 1,m3) = blend_101 ( r, x( 1, 1,m3), x(m1, 1,m3) );
    x( i,m2,m3) = blend_101 ( r, x( 1,m2,m3), x(m1,m2,m3) );

  end

  for j = 2 : m2 - 1

    s = ( j - 1 ) / ( m2 - 1 );

    x( 1, j, 1) = blend_101 ( s, x( 1, 1, 1), x( 1,m2, 1) );
    x(m1, j, 1) = blend_101 ( s, x(m1, 1, 1), x(m1,m2, 1) );
    x( 1, j,m3) = blend_101 ( s, x( 1, 1,m3), x( 1,m2,m3) );
    x(m1, j,m3) = blend_101 ( s, x(m1, 1,m3), x(m1,m2,m3) );

  end

  for k = 2 : m3 - 1

    t = ( k - 1 ) / ( m3 - 1 );

    x( 1, 1,k) = blend_101 ( t, x( 1, 1,1), x( 1, 1,m3) );
    x(m1, 1,k) = blend_101 ( t, x(m1, 1,1), x(m1, 1,m3) );
    x( 1,m2,k) = blend_101 ( t, x( 1,m2,1), x( 1,m2,m3) );
    x(m1,m2,k) = blend_101 ( t, x(m1,m2,1), x(m1,m2,m3) );

  end
%
%  Interpolate values along the "faces", that is, index triplets (i,j,k)
%  with exactly one of I, J, K is an "extreme" value.
%
  for j = 2 : m2 - 1

    s = ( j - 1 ) / ( m2 - 1 );

    for k = 2 : m3 - 1

      t = ( k - 1 ) / ( m3 - 1 );

      x(1,j,k) = blend_112 ( s, t, x(1,1,1), x(1,1,m3), x(1,m2,1), x(1,m2,m3), ...
        x(1,j,1), x(1,j,m3), x(1,1,k), x(1,m2,k) );

      x(m1,j,k) = blend_112 ( s, t, x(m1,1,1), x(m1,1,m3), x(m1,m2,1), ...
        x(m1,m2,m3), x(m1,j,1), x(m1,j,m3), x(m1,1,k), x(m1,m2,k) );

    end
  end

  for i = 2 : m1 - 1

    r = ( i - 1 ) / ( m1 - 1 );

    for k = 2 : m3 - 1

      t = ( k - 1 ) / ( m3 - 1 );

      x(i,1,k) = blend_112 ( r, t, x(1,1,1), x(1,1,m3), x(m1,1,1), ...
        x(m1,1,m3), x(i,1,1), x(i,1,m3), x(1,1,k), x(m1,1,k) );

      x(i,m2,k) = blend_112 ( r, t, x(1,m2,1), x(1,m2,m3), x(m1,m2,1), ...
        x(m1,m2,m3), x(i,m2,1), x(i,m2,m3), x(1,m2,k), x(m1,m2,k) );

    end
  end

  for i = 2 : m1 - 1

    r = ( i - 1 ) / ( m1 - 1 );

    for j = 2 : m2 - 1

      s = ( j - 1 ) / ( m2 - 1 );

      x(i,j,1) = blend_112 ( r, s, x(1,1,1), x(1,m2,1), x(m1,1,1), ...
        x(m1,m2,1), x(i,1,1), x(i,m2,1), x(1,j,1), x(m1,j,1) );

      x(i,j,m3) = blend_112 ( r, s, x(1,1,m3), x(1,m2,m3), x(m1,1,m3), ...
        x(m1,m2,m3), x(i,1,m3), x(i,m2,m3), x(1,j,m3), x(m1,j,m3) );

    end
  end
%
%  Interpolate values in the interior.
%
  for i = 2 : m1 - 1

    r = ( i - 1 )  / ( m1 - 1 );

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
