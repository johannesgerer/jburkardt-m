function rd = r8_to_r8_discrete ( r, rmin, rmax, nr )

%*****************************************************************************80
%
%% R8_TO_R8_DISCRETE maps R to RD in [RMIN, RMAX] with NR possible values.
%
%  Discussion:
%
%    if ( R < RMIN ) then
%      RD = RMIN
%    else if ( RMAX < R ) then
%      RD = RMAX
%    else
%      T = nint ( ( NR - 1 ) * ( R - RMIN ) / ( RMAX - RMIN ) )
%      RD = RMIN + T * ( RMAX - RMIN ) / real ( NR - 1 )
%
%    In the special case where NR = 1, when
%
%      RD = 0.5 * ( RMAX + RMIN )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the number to be converted.
%
%    Input, real RMAX, RMIN, the maximum and minimum
%    values for RD.
%
%    Input, integer NR, the number of allowed values for XD.
%    NR should be at least 1.
%
%    Output, real RD, the corresponding discrete value.
%

%
%  Check for errors.
%
  if ( nr < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_TO_R8_DISCRETE - Fatal error!\n' );
    fprintf ( 1, '  NR = %d\n', nr );
    fprintf ( 1, '  but NR must be at least 1.\n' );
    error ( 'R8_TO_R8_DISCRETE - Fatal error!' );
  end

  if ( nr == 1 )
    rd = 0.5 * ( rmin + rmax );
    return
  end

  if ( rmax == rmin )
    rd = rmax;
    return
  end

  f = round ( nr * ( rmax - r ) / ( rmax - rmin ) );
  f = max ( f, 0 );
  f = min ( f, nr );

  rd = ( (      f ) * rmin   ...
       + ( nr - f ) * rmax ) ...
       / ( nr     );


  return
end
