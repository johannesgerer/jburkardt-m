function d = p09_fd ( p )

%*****************************************************************************80
%
%% P09_FD is a signed distance function for problem 9.
%
%  Discussion:
%
%    Notice that the V1 and V2 arrays, which define hexagons, contain SEVEN
%    points, not six.  This is necessary in order for DPOLY to carry out its
%    calculations correctly.
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
  v1 = [ 0.15, 0.75;
         0.20, 0.6634;
         0.30, 0.6634;
         0.35, 0.75;
         0.30, 0.8366;
         0.20, 0.8366;
         0.15, 0.75 ];

  d1 = dpoly ( p, v1 );

  v2 = [ 0.50, 0.40;
         0.55, 0.3134;
         0.65, 0.3134;
         0.70, 0.40;
         0.65, 0.4866;
         0.55, 0.4866;
         0.50, 0.40 ];

  d2 = dpoly ( p, v2 );

  d3 = dunion ( d1, d2 );

  d4 = drectangle ( p, 0.0, 1.0, 0.0, 1.0 );

  d = ddiff ( d4, d3 );

  return
end


