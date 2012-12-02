function perm_inv = perm_inverse3 ( n, perm )

%*****************************************************************************80
%
%% PERM_INVERSE3 produces the inverse of a given permutation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items permuted.
%
%    Input, integer PERM(N), a permutation.
%
%    Output, integer PERM_INV(N), the inverse permutation.
%
  perm_inv(perm(1:n)) = ( 1 : n );

  return
end
