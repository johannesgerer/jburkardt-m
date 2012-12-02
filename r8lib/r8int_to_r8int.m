function r2 = r8int_to_r8int ( rmin, rmax, r, r2min, r2max )

%*****************************************************************************80
%
%% R8INT_TO_R8INT maps one R8 interval to another.
%
%  Formula:
%
%    R2 := R2MIN + ( R2MAX - R2MIN ) * ( R - RMIN ) / ( RMAX - RMIN )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real RMIN, RMAX, the first range.
%
%    Input, real R, the number to be converted.
%
%    Input, real R2MAX, R2MIN, the second range.
%
%    Output, real R2, the corresponding value in 
%    the range [R2MIN,R2MAX].
%
  if ( rmax == rmin )

    r2 = ( r2max + r2min ) / 2.0;

  else

    r2 = ( ( ( rmax - r        ) * r2min   ...
           + (        r - rmin ) * r2max ) ...
           / ( rmax     - rmin ) );

  end

  return
end
