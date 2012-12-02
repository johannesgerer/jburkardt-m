function unicycle_index_print ( n, u_index, title )

%*****************************************************************************80
%
%% UNICYCLE_INDEX_PRINT prints a unicycle given in index form.
%
%  Example:
%
%    Input:
%
%      U_INDEX = 7 1 4 5 2 3 6
%
%    Printed output:
%
%      1 2 3 4 5 6 7
%      7 1 4 5 2 3 6
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
%    Input, integer N, the order of the unicycle.
%
%    Input, integer U_INDEX(N), the unicycle index vector.
%
%    Input, string TITLE, a title.
%
  inc = 20;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for ilo = 1 : inc : n
    ihi = min ( n, ilo + inc - 1 );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ' );
    for i = ilo : ihi
      fprintf ( 1, '%4d', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ' );
    for i = ilo : ihi
      fprintf ( 1, '%4d', u_index(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
