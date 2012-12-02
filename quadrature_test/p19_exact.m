function value = p19_exact ( dim_num )

%*****************************************************************************80
%
%% P19_EXACT returns the exact integral for problem 19.
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
  z = [];
  z = p19_r8vec ( 'G', 'Z', dim_num, z );

  value = 1.0;

  for i = 1 : dim_num 

    if ( z(i) <= 0.0 )
      value = value * ( 2.0 / 3.0 ) * ...
        ( sqrt ( ( 1.0 - z(i) )^3 ) - sqrt ( - ( z(i)^3 ) ) );
    elseif ( z(i) < 1.0 )
      value = value * ( 2.0 / 3.0 ) * ...
        ( sqrt ( z(i)^3 ) + sqrt ( ( 1.0 - z(i) )^3 ) );
    elseif ( 1.0 <= z(i) )
      value = value * ( 2.0 / 3.0 ) * ...
        ( sqrt ( z(i)^3 ) - sqrt ( ( z(i) - 1.0 )^3 ) );
    end

  end

  return
end
