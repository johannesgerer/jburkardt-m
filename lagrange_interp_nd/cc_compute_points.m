function x = cc_compute_points ( n )

%*****************************************************************************80
%
%% CC_COMPUTE_POINTS computes the Clenshaw Curtis points.
%
%  Discussion:
%
%    Our convention is that the points are numbered from left to right.
%
%    The points are defined on [-1,1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%    1 <= N.
%
%    Output, real X(N,1), the abscissas.
%
  if ( n < 1 )
    error ( 'CC_COMPUTE_POINTS - Fatal error!' );
  end

  x = zeros ( n, 1 );

  if ( n == 1 )
    x(1) = 0.0;
    return
  end

  for i = 1 : n
    x(i) = cos ( ( n - i ) * pi / ( n - 1 ) );
  end
%
%  Clean up special values.
%
  x(1) = -1.0;
  if ( mod ( n, 2 ) == 1 )
    x((n+1)/2) = 0.0;
  end
  x(n) = +1.0;

  return
end
