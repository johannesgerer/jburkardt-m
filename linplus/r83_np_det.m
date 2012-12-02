function det = r83_np_det ( n, a )

%*****************************************************************************80
%
%% R83_NP_DET returns the determinant of a R83 system factored by R83_NP_FA.
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
%    30 January 2004
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
%    Input, real A(3,N), the tridiagonal factor information computed
%    by R83_NP_FA.
%
%    Output, real DET, the determinant of the matrix.
%
  det = prod ( a(2,1:n) );

  return
end
