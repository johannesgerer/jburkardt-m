function [ x, ierror ] = r8mat_solve2 ( n, a, b, x )

%*****************************************************************************80
%
%% R8MAT_SOLVE2 computes the solution of an N by N linear system.
%
%  Discussion:
%
%    The linear system may be represented as
%
%      A*X = B
%
%    If the linear system is singular, but consistent, then the routine will
%    still produce a solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of equations.
%
%    Input, real A(N,N), the coefficient matrix to be inverted.
%
%    Input, real B(N), the right hand side of the system.
%
%    Output, real X(N), the solution of the linear system.
%
%    Output, integer IERROR.
%    0, no error detected.
%    1, consistent singularity.
%    2, inconsistent singularity.
%
  ierror = 0;

  ipiv(1:n) = 0;
  x(1:n) = 0.0;
%
%  Process the matrix.
%
  for k = 1 : n
%
%  In column K:
%    Seek the row IMAX with the properties that:
%      IMAX has not already been used as a pivot;
%      A(IMAX,K) is larger in magnitude than any other candidate.
%
    amax = 0.0;
    imax = 0;
    for i = 1 : n
      if ( ipiv(i) == 0 )
        if ( amax < abs ( a(i,k) ) )
          imax = i;
          amax = abs ( a(i,k) );
        end
      end
    end
%
%  If you found a pivot row IMAX, then,
%    eliminate the K-th entry in all rows that have not been used for pivoting.
%
    if ( imax ~= 0 )

      ipiv(imax) = k;
      a(imax,k+1:n) = a(imax,k+1:n) / a(imax,k);
      b(imax) = b(imax) / a(imax,k);
      a(imax,k) = 1.0;

      for i = 1 : n

        if ( ipiv(i) == 0 )
          a(i,k+1:n) = a(i,k+1:n) - a(i,k) * a(imax,k+1:n);
          b(i) = b(i) - a(i,k) * b(imax);
          a(i,k) = 0.0;
        end

      end
    end
  end
%
%  Now, every row with nonzero IPIV begins with a 1, and
%  all other rows are all zero.  Begin solution.
%
  for j = n : -1 : 1

    imax = 0;
    for k = 1 : n
      if ( ipiv(k) == j )
        imax = k;
      end
    end

    if ( imax == 0 )

      x(j) = 0.0;

      if ( b(j) == 0.0 )
        ierror = 1;
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8MAT_SOLVE2 - Warning:\n' );
        fprintf ( 1, '  Consistent singularity, equation = %d\n', j );
      else
        ierror = 2;
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8MAT_SOLVE2 - Error:\n' );
        fprintf ( 1, '  Inconsistent singularity, equation = %d\n', j );
      end

    else

      x(j) = b(imax);

      for i = 1 : n
        if ( i ~= imax )
          b(i) = b(i) - a(i,j) * x(j);
        end
      end

    end
  end

  return
end
