function r = i4_to_chinese ( j, n, m )

%*****************************************************************************80
%
%% I4_TO_CHINESE converts an integer to its Chinese remainder form.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer J, the integer to be converted.
%
%    Input, integer N, the number of moduluses.
%
%    Input, integer M(N), the moduluses.  These should be positive
%    and pairwise prime.
%
%    Output, integer R(N), the Chinese remainder representation of the integer.
%
  ierror = chinese_check ( n, m );

  if ( ierror )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_CHINESE - Fatal error!\n' );
    fprintf ( 1, '  The moduluses are not legal.\n' );
    error ( 'I4_TO_CHINESE - Fatal error!' );
  end

  for i = 1 : n
    r(i) = i4_modp ( j, m(i) );
  end

  return
end
