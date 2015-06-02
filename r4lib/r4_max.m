function value = r4_max ( a, b )

%*****************************************************************************80
%
%% R4_MAX returns the maximum of two R4's.
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
%    Output, real VALUE, the maximum of A and B.
%
  if ( a < b )
    value = b;
  else
    value = a;
  end

  return
end
