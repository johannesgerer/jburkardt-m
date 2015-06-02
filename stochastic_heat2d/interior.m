function [ A, rhs ] = interior ( omega, nx, ny, x, y, f, A, rhs )

%*****************************************************************************80
%
%% INTERIOR sets up the matrix and right hand side at interior nodes.
%
%  Discussion:
%
%    Nodes are assigned a single index K, which increases as:
%
%    (NY-1)*NX+1  (NY-1)*NX+2  ...  NY * NX
%           ....         ....  ...    .....
%           NX+1         NX+2  ...   2 * NX
%              1            2  ...       NX
%
%    Therefore, the neighbors of an interior node numbered C are
%
%             C+NY
%              |
%      C-1 --- C --- C+1
%              |
%             C-NY
%
%    If we number rows from bottom I = 1 to top I = NY
%    and columns from left J = 1 to right J = NX, then the relationship
%    between the single index K and the row and column indices I and J is:
%      K = ( I - 1 ) * NX + J
%    and
%      J = 1 + mod ( K - 1, NX )
%      I = 1 + ( K - J ) / NX
%      
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real OMEGA(4), the stochastic parameters.
%
%    Input, integer NX, NY, the number of grid points in X and Y.
%
%    Input, real X(NX), Y(NY), the coordinates of grid lines.
%
%    Input, function pointer @F(X,Y), evaluates the heat source term.
%
%    Input, real sparse A(N,N), the system matrix, without any entries set.
%
%    Input, real RHS(N), the system right hand side, without any entries set.
%
%    Output, real sparse A(N,N), the system matrix, with the entries for the
%    interior nodes filled in.
%
%    Output, real RHS(N), the system right hand side, with the entries for the
%    interior nodes filled in.
%
  dc0 = 1.0;
%
%  For now, assume X and Y are equally spaced.
%
  dx = x(2) - x(1);
  dy = y(2) - y(1);

  for ic = 2 : ny - 1
    for jc = 2 : nx - 1

      in = ic + 1;
      is = ic - 1;
      je = jc + 1;
      jw = jc - 1;

      kc = ( ic - 1 ) * nx + jc;
      ke = kc + 1;
      kw = kc - 1;
      kn = kc + nx;
      ks = kc - nx;

      xce = 0.5 * ( x(jc) + x(je) );
      dce = diffusivity_2d_bnt ( dc0, omega, 1, xce,   y(ic) );
      xcw = 0.5 * ( x(jc) + x(jw) );
      dcw = diffusivity_2d_bnt ( dc0, omega, 1, xcw,   y(ic) );
      ycn = 0.5 * ( y(ic) + y(in) );
      dcn = diffusivity_2d_bnt ( dc0, omega, 1, x(jc), ycn );
      ycs = 0.5 * ( y(ic) + y(is) );
      dcs = diffusivity_2d_bnt ( dc0, omega, 1, x(jc), ycs );

      A(kc,kc) = ( dce + dcw ) / dx / dx + ( dcn + dcs ) / dy / dy;
      A(kc,ke) = - dce         / dx / dx;
      A(kc,kw) =       - dcw   / dx / dx;
      A(kc,kn) =                           - dcn         / dy / dy;
      A(kc,ks) =                                 - dcs   / dy / dy;

      rhs(kc,1) = f ( x(jc), y(ic) );

    end
  end

  return
end