function c8_nint_test ( )

%*****************************************************************************80
%
%% C8_NINT_TEST tests C8_NINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2015
%
%  Author:
%
%    John Burkardt
%
  seed = 123456678;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'C8_NINT_TEST\n' );
  fprintf ( 1, '  C8_NINT computes the nearest integer to a C8.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '       C1=10*C8_UNIFORM_01          C2=C8_NINT(C1)\n' );
  fprintf ( 1, '     ---------------------     ---------------------\n' );
  fprintf ( 1, '\n' );

  for test = 1 : 10
 
    [ c1, seed ] = c8_uniform_01 ( seed );
    c1 = 10.0 * c1;
    c2 = c8_nint ( c1 );

    fprintf ( 1, '  (%12f  %12f)  (%12f  %12f)\n', ...
      real ( c1 ), imag ( c1 ), real ( c2 ), imag ( c2 ) );
 
  end

  return
end
