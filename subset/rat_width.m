function width = rat_width ( a, b )

%*****************************************************************************80
%
%% RAT_WIDTH returns the "width" of a rational number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, B, the rational number.
%
%    Output, integer WIDTH, the "width" of the rational number.
%
  width = 1;
  ten_pow = 10;

  if ( a == 0 )
    return
  end
  
  abs_a = abs ( a );

  while ( ten_pow <= abs_a )
    width = width + 1;
    ten_pow = ten_pow * 10;
  end
%
%  If the fraction is negative, a minus sign will be prepended to the
%  numerator.
%
  if ( a * b < 0 )
    width = width + 1;
    ten_pow = ten_pow * 10;
  end

  abs_b = abs ( b );

  while ( ten_pow <= abs_b )
    width = width + 1;
    ten_pow = ten_pow * 10;
  end

  return
end
