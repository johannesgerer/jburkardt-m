function cartesian_to_c8_test ( )

%*****************************************************************************80
%
%% CARTESIAN_TO_C8_TEST tests CARTESIAN_TO_C8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 February 2015
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CARTESIAN_TO_C8_TEST\n' );
  fprintf ( 1, '  CARTESIAN_TO_C8 converts (X,Y) to C8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X1,Y1=R8_UNIFORM_01    C2=CARTESIAN_TO_C8(X1,Y1)' );
  fprintf ( 1, '     X3,Y3=C8_TO_CARTESIAN(C2)\n' );
  fprintf ( 1, '       ----------------------       ----------------------' );
  fprintf ( 1, '      -----------------------\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ x1, seed ] = r8_uniform_01 ( seed );
    [ y1, seed ] = r8_uniform_01 ( seed );
    c2 = cartesian_to_c8 ( x1, y1 );
    [ x3, y3 ] = c8_to_cartesian ( c2 );


    fprintf ( 1, '  %12f  %12f  (%12f  %12f)  %12f  %12f\n', ...
      x1, y1, real ( c2 ), imag ( c2 ), x3, y3 );

  end

  return
end
