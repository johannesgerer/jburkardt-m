function value = p18_exact ( dim_num )

%*****************************************************************************80
%
%% P18_EXACT returns the exact integral for problem 18.
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
  r = 0.0;
  r = p18_r8 ( 'G', 'R', r );

  value = sphere_volume_nd ( dim_num, r );

  return
end
