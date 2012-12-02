function x = cheby_diff1_null ( n )

%*****************************************************************************80
%
%% CHEBY_DIFF1_NULL returns a null vector of the CHEBY_DIFF1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real X(N), the null vector.
%
  x(1:n) = 1.0;

  return
end
