function i4vec2_print ( n, a, b, title )

%*****************************************************************************80
%
%% I4VEC2_PRINT prints an I4VEC2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components of the vector.
%
%    Input, integer A(N), B(N), the vectors to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d: %8d  %8d\n', i, a(i), b(i) );
  end

  return
end
