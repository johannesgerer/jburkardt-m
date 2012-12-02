function a2 = r8mat_expand_linear2 ( m, n, a, m2, n2 )

%*****************************************************************************80
%
%% R8MAT_EXPAND_LINEAR2 expands an R8MAT by linear interpolation.
%
%  Discussion:
%
%    In this version of the routine, the expansion is indicated
%    by specifying the dimensions of the expanded array.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in A.
%
%    Input, real A(M,N), a "small" M by N array.
%
%    Input, integer M2, N2, the number of rows and columns in A2.
%
%    Output, real A2(M2,N2), the expanded array, which
%    contains an interpolated version of the data in A.
%
  for i = 1 : m2

    if ( m2 == 1 )
      r = 0.5;
    else
      r = ( i - 1 ) / ( m2 - 1 );
    end

    i1 = 1 + floor ( r * ( m - 1 ) );
    i2 = i1 + 1;

    if ( m < i2 )
      i1 = m - 1;
      i2 = m;
    end

    r1 = ( i1 - 1 ) / ( m - 1 );

    r2 = ( i2 - 1 ) / ( m - 1 );

    for j = 1 : n2

      if ( n2 == 1 )
        s = 0.5;
      else
        s = ( j - 1 ) / ( n2 - 1 );
      end

      j1 = 1 + floor ( s * ( n - 1 ) );
      j2 = j1 + 1;

      if ( n < j2 )
        j1 = n - 1;
        j2 = n;
      end

      s1 = ( j1 - 1 ) / ( n - 1 );

      s2 = ( j2 - 1 ) / ( n - 1 );

      a2(i,j) = ...
        ( ( r2 - r ) * ( s2 - s ) * a(i1,j1) ...
        + ( r - r1 ) * ( s2 - s ) * a(i2,j1) ...
        + ( r2 - r ) * ( s - s1 ) * a(i1,j2) ...
        + ( r - r1 ) * ( s - s1 ) * a(i2,j2) ) ...
        / ( ( r2 - r1 ) * ( s2 - s1 ) );

    end

  end

  return
end
