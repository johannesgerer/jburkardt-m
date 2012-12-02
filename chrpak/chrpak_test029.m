function chrpak_test029 ( )

%*****************************************************************************80
%
%% TEST029 tests CH_UNIFORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST029\n' );
  fprintf ( 1, '  CH_UNIFORM returns a random character in a range.\n' );

  count(1:26) = 0;

  clo = 'D';
  chi = 'W';
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  All characters will be between "%c" and "%c"\n', clo, chi );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I  A  Count\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 100000

    [ ch, seed ] = ch_uniform ( clo, chi, seed );

    j = a_to_i4 ( ch );
    count(j) = count(j) + 1;

  end

  for i = 1 : 26
    fprintf ( 1, '  %2d  %c  %5d\n', i, i4_to_a(i), count(i) );
  end

  return
end
