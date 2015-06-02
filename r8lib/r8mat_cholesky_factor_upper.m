function [ c, flag ] = r8mat_cholesky_factor_upper ( n, a )

%*****************************************************************************80
%
%% R8MAT_CHOLESKY_FACTOR_UPPER: upper Cholesky factor of a symmetric matrix.
%
%  Discussion:
%
%    The matrix must be symmetric and positive semidefinite.
%
%    For a positive semidefinite symmetric matrix A, the upper Cholesky 
%    factorization is an upper triangular matrix L such that:
%
%      A = R * R
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2013
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
%    Output, real C(N,N), the N by N upper triangular Cholesky factor.
%
%    Output, integer ( kind = 4 ) FLAG:
%    0, no error occurred.
%    1, the matrix is not positive definite.
%
  flag = 0;

  c(1:n,1:n) = a(1:n,1:n);

  for j = 1 : n

    c(j,1:j-1) = 0.0;

    for i = j : n

      sum2 = c(i,j) - c(1:j-1,j)' * c(1:j-1,i);

      if ( i == j )
        if ( sum2 <= 0.0 )
          flag = 1;
          return;
        else
          c(j,i) = sqrt ( sum2 );
        end
      else
        if ( c(j,j) ~= 0.0 )
          c(j,i) = sum2 / c(j,j);
        else
          c(j,i) = 0.0;
        end
      end

    end

  end

  return
end
