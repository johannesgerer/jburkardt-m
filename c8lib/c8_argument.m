function value = c8_argument ( x )

%*****************************************************************************80
%
%% C8_ARGUMENT returns the argument of a C8.
%
%  Discussion:
%
%    A C8 is a complex double precision value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex X, the value whose argument is desired.
%
%    Output, real C8_ARGUMENT, the argument of X.
%
  if ( imag ( x ) == 0.0 & real ( x ) == 0.0  )

    value = 0.0;

  else

    value = atan2 ( imag ( x ), real ( x ) );

  end

  return
end
