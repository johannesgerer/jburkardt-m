function cond = conex4_condition ( )

%*****************************************************************************80
%
%% CONEX4_CONDITION returns the L1 condition of the CONEX4 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real COND, the L1 condition number.
%
  a_norm = 33.0;
  b_norm = 136.0;
  cond = a_norm * b_norm;

  return
end
