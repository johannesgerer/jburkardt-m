function b = frank_rhs ( m, k )

%*****************************************************************************80
%
%% FRANK_RHS returns the FRANK right hand side.
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
  b(1:m,1) = 1.0;

  b(1  ,2) = m * ( m + 1 ) / 2;
  for i = 2 : m
    b(i,2) = ( m + 1 - i ) * ( m + 4 - i ) / 2;
  end

  return
end
