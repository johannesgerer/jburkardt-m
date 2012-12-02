function r8block_print ( l, m, n, a, title )

%*****************************************************************************80
%
%% R8BLOCK_PRINT prints an R8BLOCK
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer L, M, N, the dimensions of the block.
%
%    Input, real A(L,M,N), the matrix to be printed.
%
%    Input, string TITLE, a title to be printed first.
%    TITLE may be blank.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for k = 1 : n

    fprintf ( 1, '\n' );
    fprintf ( 1, '  K = %d\n', k );
    fprintf ( 1, '\n' );

    for jlo = 1 : 5 : m
      jhi = min ( jlo + 4, m );
      fprintf ( 1, '\n' );
      fprintf ( 1, '      ' );
      for j = jlo : jhi
        fprintf ( 1, '       %7d', j );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '\n' );
      for i = 1 : l
        fprintf ( 1, '%6d', i );
        for j = jlo : jhi
          fprintf ( 1, '  %12f', a(i,j,k) );
        end
        fprintf ( 1, '\n' );
      end
    end

  end

  return
end
