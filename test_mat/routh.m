function a = routh ( n, x )

%*****************************************************************************80
%
%% ROUTH returns the Routh matrix.
%
%  Formula:
%
%    A is tridiagonal.
%    A(1,1)   =          X(1).
%    A(I-1,I) =   sqrt ( X(I) ), for I = 2 to N.
%    A(I,I-1) = - sqrt ( X(I) ), for I = 2 to N.
%
%  Example:
%
%    N = 5, X = ( 1, 4, 9, 16, 25 )
%
%    1 -2  0  0  0
%    2  0 -3  0  0
%    0  3  0 -4  0
%    0  0  4  0 -5
%    0  0  0  5  0
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 3.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    det ( A ) = product ( X(N) * X(N-2) * X(N-4) * ... * X(N+1-2*(N/2)) )
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
%    Input, real X(N), the data that defines the matrix.
%
%    Output, real A(N,N), the matrix.
%
  if ( any ( x(2:n) < 0.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ROUTH - Fatal error!\n' );
    fprintf ( 1, '  At least one of X(2:N) was negative.\n' );
    error ( 'ROUTH - Fatal error!' );
  end

  for i = 1 : n
    for j = 1 : n

      if ( i == 1 & j == 1 )
        a(i,j) = x(1);
      elseif ( i == j+1 )
        a(i,j) = sqrt ( x(i) );
      elseif ( i == j-1 )
        a(i,j) = - sqrt ( x(i+1) );
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
