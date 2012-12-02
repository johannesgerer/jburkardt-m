function nperm = perm_enum ( n )

%*****************************************************************************80
%
%% PERM_ENUM enumerates the permutations on N digits.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values being permuted.
%    N must be nonnegative.
%
%    Output, integer NPERM, the number of distinct elements.
%
  nperm = i4_factorial ( n );

  return
end
