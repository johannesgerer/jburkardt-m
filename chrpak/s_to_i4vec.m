function ivec = s_to_i4vec ( s, n )

%*****************************************************************************80
%
%% S_TO_I4VEC reads a integer vector from a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character S(*), the string to be read.
%
%    Input, integer N, the number of values expected.
%
%    Output, integer IVEC(N), the values read from the string.
%
  i = 0;
  ivec = [];

  ilo = 1;

  while ( i < n )

    i = i + 1;

    [ ivec(i), lchar ] = s_to_i4 ( s(ilo:end) );

    ilo = ilo + lchar;

  end

  return
end
