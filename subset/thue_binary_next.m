function [ n, thue ] = thue_binary_next ( n, thue )

%*****************************************************************************80
%
%% THUE_BINARY_NEXT returns the next element in a binary Thue sequence.
%
%  Discussion:
%
%    Thue demonstrated that arbitrarily long sequences of 0's and
%    1's could be generated which had the "cubefree" property.  In
%    other words, for a given string S, there was no substring W
%    such that S contained "WWW".  In fact, a stronger result holds:
%    if "a" is the first letter of W, it is never the case that S
%    contains the substring "WWa".
%
%    In this example, the digits allowed are binary, that is, just
%    "0" and "1".  The replacement rules are:
%
%    "0" -> "01"
%    "1" -> "10"
%
%    This routine produces the next binary Thue sequence in a given series.
%    However, the input sequence must be a Thue sequence in order for
%    us to guarantee that the output sequence will also have the
%    cubic nonrepetition property.
%
%    Also, enough space must be set aside in THUE to hold the
%    output sequence.  This will always be twice the input
%    value of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the input sequence.
%
%    Input, integer THUE(N), the initial Thue sequence.
%
%    Output, integer N, the length of the output sequence.
%
%    Output, integer THUE(N), the result of applying the substitution rules once.
%
  n2 = 0;
  thue2 = [];

  for i = 1 : n

    if ( thue(i) == 0 )
      n2 = n2 + 1;
      thue2(n2) = 0;
      n2 = n2 + 1;
      thue2(n2) = 1;
    elseif ( thue(i) == 1 )
      n2 = n2 + 1;
      thue2(n2) = 1;
      n2 = n2 + 1;
      thue2(n2) = 0;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'THUE_BINARY_NEXT - Fatal error!\n' );
      fprintf ( 1, '  The input sequence contains a non-binary digit\n' );
      fprintf ( 1, '  THUE(%d) = %d\n', i, thue(i) );
      error ( 'THUE_BINARY_NEXT - Fatal error!' );
    end

  end

  n = n2;
  thue = thue2;

  return
end
