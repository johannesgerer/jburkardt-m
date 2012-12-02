function lambda = gear_eigenvalues ( ii, jj, n )

%*****************************************************************************80
%
%% GEAR_EIGENVALUES returns the eigenvalues of the Gear matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer II, JJ, define the two special entries.
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N), the eigenvalues.
%

%
%  Separate the sign and value.
%
  j = abs ( ii );
  js = i4_sign ( ii );

  k = abs ( jj );
  ks = i4_sign ( jj );

  if ( 0 < js & 0 < ks )

    w = 0;

    phi = n - floor ( ( j + k ) / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = 2 * p * pi / ( 2 * n + 2 - j - k );
    end

    phi = floor ( ( j - 1 ) / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = 2 * p * pi / j;
    end

    phi = floor ( ( k - 1 ) / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = 2 * p * pi / k;
    end

    w = w + 1;
    alpha(w) = 0.0;

    if ( i4_even ( j ) & i4_even ( k ) )
      w = w + 1;
      alpha(w) = pi;
    end

  elseif ( 0 < js & ks < 0 )

    w = 0;

    phi = n + 1 - floor ( (j+k+1) / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = ( 2 * p - 1 ) * pi / ( 2 * n + 2 - j - k );
    end

    phi = floor ( ( j - 1 ) / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = 2 * p * pi / j;
    end

    phi = floor ( k / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = ( 2 * p - 1 ) * pi / k;
    end

    if ( i4_even ( j ) & i4_odd ( k ) )
      w = w + 1;
      alpha(w) = pi;
    end

  elseif ( js < 0 & 0 < ks )

    w = 0;

    phi = n + 1 - floor ( ( j + k + 1 ) / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = ( 2 * p - 1 ) * pi / ( 2 * n + 2 - j - k );
    end

    phi = floor ( j / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = ( 2 * p - 1 ) * pi / j;
    end

    phi = floor ( ( k - 1 ) / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = 2 * p * pi / k;
    end

    if ( i4_odd ( j ) & i4_even ( k ) )
      w = w + 1;
      alpha(w) = pi;
    end

  elseif ( js < 0 & ks < 0 )

    w = 0;

    phi = n - floor ( ( j + k ) / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = 2 * p * pi / ( 2 * n + 2 - j - k );
    end

    phi = floor ( j / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = ( 2 * p - 1 ) * pi / j;
    end

    phi = floor ( k / 2 );
    for p = 1 : phi
      w = w + 1;
      alpha(w) = ( 2 * p - 1 ) * pi / k;
    end

    if ( i4_odd ( j ) & i4_odd ( k ) )
      w = w + 1;
      alpha(w) = pi;
    end

  end

  for w = 1 : n
    lambda(w) = 2.0 * cos ( alpha(w) );
  end

  return
end
