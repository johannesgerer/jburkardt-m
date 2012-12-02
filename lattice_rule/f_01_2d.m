function value = f_01_2d ( dim_num, x )

%*****************************************************************************80
%
%% F_01_2D is the 2D test function #1.
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real X(DIM_NUM), the point where the function
%    is to be evaluated.
%
%    Output, real VALUE, the value of the function at X.
%
  e = 2.718281828459045;
  value = x(2) * exp ( x(1) * x(2) ) / ( e - 2.0 );

  return
end
