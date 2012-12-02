function result = square_sum ( func, xc, yc, r, norder, xtab, ytab, weight )

%*****************************************************************************80
%
%% SQUARE_SUM carries out a quadrature rule over a square.
%
%  Integration region:
%
%    Points (X,Y) such that:
%
%      abs ( X - XC ) <= R and
%      abs ( Y - YC ) <= R
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
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
    x = xc + r * xtab(i);
    y = yc + r * ytab(i);
    quad = quad + 0.25E+00 * weight(i) * feval ( func, x, y );
  end

  volume = 4.0E+00 * r * r;
  result = quad * volume;

  return
end
