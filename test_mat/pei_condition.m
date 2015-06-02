function value = pei_condition ( alpha, n )

%*****************************************************************************80
%
%% PEI_CONDITION returns the L1 condition of the PEI matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines the Pei matrix.  A
%    typical value of ALPHA is 1.0.
%
%    Input, integer N, the order of A.
%
%    Output, real VALUE, the L1 condition.
%
  a_norm = abs ( alpha + 1.0 ) + n - 1;
  b_norm = ( abs ( alpha + n - 1.0 ) + n - 1.0 ) ...
    / abs ( alpha * ( alpha + n ) );
  value = a_norm * b_norm;

  return
end
