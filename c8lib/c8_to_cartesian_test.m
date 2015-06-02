function c8_to_cartesian_test ( )

%*****************************************************************************80
%
%% C8_TO_CARTESIAN_TEST tests C8_TO_CARTESIAN.
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
  fprintf ( 1, 'C8_TO_CARTESIAN_TEST\n' );
  fprintf ( 1, '  C8_TO_CARTESIAN converts C8 to (X,Y).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        C1=C8_UNIFORM_01       (X2,Y2)=C8_TO_CARTESIAN(C1)' );       
  fprintf ( 1, '     C3=CARTESIAN_TO_C8(X2,Y2)\n' );
  fprintf ( 1, '       ----------------------       ----------------------' );
  fprintf ( 1, '      -----------------------\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ c1, seed ] = c8_uniform_01 ( seed );
    [ x2, y2 ] = c8_to_cartesian ( c1 );
    c3 = cartesian_to_c8 ( x2, y2 );

    fprintf ( 1, '  (%12f  %12f)  %12f  %12f  (%12f  %12f)\n', ...
      real ( c1 ), imag ( c1 ), x2, y2, real ( c3 ), imag ( c3 ) );

  end

  return
end
