function buckling_spring_l ( l_num, theta_num )

%*****************************************************************************80
%
%% BUCKLING_SPRING_L plots LAMBDA(L,THETA) and MU(L,THETA) lines for fixed THETA.
%
%  Discussion:
%
%    This routine fixes THETA and plots LAMBDA and MU as functions of L.
%
%  Usage:
%
%    buckling_spring_l ( l_num, theta_num )
%
%    * l_num is the number of L lines to draw;
%    * theta_num is the number of THETA values along each L line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer L_NUM, the number of values of L,
%    which sets the number of lines to be drawn.
%    A value of 101 is plenty.
%
%    Input, integer THETA_NUM, the number of values of THETA, 
%    which controls the smoothness of each line.
%    A value of 101 is plenty.
%
  l_lo = 0.25;
  l_hi = 1.75;

  theta_lo = - 3 * pi / 8;
  theta_hi = + 3 * pi / 8;

  for j = 1 : theta_num

    if ( theta_num == 1 )
      theta = 0.5 * ( theta_lo + theta_hi );
    else
      theta = ( ( theta_num - j     ) * theta_lo ...
              + (             j - 1 ) * theta_hi ) ...
              / ( theta_num     - 1 );
    end

    for i = 1 : l_num

      if ( l_num == 1 )
        L = 0.5 * ( l_lo + l_hi );
      else
        L = ( ( l_num - i     ) * l_lo ...
            + (         i - 1 ) * l_hi ) ...
            / ( l_num     - 1 );
      end

      lambda(i,j) = ( 1 - L ) * cos ( theta ) + theta * sin ( theta ) / 4 / L;
      mu(i,j) = - theta * cos ( theta ) / 2 / L + 2 * ( 1 - L ) * sin ( theta );

    end

  end

  plot ( lambda, mu )
%
%  Limit the plot range.
%  Suppress this command to see the whole plot.
%
  axis ( [ 0.1 0.9 -0.07 0.07 ] );
%
%  Label the plot.
%
  xlabel ( '\lambda(L,\theta)' );
  ylabel ( '\mu(L,\theta)' );
  title ( 'Each line is a fixed value of \theta' );

  return
end
