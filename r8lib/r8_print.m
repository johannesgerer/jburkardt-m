function r8_print ( r, title )

%*****************************************************************************80
%
%% R8_PRINT prints an R8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2014.
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the value.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '%s  %g\n', title, r );

  return
end

