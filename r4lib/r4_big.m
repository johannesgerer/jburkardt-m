function value = r4_big ( )

%*****************************************************************************80
%
%% R8_BIG returns a "big" real number.
%
%  Discussion:
%
%    The value returned by this function is NOT required to be the
%    maximum representable R8. 
%    We simply want a "very large" but non-infinite number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, a huge number.
%
  value = 1.0E+30;

  return
end

