function a = r8mat_cholesky_inverse ( n, a )

%*****************************************************************************80
%
%% R8MAT_CHOLESKY_INVERSE computes the inverse of a symmetric matrix.
%
%  Discussion:
%
%    The matrix must be symmetric and positive semidefinite.
%
%    The upper triangular Cholesky factorization R is computed, so that:
%
%      A = R' * R
%
%    Then the inverse B is computed by
%
%      B = inv ( A ) = inv ( R ) * inv ( R' )
%
%    An R8MAT is an MxN array of R8's, stored by (I,J) -> [I+J*M].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of
%    the matrix A.
%
%    Input/output, real A(N,N).  On input, the matrix.
%    On output, the inverse of the matrix.
%
  for j = 1 : n

    s = 0.0;

    for k = 1 : j - 1
      t = a(k,j);
      for i = 1 : k - 1
        t = t - a(i,k) * a(i,j);
      end
      t = t / a(k,k);
      a(k,j) = t;
      s = s + t * t;
    end

    s = a(j,j) - s;

    if ( s <= 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8MAT_CHOLESKY_INVERSE - Fatal error!\n' );
      fprintf ( 1, '  The matrix is singular.\n' );
      error ( 'R8MAT_CHOLESKY_INVERSE - Fatal error!' );
    end

    a(j,j) = sqrt ( s );

    a(j+1:n,j) = 0.0;

  end
%
%  Compute inverse(R).
%
  for k = 1 : n

    a(k,k) = 1.0 / a(k,k);
    a(1:k-1,k) = - a(1:k-1,k) * a(k,k);

    for j = k + 1 : n
      t = a(k,j);
      a(k,j) = 0.0;
      a(1:k,j) = a(1:k,j) + t * a(1:k,k);
    end

  end
%
%  Form inverse(R) * (inverse(R))'.
%
  for j = 1 : n
    for k = 1 : j - 1
      t = a(k,j);
      a(1:k,k) = a(1:k,k) + t * a(1:k,j);
    end
    t = a(j,j);
    a(1:j,j) = a(1:j,j) * t;
  end
%
%  Use reflection.
%
  for i = 1 : n
    for j = 1 : i - 1
      a(i,j) = a(j,i);
    end
  end

  return
end
