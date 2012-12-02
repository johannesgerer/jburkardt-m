function result = square_unit_sum ( func, norder, xtab, ytab, weight )

%*****************************************************************************80
%
%% SQUARE_UNIT_SUM carries out a quadrature rule over the unit square.
%
%  Integration region:
%
%    Points (X,Y) such that
%
%      -1 <= X <= 1, and
%      -1 <= Y <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, external FUNC, the name of the function to be
%    integrated.  The user must declare the name an EXTERNAL
%    parameter in the calling program, pass the name of the
%    function in FUNC, and write a function of the form
%      function value = func ( x, y )
%    which evaluates the function at the point (X,Y).
%
%    Input, integer NORDER, the order of the rule.
%
%    Input, real XTAB(NORDER), YTAB(NORDER), the abscissas of
%    the rule.
%
%    Input, real WEIGHT(NORDER), the weights of the rule.
%
%    Output, real RESULT, the approximate integral of the function.
%
  quad = 0.0E+00;
  for i = 1 : norder
    quad = quad + weight(i) * feval ( func, xtab(i), ytab(i) ) / 4.0E+00;
  end

  volume = 1.0E+00;
  result = quad * volume;

  return
end
