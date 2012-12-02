function x = ccn_compute_points ( n )

%*****************************************************************************80
%
%% CCN_COMPUTE_POINTS: compute Clenshaw Curtis Nested points.
%
%  Discussion:
%
%    We want to compute the following sequence:
%
%    1/2,
%    0, 1
%    1/4, 3/4
%    1/8, 3/8, 5/8, 7/8,
%    1/16, 3/16, 5/16, 7/16, 9/16, 11/16, 13/16, 15/16, and so on.
%
%    But we'd prefer that the numbers in each row be regrouped in pairs
%    that are symmetric about 1/2, with the number above 1/2 coming first.
%    Thus, the last row might become:
%    (9/16, 7/16), (11/16, 5/16), ..., (15/16, 1/16).
%
%    Once we have our sequence, we apply the Chebyshev transformation
%    which maps [0,1] to [-1,+1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%  Parameters:
%
%    Input, integer N, the number of elements to compute.
%
%    Output, real X(N,1), the elements of the sequence.
%
  x = zeros ( n, 1 );
%
%  Handle first three entries specially.
%
  if ( 1 <= n )
    x(1,1) = 0.5;
  end
  if ( 2 <= n )
    x(2,1) = 1.0;
  end
  if ( 3 <= n )
    x(3,1) = 0.0;
  end

  m = 3;
  d = 2.0;

  while ( m < n )

    tu = d + 1 :  2 : 2*d - 1;
    td = d - 1 : -2 : 1;
    t = reshape ( [ tu; td ], 1, d );
    k = min ( d, n - m );
    x(m+1:m+k) = t(1:k) / d / 2.0;
    m = m + k;
    d = d * 2.0;

  end
%
%  Apply the Chebyshev transformation.
%
  x = cos ( x * pi );

  x(1) = 0.0;
  if ( 1 <= n )
    x(2) = -1.0;
  end
  if ( 2 <= n )
    x(3) = +1.0;
  end

  return
end
