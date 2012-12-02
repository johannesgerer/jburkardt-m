function value = fedn ( dim_num, x )

%*****************************************************************************80
%
%% FEDN(X(1:DIM_NUM)) = exp ( sum ( X(1:DIM_NUM) ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real X(DIM_NUM), the argument.
%
%    Output, real VALUE, the value of the function at X.
%
  value = exp ( sum ( x(1:dim_num) ) );

  return
end
