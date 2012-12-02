function value = c8_cube_root ( x )

%*****************************************************************************80
%
%% C8_CUBE_ROOT returns the principal cube root of a C8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex X, the number whose cube root is desired.
%
%    Output, complex VALUE, the cube root of X.
%
  a = real ( x );
  b = imag ( x );
  mag = sqrt ( a * a + b * b );

  if ( mag == 0.0 )

    value = 0.0;

  else

    theta = atan2 ( b, a );

    value = mag.^( 1 / 3 ) * ( cos ( theta / 3 ) + i * sin ( theta / 3 ) );

  end

  return
end
