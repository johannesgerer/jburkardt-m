function g = p15_g ( n, x )

%*****************************************************************************80
%
%% P15_G evaluates the gradient for problem 15.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real G(N), the gradient of the objective function.
%
  g = zeros ( n, 1 );

  for j = 1 : 4 : n

    if ( j + 1 <= n )
      xjp1 = x(j+1);
    else
      xjp1 = 0.0;
    end

    if ( j + 2 <= n )
      xjp2 = x(j+2);
    else
      xjp2 = 0.0;
    end

    if ( j + 3 <= n )
      xjp3 = x(j+3);
    else
      xjp3 = 0.0;
    end

    f1 = x(j) + 10.0 * xjp1;
    df1dxj = 1.0;
    df1dxjp1 = 10.0;

    if ( j + 1 <= n )
      f2 = xjp2 - xjp3;
      df2dxjp2 = 1.0;
      df2dxjp3 = -1.0;
    else
      f2 = 0.0;
      df2dxjp2 = 0.0;
      df2dxjp3 = 0.0;
    end

    if ( j + 2 <= n )
      f3 = xjp1 - 2.0 * xjp2;
      df3dxjp1 = 1.0;
      df3dxjp2 = -2.0;
    else
      f3 = 0.0;
      df3dxjp1 = 0.0;
      df3dxjp2 = 0.0;
    end

    if ( j + 3 <= n )
      f4 = x(j) - xjp3;
      df4dxj = 1.0;
      df4dxjp3 = -1.0;
    else
      f4 = 0.0;
      df4dxj = 0.0;
      df4dxjp3 = 0.0;
    end

    g(j) = 2.0 * f1 * df1dxj + 10.0 * 4.0 * f4^3 * df4dxj;

    if ( j+1 <= n )
      g(j+1) = 2.0 * f1 * df1dxjp1 + 4.0 * f3^3 * df3dxjp1;
    end

    if ( j+2 <= n )
      g(j+2) = 2.0 * 5.0 * f2 * df2dxjp2 + 4.0 * f3^3 * df3dxjp2;
    end

    if ( j+3 <= n )
      g(j+3) = 2.0 * 5.0 * f2 * df2dxjp3 + 10.0 * 4.0 * f4^3 * df4dxjp3;
    end

  end

  return
end
