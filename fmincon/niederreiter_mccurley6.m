function f = niederreiter_mccurley6 ( x )

%*****************************************************************************80
%
%% NIEDERREITER_MCCURLEY6 evaluates the Niederreiter-McCurley function 6.
%
%  Discussion:
%
%    The spatial dimension is taken as 4.
%
%    The maximum is sought within the unit hypercube.
%
%    The reported maximum value occurs at approximately
%
%      X = [ 0.509282516910744, 0.509282516910744, 0.509282516910746,
%            0.509282516910744 ]
%
%    with
%
%      F(X) = 0.999999978962229
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
  if ( any ( x == 0 ) )
    f = 0.0;
  else
    f = - sin ( 1/x(1) + 1/x(2) + 1/x(3) + 1/x(4) );
  end

  return
end
