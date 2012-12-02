function jac = p10_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P10_JAC evaluates the jacobian for problem 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, X(NVAR), the point where the jacobian is evaluated.
%
%    Output, real JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac = zeros ( nvar, nvar );

  nrow = 6;
  ncol = 6;

  h = 1.0 / ( nrow + 1 );

  for i = 1 : nrow

    for j = 1 : ncol;

      uc(1) = 0.0;
      uc(2) = 0.0;
      ux(1:4) = 0.0;

      ij = i + ( j - 1 ) * nrow;

      if ( i ~= 1 )
        ux(1) = x(ij-1);
      end

      if ( i ~= nrow )
        ux(2) = x(ij+1);
      end

      if ( 1 < j )
        jk = ij - nrow;
        ux(3) = x(jk);
        if ( i ~= 1 )
          uc(1) = x(jk-1);
        end
      end

      if ( j < ncol )
        jk = ij + nrow;
        ux(4) = x(jk);
        if ( i ~= nrow )
          uc(2) = x(jk+1);
        end
      end

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
          dx(l,k) = gp;
          sc = sc + cx(l,k);
        end

      end
%
%  diagonal
%
      xjac = 0.5 * sc;

      for k = 1 : 4
        k2 = 5 - k;
        xjac = xjac + dx(2,k) * ( x(ij) - ux(k) ) ...
              * ( 2.0 * x(ij) - ux(k) - ux(k2) ) / h / h;
        xjac = xjac + dx(1,k) * ( x(ij) - ux(k) )^2 / h / h;
      end

      jac(ij,ij) = xjac;
%
%  off-diagonals
%
      for k = 1 : 4

        if ( k == 1 )
          if ( i == 1 ) 
            continue
          end
          jk = ij - 1;
        elseif ( k == 2 )
          if ( i == nrow ) 
            continue
          end
          jk = ij + 1;
        elseif ( k == 3 )
          if ( j == 1 ) 
            continue
          end
          jk = ij - nrow;
        elseif ( k == 4 )
          if ( j == ncol ) 
            continue
          end
          jk = ij + nrow;
        end

        if ( k == 1 | k == 3 )
          k1 = 1;
        else
          k1 = 2;
        end

        k2 = 5 - k;
        xjac = ( x(ij) - ux(k) ) * ( dx(1,k) * ( 2.0 * ux(k) - x(ij) - uc(k1) ) ...
                + dx(2,k) * ( ux(k) - x(ij) ) + dx(2,k2) * ( ux(k2) - x(ij) ) );

        xjac = xjac / h / h - 0.5 * ( cx(1,k) + cx(2,k) );

        jac(ij,jk) = xjac;

      end

      if ( i ~= 1 & j ~= 1 )
        jk = ij - nrow - 1;
        xjac =   ( x(ij) - ux(1) ) * dx(1,1) * ( uc(1) - ux(1) ) ...
               + ( x(ij) - ux(3) ) * dx(1,3) * ( uc(1) - ux(3) );
        jac(ij,jk) = xjac / h / h;
      end

      if ( i ~= nrow & j ~= ncol )
        jk = ij + nrow + 1;
        xjac =   ( x(ij) - ux(2) ) * dx(1,2) * ( uc(2) - ux(2) ) ...
               + ( x(ij) - ux(4) ) * dx(1,4) * ( uc(2) - ux(4) );
        jac(ij,jk) = xjac / h / h;
      end

    end
  end

  for i = 1 : nvar - 1
    jac(i,nvar) = - h * h;
  end

  return
end
