function x = chvec_reverse ( n, x )

%*****************************************************************************80
%
%% CHVEC_REVERSE reverses the elements of a character vector.
%
%  Example:
%
%    Input:
%
%      N = 4, X = ( 'L', 'I', 'V', 'E' ).
%
%    Output:
%
%      X = ( 'E', 'V', 'I', 'L' ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, character X(N), the array to be reversed.
%
%    Output, character X(N), the reversed array.
%
  x(1:n) = x(n:-1:1);

  return
end
