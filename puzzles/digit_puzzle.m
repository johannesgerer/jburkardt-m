function digit_puzzle ( )

%*****************************************************************************80
%
%% DIGIT_PUZZLE seeks a set of digits that satisfy certain conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2009
%
%  Author:
%
%    John Burkardt
%
  product = 1 * 2 * 3 * 6 * 7 * 8 * 9;

  for k = 68 : 544

    n = product * k;
%
%  Determine the seven digits of N = "S7 S6 S5 S4 S3 S2 S1".
%
    s1 = mod ( n, 10 );  n = ( n - s1 ) / 10;
    s2 = mod ( n, 10 );  n = ( n - s2 ) / 10;
    s3 = mod ( n, 10 );  n = ( n - s3 ) / 10;
    s4 = mod ( n, 10 );  n = ( n - s4 ) / 10;
    s5 = mod ( n, 10 );  n = ( n - s5 ) / 10;
    s6 = mod ( n, 10 );  n = ( n - s6 ) / 10;
    s7 =       n;
%
%  Sum the digits.  We're looking for a result of 36.
%
    s = s1 + s2 + s3 + s4 + s5 + s6 + s7;
    
    if ( s == 36 )
      fprintf ( '  The number is %d: %d\n', k, product * k );
    end

  end

  return
end
