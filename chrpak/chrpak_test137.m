function chrpak_test137 ( )

%*****************************************************************************80
%
%% TEST137 tests S_WORD_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2007
%
%  Author:
%
%    John Burkardt
%
  test_num = 4;

  s(1,1:32) = '?                               ';
  s(2,1:32) = 'A man, a plan, a canal - Panama!';
  s(3,1:32) = ' justone!word,-@#$              ';
  s(4,1:32) = 'How about a day in the park?    ';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST137\n' );
  fprintf ( 1, '  S_WORD_COUNT counts the words in a string\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  STRING                      Words\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    word_num = s_word_count ( s(test,:) );

    fprintf ( 1, '  "%32s"  %2d\n', s(test,:), word_num );

  end

  return
end
