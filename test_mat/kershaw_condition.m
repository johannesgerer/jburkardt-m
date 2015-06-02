function value = kershaw_condition ( )

%*****************************************************************************80
%
%% KERSHAW_CONDITION returns the L1 condition of the KERSHAW matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, the L1 condition of the matrix.
%
  a_norm = 7.0;
  b_norm = 7.0;
  value = a_norm * b_norm;

  return
end
