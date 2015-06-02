function value = i4_max ( a, b )

%*****************************************************************************80
%
%% I4_MAX returns the maximum of two I4's.
%
%  Discussion:
%
%    An I4 is an integer value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, B, values to compare.
%
%    Output, real VALUE, the maximum of A and B.
%
  a = floor ( a );
  b = floor ( b );

  if ( a < b )
    value = b;
  else
    value = a;
  end

  return
end
