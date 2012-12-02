function x = dif2_solution ( n, k )

%*****************************************************************************80
%
%% DIF2_SOLUTION returns the DIF2 solution matrix.
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
  x(1:n,  1) = 1.0;

  for i = 1 : n
    x(i,2) = i;
  end

  return
end
