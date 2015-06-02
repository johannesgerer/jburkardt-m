function value = conex2_condition ( alpha )

%*****************************************************************************80
%
%% CONEX2_CONDITION returns the L1 condition of the CONEX1 matrix.
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
  c1 = 1.0;
  c2 = abs ( 1.0 - 1.0 / alpha^2 ) + 1.0 / abs ( alpha );
  c3 = 3.0 + 1.0 / abs ( alpha );
  a_norm = max ( c1, max ( c2, c3 ) );
  c1 = 1.0;
  c2 = abs ( ( 1.0 - alpha * alpha ) / alpha ) + abs ( alpha );
  c3 = abs ( ( 1.0 + alpha * alpha ) / alpha ^ 2 ) + 2.0;
  b_norm = max ( c1, max ( c2, c3 ) );
  value = a_norm * b_norm;

  return
end
