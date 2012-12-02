function jac = p13_jac2 ( option, m, nvar, lambda, u )

%*****************************************************************************80
%
%% P13_JAC2 computes the jacobian by recasting it on a square grid.
%
%  Discussion:
%
%    Actually, to stave off insanity, we only "recast" the variables into
%    a 2D array that corresponds to the spatial ordering of the grid.
%    We leave the jacobian in its original arrangement, which assumes
%    a linear ordering of variables and equations, and we simply
%    compute the equation and variable indices of the jacobian when
%    we are ready to put entries into it.  This approach seems to produce
%    a smaller amount of cosmic grief than the alternatives.
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
%    Input, integer M, the number of grid points on a side of the square.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real LAMBDA, the value of the parameter.
%
%    Input, real U(M,M), the value of the grid function.
%
%    Output, real JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac(1:nvar-1,1:nvar) = 0.0;

  h = 1.0 / ( m + 1 );

  ieqn = 0;

  for i = 1 : m
    for j = 1 : m

      ieqn = ( j - 1 ) * m + i;

      uc = u(i + (j-1)*m);

      if ( i < m )
        un = u(i+1+(j-1)*m);
      else
        un = 0.0;
      end

      if ( 1 < i )
        us = u(i-1+(j-1)*m);
      else
        us = 0.0;
      end

      if ( j < m )
        ue = u(i+j*m);
      else
        ue = 0.0;
      end

      if ( 1 < j )
        uw = u(i+(j-2)*m);
      else
        uw = 0.0;
      end

      fc = p13_gx ( option, uc );
      fn = p13_gx ( option, un );
      fs = p13_gx ( option, us );
      fe = p13_gx ( option, ue );
      fw = p13_gx ( option, uw );

      del5f = fc + h * h * ( - 4.0 * fc + fn + fs + fe + fw ) / 12.0;

      fcp = p13_gp ( option, uc );
      fnp = p13_gp ( option, un );
      fsp = p13_gp ( option, us );
      fep = p13_gp ( option, ue );
      fwp = p13_gp ( option, uw );

      ivar = ( j - 1 ) * m + i;
      jac(ieqn,ivar) = - 20.0 / ( 6.0 * h * h ) ...
        + lambda * ( fcp - 4.0 * h * h * fcp / 12.0 );

      if ( i < m )
        ivar = ( j - 1 ) * m + i + 1;
        jac(ieqn,ivar) = 4.0 / ( 6.0 * h * h ) ...
          + lambda * h * h * fnp / 12.0;
      end

      if ( 1 < i )
        ivar = ( j - 1 ) * m + i - 1;
        jac(ieqn,ivar) = 4.0 / ( 6.0 * h * h ) ...
          + lambda * h * h * fsp / 12.0;
      end

      if ( j < m )
        ivar = j * m + i;
        jac(ieqn,ivar) = 4.0 / ( 6.0 * h * h ) ...
          + lambda * h * h * fep / 12.0;
      end

      if ( 1 < j )
        ivar = ( j - 2 ) * m + i;
        jac(ieqn,ivar) = 4.0 / ( 6.0 * h * h ) ...
          + lambda * h * h * fwp / 12.0;
      end

      if ( 1 < i & 1 < j )
        ivar = ( j - 2 ) * m + i - 1;
        jac(ieqn,ivar) = 1.0 / ( 6.0 * h * h );
      end

      if ( 1 < i & j < m )
        ivar = j * m + i - 1;
        jac(ieqn,ivar) = 1.0 / ( 6.0 * h * h );
      end

      if ( i < m & 1 < j )
        ivar = ( j - 2 ) * m + i + 1;
        jac(ieqn,ivar) = 1.0 / ( 6.0 * h * h );
      end

      if ( i < m & j < m )
        ivar = j * m + i + 1;
        jac(ieqn,ivar) = 1.0 / ( 6.0 * h * h );
      end

      ivar = nvar;
      jac(ieqn,nvar) = del5f;

    end
  end

  return
end
