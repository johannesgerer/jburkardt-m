function value = nco_abscissa ( order, i )

%*****************************************************************************80
%
%% NCO_ABSCISSA returns the I-th abscissa for the Newton Cotes open rule.
%
%  Discussion:
%
%    Our convention is that the abscissas are numbered from left to
%    right.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the rule.
%    1 <= ORDER.
%
%    Input, integer I, the index of the desired abscissa.  
%    1 <= I <= ORDER.
%
%    Output, real VALUE, the value of the I-th 
%    abscissa in the Newton Cotes open rule of order ORDER.
%
  x_min = -1.0;
  x_max = +1.0;

  if ( order < 1 )
    value = - Inf;
    return
  end

  if ( i < 1 | order < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NCO_ABSCISSA - Fatal error!\n' );
    fprintf ( 1, '  1 <= I <= ORDER is required.\n' );
    error ( 'NCO_ABSCISSA - Fatal error!' );
  end

  value = ( ( order - i + 1 ) * x_min   ...
          + (         i     ) * x_max ) ...
          / ( order     + 1 );
 
  return
end
