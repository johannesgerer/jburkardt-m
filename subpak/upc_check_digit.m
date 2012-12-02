function c = upc_check_digit ( p, l, r )

%*****************************************************************************80
%
%% UPC_CHECK_DIGIT returns the check digit of a UPC.
%
%  Discussion:
%
%    UPC stands for Universal Price Code.
%
%    A full UPC is a string of 12 digits, in groups of size 1, 5, 5, and 1,
%    of the form P-LLLLL-RRRRR-C, where:
%
%      P is the one-digit product type code.
%      L is the five-digit manufacturer code.
%      R is the five_digit product code
%      C is the check digit.
%
%  Example:
%
%    0-72890-00011-8
%    0-12345-67890-5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the one-digit product type code.
%
%    Input, integer L, the five-digit manufacturer code.
%
%    Input, integer R, the five-digit product code.
%
%    Output, integer C, the check digit.
%
  if ( p < 0 | 9 < p )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'UPC_CHECK_DIGIT - Fatal error!\n' );
    fprintf ( 1, '  P < 0 or 9 < P!\n' );
    error ( 'UPC_CHECK_DIGIT - Fatal error!' );
  end

  if ( l < 0 | 99999 < l )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'UPC_CHECK_DIGIT - Fatal error!\n' );
    fprintf ( 1, '  L < 0 or 99999 < L!\n' );
    error ( 'UPC_CHECK_DIGIT - Fatal error!' );
  end

  if ( r < 0 | 99999 < r )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'UPC_CHECK_DIGIT - Fatal error!\n' );
    fprintf ( 1, '  R < 0 or 99999 < R!\n' );
    error ( 'UPC_CHECK_DIGIT - Fatal error!' );
  end

  lc = i4_to_digits_decimal ( l, 5 );
  rc = i4_to_digits_decimal ( r, 5 );

  c = ( p + lc(2) + lc(4) + rc(1) + rc(3) + rc(5) ) * 3 ...
          + lc(1) + lc(3) + lc(5) + rc(2) + rc(4);

  c = mod ( c, 10 );

  c = mod ( 10 - c, 10 );

  return
end
