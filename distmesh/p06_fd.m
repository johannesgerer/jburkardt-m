function d = p06_fd ( p )

%*****************************************************************************80
%
%% P06_FD is a signed distance function for problem 06.
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
  d = ddiff ( dexpr ( p, '(x^4+y^4)^(1/4)-1' ), ...
              dexpr ( p, '(x^4+y^4)^(1/4)-0.5' ) );

  return
end
