function [ w, r, t ] = disk_rule ( nr, nt )

%*****************************************************************************80
%
%% DISK_RULE computes a quadrature rule for the unit disk.
%
%  Discussion:
%
%    The unit disk is the region:
%
%      x * x + y * y <= 1.
%
%    The integral I(f) is then approximated by
%
%      Q(f) = pi * sum ( 1 <= j <= NT ) sum ( 1 <= i <= NR ) 
%        W(i) * F ( R(i) * cos(T(j)), R(i) * sin(T(j)) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NR, the number of points in the radial rule.
%
%    Input, integer NT, the number of angles to use.
%
%    Output, real W(NR), the weights for the disk rule.
%
%    Output, real R(NR), T(NT), the (R,Theta) points for the rule.
%

%
%  Request a Legendre rule for [-1,+1].
%
  [ xr, wr ] = legendre_ek_compute ( nr );
%
%  Shift the rule to [0,1].
%
  xr(1:nr) = ( xr(1:nr) + 1.0 ) / 2.0;
  wr(1:nr) = wr(1:nr) / 2.0;
%
%  Compute the disk rule.
%
  for it = 1 : nt
    t(it) = 2.0 * pi * ( it - 1 ) / nt;
  end

  w(1:nr) = wr(1:nr) / nt;
  r(1:nr) = sqrt ( xr(1:nr) );

  return
end
