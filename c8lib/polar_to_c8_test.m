function polar_to_c8_test ( )

%*****************************************************************************80
%
%% POLAR_TO_C8_TEST tests POLAR_TO_C8.
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
  fprintf ( 1, 'POLAR_TO_C8 converts polar form to C8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      (R1,T1)=R8_UNIFORM_01()    C2=POLAR_TO_C8(R1,T1)' );
  fprintf ( 1, '    (R3,T3)=C8_TO_POLAR(C2)\n' );
  fprintf ( 1, '       ----------------------       ----------------------' );
  fprintf ( 1, '      -----------------------\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ r1, seed ] = r8_uniform_01 ( seed );
    [ t1, seed ] = r8_uniform_01 ( seed );
    t1 = t1 * 2.0 * pi;
    c2 = polar_to_c8 ( r1, t1 );;
    [ r3, t3 ] = c8_to_polar ( c2 );


    fprintf ( 1, '  %12f  %12f  (%12f  %12f)  %12f  %12f\n', ...
      r1, t1, real ( c2 ), imag ( c2 ), r3, t3 );

  end

  return
end
