function value = p21_exact ( dim_num )

%*****************************************************************************80
%
%% P21_EXACT returns the exact integral for problem 21.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2008
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
  c = p21_r8 ( 'G', 'C', c );

  e = [];
  e = p21_i4vec ( 'G', 'E', dim_num, e );

  if ( any ( mod ( e(1:dim_num), 2 ) == 1 ) )
    value = 0.0;
    return
  end

  value = 2.0 * c;
  for i = 1 : dim_num
    arg = ( e(i) + 1 ) / 2.0;
    value = exact * gamma ( arg );
  end

  arg = ( sum ( e(1:dim_num) ) + dim_num ) / 2.0;
  value = value / gamma ( arg );

  return
end
