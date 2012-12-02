function r8vec_print ( n, a, title )

%*****************************************************************************80
%
%% R8VEC_PRINT prints a real vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, real A(N), the vector to be printed.
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
    fprintf ( 1, '%6d  %12f\n', i, a(i) );
  end

  return
end
