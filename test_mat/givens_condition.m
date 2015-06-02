function value = givens_condition ( n )

%*****************************************************************************80
%
%% GIVENS_CONDITION returns the L1 condition of the GIVENS matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = n * n;

  if ( n == 1 )
    b_norm = 1.0;
  else
    b_norm = 2.0;
  end

  value = a_norm * b_norm;

  return
end
