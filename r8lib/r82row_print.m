function r82row_print ( n, a, title )

%*****************************************************************************80
%
%% R82ROW_PRINT prints a R82ROW.
%
%  Discussion:
%
%    An R82ROW is a (2,N) array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components of the vector.
%
%    Input, real A(2,N), the vector to be printed.
%
%    Input, string TITLE, a title.
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for j = 1 : n
    fprintf ( 1, '  %6d: %12g  %12g\n', j, a(1:dim_num,j) );
  end

  return
end
