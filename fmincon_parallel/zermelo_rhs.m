function xdot = zermelo_rhs(t, x, u, PAR)

%*****************************************************************************80
%
%% ZERMELO_RHS evaluates Zermelo dynamics
%
%  Modified:
%
%    04 February 2010
%
%  Author:
%
%    Gene Cliff
%
  xdot = [ PAR.k*x(2) + cos(u(1));
                        sin(u(1))      ] ;

  return
end

