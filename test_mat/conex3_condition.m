function cond = conex3_condition ( n )

%*****************************************************************************80
%
%% CONEX3_CONDITION returns the L1 condition of the CONEX3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real COND, the L1 condition number.
%
  cond = n * 2.0 ^ ( n - 1 );

  return
end
