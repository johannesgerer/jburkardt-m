function f = niederreiter_mccurley1 ( x )

%*****************************************************************************80
%
%% NIEDERREITER_MCCURLEY1 evaluates the Niederreiter-McCurley function 1.
%
%  Discussion:
%
%    The spatial dimension is taken as 4.
%
%    The maximum is sought within the unit hypercube.
%
%    The reported maximum value occurs at approximately
%
%      X = [ 0.409887209247642, 0.409887209247642, 0.409887209247642, 
%            0.409887209247642 ]
%
%    with
%
%      F(X) = 1.026198512571862
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
  p = prod ( x );
  s = sum ( x );
  f = - exp ( p ) * sin ( s );

  return
end
