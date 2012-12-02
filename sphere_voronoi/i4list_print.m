function i4list_print ( n, first, list_num, list, title )

%*****************************************************************************80
%
%% I4LIST_PRINT prints an I4LIST.
%
%  Discussion:
%
%    An I4LIST is a list of integers grouped into N segments.
%    An index vector locates the first entry of each segment.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of segments.
%
%    Input, integer FIRST(N+1), indexes the first entry
%    of each segment.
%
%    Input, integer LIST_NUM, the number of entries.
%
%    Input, integer LIST(LIST_NUM), the data.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : n

    for jlo = first(i) : 5 : first(i+1) - 1
      jhi = min ( jlo + 4, first(i+1) - 1 );
      if ( jlo == first(i) )
        fprintf ( 1, '%5d:', i );
      else
        fprintf ( 1, '      ' );
      end
      for j = jlo : jhi
        fprintf ( 1, '  %8d', list(j) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
