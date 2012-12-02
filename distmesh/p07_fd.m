function d = p07_fd ( p )

%*****************************************************************************80
%
%% P07_FD is a signed distance function for problem 07.
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
  d1 = dexpr ( p, 'y-cos(x)' );
  d2 = dexpr ( p, '-(y-(-5+5/(5/4*2*pi)^4*x^4))' );
  d = dintersect ( d1, d2 );

  return
end
