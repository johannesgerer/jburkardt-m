function value = gfpp_condition ( n, alpha )

%*****************************************************************************80
%
%% GFPP_CONDITION returns the L1 condition of the GFPP matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, determines subdiagonal elements.
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 1.0 + ( n - 1 ) * abs ( alpha );
  b_norm = 1.0;
  value = a_norm * b_norm;

  return
end
