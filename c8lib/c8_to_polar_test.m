function c8_to_polar_test ( )

%*****************************************************************************80
%
%% C8_TO_POLAR_TEST tests C8_TO_POLAR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 February 2015
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_TO_POLAR_TEST\n' );
  fprintf ( 1, '  C8_TO_POLAR converts C8 to polar form.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        C1=C8_UNIFORM_01       (R2,T2)=C8_TO_POLAR(C1)' );       
  fprintf ( 1, '     C3=POLAR_TO_C8(R2,T2)\n' );
  fprintf ( 1, '       ----------------------       ----------------------' );
  fprintf ( 1, '      -----------------------\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ c1, seed ] = c8_uniform_01 ( seed );
    [ r2, t2 ] = c8_to_polar ( c1 );
    c3 = polar_to_c8 ( r2, t2 );

    fprintf ( 1, '  (%12f  %12f)  %12f  %12f  (%12f  %12f)\n', ...
      real ( c1 ), imag ( c1 ), r2, t2, real ( c3 ), imag ( c3 ) );

  end

  return
end
