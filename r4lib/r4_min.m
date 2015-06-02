function value = r4_min ( a, b )

%*****************************************************************************80
%
%% R4_MIN returns the minimum of two R4's.
%
%  Discussion:
%
%    An R4 is a single precision real value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, values to compare.
%
%    Output, real VALUE, the minimum of A and B.
%
  if ( a < b )
    value = a;
  else
    value = b;
  end

  return
end
