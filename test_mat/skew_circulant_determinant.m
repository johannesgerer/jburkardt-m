function determ = skew_circulant_determinant ( n, x )

%*****************************************************************************80
%
%% SKEW_CIRCULANT_DETERMINANT returns the determinant of the SKEW_CIRCULANT matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the values in the first row of A.
%
%    Output, real DETERM, the determinant.
%
  determ = 1.0;

  j_hi = floor ( ( n + 1 ) / 2 );

  for j = 1 : j_hi

    lambda = 0.0;

    for k = 1 : n
      angle = ( 2 * j - 1 ) * ( k - 1 ) * pi / n;
      lambda = lambda + x(k) * complex ( cos ( angle ), sin ( angle ) );
    end

    if ( 2 * j <= n )
      determ = determ * ( abs ( lambda ) )^2;
    else
      determ = determ * real ( lambda );
    end

  end

  return
end
