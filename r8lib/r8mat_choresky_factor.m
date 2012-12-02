function [ c, flag ] = r8mat_choresky_factor ( n, a )

%*****************************************************************************80
%
%% R8MAT_CHORESKY_FACTOR computes the "Choresky" factor of a symmetric matrix.
%
%  Discussion:
%
%    The matrix must be symmetric and positive semidefinite.
%
%    For a positive semidefinite symmetric matrix A, the Cholesky factorization
%    is an upper triangular matrix R such that:
%
%      A = R * R'
%
%    Note that the usual Cholesky factor is a LOWER triangular matrix L
%    such that
%
%      A = L * L'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of the matrix A.
%
%    Input, real A(N,N), the matrix.
%
%    Output, real C(N,N), the N by N upper triangular "Choresky" factor.
%
%    Output, integer FLAG:
%    0, no error occurred.
%    1, the matrix is not positive definite.
%
  flag = 0;

  c(n:-1:1,n:-1:1) = a(1:n,1:n);

  for j = 1 : n

    c(1:j-1,j) = 0.0;

    for i = j : n

      sum2 = c(j,i) - c(j,1:j-1) * c(i,1:j-1)';

      if ( i == j )
        if ( sum2 <= 0.0 )
          flag = 1;
          return;
        else
          c(i,j) = sqrt ( sum2 );
        end
      else
        if ( c(j,j) ~= 0.0 )
          c(i,j) = sum2 / c(j,j);
        else
          c(i,j) = 0.0;
        end
      end

    end

  end

  c(n:-1:1,n:-1:1) = c(1:n,1:n);

  return
end
