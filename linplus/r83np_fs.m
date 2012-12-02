function x = r83np_fs ( n, a, b )

%*****************************************************************************80
%
%% R83NP_FS factors and solves an R83NP system.
%
%  Discussion:
%
%    The R83NP storage format is used for a tridiagonal matrix.
%    The subdiagonal   is in entries (1,2:N),
%    the diagonal      is in entries (2,1:N),
%    the superdiagonal is in entries (3,1:N-1).
%
%    This algorithm requires that each diagonal entry be nonzero.
%    It does not use pivoting, and so can fail on systems that
%    are actually nonsingular.
%
%    The "R83NP" format used for this routine is different from the R83 format.
%    Here, we insist that the nonzero entries
%    for a given row now appear in the corresponding column of the
%    packed array.
%
%  Example:
%
%    Here is how an R83NP matrix of order 5 would be stored:
%
%       *  A21 A32 A43 A54
%      A11 A22 A33 A44 A55
%      A12 A23 A34 A45  *
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the linear system.
%
%    Input, real A(3,N), the tridiagonal matrix.
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
      fprintf ( 1, 'R83NP_FS - Fatal error!\n' );
      fprintf ( 1, '  A(2,%d) = 0.\n', i );
      return
    end
  end

  x(1:n) = b(1:n);

  for i = 2 : n
    a(2,i) = a(2,i) - a(3,i-1) * a(1,i) / a(2,i-1);
    x(i)   = x(i)   - x(i-1)   * a(1,i) / a(2,i-1);
  end

  x(n) = x(n) / a(2,n);
  for i = n-1 : -1 : 1
    x(i) = ( x(i) - a(3,i) * x(i+1) ) / a(2,i);
  end

  return
end
