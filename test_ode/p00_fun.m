function yp = p00_fun ( test, t, y )

%*****************************************************************************80
%
%% P00_FUN evaluates the right hand side of any test problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the test problem index.
%
%    Input, real T, the value of the independent variable.
%
%    Input, real Y(N), the value of the dependent variables.
%
%    Output, real YP(N), the value of the derivative of the
%    dependent variables, as specified by the ODE.
%
  if ( test == 1 )
    yp(1) = -y(1);
  elseif ( test == 2 )
    yp(1) = - 0.5 * y(1) * y(1) * y(1);
  elseif ( test == 3 )
    yp(1) = y(1) * cos ( t );
  elseif ( test == 4 )
    yp(1) = ( 1.0 - y(1) / 20.0 ) * y(1) / 4.0;
  elseif ( test == 5 )
    yp(1) = ( y(1) - t ) / ( y(1) + t );
  elseif ( test == 6 )
    yp(1) = 2.0 * y(1) * ( 1.0 - y(2) );
    yp(2) =     - y(2) * ( 1.0 - y(1) );
  elseif ( test == 7 )
    yp(1) = - y(1) +       y(2);
    yp(2) =   y(1) - 2.0 * y(2) + y(3);
    yp(3) =                y(2) - y(3);
  elseif ( test == 8 )
    yp(1:3) = [ -y(1), y(1) - y(2).^2, y(2).^2 ];
  elseif ( test == 9 )
    norm = sqrt ( y(1).^2 + y(2).^2 );

    if ( 0.0 < norm )
      yp(1) = - y(2) - y(1) * y(3) / norm;
      yp(2) =   y(1) - y(2) * y(3) / norm;
      yp(3) =                 y(1) / norm;
    else
      yp(1:3) = [ 0.0, 0.0, 0.0 ];
    end
  elseif ( test == 10 )
    yp(1) =  y(2) * y(3);
    yp(2) = -y(1) * y(3);
    yp(3) = -0.51 * y(1) * y(2);
  elseif ( test == 11 )
    neqn = p00_neqn ( test );
    yp(1)        =             - y(1);
    yp(2:neqn-1) = y(1:neqn-2) - y(2:neqn-1);
    yp(neqn)     = y(neqn-1);
  elseif ( test == 12 )
    neqn = p00_neqn ( test );
    yp(1) = - y(1);
    for i = 2 : neqn-1
      yp(i) = ( i - 1 ) * y(i-1) - i * y(i);
    end
    yp(neqn) = ( neqn - 1 ) * y(neqn-1);
  elseif ( test == 13 )
    neqn = p00_neqn ( test );
    yp(1)        =             - 2.0 * y(1) + y(2);
    yp(2:neqn-1) = y(1:neqn-2) - 2.0 * y(2:neqn-1) + y(3:neqn);
    yp(neqn)     = y(neqn-1)   - 2.0 * y(neqn);
  elseif ( test == 14 )
    neqn = p00_neqn ( test );
    yp(1)        =             - 2.0 * y(1) + y(2);
    yp(2:neqn-1) = y(1:neqn-2) - 2.0 * y(2:neqn-1) + y(3:neqn);
    yp(neqn)     = y(neqn-1)   - 2.0 * y(neqn);
  elseif ( test == 15 )
    k2 = p15_param ( 'GET', 'K2' );
    m0 = p15_param ( 'GET', 'M0' );
    m(1) = p15_param ( 'GET', 'M1' );
    m(2) = p15_param ( 'GET', 'M2' );
    m(3) = p15_param ( 'GET', 'M3' );
    m(4) = p15_param ( 'GET', 'M4' );
    m(5) = p15_param ( 'GET', 'M5' );
    i = 0;
    for l = 3 : 3 : 15
      i = i + 1;
      p = y(l-2).^2 + y(l-1).^2 + y(l).^2;
      r(i) = 1.0 / ( p * sqrt ( p ) );
      j = 0;
      for ll = 3 : 3 : 15
        j = j + 1;
        if ( ll ~= l )
          p = ( y(l-2) - y(ll-2) ).^2 + ( y(l-1) - y(ll-1) ).^2 ...
            + ( y(l) - y(ll) ).^2;
          q(i,j) = 1.0 / ( p * sqrt ( p ) );
          q(j,i) = q(i,j);
        end
      end
    end
    i3 = 0;
    for i = 1 : 5
      i3 = i3 + 3;
      for ll = i3-2 : i3
        mm = ll - i3;
        yp(ll) = y(ll+15);
        p = 0.0;
        for j = 1 : 5
          mm = mm + 3;
          if ( j ~= i )
            p = p + m(j) ...
               * ( y(mm) * ( q(i,j) - r(j) ) - y(ll) * q(i,j) );
          end
        end
        yp(ll+15) = k2 * ( - ( m0 + m(i) ) * y(ll) * r(i) + p );
      end
    end
  elseif ( test == 16 )
    yp(1) = y(3);
    yp(2) = y(4);
    yp(3) = -y(1) / ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^3;
    yp(4) = -y(2) / ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^3;
  elseif ( test == 17 )
    yp(1) = y(3);
    yp(2) = y(4);
    yp(3) = -y(1) / ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^3;
    yp(4) = -y(2) / ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^3;
  elseif ( test == 18 )
    yp(1) = y(3);
    yp(2) = y(4);
    yp(3) = -y(1) / ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^3;
    yp(4) = -y(2) / ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^3;
  elseif ( test == 19 )
    yp(1) = y(3);
    yp(2) = y(4);
    yp(3) = -y(1) / ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^3;
    yp(4) = -y(2) / ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^3;
  elseif ( test == 20 )
    yp(1) = y(3);
    yp(2) = y(4);
    yp(3) = -y(1) / ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^3;
    yp(4) = -y(2) / ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^3;
  elseif ( test == 21 )
    yp(1) = y(2);
    yp(2) = - ( 1.0 - 0.25 / ( t + 1.0 )^2 ) * y(1) ...
      - 1.0 / ( t + 1.0 ) * y(2);
  elseif ( test == 22 )
    yp(1) = y(2);
    yp(2) = ( 1.0 - y(1).^2 ) * y(2) - y(1);
  elseif ( test == 23 )
    yp(1) = y(2);
    yp(2) = y(1).^3 / 6.0 - y(1) + 2.0 * sin ( 2.78535 * t );
  elseif ( test == 24 )
    yp(1) = y(2);
    yp(2) = 0.032 - 0.4 * y(2).^2;
  elseif ( test == 25 )
    yp(1) = y(2);
    yp(2) = sqrt ( 1.0 + y(2).^2 ) / ( 25.0 - t );
  elseif ( test == 26 )
    a = p26_param ( 'GET', 'A' );
    yp(1) = y(2);
    if ( mod ( floor ( t ), 2 ) == 0 )
      yp(2) = 2.0 * a * y(2) - ( pi^2 + a^2 ) * y(1) + 1.0;
    else
      yp(2) = 2.0 * a * y(2) - ( pi^2 + a^2 ) * y(1) - 1.0;
    end
  elseif ( test == 27 )
    if ( mod ( floor ( t ), 2 ) == 0 )
      yp(1) = 55.0 - 1.5 * y(1);
    else
      yp(1) = 55.0 - 0.5 * y(1);
    end
  elseif ( test == 28 )
    yp(1) = y(2);
    yp(2) = 0.01 * y(2) * ( 1.0 - y(1).^2 ) - y(1) - abs ( sin ( pi * t ) );
  elseif ( test == 29 )
    if ( t <= 10.0 )
      yp(1) = - 2.0 / 21.0 ...
        - 120.0 * ( t - 5.0 ) / ( 1.0 + 4.0 * ( t - 5.0 )^2 );
    else
      yp(1) = - 2.0 * y(1);
    end
  elseif ( test == 30 )
    csum = 0.0;
    for i = 1 : 19
      csum = csum + ( i )^(4.0/3.0);
    end
%
%  Alas, even MATLAB wants to do funny things with cube roots
%  of negative numbers!  I thought only Mathematica had that
%  lofty bent.
%
    pprime = 0.0;
    for i = 1 : 19
      pprime = pprime + ( 4.0 / 3.0 ) * r8_sign ( t - i ) ...
        * ( abs ( t - i ) )^(1.0/3.0);
    end
    yp(1) = pprime * y(1) / csum;
  elseif ( test == 31 )
    a = p31_param ( 'GET', 'A' );
    b = p31_param ( 'GET', 'B' );
    c = p31_param ( 'GET', 'C' );
    d = p31_param ( 'GET', 'D' );
    yp(1) = ( a - b * y(2) ) * y(1);
    yp(2) = ( c * y(1) - d ) * y(2);
  elseif ( test == 32 )
    beta = p32_param ( 'GET', 'BETA' );
    rho = p32_param ( 'GET', 'RHO' );
    sigma = p32_param ( 'GET', 'SIGMA' );
    yp(1) = sigma * ( y(2) - y(1) );
    yp(2) = rho * y(1) - y(2) - y(1) * y(3);
    yp(3) = - beta * y(3) + y(1) * y(2);
  elseif ( test == 33 )
    delta = p33_param ( 'GET', 'DELTA' );
    yp(1) = y(2);
    yp(2) = delta * ( 1.0 - y(1).^2 ) * y(2) - y(1);
  elseif ( test == 34 )
    g = p34_param ( 'GET', 'G' );
    k = p34_param ( 'GET', 'K' );
    l = p34_param ( 'GET', 'L' );
    m = p34_param ( 'GET', 'M' );
    yp(1) = y(2);
    yp(2) = - ( g / l ) * y(1) - ( k / m ) * y(2);
  elseif ( test == 35 )
    g = p35_param ( 'GET', 'G' );
    k = p35_param ( 'GET', 'K' );
    l = p35_param ( 'GET', 'L' );
    m = p35_param ( 'GET', 'M' );
    yp(1) = y(2);
    yp(2) = - ( g / l ) * sin ( y(1) ) - ( k / m ) * y(2);
  elseif ( test == 36 )
    yp(1) = y(2);
    yp(2) = y(1) * ( 1.0 - y(1).^2 );
  elseif ( test == 37 )
    a = p37_param ( 'GET', 'A' );
    k = p37_param ( 'GET', 'K' );
    w = p37_param ( 'GET', 'W' );
    yp(1) = y(2);
    yp(2) = y(1) * ( 1.0 - y(1).^2 ) - k * y(2) + a * cos ( w * t );
  elseif ( test == 38 )
    yp(1) = y(1).^2 * ( 1.0 - y(1) );
  elseif ( test == 39 )
    a = p39_param ( 'GET', 'A' );
    b = p39_param ( 'GET', 'B' );
    yp(1) = y(1).^2 - a * t + b;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FUN - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_FUN - Fatal error!' );
  end
%
%  MATLAB expects YP to be a column vector.
%
  yp = yp';

  return
end
