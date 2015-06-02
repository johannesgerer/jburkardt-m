function z = polar_to_c8 ( r, theta )

%*****************************************************************************80
%
%% POLAR_TO_C8 converts a polar form to a C8.
%
%  Discussion:
%
%    A C8 is a complex value.
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
%    Input, real R, THETA, the polar form.
%
%    Output, complex Z, the complex number.
%
  z = r * ( cos ( theta ) + i * sin ( theta ) );

  return
end
