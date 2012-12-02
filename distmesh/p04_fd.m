function d = p04_fd ( p )

%*****************************************************************************80
%
%% P04_FD is a signed distance function for problem 4.
%
%  Discussion:
%
%    Notice that the OUTER and INNER arrays, which define the two hexagons,
%    each contain 7 vertices, not 6.  This is necessary in order for the
%    DPOLY routine to work properly.
%
%  Licensing:
%
%    (C) 2004 Per-Olof Persson. 
%    See COPYRIGHT.TXT for details.
%
%  Modified:
%
%    11 March 2006
%
%  Parameters:
%
%    Input, real P, one or more points.
%
%    Output, real D, the signed distance of each point to the boundary of the region.
%
  n = 6;

  phi = 2 * pi * (0:2:2*n)' / ( 2 * n );
  outer = [ cos(phi), sin(phi) ];

  phi = 2 * pi * (1:2:2*n+1)' / ( 2 * n );
  inner = 0.5 * [ cos(phi), sin(phi) ];

  d1 = dpoly ( p, outer );
  d2 = dpoly ( p, inner );
  d = ddiff ( d1, d2 );

  return
end
