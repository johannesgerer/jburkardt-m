function x = r83_np_fs ( n, a, b )

%*****************************************************************************80
%
%% R83_NP_FS factors and solves a R83 system with no pivoting.
%
%  Discussion:
%
%    The R83 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%    This algorithm requires that each diagonal entry be nonzero.
%    It does not use pivoting, and so can fail on systems that
%    are actually nonsingular.
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
%    27 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the linear system.
%
%    Input/output, real A(3,N).
%    On input, the tridiagonal matrix.
%    On output, the data in these vectors has been overwritten
%    by factorization information.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Output, real X(N), the solution of the linear system.
%

%
%  The diagonal entries can't be zero.
%
  for i = 1 : n
    if ( a(2,i) == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R83_NP_FS - Fatal error!\n' );
      fprintf ( 1, '  A(2,%d) = 0.\n', i );
      return;
    end
  end

  x(1:n) = b(1:n);

  for i = 2 : n
    xmult = a(3,i-1) / a(2,i-1);
    a(2,i) = a(2,i) - xmult * a(1,i);
    x(i)   = x(i)   - xmult * x(i-1);
  end

  x(n) = x(n) / a(2,n);
  for i = n-1 : -1 : 1
    x(i) = ( x(i) - a(1,i+1) * x(i+1) ) / a(2,i);
  end

  return
end
