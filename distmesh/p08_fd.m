function d = p08_fd ( p )

%*****************************************************************************80
%
%% P08_FD is a signed distance function for problem 08.
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
  g1 = dcircle ( p, 0, 0, 1 );
  g2 = drectangle ( protate ( p, pi/12 ), -1, 1, 0, 1 );
  g3 = drectangle ( protate ( p, -pi/12 ), -1, 1, -1, 0 );
  g4 = drectangle ( protate ( pshift ( p, -0.9, 0 ), -pi/4 ), 0, 0.2, 0, 0.2 );
  g5 = dcircle ( p, 0.6, 0, 0.1 );

  d = ddiff ( ddiff ( ddiff ( ddiff ( g1, g2 ), g3 ), g4 ), g5 );

  return
end
