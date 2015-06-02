function r8vec_print_16 ( n, a, title )

%*****************************************************************************80
%
%% R8VEC_PRINT_16 prints an R8VEC to 16 decimal places.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 May 2014
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
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%6d: %24.16g\n', i, a(i) );
  end

  return
end
