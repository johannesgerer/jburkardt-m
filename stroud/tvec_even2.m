function t = tvec_even2 ( nt )

%*****************************************************************************80
%
%% TVEC_EVEN2 computes an evenly spaced set of angles between 0 and 2*PI.
%
%  Discussion:
%
%    The computation realizes that 0 = 2 * PI.  The values are equally
%    spaced in the circle, do not include 0, and are symmetric about 0.
%
%  Example:
%
%    NT = 4
%
%    T = ( PI/4, 3*PI/4, 5*PI/4, 7*PI/4 )
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
  t(1:nt) = ( 1:2:(2*nt-1) ) * pi / nt;

  return
end
