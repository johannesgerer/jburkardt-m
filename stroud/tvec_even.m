function t = tvec_even ( nt )

%*****************************************************************************80
%
%% TVEC_EVEN computes an evenly spaced set of angles between 0 and 2*PI.
%
%  Discussion:
%
%    The computation realizes that 0 = 2 * PI, and does not include that value.
%
%  Example:
%
%    NT = 4
%
%    T = ( 0, PI/2, PI, 3*PI/2 )
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
  t(1:nt) = 2 * (0:(nt-1)) * pi / nt;

  return
end
