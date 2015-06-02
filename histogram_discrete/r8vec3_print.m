function r8vec3_print ( n, a1, a2, a3, title )

%*****************************************************************************80
%
%% R8VEC3_PRINT prints an R8VEC3.
%
%  Discussion:
%
%    An R8VEC3 is a dataset consisting of N triples of real values, stored
%    as separate vectors A1, A2, A3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components of the vector.
%
%    Input, real A1(N), A2(N), A3(N), the vectors to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %6d:   %12g  %12g  %12g\n', i, a1(i), a2(i), a3(i) );
  end

  return
end
