function subset_test025 ( )

%*****************************************************************************80
%
%% TEST025 tests DEC_ROUND.
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
  n_test = 7;
  d_test = [ 1, 2, 3, 4, 2, 3, 4 ];
  exponent_test = [ -1,  -1, -1, -1, 2, 2, 2 ];
  mantissa_test = [ 523, 523, 523, 523, 6340, 6340, 6340 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST025\n' );
  fprintf ( 1, '  DEC_ROUND "rounds" a decimal to a number of digits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '           -----Before-------  -----After--------\n' );
  fprintf ( 1, '  Digits   Mantissa  Exponent  Mantissa  Exponent\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n_test

    dec_digit = d_test(i);

    mantissa = mantissa_test(i);
    exponent = exponent_test(i);

    [ mantissa, exponent ] = dec_round ( mantissa, exponent, dec_digit );
    fprintf ( 1, '  %6d  %6d  %6d      %6d  %6d\n', ...
      dec_digit, mantissa_test(i), exponent_test(i), mantissa, exponent );

  end

  return
end
