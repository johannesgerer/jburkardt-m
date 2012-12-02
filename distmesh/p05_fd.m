function d = p05_fd ( p )

%*****************************************************************************80
%
%% P05_FD is a signed distance function for problem 05.
%
%  Licensing:
%
%    (C) 2004 Per-Olof Persson. 
%    See COPYRIGHT.TXT for details.
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
  d1 = dcircle ( p, 0, 0, 1 );
  d2 = dcircle ( p, -0.4, 0, 0.55 );
  d = dintersect ( -p(:,2), ddiff ( d1, d2 ) );

  return
end
