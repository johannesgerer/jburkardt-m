function c8_print ( a, title )

%*****************************************************************************80
%
%% C8_PRINT prints a C8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex A, the value to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '%s  ( %14f, %14f )\n', title, real ( a ), imag ( a ) );

  return
end
