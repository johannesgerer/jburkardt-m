function r = i4int_to_r8int ( imin, imax, i, rmin, rmax )

%*****************************************************************************80
%
%% I4INT_TO_R8INT maps an integer interval to an R8 interval.
%
%  Formula:
%
%    R := RMIN + ( RMAX - RMIN ) * ( I - IMIN ) / ( IMAX - IMIN )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer IMIN, IMAX, the range.
%
%    Input, integer I, the integer to be converted.
%
%    Input, real RMIN, RMAX, the range.
%
%    Output, real R, the corresponding value in [RMIN,RMAX].
%
  if ( imax == imin )

    r = 0.5 * ( rmin + rmax );

  else

    r = (  ( imax - i        ) * rmin   ...
        +  (        i - imin ) * rmax ) ...
        /  ( imax     - imin );

  end

  return
end
