function det = r83p_det ( n, a_lu, work4 )

%*****************************************************************************80
%
%% R83P_DET computes the determinant of a matrix factored by R83P_FA.
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
%    25 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be at least 3.
%
%    Input, real A_LU(3,N), the LU factors from R83P_FA.
%
%    Input, real WORK4, factorization information from R83P_FA.
%
%    Output, real DET, the determinant of the matrix.
%
  det = prod ( a_lu(2,1:n-1) ) * work4;

  return
end
