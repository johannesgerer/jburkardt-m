function value = force2 ( x )

%*****************************************************************************80
%                                                    
%% FORCE2 evaluates the forcing function.
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
%    Output, real FORCE2, the value of the forcing function at X.
%
  value = - x .* ( x + 3.0 ) .* exp ( x );

  return
end
