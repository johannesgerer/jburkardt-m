function value = ill3_condition ( )

%*****************************************************************************80
%
%% ILL3_CONDITION returns the L1 condition of the ILL3 matrix.
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
%  Reference:
%
%    Joan Westlake,
%    A Handbook of Numerical Matrix Inversion and Solution of Linear Equations,
%    John Wiley, 1968.
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = 725.0;
  b_norm = 299.0;
  value = a_norm * b_norm;

  return
end
