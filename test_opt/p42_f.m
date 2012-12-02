function f = p42_f ( n, x )

%*****************************************************************************80
%
%% P42_F evaluates the objective function for problem 42.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2002
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    MJD Powell,
%    An Efficient Method for Finding the Minimum of a Function of
%    Several Variables Without Calculating Derivatives,
%    Computer Journal,
%    Volume 7, Number 2, pages 155-162, 1964.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  if ( x(2) == 0.0 )
    term = 0.0;
  else
    arg = ( x(1) + 2.0 * x(2) + x(3) ) / x(2);
    term = exp ( - arg^2 );
  end

  f = 3.0 ...
    - 1.0 / ( 1.0 + ( x(1) - x(2) )^2 ) ...
    - sin ( 0.5 * pi * x(2) * x(3) ) ...
    - term;

  return
end
