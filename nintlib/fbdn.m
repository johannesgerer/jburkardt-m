function value = fbdn ( dim_num, x )

%*****************************************************************************80
%
%% FBDN(X(1:DIM_NUM)) = 1 / ( 1 + sum ( X(1:DIM_NUM)**2 ) )
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
  value = 1.0 / ( 1.0 + sum ( x(1:dim_num).^2 ) );

  return
end
