function ohd = init ( )

%*****************************************************************************80
%
%% INIT initializes the problem data.
%
%  Discussion:
%
%    The graph uses 6 nodes, and has the following diagram and
%    distance matrix:
%
%    N1--15--N3-100--N4           0   40   15  Inf  Inf  Inf
%      \      |     /            40    0   20   10   25    6
%       \     |    /             15   20    0  100  Inf  Inf
%        40  20  10             Inf   10  100    0  Inf  Inf
%          \  |  /              Inf   25  Inf  Inf    0    8
%           \ | /               Inf    6  Inf  Inf    8    0
%            N2
%            / \
%           /   \
%          6    25
%         /       \
%        /         \
%      N6----8-----N5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 July 2010
%
%  Author:
%
%    Original C version by Norm Matloff, CS Dept, UC Davis.
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Output, int OHD(NV,NV), the distance of the direct link between
%    nodes I and J.
%
  nv = 6;

  ohd(1:nv,1:nv) = Inf;
  for i = 1 : nv
    ohd(i,i) = 0;
  end

  ohd(1,2) = 40;
  ohd(2,1) = 40;
  ohd(1,3) = 15;
  ohd(3,1) = 15;
  ohd(2,3) = 20;
  ohd(3,2) = 20;
  ohd(2,4) = 10;
  ohd(4,2) = 10;
  ohd(2,5) = 25;
  ohd(5,2) = 25;
  ohd(3,4) = 100;
  ohd(4,3) = 100;
  ohd(2,6) = 6;
  ohd(6,2) = 6;
  ohd(5,6) = 8;
  ohd(6,5) = 8;

  return;
end
