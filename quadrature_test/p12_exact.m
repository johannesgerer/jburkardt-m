function value = p12_exact ( dim_num )

%*****************************************************************************80
%
%% P12_EXACT returns the exact integral for problem 12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Output, real VALUE, the exact value of the integral.
%
  value = 1.0;
  for i = 1 : dim_num
    value = value * sin ( i );
  end

  return
end
