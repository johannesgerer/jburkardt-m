function r8lib_test048 ( )

%*****************************************************************************80
%
%% R8LIB_TEST048 tests R8INT_TO_I4INT and I4INT_TO_R8INT;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2009
%
%  Author:
%
%    John Burkardt
%
  rhi = 200.0;
  rlo = 100.0;
  test_num = 10;

  ilo = 1;
  ihi = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST048\n' );
  fprintf ( 1, '  For data in an interval,\n' );
  fprintf ( 1, '  I4INT_TO_R8INT converts an I4 to an R8;\n' );
  fprintf ( 1, '  R8INT_TO_I4INT converts an R8 to an I4.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I4 interval: [%d, %d]\n', ilo, ihi );
  fprintf ( 1, '  R8 interval: [%f, %f]\n', rlo, rhi );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R   I(R)  R(I(R))\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  rlo2 = rlo - 15.0;
  rhi2 = rhi + 15.0;

  for test = 1 : test_num

    [ r, seed ] = r8_uniform_ab ( rlo2, rhi2, seed );

    ir = r8int_to_i4int ( rlo, rhi, r, ilo, ihi );

    r2 = i4int_to_r8int ( ilo, ihi, ir, rlo, rhi );

    fprintf ( 1, '  %14f  %6d  %14f\n', r, ir, r2 );

  end

  return
end
