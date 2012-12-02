function value = f20_s ( dim_num, x )

%*****************************************************************************80
%
%% F20_S evaluates a function of a vector used in defining P2(Q).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 November 2008
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real X(DIM_NUM), the value of the argument.
%
%    Output, real VALUE, the value of F20_S(X).
%
  value = 1.0;
  for i = 1 : dim_num
    value = value * ( 1.0 + ( f2 ( x(i) ) - 1.0 ) );
  end

  value = value - 1.0;

  return
end
