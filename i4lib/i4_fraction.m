function value = i4_fraction ( i, j )

%*****************************************************************************80
%
%% I4_FRACTION computes a ratio and returns an integer result.
%
%  Discussion:
%
%    Given variables I and J, MATLAB will evaluate an expression such as 
%    "I/J" using real arithmetic.  Thus "7/3" produces the 2.333...
%
%    In the case where the result is negative, such as -2.33..., we might
%    choose to round down to -3 or up to -2.  In MATLAB, this is the
%    difference between the floor() and round() functions.  Here, we
%    choose the ROUND function so that, for instance, it will be true that
%
%      i4_fraction ( i, j ) + i4_fraction ( -i, j ) = 0
%
%  Example:
%
%       I     J     Real    I4_FRACTION
%
%       1     2     0.5      0
%       8     4     2.00     2
%       9     4     2.25     2
%       7     4     1.75     1
%      -7     4    -1.75    -1
%       7    -4    -1.75    -1     
%      -7    -4     1.75     1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the arguments.
%
%    Output, integer I4_FRACTION, the value of the ratio.
%
  i4_fraction = round ( i / j );

  return
end
