function r8r8_print ( a1, a2, title )

%*****************************************************************************80
%
%% R8R8_PRINT prints an R8R8.
%
%  Discussion:
%
%    An R8R8 is simply a pair of R8's, thought of as a single item.
%
%    A format is used which suggests a coordinate pair:
%
%  Example:
%
%    Center : ( 1.23, 7.45 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A1, A2, the coordinates of the vector.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '  %s : ( %12g, %12g )\n', title, a1, a2 );

  return
end
