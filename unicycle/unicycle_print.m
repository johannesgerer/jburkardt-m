function unicycle_print ( n, u, title )

%*****************************************************************************80
%
%% UNICYCLE_PRINT prints a unicycle given in sequence form.
%
%  Example:
%
%    Input:
%
%      U = 7 1 4 5 2 3 6
%
%    Printed output:
%
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
%    Input, integer U(N), the unicycle sequence vector.
%
%    Input, string TITLE, a title.
%
  inc = 20;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
    fprintf ( 1, '\n' );
  end

  for ilo = 1 : inc : n
    ihi = min ( n, ilo + inc - 1 );
    for i = ilo : ihi
      fprintf ( 1, '  %4d', u(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
