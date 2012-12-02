function subset_test028 ( )

%*****************************************************************************80
%
%% TEST028 tests DEC_WIDTH.
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
  fprintf ( 1, 'TEST028\n' );
  fprintf ( 1, '  DEC_WIDTH determines the "width" of a decimal.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Mantissa  Exponent  Width\n' );
  fprintf ( 1, '\n' );

  mantissa = 523;
  exponent = -1;
  i = dec_width ( mantissa, exponent );
  fprintf ( 1, '  %6d  %6d  %6d\n', mantissa, exponent, i );

  mantissa = 134;
  exponent = 2;
  i = dec_width ( mantissa, exponent );
  fprintf ( 1, '  %6d  %6d  %6d\n', mantissa, exponent, i );

  mantissa = -134;
  exponent = 2;
  i = dec_width ( mantissa, exponent );
  fprintf ( 1, '  %6d  %6d  %6d\n', mantissa, exponent, i );

  mantissa = 0;
  exponent = 10;
  i = dec_width ( mantissa, exponent );
  fprintf ( 1, '  %6d  %6d  %6d\n', mantissa, exponent, i );

  for exponent = -8 : 3
    mantissa = 123456;
    i = dec_width ( mantissa, exponent );
    fprintf ( 1, '  %6d  %6d  %6d\n', mantissa, exponent, i );
  end

  return
end
