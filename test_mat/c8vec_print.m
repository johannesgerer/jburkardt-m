function c8vec_print ( n, a, title )

%*****************************************************************************80
%
%% C8VEC_PRINT prints a C8VEC, with an optional title.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components of the vector.
%
%    Input, complex A(N), the vector to be printed.
%
%    Input, string TITLE, a title to be printed first.
%    TITLE may be blank.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %s\n', i, num2str ( a(i) ) );
  end

  return
end
