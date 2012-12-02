function f = niederreiter_mccurley5 ( x )

%*****************************************************************************80
%
%% NIEDERREITER_MCCURLEY5 evaluates the Niederreiter-McCurley function 5.
%
%  Discussion:
%
%    The spatial dimension is taken as 4.
%
%    The maximum is sought within the unit hypercube.
%
%    The reported maximum value occurs at approximately
%
%      X = [ 3/11, 6/13, 12/23, 8/37 ]
%        = [ 0.272727272727273, 0.461538461538462, 0.521739130434783,
%            0.216216216216216 ]
%
%    with
%
%      F(X) = 0
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
  f = ( x(1) -  3 / 11 )^2 ...
    + ( x(2) -  6 / 13 )^2 ...
    + ( x(3) - 12 / 23 )^4 ...
    + ( x(4) -  8 / 37 )^6;

  return
end
