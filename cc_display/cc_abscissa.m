function value = cc_abscissa ( order, i )

%*****************************************************************************80
%
%% CC_ABSCISSA returns the I-th Clenshaw Curtis abscissa.
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
%    02 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ORDER, the order of the Clenshaw Curtis rule.
%
%    Input, integer I, the index of the desired abscissa.  1 <= I <= ORDER.
%
%    Output, real VALUE, the value of the I-th abscissa in the 
%    Clenshaw Curtis rule of order ORDER.
%
  if ( order < 1 )
    value = -Inf;
    return
  end

  if ( order == 1 )
    value = 0.0;
    return
  end

  if ( i < 1 )
    value = -1.0;
  elseif ( i <= order )
    value = cos ( ( order - i ) * pi / ( order - 1 ) );
  else
    value = +1.0
  end 

  return
end
