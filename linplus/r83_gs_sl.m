function x_new = r83_gs_sl ( n, a, b, x, it_max, job )

%*****************************************************************************80
%
%% R83_GS_SL solves a R83 system using Gauss-Seidel iteration.
%
%  Discussion:
%
%    The R83 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%    This routine simply applies a given number of steps of the
%    iteration to an input approximate solution.  On first call, you can
%    simply pass in the zero vector as an approximate solution.  If
%    the returned value is not acceptable, you may call again, using
%    it as the starting point for additional iterations.
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
%    02 February 2004
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
%    Input, real A(3,N), the R83 matrix.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Input, real X(N), an approximate solution to the system.
%
%    Input, integer IT_MAX, the maximum number of iterations.
%
%    Input, integer JOB, specifies the system to solve.
%    0, solve A * x = b.
%    nonzero, solve A' * x = b.
%
%    Output, real X_NEW(N), an approximate solution to the system.
%

%
%  No diagonal matrix entry can be zero.
%
  for i = 1 : n
    if ( a(2,i) == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R83_GS_SL - Fatal error!\n' );
      fprintf ( 1, '  Zero diagonal entry, index = %d\n', i );
      return;
    end
  end

  if ( job == 0 )

    for it_num = 1 : it_max

      x_new(1) = ( b(1) - a(3,1) * x(2)   ) / a(2,1);
      for i = 2 : n - 1
        x_new(i) = ( b(i) - a(1,i) * x_new(i-1) - a(3,i) * x(i+1) ) ...
          / a(2,i);
      end
      x_new(n) = ( b(n) - a(1,n) * x_new(n-1) ) / a(2,n);

      x(1:n) = x_new(1:n);
    end

  else

    for it_num = 1 : it_max
      x_new(1) = ( b(1) - a(1,2) * x(2) ) / a(2,1);
      for i = 2 : n - 1
        x_new(i) = ( b(i) - a(3,i-1) * x_new(i-1) - a(1,i+1) * x(i+1) ) ...
          / a(2,i);
      end
      x_new(n) = ( b(n) - a(3,n-1) * x_new(n-1) ) / a(2,n);
      
      x(1:n) = x_new(1:n);
    end

  end

  return
end
