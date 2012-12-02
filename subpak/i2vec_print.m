function i2vec_print ( n, a, title )

%*****************************************************************************80
%
%% I2VEC_PRINT prints an I2VEC.
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
%    Input, integer N, the number of components of the vector.
%
%    Input, integer A(2,N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %6d: %10d  %10d\n', i, a(1:2,i) );
  end

  return
end
