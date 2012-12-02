function value = i4_div_rounded ( a, b )

%*****************************************************************************80
%
%% I4_DIV_ROUNDED computes the rounded result of I4 division.
%
%  Discussion:
%
%    This routine computes C = A / B, where A, B and C are integers
%    and C is the closest integer value to the exact real result.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, B, the number to be divided,
%    and the divisor.
%
%    Output, integer VALUE, the rounded result of the division.
%
  i4_huge = 2147483647;

  if ( a == 0 && b == 0 )

    value = i4_huge;
 
  elseif ( a == 0 )

    value = 0;

  elseif ( b == 0 )

    if ( a < 0 )
      value = - i4_huge;
    else
      value = + i4_huge;
    end

  else

    a_abs = abs ( a );
    b_abs = abs ( b );

    value = floor ( a_abs / b_abs );
%
%  Round the value.
%
    if ( ( 2 * value + 1 ) * b_abs < 2 * a_abs )
      value = value + 1;
    end
%
%  Set the sign.
%
    if ( ( a < 0 && 0 < b ) || ( 0 < a && b < 0 ) )
      value = - value;
    end

  end

  return
end
