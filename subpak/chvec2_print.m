function chvec2_print ( m, a, n, b, title )

%*****************************************************************************80
%
%% CHVEC2_PRINT prints two vectors of characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the length of the first sequence.
%
%    Input, string A(M), the first sequence.
%
%    Input, integer N, the length of the second sequence.
%
%    Input, string B(N), the second sequence.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : max ( m, n )

    fprintf ( 1, '  %3d:', i );

    if ( i <= m )
      fprintf ( 1, '  %c', a(i) );
    else
      fprintf ( 1, '   ' );
    end if

    if ( i <= n )
      fprintf ( 1, '  %c\n', b(i) );
    else
      fprintf ( 1, '   \n' );
    end

  end 

  return
end
