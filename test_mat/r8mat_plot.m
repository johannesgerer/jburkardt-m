function r8mat_plot ( m, n, a, title )

%*****************************************************************************80
%
%% R8MAT_PLOT "plots" an R8MAT, with an optional title.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the matrix.
%
%    Input, character TITLE(*), a title to be printed.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for jlo = 1 : 70 : n

    jhi = min ( jlo + 70-1, n );
    fprintf ( 1, '\n' );
    fprintf ( 1, '          ' );
    for j = jlo : jhi
      fprintf ( 1, '%d', mod ( j, 10 ) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    for i = 1 : m
      fprintf ( 1, '%6d    ', i );
      for j = jlo : jhi
        fprintf ( 1, '%c', r8mat_plot_symbol ( a(i,j) ) );
      end
      fprintf ( 1, '\n' );
    end
  end

  return
end
