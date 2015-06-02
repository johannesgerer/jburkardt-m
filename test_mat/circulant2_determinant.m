function determ = circulant2_determinant ( n )

%*****************************************************************************80
%
%% CIRCULANT2_DETERMINANT returns the determinant of the CIRCULANT2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real DETERM, the determinant.
%
  w = c8vec_unity ( n );

  lambda = zeros ( n, 1 );
  lambda(1:n) = n;
  for i = n-1 : -1 : 1
    lambda(1:n) = lambda(1:n) .* w(1:n) + i;
  end
%
%  First eigenvalue is "special".
%
  determ = real ( lambda(1) );
%
%  Eigenvalues 2, 3     through ( N + 1 ) / 2 are paired with complex conjugates.
%
  for i = 2 : floor ( ( n + 1 ) / 2 )
    determ = determ * ( abs ( lambda(i) ) )^2;
  end
%
%  If N is even, there is another unpaired eigenvalue.
%
  if ( mod ( n, 2 ) == 0 )
    determ = determ * real ( lambda((n/2)+1) );
  end

  return
end
