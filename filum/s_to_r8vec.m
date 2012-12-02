function rvec = s_to_r8vec ( s, n )

%*****************************************************************************80
%
%% S_TO_R8VEC reads an R8VEC from a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be read.
%
%    Input, integer N, the number of values expected.
%
%    Output, real RVEC(N), the values read from the string.
%
  i = 0;

  ilo = 1;

  while ( i < n )

    i = i + 1;

    [ rvec(i), lchar ] = s_to_r8 ( s(ilo:) );

    ilo = ilo + lchar;

  end

  return
end
