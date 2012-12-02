function value = perm_is_unicycle ( n, p )

%*****************************************************************************80
%
%% PERM_IS_UNICYCLE is TRUE if a permutation is a unicycle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects in the permutation.
%
%    Input, integer P(N), the permutation.
%
%    Output, logical VALUE, is TRUE if the permutation is a unicycle.
%
  value = 0;

  perm_check ( n, p );
%
%  From 1, you must be able to take N-1 steps without reaching 1...
%
  i = 1;
  for j = 1 : n - 1
    i = p(i);
    if ( i == 1 )
      return
    end
  end
%
%  ...and the N-th step must reach 1.
%
  i = p(i);
  if ( i == 1 )
    value = 1;
  end

  return
end
