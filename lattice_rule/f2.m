function value = f2 ( x )

%*****************************************************************************80
%
%% F2 evaluates a function of a scalar used in defining P2(Q).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ian Sloan, Stephen Joe,
%    Lattice Methods for Multiple Integration,
%    Oxford, 1994,
%    ISBN: 0198534728,
%    LC: QA311.S56
%
%  Parameters:
%
%    Input, real X, the value of the argument.
%
%    Output, real VALUE, the value of F2(X).
%
  value = 1.0 + 2.0 * pi * pi * ( x * x - x + 1.0 / 6.0 );

  return
end
