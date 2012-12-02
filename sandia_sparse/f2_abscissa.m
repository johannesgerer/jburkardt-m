function value = f2_abscissa ( order, i )

%*****************************************************************************80
%
%% F2_ABSCISSA returns the I-th abscissa for the Fejer type 2 rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to
%    right.
%
%    This rule is defined on [-1,1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, integer I, the index of the desired abscissa.  1 <= I <= ORDER.
%
%    Output, real VALUE, the value of the I-th abscissa in the 
%    rule of order ORDER.
%
  if ( order < 1 )
    value = - Inf;
  elseif ( i < 1 | order < i )
    value = - Inf;
  elseif ( order == 1 )
    value = 0.0;
  elseif ( 2 * ( order + 1 - i ) == order + 1 )
    value = 0.0;
  else
    value = cos ( ( order + 1 - i ) * pi / ( order + 1 ) );
  end

  return
end
