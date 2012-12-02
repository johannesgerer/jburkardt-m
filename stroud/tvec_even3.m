function t = tvec_even3 ( nt )

%*****************************************************************************80
%
%% TVEC_EVEN3 computes an evenly spaced set of angles between 0 and 2*PI.
%
%  Discussion:
%
%    The angles begin with 0 and end with 2*PI.
%
%  Example:
%
%    NT = 4
%
%    T = ( 0, 2*PI/3, 4*PI/3 2*PI )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NT, the number of values to compute.
%
%    Output, real TVEC(NT), the evenly spaced angles, in radians.
%
  if ( nt == 1 )
    t(1) = pi;
  else
    t(1:nt) = ( 0:2:(2*nt-1) ) * pi / ( nt - 1 );
  end

  return
end
