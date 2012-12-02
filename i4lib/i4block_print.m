function i4block_print ( l, m, n, a, title )

%*****************************************************************************80
%
%% I4BLOCK_PRINT prints an I4BLOCK
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer L, M, N, the dimensions of the block.
%
%    Input, integer A(L,M,N), the matrix to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );

  for k = 1 : n

    fprintf ( 1, '\n' );
    fprintf ( 1, '  K = %d\n', k );

    for jlo = 1 : 10 : m
      jhi = min ( jlo + 10 - 1, m );
      fprintf ( 1, '\n' );
      fprintf ( 1, '        J:' );
      for j = jlo : jhi
        fprintf ( 1, '  %6d', j );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '\n' );
      for i = 1 : l
        fprintf ( 1, '  %6d: ', i );
        for j = jlo : jhi
          fprintf ( 1, '  %6d', a(i,j,k) );
        end
        fprintf ( 1, '\n' );
      end
    end

  end

  return
end
