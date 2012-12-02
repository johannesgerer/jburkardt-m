function subpak_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests BAR_CHECK, BAR_CODE, BAR_DIGIT_CODE_LEFT and BAR_DIGIT_CODE_RIGHT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  BAR_CHECK checks digits for a barcode;\n' );
  fprintf ( 1, '  BAR_CODE computes the barcode for a string of\n' );
  fprintf ( 1, '  11 digits;\n' );
  fprintf ( 1, '  BAR_DIGIT_CODE_LEFT returns the left digit code.\n' );
  fprintf ( 1, '  BAR_DIGIT_CODE_RIGHT returns the right digit code.\n' );

  for i = 1 : 11
    digit(i) = mod ( i-1, 10 );
  end

  check = bar_check ( digit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The check digit is %d\n', check );

  digit(12) = check;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The left and right digit codes:\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 9
    codel = bar_digit_code_left ( i );
    coder = bar_digit_code_right ( i );
    fprintf ( 1, '  %2d  %s  %s\n', i, codel, coder );
  end

  bar = bar_code ( digit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Bar code:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    %s\n', bar(1:9) );
  fprintf ( 1, '    %s\n', bar(10:12) );
  fprintf ( 1, '    %s\n', bar(13:19) );
  fprintf ( 1, '    %s\n', bar(20:26) );
  fprintf ( 1, '    %s\n', bar(27:33) );
  fprintf ( 1, '    %s\n', bar(34:40) );
  fprintf ( 1, '    %s\n', bar(41:47) );
  fprintf ( 1, '    %s\n', bar(48:54) );
  fprintf ( 1, '    %s\n', bar(55:59) );
  fprintf ( 1, '    %s\n', bar(60:66) );
  fprintf ( 1, '    %s\n', bar(67:73) );
  fprintf ( 1, '    %s\n', bar(74:80) );
  fprintf ( 1, '    %s\n', bar(81:87) );
  fprintf ( 1, '    %s\n', bar(88:94) );
  fprintf ( 1, '    %s\n', bar(95:101) );
  fprintf ( 1, '    %s\n', bar(102:104) );
  fprintf ( 1, '    %s\n', bar(105:113) );

  return
end
