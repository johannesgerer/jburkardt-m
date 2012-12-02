function subpak_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests FAC_DIV, FAC_GCD, FAC_LCM, FAC_MUL, FAC_TO_I4, I4_TO_FAC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  prime_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  For products of prime factors:\n' );
  fprintf ( 1, '  FAC_DIV computes a quotient;\n' );
  fprintf ( 1, '  FAC_MUL multiplies;\n' );
  fprintf ( 1, '  FAC_LCM computes the LCM;\n' );
  fprintf ( 1, '  FAC_GCD computes the GCD;\n' );
  fprintf ( 1, '  I4_TO_FAC converts an integer;\n' );
  fprintf ( 1, '  FAC_TO_I4 converts to an integer.\n' );
  fprintf ( 1, '  FAC_TO_RAT converts to a ratio.\n' );

  i1 = 720;
  i2 = 42;

  npower1 = i4_to_fac ( i1, prime_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Representation of I1 = %d\n', i1 );
  fprintf ( 1, '\n' );

  fac_print ( prime_num, npower1 );

  npower2 = i4_to_fac ( i2, prime_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Representation of I2 = %d\n', i2 );
  fprintf ( 1, '\n' );

  fac_print ( prime_num, npower2 );

  npower3 = fac_lcm ( prime_num, npower1, npower2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LCM of I1, I2:\n' );
  fprintf ( 1, '\n' );

  fac_print ( prime_num, npower3 );

  npower3 = fac_gcd ( prime_num, npower1, npower2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  GCD of I1, I2:\n' );
  fprintf ( 1, '\n' );

  fac_print ( prime_num, npower3 );

  npower3 = fac_mul ( prime_num, npower1, npower2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Product of I1, I2:\n' );
  fprintf ( 1, '\n' );

  fac_print ( prime_num, npower3 );

  npower3 = fac_div ( prime_num, npower2, npower1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quotient of I2 / I1:\n' );
  fprintf ( 1, '\n' );

  fac_print ( prime_num, npower3 );

  [ top, bot ] = fac_to_rat ( prime_num, npower3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Quotient as a rational: %d / %d\n', top, bot );

  return
end
