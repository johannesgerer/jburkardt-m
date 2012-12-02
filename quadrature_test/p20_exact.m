function value = p20_exact ( dim_num )

%*****************************************************************************80
%
%% P20_EXACT returns the exact integral for problem 20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2007
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
  aval = 0.0;
  aval = p20_r8 ( 'G', 'A', aval );

  bval = 0.0;
  bval = p20_r8 ( 'G', 'B', bval );

  p = 0.0;
  p = p20_r8 ( 'G', 'P', p );

  value = 0.0;
  exponent = dim_num + p;

  minus_one = -1.0;
  for i = 0 : dim_num
    minus_one = - minus_one;
    value = value + minus_one * r8_choose ( dim_num, i ) ...
      * ( ( dim_num - i ) * bval + i * aval )^exponent;
  end

  for i = 1 : dim_num
    value = value / ( p + i );
  end

  return
end
