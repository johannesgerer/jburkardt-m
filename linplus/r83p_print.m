function r83p_print ( n, a, title )

%*****************************************************************************80
%
%% R83P_PRINT prints a R83P matrix.
%
%  Discussion:
%
%    The R83P storage format stores a periodic tridiagonal matrix as 
%    a 3 by N array, in which each row corresponds to a diagonal, and 
%    column locations are preserved.  The matrix value 
%    A(1,N) is stored as the array entry A(3,N), and the matrix value
%    A(N,1) is stored as the array entry A(1,1).
%
%  Example:
%
%    Here is how a R83P matrix of order 5 would be stored:
%
%      A51 A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54 A15
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A(3,N), the R83P matrix.
%
%    Input, string TITLE, a title.
%
  r83p_print_some ( n, a, 1, 1, n, n, title );

  return
end
