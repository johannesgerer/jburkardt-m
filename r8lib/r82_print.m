function r82_print ( a, title )

%*****************************************************************************80
%
%% R82_PRINT prints an R82.
%
%  Discussion:
%
%    An R82 is a vector of two R8 values.
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
%    10 September 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(2), the coordinates of the vector.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '  %s : ( %12g, %12g )\n', title, a(1:2) );

  return
end
