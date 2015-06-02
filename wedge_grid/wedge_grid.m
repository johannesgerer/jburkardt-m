function g = wedge_grid ( n, ng )  

%*****************************************************************************80
%
%% WEDGE_GRID computes grid points in the unit wedge in 3D.
%
%  Discussion:
%
%    The interior of the unit wedge in 3D is defined by the constraints:
%      0 <= X
%      0 <= Y
%           X + Y <= 1
%     -1 <= Z <= +1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%    0 <= N.
%
%    Input, integer NG, the number of grid points.
%    This can be computed by WEDGE_GRID_SIZE, or else determined by
%    NG =(N+1)*((N+1)*(N+2))/2.
%
%    Output, real G(3,NG), the coordinates
%    of the grid points.
%
  g = zeros ( 3, ng );

  if ( n == 0 )
    g(1,1) = 0.5;
    g(2,1) = 0.5;
    g(3,1) = 0.0;
    return
  end

  p = 0;

  for k = 0 : n
    kr = ( 2 * k - n ) / n;
    for j = 0 : n
      jr = j / n;
      for i = 0 : n - j
        ir = i / n;
        p = p + 1;
        g(1,p) = ir;
        g(2,p) = jr;
        g(3,p) = kr;
      end
    end
  end

  return
end
