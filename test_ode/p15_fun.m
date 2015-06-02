function yp = p15_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P15_FUN evaluates the function for problem P15.
%
%  Discussion:
%
%    30 equations.
%
%    This system models the motion of the five outer planets of the
%    solar system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Wayne Enright, John Pryce,
%    Algorithm 648,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 1, pages 28-34.
%
%  Parameters:
%
%    Input, integer NEQN, the number of equations.
%
%    Input, real T, Y(NEQN), the arguments of the derivative
%    function.
%
%    Output, real YP(NEQN), the value of the derivative function.
%
  yp = zeros ( neqn, 1 );

  m = zeros ( 5, 1 );
  k2 = p15_param ( 'GET', 'K2', [] );
  m0 = p15_param ( 'GET', 'M0', [] );
  m(1) = p15_param ( 'GET', 'M1', [] );
  m(2) = p15_param ( 'GET', 'M2', [] );
  m(3) = p15_param ( 'GET', 'M3', [] );
  m(4) = p15_param ( 'GET', 'M4', [] );
  m(5) = p15_param ( 'GET', 'M5', [] );
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

  return
end
