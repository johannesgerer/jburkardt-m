function f = niederreiter_mccurley3 ( x )

%*****************************************************************************80
%
%% NIEDERREITER_MCCURLEY3 evaluates the Niederreiter-McCurley function 3.
%
%  Discussion:
%
%    The spatial dimension is taken as 4.
%
%    The maximum is sought within the unit hypercube.
%
%    The reported maximum value occurs at approximately
%
%      X = [ 0.999980569087140,  0.500000721280566,  0.333341891834645,
%            0.249997266604697 ]
%
%    with
%
%      F(X) = 7.631516199219027
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
  f = - 10000 * prod ( x ) * exp ( - x(1) - 2 * x(2) - 3 * x(3) - 4 * x(4) );

  return
end
