function subset_test027 ( )

%*****************************************************************************80
%
%% TEST027 tests DEC_TO_S.
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
  fprintf ( 1, 'TEST027\n' );
  fprintf ( 1, '  DEC_TO_S prints a decimal value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Mantissa  Exponent  String\n' );
  fprintf ( 1, '\n' );

  mantissa = 523;
  exponent = -1;
  s = dec_to_s ( mantissa, exponent );
  fprintf ( 1, '    %6d  %8f  %s\n', mantissa, exponent, s );

  mantissa = 134;
  exponent = 2;
  s = dec_to_s ( mantissa, exponent );
  fprintf ( 1, '    %6d  %8f  %s\n', mantissa, exponent, s );

  mantissa = -134;
  exponent = 2;
  s = dec_to_s ( mantissa, exponent );
  fprintf ( 1, '    %6d  %8f  %s\n', mantissa, exponent, s );

  mantissa = 0;
  exponent = 10;
  s = dec_to_s ( mantissa, exponent );
  fprintf ( 1, '    %6d  %8f  %s\n', mantissa, exponent, s );

  for exponent = -8 : 3
    mantissa = 123456;
    s = dec_to_s ( mantissa, exponent );
    fprintf ( 1, '    %6d  %8f  %s\n', mantissa, exponent, s );
  end

  return
end
