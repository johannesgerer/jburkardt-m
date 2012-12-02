function d = p10_fd ( p )

%*****************************************************************************80
%
%% P10_FD is a signed distance function for problem 10.
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
  d = drectangle ( p, 0.0, 1.0, 0.0, 1.0 );

  return
end
