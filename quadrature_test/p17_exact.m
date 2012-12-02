function value = p17_exact ( dim_num )

%*****************************************************************************80
%
%% P17_EXACT returns the exact integral for problem 17.
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
  [ a, b ] = p17_lim ( dim_num );
%
%  Get the location of Z.
%
  z = [];
  z = p17_r8vec ( 'G', 'Z', dim_num, z );
%
%  The value of the DIM_NUM dimensional integral can be broken
%  into the weighted sum of integrals over each dimension.
%
  value = 0.0;

  volume = prod ( b(1:dim_num) - a(1:dim_num) );

  for i = 1 : dim_num
%
%  Z < A < B
%
    if ( z(i) < a(i) )

      integral = ( ( b(i) - z(i) )^3 ...
                 - ( a(i) - z(i) )^3 ) / 3.0;
%
%  A < Z < B
%
    elseif ( z(i) < b(i) )

      integral = ( ( b(i) - z(i) )^3 ...
                 + ( z(i) - a(i) )^3 ) / 3.0;
%
%  A < B < Z
%
    else

      integral = ( ( z(i) - b(i) )^3 ...
                 - ( z(i) - a(i) )^3 ) / 3.0;

    end

    value = value + volume * integral / ( b(i) - a(i) );

  end

  return
end
