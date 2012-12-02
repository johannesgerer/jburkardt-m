function x = frank_solution ( n, k )

%*****************************************************************************80
%
%% FRANK_SOLUTION returns the FRANK solution matrix.
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
%    Input, integer N, the row dimension.
%
%    Input, integer K, the column dimension ( should be 2).
%
%    Output, real X(N,K), the solution matrix.
%
  x(1:n-1,1) = 0.0;
  x(  n  ,1) = 1.0;

  x(1:n,2) = 1.0;

  return
end
