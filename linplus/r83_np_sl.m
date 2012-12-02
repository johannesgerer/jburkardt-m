function x = r83_np_sl ( n, a_lu, b, job )

%*****************************************************************************80
%
%% R83_NP_SL solves a R83 system factored by R83_NP_FA.
%
%  Discussion:
%
%    The R83 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a R83 matrix of order 5 would be stored:
%
%       *  A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54  *
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 2.
%
%    Input, real A_LU(3,N), the LU factor information
%    returned by R83_NP_FA.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Input, integer JOB, specifies the system to solve.
%    0, solve A * x = b.
%    nonzero, solve A' * x = b.
%
%    Output, real X(N), the solution of the linear system.
%
  x(1:n) = b(1:n);
  
  if ( job == 0 )
%
%  Solve L * Y = B.
%
    for i = 2 : n
      x(i) = x(i) - a_lu(3,i-1) * x(i-1);
    end
%
%  Solve U * X = Y.
%
    for i = n : -1 : 1
      x(i) = x(i) ./ a_lu(2,i);
      if ( 1 < i )
        x(i-1) = x(i-1) - a_lu(1,i) * x(i);
      end
    end

  else
%
%  Solve U' * Y = B
%
    for i = 1 : n
      x(i) = x(i) / a_lu(2,i);
      if ( i < n )
        x(i+1) = x(i+1) - a_lu(1,i+1) * x(i);
      end
    end
%
%  Solve L' * X = Y.
%
    for i = n-1 : -1 : 1
      x(i) = x(i) - a_lu(3,i) * x(i+1);
    end

  end

  return
end
