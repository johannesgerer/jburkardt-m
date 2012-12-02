function value = p22_exact ( dim_num )

%*****************************************************************************80
%
%% P22_EXACT returns the exact integral for problem 22.
%
%  Discussion:
%
%    Thanks to Jeffrey Sax of Extreme Optimization for pointing out a mistake
%    in a previous version of this routine, 28 May 2008.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2008
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
  c = p22_r8 ( 'G', 'C', c );

  r = 0.0;
  r = p22_r8 ( 'G', 'R', r );

  e = [];
  e = p22_i4vec ( 'G', 'E', dim_num, e );

  if ( any ( mod ( e(1:dim_num), 2 ) == 1 ) )
    value = 0.0;
    return
  end

  e_sum = sum ( e(1:dim_num) ) + dim_num;

  value = 2.0 * c;
  for i = 1 : dim_num;
    arg = ( e(i) + 1 ) / 2.0;
    value = value * gamma ( arg );
  end

  arg = e_sum / 2.0;

  value = value / gamma ( arg );

  value = value * r^( e_sum ) / e_sum;

  return
end
