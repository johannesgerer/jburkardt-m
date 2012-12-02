function ix = r8_to_i4 ( x, xmin, xmax, ixmin, ixmax )

%*****************************************************************************80
%
%% R8_TO_I4 maps X in [XMIN, XMAX] to integer IX in [IXMIN, IXMAX].
%
%  Discussion:
%
%    IX := IXMIN + ( IXMAX - IXMIN ) * ( X - XMIN ) / ( XMAX - XMIN )
%    IX := min ( IX, max ( IXMIN, IXMAX ) )
%    IX := max ( IX, min ( IXMIN, IXMAX ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the number to be converted.
%
%    Input, real XMIN, XMAX, the range.  XMAX and
%    XMIN must not be equal.  It is not necessary that XMIN be less than XMAX.
%
%    Input, integer IXMIN, IXMAX, the allowed range of the output
%    variable.  IXMAX corresponds to XMAX, and IXMIN to XMIN.
%    It is not necessary that IXMIN be less than IXMAX.
%
%    Output, integer IX, the value in the range [IXMIN,IXMAX] that
%    corresponds to X.
%
  if ( xmax == xmin )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_TO_I4 - Fatal error!\n' );
    fprintf ( 1, '  XMAX = XMIN, making a zero divisor.\n' );
    fprintf ( 1, '  XMAX = %f\n', xmax );
    fprintf ( 1, '  XMIN = %f\n', xmin );
    error ( 'R8_TO_I4 - Fatal error!' );
  end

  temp = ( ( xmax - x        ) * ixmin   ...
         + (        x - xmin ) * ixmax ) ...
         / ( xmax     - xmin );

  if ( 0.0 <= temp )
    temp = temp + 0.5;
  else
    temp = temp - 0.5;
  end

  ix = floor ( temp );

  return
end
