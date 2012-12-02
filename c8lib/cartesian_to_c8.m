function z = cartesian_to_c8 ( x, y )

%*****************************************************************************80
%
%% CARTESIAN_TO_C8 converts a Cartesian form to a C8.
%
%  Discussion:
%
%    A C8 is a complex ( kind = 8 ) value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the Cartesian form.
%
%    Output, complex Z, the complex number.
%
  z = x + i * y;

  return
end
