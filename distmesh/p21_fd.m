function d = p21_fd ( p )

%*****************************************************************************80
%
%% P21_FD is a signed distance function for problem 21.
%
%  Modified:
%
%    06 February 2006
%
%  Parameters:
%
%    Input, real P, one or more points.
%
%    Output, real D, the signed distance of each point to the boundary of the region.
%
  d1 = drectangle ( p, 0, 3.0, 0.0, 3.0 );
  d2 = dcircle ( p, 3.0, 0.0, 1.5 );
  d3 = 3-p(:,1);
  d4 = p(:,2);

  d  = max ( d1, -d2 );
  d  = max ( d, -d3 );
  d  = max ( d, -d4 );

  return
end
