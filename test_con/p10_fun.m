function fx = p10_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P10_FUN evaluates the function for problem 10.
%
%  Title:
%
%    Torsion of a square rod, finite difference solution
%
%  Description:
%
%    The problem is a boundary value problem on (0,1) x (0,1)
%    of the form:
%
%      - d/dx ( PHI ( dU/dx, dU/dy ) * dU/dx )
%      - d/dy ( PHI ( dU/dx, dU/dy ) * dU/dy ) = G ( U, LAMBDA )
%
%    A standard finite difference approximation on a uniform mesh is
%    applied to yield the equations, with X(1) through X(NVAR-1) storing
%    the value of U at the mesh points, and X(NVAR) holding the value
%    of LAMBDA.
%
%  Options:
%
%    Let S = dU/dX**2 + dU/dY**2.
%
%    OPTION=1
%
%      PHI(S) = exp ( 5 * S )
%
%    OPTION=2
%
%      Let SBAR = ( 40 * S - 13 ) / 7
%
%      if ( S <= 0.15 ) then
%        PHI = 1.0
%      else if ( 0.15 <= S <= 0.50 ) then
%        PHI = 5.5 + 4.5 * ( 3 * SBAR - SBAR**3 )
%      else if ( 0.50 <= S ) then
%        PHI = 10.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Werner Rheinboldt,
%    On the Solution of Some Nonlinear Equations Arising in the
%    Application of Finite Element Methods,
%    in The Mathematics of Finite Elements and Applications II,
%    edited by John Whiteman
%    Academic Press, London, 1976, pages 465-482,
%    LC: TA347.F5.M37.
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the function.
%
%    Output, real FX(NVAR-1), the value of the function at X.
%

%
%  UC contains the two cornerpoints,
%  UX contains the four side-points,
%  CX contains the elements connected to the side points.
%
  nrow = 6;
  ncol = 6;

  h = 1.0 / ( nrow + 1 );

  cx(1:2,1:4) = 0.0;
  uc(1:2) = 0.0;
  ux(1:4) = 0.0;
  fx(1:nvar-1) = 0.0;

  for i = 1 : nrow

    for j = 1 : ncol

      uc(1) = 0.0;
      uc(2) = 0.0;
      ux(1:4) = 0.0;

      ij = ( j - 1 ) * nrow + i;

      if ( i ~= 1 )
        ux(1) = x(ij-1);
      end

      if ( i ~= nrow )
        ux(2) = x(ij+1);
      end

      if ( j ~= 1 )
        jk = ij - nrow;
        ux(3) = x(jk);
        if ( i ~= 1 )
          uc(1) = x(jk-1);
        end
      end

      if ( j ~= ncol )

        jk = ij + nrow;
        ux(4) = x(jk);

        if ( i ~= nrow )
          uc(2) = x(jk+1);
        end

      end
%
%  k = 1, 2*qw calculated and stored in ( cx(1,k) + cx(2,k) )
%  k = 2, 2*qe calculated and stored in ( cx(1,k) + cx(2,k) )
%  k = 3, 2*qs calculated and stored in ( cx(1,k) + cx(2,k) )
%  k = 4, 2*qn calculated and stored in ( cx(1,k) + cx(2,k) )
%
      sc = 0.0;

      for k = 1 : 4

        if ( k == 1 | k == 3 )
          k1 = 1;
        else
          k1 = 2;
        end

        k2 = 5 - k;

        for l = 1 : 2

          rlk = ( ux(k) - x(ij) )^2;

          if ( l == 1 )
            rlk = ( rlk + ( ux(k) - uc(k1) )^2 ) / h / h;
          else
            rlk = ( rlk + ( x(ij) - ux(k2) )^2 ) / h / h;
          end

          [ g, gp ] = p10_gx ( option, rlk );
          cx(l,k) = g;
          sc = sc + cx(l,k);

        end

      end
%
%  sc = qn + qs + qe + qw
%
      fx(ij) = 0.5 * sc * x(ij) - x(nvar) * h * h;
      for k = 1 : 4
        fx(ij) = fx(ij) - 0.5 * ux(k) * ( cx(1,k) + cx(2,k) );
      end

    end

  end

  return
end
