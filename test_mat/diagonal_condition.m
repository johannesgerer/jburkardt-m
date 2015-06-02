function cond = diagonal_condition ( n, x )

%*****************************************************************************80
%
%% DIAGONAL_CONDITION returns the L1 condition of the DIAGONAL matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the diagonal entries of A.
%
%    Output, real COND, the L1 condition.
%
  cond = max ( abs ( x(1:n) ) ) / min ( abs ( x(1:n) ) );

  return
end
