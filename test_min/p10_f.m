function f = p10_f ( x )

%*****************************************************************************80
%
%% P10_F evaluates the objective function for problem 10.
%
%  Discussion:
%
%    This function is oscillatory.
%
%    The function has a local minimum at 1.7922 whose function value is
%    very close to the minimum value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Isabel Beichl, Dianne O'Leary, Francis Sullivan,
%    Monte Carlo Minimization and Counting: One, Two, Too Many,
%    Computing in Science and Engineering,
%    Volume 9, Number 1, January/February 2007.
%
%    Dianne O'Leary,
%    Scientific Computing with Case Studies,
%    SIAM, 2008,
%    ISBN13: 978-0-898716-66-5,
%    LC: QA401.O44.
%
%  Parameters:
%
%    Input, real X, the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  f =       cos (       x ) ...
    + 5.0 * cos ( 1.6 * x ) ...
    - 2.0 * cos ( 2.0 * x ) ...
    + 5.0 * cos ( 4.5 * x ) ...
    + 7.0 * cos ( 9.0 * x );

  return
end
