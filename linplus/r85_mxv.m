function b = r85_mxv ( n, a, x )

%*****************************************************************************80
%
%% R85_MXV multiplies a R85 matrix times a vector.
%
%  Discussion:
%
%    The R85 storage format represents a pentadiagonal matrix as a 5 
%    by N array, in which each row corresponds to a diagonal, and 
%    column locations are preserved.  Thus, the original matrix is 
%    "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a R85 matrix of order 6 would be stored:
%
%       *   *  A13 A24 A35 A46
%       *  A12 A23 A34 A45 A56
%      A11 A22 A33 A44 A55 A66
%      A21 A32 A43 A54 A65  *
%      A31 A42 A53 A64  *   *
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the linear system.
%
%    Input, real A(5,N), the R85 matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * x.
%
  b(1:n)   =            a(3,1:n)   .* x(1:n);

  b(3:n)   = b(3:n)   + a(1,3:n)   .* x(1:n-2);
  b(2:n)   = b(2:n)   + a(2,2:n)   .* x(1:n-1);
  b(1:n-1) = b(1:n-1) + a(4,1:n-1) .* x(2:n);
  b(1:n-2) = b(1:n-2) + a(5,1:n-2) .* x(3:n);

  return
end

