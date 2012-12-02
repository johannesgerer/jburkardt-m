function d = p01_fd ( p )

%*****************************************************************************80
%
%% P01_FD is a signed distance function for problem 1.
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
  d = sqrt ( sum ( p.^2, 2 ) ) - 1.0;

  return
end
