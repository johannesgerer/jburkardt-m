function perm_print ( n, p, title )

%*****************************************************************************80
%
%% PERM_PRINT prints a permutation.
%
%  Example:
%
%    Input:
%
%      P = 7 2 4 1 5 3 6
%
%    Printed output:
%
%      1 2 3 4 5 6 7
%      7 2 4 1 5 3 6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the integer which is to be partitioned.
%
%    Input, integer P(N), the permutation to be converted.
%
%    Input, string TITLE, a title.
%
  inc = 20;

  fprintf ( 1, '\n');
  fprintf ( 1, '%s\n', title );

  for ilo = 1 : inc : n
    ihi = min ( n, ilo + inc - 1 );
    fprintf ( 1, '\n');
    for i = ilo : ihi
      fprintf ( 1, '%4d', i )
    end
    fprintf ( 1, '\n' );
    for i = ilo : ihi
      fprintf ( 1, '%4d', p(i) )
    end
    fprintf ( 1, '\n' );
  end

  return
end
