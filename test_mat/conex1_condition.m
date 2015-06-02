function value = conex1_condition ( alpha )

%*****************************************************************************80
%
%% CONEX1_CONDITION returns the L1 condition of the CONEX1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar defining A.  
%    A common value is 100.0.
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = max ( 3.0, 3.0 * abs ( alpha ) + abs ( 1.0 + alpha ) );
  v1 = abs ( 1.0 - alpha ) + abs ( 1.0 + alpha ) + 1.0;
  v2 = 2.0 * abs ( alpha ) + 1.0;
  v3 = 2.0 + 2.0 / abs ( alpha );
  b_norm = max ( v1, max ( v2, v3 ) );
  value = a_norm * b_norm;

  return
end
