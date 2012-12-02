function value = composite_abscissa ( order, i )

%*****************************************************************************80
%
%% COMPOSITE_ABSCISSA returns the I-th abscissa of a composite rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to
%    right, that the interval is [-1,1], and the the abscissas are
%    evenly spaced, and that, except for the order 1 rule, the
%    endpoints are included.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%
%    Input, integer I, the index of the desired abscissa.  
%    1 <= I <= ORDER.
%
%    Output, real VALUE, the value of the I-th abscissa in the 
%    rule of order ORDER.
%
  a = -1.0;
  b = +1.0;

  if ( order < 1 )
    value = - Inf;
  elseif ( i < 1 | order < i )
    value = - Inf;
  elseif ( order == 1 )
    value = 0.5 * ( a + b );
  else
    value = ( ( order - i     ) * a   ...
            + (         i - 1 ) * b ) ...
            / ( order     - 1 );
  end

  return
end
