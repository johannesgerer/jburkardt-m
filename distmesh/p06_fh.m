function h = p06_fh ( p )

%*****************************************************************************80
%
%% P06_FH is the mesh density function for problem 06.
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
  h = dexpr ( p, '(x^4+y^4)^(1/4)' );

  return
end
