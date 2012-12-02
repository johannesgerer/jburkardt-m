function fx = p13_fx2 ( option, m, u, lambda )

%*****************************************************************************80
%
%% P13_FX2 computes the function by recasting it on a square grid.
%
%  Discussion:
%
%    For M = 4, there are M*M = 16 U variables plus LAMBDA.
%
%    The ordering of the U variables is suggested by the diagram, in which
%    "0" indicates a point where U is zero, and a nonzero value indicates
%    the index in the vector U of the corresponding value:
%
%      |
%     1.0      0   0   0   0   0   0
%      |       0  13  14  15  16   0
%      |       0   9  10  11  12   0
%      Y       0   5   6   7   8   0
%      |       0   1   2   3   4   0
%     0.0      0   0   0   0   0   0
%      |
%      +--0.0------X----------1.0--->
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
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer M, the number of grid points along a side of
%    the square.
%
%    Input, real U(M,M), the value of the grid function at the
%    grid points.
%
%    Input, real LAMBDA, the value of the parameter.
%
%    Output, real FX(M,M), the value of the function.
%
  h = 1.0 / ( m + 1 );

  for i = 1 : m
    for j = 1 : m
%
%  Evaluate the solution on the grid:
%
%   UNW-UN--UNE
%    |   |   |
%   UW--UC--UE
%    |   |   |
%   USW-US--USE
%
      uc = u(i+(j-1)*m);

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

      if ( 1 < i & 1 < j )
        usw = u(i-1+(j-2)*m);
      else
        usw = 0.0;
      end

      if ( 1 < i & j < m )
        use = u(i-1+j*m);
      else
        use = 0.0;
      end

      if ( i < m & 1 < j )
        unw = u(i+1+(j-2)*m);
      else
        unw = 0.0;
      end

      if ( i < m & j < m )
        une = u(i+1+j*m);
      else
        une = 0.0;
      end
%
%  Evaluate the right hand side on the grid.
%
%      FN
%      |
%   FW-FC-FE
%      |
%      FS
%
      fc = p13_gx ( option, uc );
      fn = p13_gx ( option, un );
      fs = p13_gx ( option, us );
      fe = p13_gx ( option, ue );
      fw = p13_gx ( option, uw );
%
%  Compute the 9 point approximation to Laplacian U.
%
      del9u = ( - 20.0 * uc + 4.0 * ( un + us + ue + uw ) ...
              + une + unw + use + usw ) / ( 6.0 * h * h );

      del5f = fc + h * h * ( - 4.0D+00 * fc + fn + fs + fe + fw ) / 12.0;

      fx(i+(j-1)*m) = del9u + lambda * del5f;

    end
  end

  return
end
