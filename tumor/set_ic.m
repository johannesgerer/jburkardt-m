function [ cold, etaold, fold, vold ] = set_ic ( np, indx, xc, m, czero, ...
  etazero, fzero, vzero )

%*****************************************************************************80
%
%% SET_IC sets the initial conditions for the problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2005
%
%  Parameters:
%
%    Input, integer NP, the number of nodes.
%
%    Input, integer INDX(NP); if positive, indicates, for each node,
%    the index of the associated finite element coefficient.  Otherwise, 
%    it indicates that a boundary condition is being imposed.
%
%    Input, real XC(NP), the coordinates of each node.
%
%    Input, real CZERO, the initial condition for C.
%
%    Input, real ETAZERO, the initial condition for ETA.
%
%    Input, real FZERO, the initial condition for F.
%
  for ip = 1 : np

    i = indx(ip);

    if ( 0 < i ) then
      x = xc(ip);
      vold(i) = vzero * kappa *  ( 1.0 - cos ( 2.0 * pi * x ) )^m ;
      cold(i) = czero;
      fold(i) = fzero;
      etaold(i) = etazero;
    end if

  end

  return
end
