function value = p32_exact ( dim_num )

%*****************************************************************************80
%
%% P32_EXACT returns the exact integral for problem 32.
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
  c = [];
  c = p32_r8vec ( 'G', 'C', dim_num, c );

  z = [];
  z = p32_r8vec ( 'G', 'Z', dim_num, z );

  [ a, b ] = p32_lim ( dim_num );

  value = 1.0;

  for i = 1 : dim_num

    if ( z(i) <= a(i) )

      value = value * 0.0;

    elseif ( z(i) <= b(i) )

      if ( c(i) == 0.0 )
        value = value * ( z(i) - a(i) );
      else
        value = value * ( exp ( c(i) * z(i) ) - exp ( c(i) * a(i) ) ) / c(i);
      end

    else

      if ( c(i) == 0.0 )
        value = value * ( b(i) - a(i) );
      else
        value = value * ( exp ( c(i) * z(i) ) - exp ( c(i) * a(i) ) ) / c(i);
      end

    end

  end

  return
end
