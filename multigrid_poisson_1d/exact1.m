function value = exact1 ( x )

%*****************************************************************************80
%                                                    
%% EXACT1 evaluates the exact solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    William Hager,
%    Applied Numerical Linear Algebra,
%    Prentice-Hall, 1988,
%    ISBN13: 978-0130412942,
%    LC: QA184.H33.
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of the exact solution at X.
%
  value = 0.5 * ( - x .* x + x );

  return
end
