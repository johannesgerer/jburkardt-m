function f = niederreiter_mccurley4 ( x )

%*****************************************************************************80
%
%% NIEDERREITER_MCCURLEY4 evaluates the Niederreiter-McCurley function 4.
%
%  Discussion:
%
%    The spatial dimension is taken as 4.
%
%    The maximum is sought within the unit hypercube.
%
%    The reported maximum value occurs at approximately
%
%      X = [ 1, 1, 1, 1 ]
%
%    with
%
%      F(X) = 9.196986029286059
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
  f = - 100 * prod ( x ) * exp ( - x(4) ) ./ ( 1 + x(1) * x(2) * x(3) ).^2;

  return
end
