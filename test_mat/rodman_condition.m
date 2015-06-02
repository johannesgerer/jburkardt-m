function value = rodman_condition ( n, alpha )

%*****************************************************************************80
%
%% RODMAN_CONDITION returns the L1 condition of the RODMAN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, the parameter.
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 1.0 + ( n - 1 ) * abs ( alpha );
  top = abs ( 1.0 + alpha * ( n - 2 ) ) + ( n - 1 ) * abs ( alpha );
  bot = abs ( 1.0 + alpha * ( n - 2 ) - alpha * alpha * ( n - 1 ) );
  b_norm = top / bot;

  value = a_norm * b_norm;

  return
end
