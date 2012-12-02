function i = r8int_to_i4int ( rmin, rmax, r, imin, imax )

%*****************************************************************************80
%
%% R8INT_TO_I4INT maps an R8 interval to an I4 interval.
%
%  Formula:
%
%    I := IMIN + ( IMAX - IMIN ) * ( R - RMIN ) / ( RMAX - RMIN )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real RMIN, RMAX, the range.
%
%    Input, real R, the number to be converted.
%
%    Input, integer IMAX, IMIN, the integer range.
%
%    Output, integer I, the corresponding value in the range [IMIN,IMAX].
%
  if ( rmax == rmin )

    i = floor ( ( imax + imin ) / 2 );

  else

    i = round ( ...
      ( ( rmax - r        ) * imin   ...
      + (        r - rmin ) * imax ) ...
      / ( rmax     - rmin ) );

  end

  return
end
