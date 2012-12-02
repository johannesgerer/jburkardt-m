function [ c, ierror ] = r8mat_cholesky_factor ( n, a )

%*****************************************************************************80
%
%% R8MAT_CHOLESKY_FACTOR computes the Cholesky factor of a symmetric matrix.
%
%  Discussion:
%
%    The matrix must be symmetric and positive semidefinite.
%
%    For a positive semidefinite symmetric matrix A, the Cholesky factorization
%    is a lower triangular matrix L such that:
%
%      A = L * L'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the matrix.
%
%    Output, real C(N,N), the lower triangular Cholesky factor.
%
%    Output, integer IERROR, error flag.
%    0, no error.
%    1, warning, the matrix is positive semidefinite.  The factorization
%    was carried out, but the matrix is singular.
%    2, error, the matrix has at least one negative eigenvalue.  The
%    factorization could not be completed.
%
  ierror = 0;

  c(1:n,1:n) = a(1:n,1:n);

  for j = 1 : n

    c(1:j-1,j) = 0.0;

    for i = j : n

      ctc = c(j,i) - c(i,1:j-1) c(j,1:j-1)';

      if ( i == j )
        if ( ctc < 0.0 )
          ierror = 2;
          return
        elseif ( ctc == 0.0 )
          ierror = 1;
        else
          c(i,j) = sqrt ( ctc );
        end
      else
        if ( c(j,j) ~= 0.0 )
          c(i,j) = ctc / c(j,j);
        else
          c(i,j) = 0.0;
        end
      end

    end

  end

  return
end
