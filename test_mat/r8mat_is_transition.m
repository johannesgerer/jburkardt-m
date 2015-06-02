function error_frobenius = r8mat_is_transition ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_IS_TRANSITION checks whether an R8MAT is a transition matrix.
%
%  Discussion:
%
%    A transition matrix:
%    * is a square matrix;
%    * with real, nonnegative entries;
%    * whose columns each sum to 1.
%
%    An R8MAT is a matrix of real values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Input, real A(M,N), the matrix.
%
%    Output, real ERROR_FROBENIUS.
%    This value is Inf, if M /= N.
%    This value is Inf, if any entry is negative.
%    Otherwise, it is the square root of the sum of the squares
%    of the deviations of the column sums from 1.
%
  if ( m ~= n )
    error_frobenius = Inf;
    return
  end

  if ( 0 < any ( any ( a < 0.0 ) ) )
    error_frobenius = Inf;
    return
  end
%
%  Take column sums.
%
  error_frobenius = sqrt ...
    ( sum ...
      ( ...
        ( ...
          sum ( a(1:m,1:n), 1 ) - ones ( 1, n ) ...
        ) .^2 ...
      ) ...
    );
 
  return
end
