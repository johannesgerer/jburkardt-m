function subset_test026 ( )

%*****************************************************************************80
%
%% TEST026 tests DEC_TO_RAT, RAT_TO_DEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST026\n' );
  fprintf ( 1, '  RAT_TO_DEC fraction => decimal,\n' );
  fprintf ( 1, '  DEC_TO_RAT decimal => fraction.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, choose the top and bottom\n' );
  fprintf ( 1, '  of a rational at random, and compute the\n' );
  fprintf ( 1, '  equivalent real number.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Then convert to decimal, and the equivalent real.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Then convert back to rational and the equivalent real.\n' );
  
  seed = 123456789;

  for i = 1 : 10

    [ rat_top, seed ] = i4_uniform ( -1000, 1000, seed );
    [ rat_bot, seed ] = i4_uniform (     1, 1000, seed );

    r1 = rat_top / rat_bot;
    [ mantissa, exponent ] = rat_to_dec ( rat_top, rat_bot );
    r2 = mantissa * 10^exponent;
    [ rat_top2, rat_bot2 ] = dec_to_rat ( mantissa, exponent );
    r3 = rat_top2 / rat_bot2;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %f = %d / %d\n', r1, rat_top, rat_bot );
    fprintf ( 1, '  %f = %d * 10^%d\n', r2, mantissa, exponent );
    fprintf ( 1, '  %f = %d / %d\n', r1, rat_top2, rat_bot2 );

  end

  return
end
