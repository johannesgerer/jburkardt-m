function b = dif2_rhs ( m, k )

%*****************************************************************************80
%
%% DIF2_RHS returns the DIF2 right hand side.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the row dimension.
%
%    Input, integer K, the column dimension ( should be 2).
%
%    Output, real B(M,K), the right hand side matrix.
%
  b(1    ,1) = 1.0;
  b(2:m-1,1) = 0.0;
  b(  m,  1) = 1.0;

  b(1:m-1,2) = 0.0;
  b(  m,  2) = m + 1;

  return
end
