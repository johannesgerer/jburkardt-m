function value = i4_min ( a, b )

%*****************************************************************************80
%
%% I4_MIN returns the minimum of two I4's.
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
%    Output, integer VALUE, the minimum of A and B.
%
  a = floor ( a );
  b = floor ( b );

  if ( a < b )
    value = a;
  else
    value = b;
  end

  return
end
