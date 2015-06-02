function yp = p30_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P30_FUN evaluates the function for problem P30.
%
%  Discussion:
%
%    1 equation.
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

  csum = 0.0;
  for i = 1 : 19
    csum = csum + ( i )^(4.0/3.0);
  end
  pprime = 0.0;
  for i = 1 : 19
    pprime = pprime + ( 4.0 / 3.0 ) * r8_sign ( t - i ) ...
      * ( abs ( t - i ) )^(1.0/3.0);
  end
  yp(1) = pprime * y(1) / csum;

  return
end
