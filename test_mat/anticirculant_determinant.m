function determ = anticirculant_determinant ( n, x )

%*****************************************************************************80
%
%% ANTICIRCULANT_DETERMINANT returns the determinant of the ANTICIRCULANT matrix.
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
%    Input, real X(N), the values in the first row of A.
%
%    Output, real DETERM, the determinant.
%
  w = c8vec_unity ( n );
  w = w(:);

  lambda = zeros ( n, 1 );
  lambda(1:n) = x(n);
  for i = n-1 : -1 : 1
    lambda(1:n) = lambda(1:n) .* w(1:n) + x(i);
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
%
%  This is actually the determinant of the CIRCULANT matrix.
%  We have to perform ( N - 1 ) / 2 row interchanges to get
%  to the anticirculant matrix.
%
  determ = r8_mop ( floor ( ( n - 1 ) / 2 ) ) * determ;

  return
end
