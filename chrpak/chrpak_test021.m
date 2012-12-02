function chrpak_test021 ( )

%*****************************************************************************80
%
%% TEST021 tests CH_TO_DIGIT and DIGIT_TO_CH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST021\n' );
  fprintf ( 1, '  CH_TO_DIGIT: character -> decimal digit\n' );
  fprintf ( 1, '  DIGIT_TO_C: decimal digit -> character.\n' );
  fprintf ( 1, '\n' );
 
  for i = -2 : 11
    c = digit_to_ch ( i );
    i2 = ch_to_digit ( c );
    fprintf ( 1, '  %8d  "%c"  %8d\n', i, c, i2 );
  end
 
  return
end
