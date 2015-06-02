function r8vec_transpose_print ( n, a, title )

%*****************************************************************************80
%
%% R8VEC_TRANSPOSE_PRINT prints an R8VEC "transposed".
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%  Example:
%
%    A = (/ 1.0, 2.1, 3.2, 4.3, 5.4, 6.5, 7.6, 8.7, 9.8, 10.9, 11.0 /)
%    TITLE = 'My vector:  '
%
%    My vector:
%
%        1.0    2.1    3.2    4.3    5.4
%        6.5    7.6    8.7    9.8   10.9
%       11.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components of the vector.
%
%    Input, real A(N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  for ilo = 1 : 5 : n
    ihi = min ( ilo + 5 - 1, n );
    for i = ilo : ihi
      fprintf ( 1, '  %12g', a(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
