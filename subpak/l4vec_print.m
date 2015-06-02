function l4vec_print ( n, a, title )

%*****************************************************************************80
%
%% L4VEC_PRINT prints an L4VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%
%    Input, logical A(N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : n
    value = ( a(i) ~= 0 );
    if ( a(i) == 0 )
      fprintf ( 1, '%6d: F\n', i );
    else
      fprintf ( 1, '%6d: T\n', i );
    end
  end

  return
end
