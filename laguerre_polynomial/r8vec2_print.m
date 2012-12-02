function r8vec2_print ( n, a1, a2, title )

%*****************************************************************************80
%
%% R8VEC2_PRINT prints an R8VEC2.
%
%  Discussion:
%
%    An R8VEC2 is a dataset consisting of N pairs of real values, stored
%    as two separate vectors A1 and A2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components of the vector.
%
%    Input, real A1(N), A2(N), the vectors to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %6d:   %12g  %12g\n', i, a1(i), a2(i) );
  end

  return
end
