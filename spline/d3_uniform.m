function [ a, seed ] = d3_uniform ( n, seed )

%*****************************************************************************80
%
%% D3_UNIFORM randomizes a D3 matrix.
%
%  Discussion:
%
%    The D3 storage format is used for a tridiagonal matrix.
%    The superdiagonal is stored in entries (1,2:N), the diagonal in
%    entries (2,1:N), and the subdiagonal in (3,1:N-1).  Thus, the
%    original matrix is "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a D3 matrix of order 5 would be stored:
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
%    Input, integer N, the order of the linear system.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(3,N), the D3 matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  a(1,1) = 0.0;
  [ a(1,2:n), seed ] = r8vec_uniform ( n-1, 0.0, 1.0, seed );

  [ a(2,1:n), seed ] = r8vec_uniform ( n,   0.0, 1.0, seed );

  [ a(3,1:n-1), seed ] = r8vec_uniform ( n-1, 0.0, 1.0, seed );
  a(3,n) = 0.0;

  return
end
