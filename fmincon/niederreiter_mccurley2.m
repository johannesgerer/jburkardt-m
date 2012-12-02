function f = niederreiter_mccurley2 ( x )

%*****************************************************************************80
%
%% NIEDERREITER_MCCURLEY2 evaluates the Niederreiter-McCurley function 2.
%
%  Discussion:
%
%    The spatial dimension is taken as 4.
%
%    The maximum is sought within the unit hypercube.
%
%    The reported maximum value occurs at approximately
%
%      X = [ 0.390500591228663,  0.392051909813608,  0.393601661544812,
%            0.395149843840982 ]
%
%    with
%
%      F(X) = 1.000089108383539
%
%    however, Niederreiter and McCurley find a maximum of 1.0002542.
%
%    Note that FMINCON is designed to minimize functions, so we must negate
%    the output value here in order to satisfy FMINCON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Harald Niederreiter, Kevin McCurley,
%    Optimization of functions by quasi-random search methods,
%    Computing,
%    Volume 22, Number 2, 1979, pages 119-123.
%
%  Parameters:
%
%    Input, real X(N), the argument of the objection function.
%
%    Output, real F, the value of the objective function.
%
  p = x(1) * x(2).^2 * x(3).^3 * x(4).^4;
  s = sum ( x );
  f = - exp ( p ) * sin ( s );

  return
end
