function value = p23_exact ( dim_num )

%*****************************************************************************80
%
%% P23_EXACT returns the exact integral for problem 23.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2007
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
  c = 0.0;
  c = p23_r8 ( 'G', 'C', c );

  e = [];
  e = p23_i4vec ( 'G', 'E', dim_num, e );

  value = c;
  for i = 1: dim_num
    value = value * gamma ( e(i) + 1 );
  end

  value = value / gamma ( sum ( e(1:dim_num) ) + 1 );

  return
end
