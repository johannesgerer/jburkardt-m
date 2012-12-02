function value = i4_is_triangular ( i )

%*****************************************************************************80
%
%% I4_IS_TRIANGULAR determines whether an integer is triangular.
%
%  Discussion:
%
%    The N-th triangular number is equal to the sum of the first
%    N integers.
%
%  First Values:
%
%    Index  Value
%     0      0
%     1      1
%     2      3
%     3      6
%     4     10
%     5     15
%     6     21
%     7     28
%     8     36
%     9     45
%    10     55
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, the integer to be checked.
%
%    Output, logical VALUE, is TRUE if I is triangular.
%
  if ( i < 0 )

    value = 0;

  elseif ( i == 0 )

    value = 1;

  else

    [ j, k ] = i4_to_triangle ( i );

    if ( j == k )
      value = 1;
    else
      value = 0;
    end

  end

  return
end
