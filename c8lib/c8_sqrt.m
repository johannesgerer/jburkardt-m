function value = c8_sqrt ( c )

%*****************************************************************************80
%
%% C8_SQRT returns the principal square root of a C8.
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
%    15 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex double precision C, the number whose square root is desired.
%
%    Output, complex double precision VALUE, the square root of X.
%
  argument = c8_arg ( c );
  magnitude = c8_mag ( c );

  if ( magnitude == 0.0 )

    value = 0.0;

  else

    value = sqrt ( magnitude ) ...
      * ( cos ( argument / 2.0 ) + i * sin ( argument / 2.0 ) );

  end

  return
end
