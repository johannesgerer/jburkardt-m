function nsub = subset_enum ( n )

%*****************************************************************************80
%
%% SUBSET_ENUM enumerates the subsets of a set with N elements.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements in the set.
%    N must be at least 0.
%
%    Output, integer NSUB, the number of distinct elements.
%
  nsub = 2^n;

  return
end
