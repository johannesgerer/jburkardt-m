function value = polyterm_value_3d ( x )

%*****************************************************************************80
%
%% POLYTERM_VALUE_3D evaluates a single polynomial term in 3D.
%
%  Discussion:
%
%    The polynomial term has the form:
%
%      X(1)^E(1) * X(2)^E(2) * X(3)^E(3)
%
%    The exponents E(1:3) are set by calling POLYTERM_EXPONENT_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(3), the point where the polynomial term 
%    is to be evaluated.
%
%    Output, real VALUE, the value of the polynomial term.
%
  e = [];
  e = polyterm_exponent ( 'GET', e );

  value = 1.0;

  for i = 1 : 3

    if ( e(i) == 0 )
      factor = 1.0;
    elseif ( e(i) == 1 )
      factor = x(i);
    elseif ( x(i) == 0.0 )
      factor = 0.0;
    else
      factor = x(i)^e(i);
    end

    value = value * factor;

  end
  
  return
end
