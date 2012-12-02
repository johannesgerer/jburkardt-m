function h = p05_fh ( p )

%*****************************************************************************80
%
%% P05_FH is the mesh density function for problem 05.
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
%    Output, real H, the value of the mesh density function at P.
%
  d1 = dcircle ( p,  0.0, 0.0, 1.0 );
  d2 = dcircle ( p, -0.4, 0.0, 0.55 ) ;

  h1 = ( 0.15 - 0.2 * d1 );
  h2 = ( 0.06 + 0.2 * d2 );
  h3 = ( d2 - d1 ) / 3;

  h = min ( min ( h1, h2 ), h3 );

  return
end

