function value = c8_arg ( x )

%*****************************************************************************80
%
%% C8_ARG returns the argument of a C8.
%
%  Discussion:
%
%    A C8 is a complex double precision value.
%
%    The value returned by this function will always lie between 0 and 2*PI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex X, the value whose argument is desired.
%
%    Output, real C8_ARG, the argument of X.
%
  if ( imag ( x ) == 0.0 & real ( x ) == 0.0  )

    value = 0.0;

  else

    value = r8_atan ( imag ( x ), real ( x ) );

  end

  return
end
