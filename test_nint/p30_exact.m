function value = p30_exact ( dim_num )

%*****************************************************************************80
%
%% P30_EXACT returns the exact integral for problem 30.
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
  c = [];
  c = p30_r8vec ( 'G', 'C', dim_num, c );

  z = [];
  z = p30_r8vec ( 'G', 'Z', dim_num, z );

  value = 1.0;

  for i = 1 : dim_num

    value = value * ...
      sqrt ( pi ) ...
      * ( error_f ( c(i) * ( 1.0 - z(i) ) ) ...
        + error_f ( c(i) *         z(i)   ) ) ...
      / ( 2.0 * c(i) );

  end

  return
end
