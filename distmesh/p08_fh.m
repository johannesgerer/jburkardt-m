function h = p08_fh ( p )

%*****************************************************************************80
%
%% P08_FH is the mesh density function for problem 08.
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
%    Input, real P(N,1:2), one or more points.
%
%    Output, real H, the value of the mesh density function at P.
%
  h1 = 0.005 + 0.2 * sqrt ( sum ( p .^ 2, 2 ) );
  h2 = 0.02 + 0.2 * ( sqrt ( ( p(:,1) - 0.6 ) .^ 2 + p(:,2) .^ 2 ) - 0.1 );
  h3 = 0.005 + 0.2 * sqrt ( ( p(:,1) - 0.9) .^ 2 + p(:,2) .^ 2 );
  h = min ( min ( min ( h1, h2 ), h3 ), 0.03 );

  return
end
