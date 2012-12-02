function value = p16_exact ( dim_num )

%*****************************************************************************80
%
%% P16_EXACT returns the exact integral for problem 16.
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

%
%  Get the limits of integration.
%
  [ a, b ] = p16_lim ( dim_num );
%
%  Get the location of Z.
%
  z = [];
  z = p16_r8vec ( 'G', 'Z', dim_num, z );
%
%  The value of the DIM_NUM dimensional integral can be broken down
%  into the weighted sum of 1 dimensional integrals.
%
  value = 0.0;

  volume = prod ( b(1:dim_num) - a(1:dim_num) );

  for i = 1 : dim_num
%
%  Z < A < B
%
    if ( z(i) < a(i) )

      integral = 0.5 * ( b(i) - a(i) ) * ( b(i) + a(i) - 2.0 * z(i) );
%
%  A < Z < B
%
    elseif ( z(i) < b(i) )

      integral = 0.5 * ( ( b(i) - z(i) )^2 + ( z(i) - a(i) )^2 );
%
%  A < B < Z
%
    else

      integral = 0.5 * ( b(i) - a(i) ) * ( 2.0 * z(i) - a(i) - b(i) );

    end

    value = value + volume * integral / ( b(i) - a(i) );

  end

  return
end
